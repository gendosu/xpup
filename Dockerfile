FROM golang:1.20.2 as builder

WORKDIR /app

COPY . /app

# RUN go install
RUN go install github.com/gendosu/xpup@latest

FROM buildpack-deps:bullseye-scm as app

ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

COPY --from=builder /go/bin /go/bin

CMD "/go/bin/pup"
