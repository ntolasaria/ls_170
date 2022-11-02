# HTTP

## Client-Server

client -> http request -> server
client <- http response <- server

server ->   web server  - responds to static requests like files, images, css, javascript etc.

            application sever - application or logic resides here - more complicated requests are handled here
            
            data store - used to persist data between stateless request/response cycles

## HTTP over TCP/IP

- HTTP mostly relies omn TCP/IP connection.
- HTTP operates at application layer - structures messages that are exchanged between apps. TCP/IP does the heavy lifting and ensures request/response cycle gets completed between browser and server


# URL

- URI - sequence of characters that identifies an abstract or physical resource
- URL - the subset of URIs that, in additon to identifying a resource, provides a means of locating the resource by describing its primary access mechanism (e.g, network location)

## Schemes and Protocols
- scheme and protocols are different, howver scheme identifies the protocol or protocol family used to access a resource like `http` rather than `HTTP 1.0` or `HTTP 1.1`.
- scheme is lowercase and protocol names are in uppercase in the canonical form

## Filepaths

- earlier paths of the URL `http://www.mywebsite.com/food/recipes/lasagne.html` represented a physical file location on the web server. Here, the file `lasagne.html` from the `recipes` sub-directory of the `food` directory from the server identified by `www.mywebsite.com/`
- now content is generated dynamically which takes place on the server where server-side frameworks or applications produce HTML pages and responses. Very recently there has been increase in client-side frameworks, where HTTP response is manipulated by an app running in the browser before being rendered
- the client and server side frameworks differ in implementation, the common part is that the path portion of URL is determined by application logic and not necessarily a represents a file structure on the server
- the way path is used is implemented in applicaion or framework, involves pattern matching to match the path to pre-defined route which then executes some specific logic

## Request/Response Cycle

**Request**
- required components of an HTTP request
  - HTTP method (like `GET`, `POST` etc)
  - path, makes up request-line with above
  - as of HTTP 1.0, the version also forms part of request-line
  - `Host` header since HTTP 1.1
- optional components
  - parameters
  - other headers
  - message body

**Response**
- required components
  - status code (Like `200` OK)
- optional
  - headers
  - body

**Methods**

`GET` - only retrieve content from the server
- can be thought of as read only operations
- exceptions - webpage that tracks how many times it is viewed. `GET` is appropriate since the main content of page doesn't change
- search froms - use `GET` - since data on the server is not being changed only viewed

`POST` - involve changing values that are stored on the server
- most HTML forms that submit their values to the server will use `POST`
- exception - search forms - use `GET`
- 