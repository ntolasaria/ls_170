# HTTP

- invented by Tim Berners-Lee in 1980s. 
- protocol that serves as a link between applications and the transfer of hypertext documents

When a URL is accessed, like http://www.google.com. Essentially URL's are mapped to their respective IP addresses. The mapping is handled by  DNS (Domain Name System) which is a distributed database which translates domain names to an IP address. DNS databases are stored on computers called DNS servers. There is a very large world-wide network of hierarchically organised DNS servers and no single DNS server contains the complete database. IF a DNS server does not contain a requested domain name, it routes the request to another one up the hierarchy.

Typical interaction with the internet starts with a web browser.

  - a URL is entered into the web browser's address bar like http://www.google.com
  - the browser creates an HTTP request which is packaged and sent to the device's network interface
  - If device has IP address for domain name in the DNS cache, it will be used. If not, DNS request will be made to the Domain Name System to get the IP address
  - The packaged-up HTTP request then goes over the internet where it is directed to the server with the matching IP address
  - The remote server accepts the request sends a response over the internet back to your network interface which hands it to your browser
  - Finally, the browser displays the response in the form of a web page

Basically, when the browser issues a request, it's simply sending some text to an IP address. Because the client (browser) and the server (recepient) have an agreement, or protocol (HTTP), the server can take apart the request ad understand its components and send a response back to the web browser. The browser will then process the response strings into content that you can understand.

**Resources** - generic term for things you interact with on the internet via a URL like images, videos, web pages and other files. It can also be in the form of software that lets you trade stock or a game etc.

- HTTP is a stateless protocol - developers need to use other ways, tricks and frameworks to create a stateful experience in web applications
  - Web is built on HTTP. Statelessness makes it resilient, distributed and hard to control. However, it also makes it so difficult to secure and build on top of

## URL components

http://www.example.com:88/home?item=book

- `http` - **scheme** - comes before colon and two forward slashes, tells the web client how to access the resource. In this case it tells the web client to use Hypertext Transfer Protocol (HTTP) to make a request. Other popular URL schemes are `ftp`, `mailto`, `git` etc.

- `www.example.com` - the **host** - tells client where the resource is hosted or located

- `:88` - **port** or port number. Required if other port is to be used than the default

- `/home` - **path** - shows what local resource is being requested. Optional

- `?item=book` - **query string** - made up of query parameters. Used to send data to the server. Also optional.
  
http://www.example.com/home/index.html

Sometimes tha path can point to a specific resource on the host. Like above, the HTML file is pointed to in the server

http://www.example.com?search=ruby&results=10

- `?` reserved character, marks start of query string

- `search=ruby` parameter name/value pair

- `&` reserved character, to add more parameters to the query string

- `results=10` - also a parameter name/value pair

Limitations of query strings:

- query strings have a maximum length.
- name/value pairs are visible. Passing sensitive information like username or password not recommended
- space and special characters like `&` cannot be used. Must be URL encoded

**URL Encoding** - reserved characters (`/`, `?`, `:`, `&`, `@` etc.) (when not being used for their special use), unsafe characters (`%`, `#`, `<`, `>`, `{`, `}` etc.) and characters that don't have a corresponding character within the standard ASCII character set need to be encoded with a `%` symbol followed by two hexadecimal digits that represent the ASCII code of the character.

Basically, alphaneumeric and the special characters `$-_.+!'()",` and reserved characters when used for their reserved purposes can be used unencoded within a URL.

## Making Requests:

Methods

**GET**
- typically initiated by clicking a link or via the address bar if a web browser. 

**POST**
- used when we want to initiate some action on the server or send data to a server
- typically when submitting a form from a browser `POST` is used
- allows us to send much larger and sensitive data to the server like images, videos etc.
- for sensitive data like username, passwords if `GET` is used and query strings are sent, the information will be exposed in the URL
- `POST` request in a form fixes this problem
- `POST` also helps with the query string size limitation as with `GET`. larger forms of information can be sent to the server


## Processing Responses

**Status Code**
- three digit number that server sends back after receiving request signifying the status of the request. `status text` is displayed next to `status code`

Some useful status code

`200` - ***OK*** - request was handled successfully
`302` - ***Found*** - requested resource has changed temporarily. Usually results in a redirect to another URL
`404` - ***Not Found*** - requested resource cannot be found
`500` - ***Internal Server Error*** - server has encountered a generic error


**Parts of an HTTP response**
- status code
- headers
- message body, which contains raw response data.

## Stateful Web Applications

- HTTP is stateless, ie the server does not hang on to information between each request / response cycle
- each request is treated as a brand new entity and different requests are not aware of each other
  - pros: makes HTTP and internet spo distributed and difficult to control
  - cons: makes it difficult for web developers to build stateful web applications

Some techniques used on the client to make displaying dynamic content easy / simulate a stateful web experience:

- Sessions
- Cookies
- Asynchronous JavaScript calls, or AJAX

**Sessions**
- server sends a unique token to the client
- whenever client makes a request to that server, it appends this token as part of the request, allowing the server to identify clients
- this token is called the **session identifier**
- this mechanism of passing `session id` between client and server creates a sense of statefulness (false) which web developers leverage to build sophisticated applications.
- each request is technically stateless though
- some consequences
  - every request must be inspected for a session a identifier
  - if identifier is there, server must check that the session id is still valid
  - server needs to maintain rules regarding how to handle session expiration and how to store its session data
  - also server needs to retrieve the session based on the session id
  - finally recreating the application state and sending it back to the client as a response
- server works really hard for every request, for every small change the entire page has to be recreated and sent back to the client freshly
  - example, liking an image on facebook and the page reloads with a new response recreating the page (HTML) just for that like. However, FB uses Ajax instead.

**Cookies**
- piece of data that's sent from the server and stored in the client during a request / response cycle. 
- cookies of HTTP cookies are small files stored in the browser and contain session information
- when a website is accessed for the first time, server sends session information and sets it in browser cookie in the local computer
- actual session data stored on client. client and server side cookies are compared to identify the session
- cookies are set in the browser, however the session data is stored in the server
- browsers have cookies enabled by default

**AJAX** - Asynchronous JavaScript and XML
- allows browsers to issue requests and process responses without a full page refresh
- example, facebook page logged in
  - server generates initial page with all photos, likes, comments etc. (very expensive HTML page)
  - when liking a pic, the entire page will not be refreshed / reloaded saving on a lot of resources
- with AJAX, all requests sent from the client are performed asynchronously, basically the page is not refreshed for every request
- every change in the page like pressing a like button, typing a character etc. issues a request basically triggers an AJAX request. The responses by these requests are processed by some `callback` (piece of logic you pass to some function to be executed after a certain event has happened). This updates the HTML with the new responses.
- AJAX requests are like normal requests. They are sent to server with all normal components of an HTTP request, server handles them like any other request. Difference is that the response is processed by a callback function, which is usually some client-side JavaScript code.
- AJAX helps to display dynamic content in web applications


## Security

**HTTPS** - Secure HTTP

- `https://` instead of `http://`
- hacker can employ packet sniffing and get the session id, then pose as the original client and logged in to the desired session without even knowing the username or password
- in HTTPS every request/response is encrypted before being transported on the network. If the hacker get the data, it will be encrypted and useless
- cryptographic protocol TLS (Transport Layer Security) is used for encrytion. Earlier versions used SSL (Secure Sockets Layer)
  - uses certificates to communicate with remote servers and exchange security keys before data encryption happens. Certificates can be inspected by clicking on the padlock icon that appears before `https://` in the browser
- as an extra security step, certificates can be viewed before interacting with the website

**Same-origin policy**

