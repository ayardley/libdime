#!/bin/bash

# Example usage: scripts/test.sh -j4

ROOT_DIR=`git rev-parse --show-toplevel`
DEBUG_DIR="$ROOT_DIR/build/clang_debug"
if [ -d "$DEBUG_DIR" ]; then
	cd "$DEBUG_DIR"
else
	mkdir -p "$DEBUG_DIR"
	cd "$DEBUG_DIR"
	"$ROOT_DIR/configure" \
		CC="clang" \
		CFLAGS="-O0 -g" \
		CXXFLAGS="-O0 -g"
fi
make "$@" check
