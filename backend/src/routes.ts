import { Router, Request, Response } from "express";
import pool from "./database";
import { Option, Question } from "./models";

const router = Router();

router.get("/", (req: Request, res: Response) => {
    res.send("Welcome to 'A Quiz for Everyone!'");
});

router.get("/questions", async (req: Request, res: Response) => {
    try {
        const result = await pool.query("SELECT * FROM questions");
        const questionsFromDatabase = result.rows;
        // example of question from database:
        // {
        //     "question_id":"d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2",
        //     "question_text":"What is the capital city of Norway?", 
        //     "question_subject":"GEOGRAPHY"
        // }
        const numberOfQuestionsInDatabase = questionsFromDatabase.length;
        const questions: Question[] = [];

        const randomIndices: number[] = Array.from(
            { length: 10 },
            () => Math.floor(Math.random() * numberOfQuestionsInDatabase)
        );
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

export default router;