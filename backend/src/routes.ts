import { Router, Request, Response } from "express";
import pool from "./database";
import { Question } from "./models";

const router = Router();

router.get("/", (req: Request, res: Response) => {
    res.send("Welcome to 'A Quiz for Everyone!'");
});

router.get("/questions", async (req: Request, res: Response) => {
    try {
        const result = await pool.query("SELECT * FROM questions");
        const questions: Question[] = result.rows;
        res.json(questions);
    } catch (error) {
        console.error("Error fetching questions", error);
        res.status(500).json({ error: "Error fetching questions" });
    }
});

export default router;