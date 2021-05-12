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
  app.get("/db_customers", (req: Request, res: Response): void => {
    MYSQL.query(QUERYS.default.VIEW_CUSTOMERS, (err: Error, results: Object[]) => {
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
  app.put("/db_customers", (req: Request, res: Response): void => {
    let rb = req.body;
    let sql = `update Customers set name="${rb.name}", phone=${rb.phone}, email_addr="${rb.email_addr}" where customer_id= ${rb.customer_id}`;
    MYSQL.query(sql, (err: Error, results: Object[]) => {
      if (err) {
        res.status(400).send(err.message);
      } else {
        res.status(200).send(results);
      }
    });
  });
  app.delete("/db_customers", (req: Request, res: Response): void => {
    let rb = req.body;
    let sql = `delete from Customers where customer_id=${rb.customer_id};`;
    MYSQL.query(sql, (err: Error, results: Object[]) => {
      if (err) {
        res.status(400).send(err.message);
      } else {
        res.status(200).send(results);
      }
    });
  });
  app.post("/db_customers", (req: Request, res: Response): void => {
    let rb = req.body;
    let sql = `insert into Customers (name,phone,email_addr) values ('${rb.name}',${rb.phone},'${rb.email_addr}');`;
    MYSQL.query(sql, (err: Error, results: Object[]) => {
      if (err) {
        res.status(400).send(err.message);
      } else {
        res.status(200).send(results);
      }
    });
  });
};
