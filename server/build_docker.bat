@echo OFF

:: we make sure that we have js files
npm install
npm run build

docker build -t mongotextsearch-be .
docker run -d --name mongotext-search-be --p 3000:3000 mongotextsearch