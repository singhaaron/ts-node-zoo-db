//Dependencies
import express from "express"; //Express
import * as dotenv from "dotenv"; //Environment Variable
import cors from "cors";
//Environment Config
dotenv.config({ path: "../" + "/.env" });

//Init
const app: express.Application = express();

//Middleware
app.use(
  cors({
    credentials: true,
    origin: ["http://localhost:3000"],
    allowedHeaders: ["Origin", "X-Requested-With", "contentType", "Content-Type", "Accept", "Authorization"],
  })
);

//Routes
require("./routes/tables")(app);

//Confirmation
app.listen(process.env.BACKEND_PORT, (): void => {
  console.log("Server Running");
});
