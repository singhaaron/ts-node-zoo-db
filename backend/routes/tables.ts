/**
 * File: tables.js
 * Purpose: Handle GET request from frontend to provide information from database.
 * Functionality IE: Frontend to Fetch
 * Author:Aaron
 */

import express, { Request, Response } from "express";
import MYSQL from "../mysql/init";
import * as QUERYS from "../mysql/Select";

module.exports = (app: express.Application) => {
  app.get("/animal-exhibit", (req: Request, res: Response): void => {
    MYSQL.query(QUERYS.default.VIEW_ANIMAL_EXHIBITS, (err: Error, results: Object[]) => {
      if (err) {
        res.status(400).json({
          ok: false,
          err,
        });
      } else {
        res.json({
          ok: true,
          Results: results,
        });
      }
    });
  });
};
