FROM python:alpine

RUN pip install uv && \
    uv pip install --system \
        autoflake \
        isort \
        black \
        yamlfix \
        jsbeautifier \
        cssbeautifier

RUN apk add jq

RUN apk add php-cli php-tokenizer php-xml php-dom composer

RUN composer global require laravel/pint

RUN mkdir /app/

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

WORKDIR /app/

ENTRYPOINT ["/app/entrypoint.sh"]

# Labels
LABEL org.opencontainers.image.source=https://github.com/choval/formatter

