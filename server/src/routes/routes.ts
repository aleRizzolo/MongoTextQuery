import { Router } from "express"
import { retrieveArticle, saveArticle } from "./handler"

const articleRouter = Router()

articleRouter.post("/add", saveArticle)
articleRouter.get("/get", retrieveArticle)

export default articleRouter
