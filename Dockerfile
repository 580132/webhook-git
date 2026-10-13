FROM alpine:3.20

ARG TARGETARCH
ARG WEBHOOK_VERSION=2.8.3

RUN apk add --no-cache git \
    && wget -qO- "https://github.com/adnanh/webhook/releases/download/${WEBHOOK_VERSION}/webhook-linux-${TARGETARCH}.tar.gz" \
        | tar -xz -C /tmp \
    && mv "/tmp/webhook-linux-${TARGETARCH}/webhook" /usr/local/bin/webhook \
    && chmod +x /usr/local/bin/webhook \
    && git config --global --add safe.directory '*'

EXPOSE 9000

CMD ["webhook", "-verbose", "-hooks=/etc/webhook/hooks.json", "-port=9000", "-hotreload"]
