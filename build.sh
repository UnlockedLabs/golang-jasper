#!/bin/bash

# builds and pushs Go + JasperStarter base image

# config settings
IMAGE_NAME="golang-jasper"
VERSION="1.23-3.6.2"
REGISTRY="carddev81/"  # Set your registry here, e.g., "your-registry.com/"
FULL_IMAGE_NAME="${REGISTRY}${IMAGE_NAME}:${VERSION}"

echo "Building ${FULL_IMAGE_NAME}..."
docker build -t "${FULL_IMAGE_NAME}" .
docker tag "${FULL_IMAGE_NAME}" "${REGISTRY}${IMAGE_NAME}:latest"

echo "Build completed!"
echo "Image: ${FULL_IMAGE_NAME}"
echo "Also tagged as: ${REGISTRY}${IMAGE_NAME}:latest"

read -p "Push to registry? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Pushing ${FULL_IMAGE_NAME}..."
    docker push "${FULL_IMAGE_NAME}"

    echo "Pushing ${REGISTRY}${IMAGE_NAME}:latest..."
    docker push "${REGISTRY}${IMAGE_NAME}:latest"

    echo "Push completed!"
else
    echo "Images built locally. Use 'docker push' to upload to registry when ready."
fi

echo ""
echo "To use this image in your Dockerfile:"
echo "FROM ${FULL_IMAGE_NAME}"