//Dependencies
import express from "express"; //Express
import * as dotenv from "dotenv"; //Environment Variable
import cors from "cors";
const cookieparser = require("cookie-parser");
//Environment Config
dotenv.config({ path: "../" + "/.env" });

//Init
const app: express.Application = express();

//Middleware
app.use(
  cors({
    credentials: true,
    origin: ["http://localhost:3000", "http://localhost:5050"],
    allowedHeaders: ["Origin", "X-Requested-With", "contentType", "Content-Type", "Accept", "Authorization"],
  })
);
app.use(cookieparser());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

//Routes
require("./routes/tables")(app);

//Confirmation
app.listen(process.env.BACKEND_PORT, (): void => {
  console.log("Server Running");
});
