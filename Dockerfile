FROM golang:alpine3.18 as build
WORKDIR /go/src/app
ADD . .
RUN go mod init desafio-go
RUN go build -o myapp
FROM scratch as production
COPY --from=build /go/src/app/myapp /myapp
CMD ["./myapp"]

