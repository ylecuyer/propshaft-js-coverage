#!/bin/sh

cd js/instrumenter
yarn install --frozen-lockfile
yarn run build
cd -

bundle exec gem build
