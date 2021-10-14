#!/bin/bash
function prepare_libs_lambda_layer() {
  rm -rf lambda-layers-libs

  mkdir -p lambda-layers-libs/nodejs/node_modules/@libs
  mv libs @libs

  cp -r @libs lambda-layers-libs/nodejs/node_modules

  rm -r @libs
}
prepare_libs_lambda_layer