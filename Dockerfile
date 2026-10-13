FROM adnanh/webhook:2.8.2-alpine
USER root
RUN apk add --no-cache git && git config --global --add safe.directory '*'
USER webhook
CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-port=9000", "-hotreload"]
