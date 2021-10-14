#!/bin/bash
function prepare_prisma_client_lambda_layer() {
  chmod +x scripts/ci/create-build-dir.sh && scripts/ci/create-build-dir.sh
  echo "Compiling typescript..."
  tsc
  cp .env build/lambdas/
  cp serverless.yml build/lambdas/
  echo "Installing prod dependencies..."
  yarn install --production --modules-folder build/node_modules/ &> /dev/null
  cp -r scripts/ci/ build/ci
  cp -r prisma build/prisma
  cd build
  npx prisma generate &> /dev/null
  echo "Creating lambda layers..."
  chmod +x ci/prepare-prisma-client-lambda-layer.sh && ci/prepare-prisma-client-lambda-layer.sh
  chmod +x ci/prepare-node-modules-lambda-layer.sh && ci/prepare-node-modules-lambda-layer.sh
  chmod +x ci/prepare-libs-lambda-layer.sh && ci/prepare-libs-lambda-layer.sh

  echo "Cleaning up..."
  rm -rf ci
  rm -rf node_modules
  rm -rf prisma
}

prepare_prisma_client_lambda_layer