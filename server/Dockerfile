FROM node:18

WORKDIR /app

COPY package* ./

RUN npm install

COPY . .

ENV NODE_ENV=production

ENV PORT=3000

EXPOSE $PORT

ENTRYPOINT [ "npm", "run", "start" ]