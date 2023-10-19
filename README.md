# MongoTextQuery
![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)<br>

This project is a Full Text Search Engine powered by MongoDB and developed using TypeScript with Express. It provides a foundation for creating applications or services that require full text search capabilities and supports fuzzy search for more flexible text matching.

## Table of Contents:
- [MongoTextQuery](#mongotextquery)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [Deploy to your vercel instance](#deploy-to-your-vercel-instance)
- [Next Steps](#next-steps)

## Prerequisites

Before you can run this project, make sure you have the following prerequisites installed on your system:

- Node.js: You can download and install Node.js from [nodejs.org](https://nodejs.org/).
- MongoDB: Ensure you have MongoDB installed locally or access to a MongoDB server.

## Getting Started

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/aleRizzolo/MongoTextQuery.git
   ```

2. Change into the project directory:

   ```bash
   cd MongoTextQuery
   ```

3. Create a `.env` file by copying the contents from `.env.sample`. You can do this manually or use the following command:

   ```bash
   cp .env.sample .env
   ```

   Edit the `.env` file and replace the placeholder values with your MongoDB connection details.

4. Install the project dependencies using npm:

   ```bash
   npm install
   ```

5. Build the application:

   ```bash
   npm run build
   ```

6. Start the application:

   ```bash
   npm run start
   ```

The Full Text Search Engine should now be up and running on `http://localhost:3000` (or 8080 if PORT variable is not defined).

## Project Structure

The project has the following structure:

- `dist/`: Compiled JavaScript files (needed for vercel deploy).
- `src/`: Contains the TypeScript source code.
    - `routes/`: Define your API routes here.
    - `models/`: Define your MongoDB data models.
    - `types/`: Define the types for the models and for the routes.
- `utils/`: Contains logger configuration.
- `db.ts`: Connection to the Database
- `index.ts`: The main entry point of the application.

## Contributing

If you would like to contribute to this project, please open an issue or create a pull request on the GitHub repository.

## Deploy to your vercel instance

If you wish to deploy this project on your vercel instance, You can follow this [guide](https://dev.to/tirthpatel/deploy-node-ts-express-typescript-on-vercel-284h)

## Next Steps

- [ ] Add a front-end