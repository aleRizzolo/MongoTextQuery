import mongoose from "mongoose"

import { AddArticles } from "../types/addArticles"

const ArticlesModel = new mongoose.Schema<AddArticles>({
  name: {
    type: String,
    required: true,
  },
  url: {
    type: String,
    required: true,
    unique: true,
  },
})

export default mongoose.model<AddArticles>("Articles", ArticlesModel)
