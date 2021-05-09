"use strict";
/**
 * File: tables.js
 * Purpose: Handle GET request from frontend to provide information from database.
 * Functionality IE: Frontend to Fetch
 * Author:Aaron
 */
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    Object.defineProperty(o, k2, { enumerable: true, get: function() { return m[k]; } });
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const init_1 = __importDefault(require("../mysql/init"));
const QUERYS = __importStar(require("../mysql/Select"));
module.exports = (app) => {
    app.get("/animal-exhibit", (req, res) => {
        init_1.default.query(QUERYS.default.VIEW_ANIMAL_EXHIBITS, (err, results) => {
            if (err) {
                res.status(400).json({
                    ok: false,
                    err,
                });
            }
            else {
                res.json({
                    ok: true,
                    Results: results,
                });
            }
        });
    });
};
