"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const handler_1 = require("./handler");
const articleRouter = (0, express_1.Router)();
articleRouter.post("/add", handler_1.saveArticle);
articleRouter.get("/get", handler_1.retrieveArticle);
exports.default = articleRouter;
