$ROOT_DIR = Get-Location

# Ensure that we have JavaScript files
Set-Location -Path "server"
npm install
npm run build

# Build Docker image
docker build -t mongotextsearch-be .

# Clear the console
Clear-Host

$answer = Read-Host "Do you want to start the backend container? (y/n)"

if ($answer -eq "y") {
    # Start the Docker container
    docker run -d -p 3000:3000 --name mongotextsearch-be mongotextsearch-be
} else {
    return 0
}
