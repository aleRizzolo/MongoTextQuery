@echo OFF

:: we make sure that we have js files
npm install
npm run build

docker build -t mongotextsearch-be .
docker run -d -p 3000:3000 --name mongotextsearch-be mongotextsearch-be