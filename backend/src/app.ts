import express, { Router, Request, Response } from "express";
import bodyParser from "body-parser";
import * as dotenv from "dotenv";
import todoRoutes from "./routes";

dotenv.config({ path: __dirname + "/.env" });

const baseUrl = process.env.BASE_URL;
const port = process.env.BACKEND_PORT || 3000;

const app = express();

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);
app.use("/", todoRoutes);

app.listen(port, () => {
  console.log(`Server is up and listening on ${baseUrl}:${port}...`);
});