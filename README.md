# xpup

xpup is pup for XML.

It uses xpath rather than css selectors.

## Install

```
go get github.com/ericchiang/xpup
```

Binary installs coming soon.

## Example

```
$ curl -s http://www.xmlfiles.com/examples/note.xml
<?xml version="1.0" encoding="ISO8859-1" ?>
<note>
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>
```

```
$ curl -s http://www.xmlfiles.com/examples/note.xml | xpup '/*/body'
Don't forget me this weekend!
```

## Example using Docker

```
$ curl -s http://www.xmlfiles.com/examples/note.xml | docker run --rm gendosu/xpup xpup '/*/body'
Don't forget me this weekend!
```

## build docker image

```
$ docker buildx build --platform linux/amd64,linux/arm64 -t gendosu/xpup:latest --push .
```
