FROM python:3.12-slim AS builder

WORKDIR /app

COPY . /app/

RUN pip install uv && \
    uv sync && \
    cp -a .venv /opt/venv

FROM python:3.12-slim AS runtime

WORKDIR /app

COPY --from=builder /opt/venv /opt/venv
COPY --from=builder /app /app
COPY --from=builder /app/docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENV PATH="/opt/venv/bin:${PATH}"

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
