#!/bin/bash

MSYS_NO_PATHCONV=1 docker run -it --rm -p 8000:8000 \
  -v "$(pwd)":/app \
  pytemporal:latest
