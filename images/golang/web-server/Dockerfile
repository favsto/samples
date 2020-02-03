# Multistage build

###### compile #######
FROM golang:1.13-alpine AS builder

# compiling
ADD ./app /go/src/hello-app
RUN go install hello-app


###### release #######
FROM alpine:latest

# metadata
LABEL maintainer="fausto.fusaro@injenia.it"

# ports
ENV PORT 8080

# copy executable files
COPY --from=builder /go/bin/hello-app .

# command entrypoint
CMD ["./hello-app"]