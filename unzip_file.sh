#!/bin/bash
STEM=$(basename "${1}" .gz)
gunzip -c data/compressed/${1} > data/uncompressed/${STEM}
