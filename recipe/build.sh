#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

export RUST_BACKTRACE=1
export OPENSSL_DIR=$PREFIX
export CARGO_PROFILE_RELEASE_STRIP=symbols
export CARGO_PROFILE_RELEASE_LTO=fat

# build
cargo install --locked \
    --no-track \
    --root "$PREFIX" \
    --path .

cargo-bundle-licenses \
    --format yaml \
    --output "${SRC_DIR}/THIRDPARTY.yml"
