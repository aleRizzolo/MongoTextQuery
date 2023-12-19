# Define variables
$ROOT_DIR = Get-Location

# Create a Docker network
docker network create --driver bridge mongotextsearch

# Change directory to the server folder
cd server

# Install npm dependencies and build
npm install
npm run build

# Build the Docker image for the server
docker build -t mongotextsearch-server .
Clear-Host

# Change back to the root directory
cd $ROOT_DIR

$answer = Read-Host "Do you want to start the application? Yy/Nn"

switch ($answer) {
    'Y' { Write-Host "docker run --rm -d --network mongotextsearch -p 3000:3000 --name mongotextsearch-server mongotextsearch-server" }
    'y' { Write-Host "docker run --rm -d --network mongotextsearch -p 3000:3000 --name mongotextsearch-server mongotextsearch-server" }
    'N' { exit 0 }
    'n' { exit 0 }
    default { Write-Host "Invalid choice" }
}
