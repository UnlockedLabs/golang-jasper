# Go + JasperStarter Docker Image

A lightweight Docker base image combining Go 1.23 Alpine with JasperStarter for report generation.

## What's Included

- **Go 1.23** - Go programming language
- **OpenJDK 17** - Java runtime for JasperStarter
- **JasperStarter 3.6.2** - Tool to run JasperReports reports
- **Font Support** - Common fonts (FreeFont, Liberation, DejaVu) for PDF generation
- **Alpine Linux** - Small and secure base distribution

## Image Tags

- `golang-jasper:1.23-3.6.2` - Version specific tag
- `golang-jasper:latest` - Latest version

## Usage

### As a Base Image

Use this image as a base for your Go applications that need JasperStarter:

```dockerfile
FROM golang-jasper:1.23-3.6.2

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
# clone or copy this directory
cd ~/wkspcs/golang-jasper

# build using the script
./build.sh

# or build manually
docker build -t golang-jasper:1.23-3.6.2 .
docker tag golang-jasper:1.23-3.6.2 golang-jasper:latest
```

## Pushing to Registry

Edit the `REGISTRY` variable in `build.sh` or specify it when building:

```bash
# for Docker Hub
REGISTRY="yourusername/"
./build.sh

# for private registry
REGISTRY="your-registry.com/yournamespace/"
./build.sh
```

## Verification

Test the installation:

```bash
docker run --rm golang-jasper:1.23-3.6.2 jasperstarter --version
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
