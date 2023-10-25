export const createAggregationPipeline = (article: string, path: string) => [
  {
    $search: {
      text: {
        query: JSON.stringify(article),
        path: path,
      },
    },
  },
]
