FROM golang:1.11-alpine AS BuildingStage


RUN mkdir /BuildSpace
WORKDIR /BuildSpace
COPY . .

ENV GOOS=linux
ENV GO111MODULE=on
ENV CGO_ENABLED=0

RUN go build -o main.o .
WORKDIR /ViolinApp
RUN mkdir /ViolinApp
RUN cp /BuildSpace/main.o .
