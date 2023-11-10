import { db } from "../db"
import logger from "../utils/logger"
import { Request, Response } from "express"
import ArticlesModel from "../models/Articles"
import { createAggregationPipeline } from "../utils/aggregation"
import { AddArticles, DeleteArticle, RetrieveArticles } from "../types"

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
    const aggregationPipeline = createAggregationPipeline(article.name.toString(), "name")

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

export const deleteArticle = async (req: Request, res: Response) => {
  const article: DeleteArticle = req.body

  if (article.url === null) {
    return res.status(400).send({ success: false, message: "Please provide the article's name" })
  }

  try {
    const result = await ArticlesModel.findOne({ url: article.url })

    if (result === null) {
      return res.status(404).send({ success: false, message: "Article not found" })
    }

    const deletedArticle = await ArticlesModel.deleteOne({ url: article.url })

    return res.status(200).send({ success: true, data: "Article deleted" })
  } catch (err: any) {
    logger.error(err.stack)
    return res.status(500).send({ success: false, message: `Error: ${err}` })
  }
}
