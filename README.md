# MongoTextQuery

![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)<br>

This project is a Full Text Search Engine powered by MongoDB and developed using TypeScript with Express that saves the headline and the url of an online article. It provides a foundation for creating applications or services that require full text search capabilities and supports fuzzy search for more flexible text matching.

## Table of Contents:

- [Why this Project?](#why-this-project)
- [Prerequisites](#prerequisites)
- [Manual Run](#manual-run)
- [Run from Script](#run-from-script-requires-docker)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [Next Steps](#next-steps)

## Why this Project?

I had a problem <br>Months ago, wanting to stay up-to-date with k8s world, I signed up for a [newsletter](https://learnk8s.io/learn-kubernetes-weekly) wich sends me an email with a lot of useful "How to" guides and some insightful articles. Unfortunately, most articles remain unread, and when I will need them in the future, I will have forgotten that I already have the solution.<br>This is why this project is born: this is a way to save title and URL of an article, and when I need them, I will first search in my personal database

## Prerequisites

Before you can run this project, make sure you have the following prerequisites installed on your system:

- Node.js: You can download and install Node.js from [nodejs.org](https://nodejs.org/).
- MongoDB: Ensure you have MongoDB installed locally or access to a MongoDB server.

## Manual Run

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/aleRizzolo/MongoTextQuery.git
   ```

2. Change into the project directory:

   ```bash
   cd MongoTextQuery/server
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

_ToDo: start the front-end_

The Full Text Search Engine should now be up and running on `http://localhost:3000` (or 8080 if PORT variable is not defined).

## Run from script (requires Docker)

1. Run server Docker build<br>

   ```bash
   cd server
   ```

   and

   ```bash
   ./build_docker.[bat][sh]
   ```

2. Run front-end Docker build<br>
   _ToDo_

## Project Structure

The project has the following structure:

- `server/`: Contains all the server directories
  - `src/`: Contains the TypeScript source code.
    - `routes/`: Define your API routes here.
    - `models/`: Define your MongoDB data models.
    - `types/`: Define the types for the models and for the routes.
  - `utils/`: Contains logger configuration.
  - `db.ts`: Connection to the Database
  - `index.ts`: The main entry point of the application.

## Contributing

If you would like to contribute to this project, please open an issue or create a pull request on the GitHub repository.

## Next Steps

- [ ] Add search based on tags

- [ ] Add a front-end
