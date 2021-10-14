#!/bin/bash
function prepare_node_modules_lambda_layer() {
  rm -rf lambda-layers-node_modules

  mkdir -p lambda-layers-node_modules/nodejs

  rsync -av --progress node_modules lambda-layers-node_modules/nodejs --exclude .prisma --exclude @prisma --exclude prisma &> /dev/null
}
prepare_node_modules_lambda_layer