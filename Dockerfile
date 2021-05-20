FROM golang:1.16.4-alpine3.13 AS build
WORKDIR /src
COPY . .
RUN go build -o /out/rocks .
FROM scratch as bin
COPY --from=build /out/rocks /
CMD [ "./rocks" ]