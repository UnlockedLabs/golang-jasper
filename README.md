# Go + JasperStarter Docker Image

A lightweight Docker base image combining Go 1.25 Alpine with JasperStarter for report generation.

## What's Included

- **Go 1.25** - Go programming language
- **OpenJDK 17** - Java runtime for JasperStarter
- **JasperStarter 3.6.2** - Tool to run JasperReports reports
- **Font Support** - Common fonts (FreeFont, Liberation, DejaVu) for PDF generation
- **Alpine Linux** - Small and secure base distribution

## Image Tags

Available on GitHub Container Registry:

- `ghcr.io/unlockedlabs/golang-jasper:1.25-3.6.2` - Version specific tag
- `ghcr.io/unlockedlabs/golang-jasper:latest` - Latest version

## Usage

### As a Base Image

Use this image as a base for your Go applications that need JasperStarter:

```dockerfile
FROM ghcr.io/unlockedlabs/golang-jasper:1.25-3.6.2

# install your Go development tools
RUN go install github.com/air-verse/air@v1.61.0
RUN go install github.com/go-delve/delve/cmd/dlv@latest

# copy your application files
COPY go.mod go.sum ./
RUN go mod download

COPY . .

# your application setup
EXPOSE 8080
CMD ["air"]
```

### Pulling the Image

```bash
# Pull the latest version
docker pull ghcr.io/unlockedlabs/golang-jasper:latest

# Pull a specific version
docker pull ghcr.io/unlockedlabs/golang-jasper:1.25-3.6.2
```

### Running JasperStarter

The image includes JasperStarter in the PATH, so you can use it directly:

```bash
# in your Dockerfile or at runtime
RUN jasperstarter --version

# just an example in your application code, but suggest to use go-jasper
exec.Command("jasperstarter", "process", "report.jrxml", "-f", "pdf")
```

## Building the Image

```bash
# clone this repository
git clone https://github.com/unlockedlabs/golang-jasperstarter-docker.git
cd golang-jasperstarter-docker

# build using the script
./build.sh

# or build manually
docker build -t ghcr.io/unlockedlabs/golang-jasper:1.25-3.6.2 .
docker tag ghcr.io/unlockedlabs/golang-jasper:1.25-3.6.2 ghcr.io/unlockedlabs/golang-jasper:latest
```

## Pushing to Registry

The image is automatically built and pushed to GitHub Container Registry via GitHub Actions on every push to `main` and on version tags.

### Manual Push

Set your GitHub token and run the build script:

```bash
export GITHUB_TOKEN=ghp_your_token_here
./build.sh
```

The script will prompt you to push after building.

### Automated Push (GitHub Actions)

Push to the `main` branch or create a version tag:

```bash
# Trigger build on push to main
git push origin main

# Or create and push a version tag
git tag v1.25-3.6.2
git push origin v1.25-3.6.2
```

## Verification

Test the installation:

```bash
docker run --rm ghcr.io/unlockedlabs/golang-jasper:1.25-3.6.2 go version
docker run --rm ghcr.io/unlockedlabs/golang-jasper:1.25-3.6.2 jasperstarter --version
```

## Size Optimization

This image is optimized for size while including all necessary components:

- Uses Alpine Linux base
- Removes build artifacts after installation
- Combines RUN commands to reduce layers

## Font Support

The image includes common fonts for PDF generation:

- FreeFont family
- Liberation family
- DejaVu family

Font cache is updated during image build for optimal performance.

## License

This Dockerfile is released under the MIT License. See [LICENSE](LICENSE) for details.

The image includes third-party software with their respective licenses:

- Go: BSD-3-Clause License
- JasperStarter: Apache-2.0 License

See [NOTICES](NOTICES) for complete third-party license information.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
