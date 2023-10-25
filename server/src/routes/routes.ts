import { Router } from "express"
import { deleteArticle, retrieveArticle, saveArticle } from "./handler"

const articleRouter = Router()

articleRouter.post("/add", saveArticle)
articleRouter.get("/get", retrieveArticle)
articleRouter.delete("/delete", deleteArticle)

export default articleRouter
