FROM golang:latest

ADD src /go/src

RUN go get github.com/astaxie/beego

RUN go get github.com/beego/bee

EXPOSE 8080

ENTRYPOINT bee run tblox
