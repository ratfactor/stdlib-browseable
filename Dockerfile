FROM php:8.1-cli-alpine3.18
RUN apk add --update --no-cache bash
WORKDIR /usr/src/myapp
RUN mkdir -p /usr/src/zig
COPY . .
CMD [ "/usr/src/myapp/build.sh", "/usr/src/zig/lib/std" ]
