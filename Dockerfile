FROM golang:1.14.7-alpine3.12 as getter
RUN apk add git
RUN go get github.com/prasmussen/gdrive
RUN cp $GOPATH/bin/gdrive /gdrive
FROM alpine:3.12
WORKDIR /app
COPY --from=getter /gdrive .
ENTRYPOINT ["./gdrive"]
