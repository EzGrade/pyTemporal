#!/bin/bash
set -euo pipefail

cd /app

python src/manage.py makemigrations --noinput
python src/manage.py migrate --noinput

exec python src/manage.py runserver 0.0.0.0:8000
