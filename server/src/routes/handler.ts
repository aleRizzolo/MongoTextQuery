import { db } from "../db"
import logger from "../utils/logger"
import { Request, Response } from "express"
import ArticlesModel from "../models/Articles"
import { AddArticles, RetrieveArticles } from "../types"

export const saveArticle = async (req: Request, res: Response) => {
  const article: AddArticles = req.body

  try {
    const articleToSave = await ArticlesModel.create(article)

    return res.status(200).send({ success: true, data: articleToSave })
  } catch (err: any) {
    logger.error(err.stack)
    return res.status(500).send({ success: false, message: `Error: ${err}` })
  }
}

export const retrieveArticle = async (req: Request, res: Response) => {
  const article: RetrieveArticles = req.body

  if (article.name === null) {
    return res.status(400).send({ success: false, message: "Please provide the article's name" })
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
    ]

    const cursor = db.collection("articles").aggregate(aggregationPipeline)

    const result = await cursor.toArray()

    if (result.length === 0) {
      return res.status(404).send({ success: false, message: "Article not found" })
    }

    return res.status(200).send({ success: true, data: result })
  } catch (err: any) {
    logger.error(err.stack)
    return res.status(500).send({ success: false, message: `Error: ${err}` })
  }
}
