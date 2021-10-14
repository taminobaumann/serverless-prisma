#!/bin/bash
function prepare_prisma_client_lambda_layer() {
  rm -rf lambda-layers-prisma-client

  mkdir -p lambda-layers-prisma-client/nodejs/node_modules/.prisma
  mkdir -p lambda-layers-prisma-client/nodejs/node_modules/@prisma

  cp -r node_modules/.prisma/ lambda-layers-prisma-client/nodejs/node_modules/.prisma
  cp -r node_modules/@prisma/ lambda-layers-prisma-client/nodejs/node_modules/@prisma

  rm lambda-layers-prisma-client/nodejs/node_modules/.prisma/client/libquery_engine-darwin.dylib.node
}

prepare_prisma_client_lambda_layer