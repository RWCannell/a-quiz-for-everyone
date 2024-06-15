import { Router, Request, Response } from "express";
import pool from "./database";
import { Option, Question } from "./models";
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

router.get("/options", async (req: Request, res: Response) => {
    try {
        const result = await pool.query("SELECT * FROM options");
        const optionsFromDatabase = result.rows;
        const options: Option[] = [];

        for (let i = 0; i < optionsFromDatabase.length; i++) {
            options.push({
                id: optionsFromDatabase[i]["option_id"].toString(),
                text: optionsFromDatabase[i]["option_text"].toString(),
                owningQuestionId: optionsFromDatabase[i]["question_id"].toString(),
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
            SELECT * FROM options WHERE question_id = '${questionId}'
        `
        );
        const optionsFromDatabase = result.rows;
        const options: Option[] = [];

        for (let i = 0; i < optionsFromDatabase.length; i++) {
            options.push({
                id: optionsFromDatabase[i]["option_id"].toString(),
                text: optionsFromDatabase[i]["option_text"].toString(),
                owningQuestionId: optionsFromDatabase[i]["question_id"].toString(),
            });
        }
        res.status(200).json({ responseBody: options });
    } catch (error) {
        console.error("Error fetching options", error);
        res.status(500).json({ error: "Error fetching options" });
    }
});

export default router;