"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.retrieveArticle = exports.saveArticle = void 0;
const db_1 = require("../db");
const logger_1 = __importDefault(require("../utils/logger"));
const Articles_1 = __importDefault(require("../models/Articles"));
const saveArticle = async (req, res) => {
    const article = req.body;
    if ((article.link || article.name) === null) {
        return res.status(400).send({ success: false, message: "Please provide the article's name and link" });
    }
    try {
        const articleToSave = await Articles_1.default.create(article);
        return res.status(200).send({ success: true, data: articleToSave });
    }
    catch (err) {
        logger_1.default.error(err.stack);
        return res.status(500).send({ success: false, message: `Error: ${err}` });
    }
};
exports.saveArticle = saveArticle;
const retrieveArticle = async (req, res) => {
    const article = req.body;
    if (article.name === null) {
        return res.status(400).send({ success: false, message: "Please provide the article's name" });
    }
    try {
        const aggregationPipeline = [
            {
                $search: {
                    text: {
                        query: JSON.stringify(article),
                        path: "name",
                    },
                },
            },
        ];
        const cursor = db_1.db.collection("articles").aggregate(aggregationPipeline);
        const result = await cursor.toArray();
        if (result.length === 0) {
            return res.status(404).send({ success: false, message: "Article not found" });
        }
        return res.status(200).send({ success: true, data: result });
    }
    catch (err) {
        logger_1.default.error(err.stack);
        return res.status(500).send({ success: false, message: `Error: ${err}` });
    }
};
exports.retrieveArticle = retrieveArticle;
