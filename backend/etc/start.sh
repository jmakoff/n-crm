#!/bin/bash

DIR=$(dirname "$0")

export BACKEND_PORT=2100

bash $DIR/../../dev-env/start.sh

# pm2 start $DIR/../src/index.js
$DIR/../node_modules/.bin/nodemon --harmony --trace-deprecation --trace-warnings $DIR/../src/index.js