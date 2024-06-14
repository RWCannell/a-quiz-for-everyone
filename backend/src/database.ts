import * as dotenv from "dotenv";
import { Pool } from "pg";

dotenv.config({ path: __dirname + "/.env" });

const postgresUser = process.env.POSTGRES_USER;
const postgresHost = process.env.POSTGRES_HOST;
const postgresPassword = process.env.POSTGRES_PASSWORD;
const postgresDatabase = process.env.POSTGRES_DB;
let postgresPort = 5432; 
if (process.env.POSTGRES_PORT) {
    postgresPort = parseInt(process.env.POSTGRES_PORT);
}

const pool = new Pool({
  user: postgresUser,
  host: postgresHost,
  password: postgresPassword,
  database: postgresDatabase,
  port: postgresPort
});

export default pool;