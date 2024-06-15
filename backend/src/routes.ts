import { Router, Request, Response } from "express";
import pool from "./database";
import { FullQuestionDto, Option, Question } from "./models";
import { generateRandomUniqueNumbers } from "./helpers";

const router = Router();

router.get("/", (req: Request, res: Response) => {
    res.send("Welcome to 'A Quiz for Everyone!'");
});

router.get("/questions", async (req: Request, res: Response) => {
    try {
        const result = await pool.query("SELECT * FROM questions");
        const questionsFromDatabase = result.rows;
        const numberOfQuestionsInDatabase = questionsFromDatabase.length;
        const questions: Question[] = [];

        const randomIndices = generateRandomUniqueNumbers(5, numberOfQuestionsInDatabase - 1, 0);

        randomIndices.forEach((index) => {
            questions.push({
                id: questionsFromDatabase[index]["question_id"].toString(),
                text: questionsFromDatabase[index]["question_text"].toString(),
                subject: questionsFromDatabase[index]["question_subject"].toString(),
            });
        });
        res.status(200).json({ responseBody: questions });
    } catch (error) {
        console.error("Error fetching questions", error);
        res.status(500).json({ error: "Error fetching questions" });
    }
});

router.get("/questions/:questionId", async (req: Request, res: Response) => {
    const questionId = req.params.questionId;
    try {
        const result = await pool.query(`
            SELECT * FROM questions WHERE question_id = '${questionId}'
        `
        );
        const response = result.rows;

        const question: Question = {
                id: response[0]["question_id"].toString(),
                text: response[0]["question_text"].toString(),
                subject: response[0]["question_subject"].toString(),
        };
        res.status(200).json({ responseBody: question });
    } catch (error) {
        console.error(`Error fetching question with id '${questionId}'`, error);
        res.status(500).json({ error: `Error fetching question with id '${questionId}'` });
    }
});

router.get("/options", async (req: Request, res: Response) => {
    try {
        const result = await pool.query("SELECT * FROM options");
        const optionsFromDatabase = result.rows;
        const options: Option[] = [];

        for (let i = 0; i < optionsFromDatabase.length; i++) {
            options.push({
                id: optionsFromDatabase[i]["option_id"].toString(),
                text: optionsFromDatabase[i]["option_text"].toString(),
                owningQuestionId: optionsFromDatabase[i]["owning_question_id"].toString(),
            });
        }
        res.status(200).json({ responseBody: options });
    } catch (error) {
        console.error("Error fetching options", error);
        res.status(500).json({ error: "Error fetching options" });
    }
});

router.get("/options/:questionId", async (req: Request, res: Response) => {
    const questionId = req.params.questionId;
    try {
        const result = await pool.query(`
            SELECT * FROM options WHERE owning_question_id = '${questionId}'
        `
        );
        const optionsFromDatabase = result.rows;
        const options: Option[] = [];

        for (let i = 0; i < optionsFromDatabase.length; i++) {
            options.push({
                id: optionsFromDatabase[i]["option_id"].toString(),
                text: optionsFromDatabase[i]["option_text"].toString(),
                owningQuestionId: optionsFromDatabase[i]["owning_question_id"].toString(),
            });
        }
        res.status(200).json({ responseBody: options });
    } catch (error) {
        console.error(`Error fetching options with id '${questionId}'`, error);
        res.status(500).json({ error: `Error fetching options for question with id '${questionId}'` });
    }
});

router.get("/fullquestions", async (req: Request, res: Response) => {
    try {
        const result = await pool.query("SELECT * FROM questions");
        const questionsFromDatabase = result.rows;
        const numberOfQuestionsInDatabase = questionsFromDatabase.length;
        const questions: Question[] = [];

        const randomIndices = generateRandomUniqueNumbers(5, numberOfQuestionsInDatabase - 1, 0);

        randomIndices.forEach((index) => {
            questions.push({
                id: questionsFromDatabase[index]["question_id"].toString(),
                text: questionsFromDatabase[index]["question_text"].toString(),
                subject: questionsFromDatabase[index]["question_subject"].toString(),
            });
        });

        const fullQuestions: FullQuestionDto[] = [];
        for (const question of questions) {
            try {
                const result = await pool.query(`
                    SELECT * FROM options WHERE owning_question_id = '${question.id}'
                `
                );
                const optionsForQuestion = result.rows;
                const options: Option[] = [];
        
                for (let i = 0; i < optionsForQuestion.length; i++) {
                    options.push({
                        id: optionsForQuestion[i]["option_id"].toString(),
                        text: optionsForQuestion[i]["option_text"].toString(),
                        owningQuestionId: optionsForQuestion[i]["owning_question_id"].toString(),
                    });
                }
                fullQuestions.push({
                    ...question,
                    options: options
                });
            } catch (error) {
                console.error(`Error fetching options with id '${question.id}'`, error);
                res.status(500).json({ error: `Error fetching options for question with id '${question.id}'` });
            }
        }
        res.status(200).json({ responseBody: fullQuestions });
    } catch (error) {
        console.error("Error fetching questions", error);
        res.status(500).json({ error: "Error fetching questions" });
    }
});

export default router;