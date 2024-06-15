import express from "express";
import cors from "cors";
import bodyParser from "body-parser";
import todoRoutes from "./routes";
import "dotenv/config";

// import * as dotenv from "dotenv";
// dotenv.config();
// dotenv.config({ path: __dirname + "/.env" });

const baseUrl = process.env.BASE_URL;
const port = process.env.BACKEND_PORT || 4000;

const app = express();

app.use(cors());
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