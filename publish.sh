#!/usr/bin/env bash
set -e

function publish {
  echo -e "Attempting to publish to NPM..."
  npm publish --access public
  echo -e "Successfully published to NPM.\n"
}

if [[ -n "$TRAVIS_TAG" ]]; then
  if [[ $NPM_TOKEN ]]; then

    echo "//registry.npmjs.org/:_authToken=\${NPM_TOKEN}" > .npmrc
    publish
    rm .npmrc

  else
    echo -e "Aborting publishing to NPM. Credentials not found."
  fi
else
  echo -e "Publishing to NPM only occurs during a tagged build."
fi