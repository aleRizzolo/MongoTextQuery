$ROOT_DIR = Get-Location

docker network create --driver bridge mongotextsearch

# Ensure that we have JS files
Set-Location "server"
npm install
npm run build

docker build -t mongotextsearch-server .
Clear-Host

Set-Location $ROOT_DIR\client
docker build -t mongotextsearch-client .
Clear-Host

Set-Location $ROOT_DIR

$answer = Read-Host "Do you want to start the backend container? (y/n)"

if ($answer -eq "y") {
    docker run --rm -d --network mongotextsearch -p 3000:3000 --name mongotextsearch-server mongotextsearch-server
} else {
    return 0
}
