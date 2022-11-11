1. **What is a network?**

**Answer**
At a basic level, a network is two devices connected in a way that they can communicate or echange data. It can be two computers connected directly using a LAN cable and configured to form a distinct network. It can be a LAN (Local Area Network) where multiple devices are connected via a hub or a switch or it can be as huge and vast as the internet which is a network of networks spreading across the world.

2. **What is the Internet?**

**Answer**
Internet is essentially a network of networks. In a LAN a small number of devices are connected. The scope of communications is limited to the devices connected to the network hub or switch, ie they are local. Routers enable communication between different networks. Within a LAN they act as gateways into and out of the network. Internet can be imagined as a vast number of these networks connected together. In between of all the sub-networks are systems of routers that direct network traffic. Internet spans across the world and is a vast and complex network.

3. **Is the Internet the same thing as a network?** 

**Answer**
Internet is a network in itself. However, all networks are not the internet. A network can be as small as two devices connected directly to each other or a group of devices connected in a local area or as vast as the internet which spans across the globe.

4. **What is WEB (world wide web)**

**Answer**
The world wide web or web is a service that can be accessed via the internet. It is a vast information system comprised of resources which are navigable by means of a URL (Uniform Resource Locator). Uniformity is required for the web as it is a vast system which is achieved by the following:
  - uniformity in how resources are structured so that they can be rendered properly for viewing (HTML). HTML structures documents using headings, paragraphs, lists etc. Hypertexts that make texts a link from one resource to another
  - uniformity in how resources are addressed so that they can be easily located (URI). URI is a stfing of characters which identifies a particular resource.
  - uniformity in the way a request is made and the response to that request (HTTP).

5. **What is the difference between network, Internet, and WEB?**

**Answer**

6. **What are LAN and WLAN?**

**Answer**

LAN or local area network is a network of multiple computers or devices connected via hub or switch. The devices are connected via network cables.

When a wireless hub or switch is used, the network is still comprised of local devices connected but in this case wirelessly which is referred to as WLAN or wireless local area network.

The similarity is the scope of both these types of network is limited to the devices connected to the network hub or switch. They are local to one another.

7. **What is a protocol?**

**Answer**
A vast variety of devices can be connected to the internet ranging from phones, computers, printers, tablets, appliances etc. And these can all rely on hardware like hubs, switches, routers etc. from different makes and also there can be a vast variety of software they are running.

Protocol refers to a set of rules that govern the exchange or transmission of data / messages between devices in a network. Protocols exist to provide uniformity in how the data is exchanged between devices and how it is structured so that it can be interpreted appropriately.

There are many different protocols for network communication and they are in place for mainly two reasons:
  - different protocols to address different aspects of  network communication
  - differnt protocols to address same aspect of network communication but in different ways or for specific use cases

Few examples of protocols are - IP, TCP, UDP, TLS, HTTP, Ethernet, FTP, DNS etc.

8. **What is the role of protocols?** 

**Answer**
Similar to 7


9.  **Why there are many different types of protocols?**

**Answer**

Mentioned in last part of 7

10. **What does it mean that a protocol is stateless?**

**Answer**

A protocol is said it to be stateless when the devices interacting / communicating via the protocol do not hang to information / data from one cycle of data transfer. In other words it can be said that each cycle, example in the case of HTTP every request/response cycle is treated as brand new entities and one request is not aware of any previous request / response.

11. **Explain briefly what are OCI and TCP/IP models? What is the purpose of having models like that?**

**Answer**
Network communication is a complex system. It can be broken down into layers which modularizes it and structures it. By doing so the entire system can be broken down and every particular layer provides with a clear information of what is happenening at that layer. Two most popular are OSI and TCP/IP models. 

The layers of the OSI model are as follows:

`Application`
`Presentation`
`Session`
`Transport`
`Network`
`Data Link`
`Physical`

The layers of the TCP/IP are as follows:

`Application`
`Transport`
`Internet`
`Link`

They help modularize different levels of responsibility in the system.


12. **What is PDU? What is its role?**

**Answer**

PDU is an amount or block of data transferred over a network. Different protocols or protocol layers refer to PDUs by different names. Example, at Link layer, the PDU is an ethernet frame, at transport layer it can be a segment (TCP) or datagram (UDP) at the internet layer it is known as a pakcet.

The PDU generally consists of the following:
- header
- data payload
- trailer or footer (in some cases)

The header provides the metadata for the PDU, for example an IP packet will have the source and destination IP addresses which will be used to route the packet.

Data payload is simply the data that is being transmitted. Data payload is the key to the way encapsulation is implemented. The entire PDU from a protocol at one layer is set as the data payload for a protocol at the layer below. Example, an HTTP request at Application layer will be the data payload for a TCP segement at the transport layer.

13. **What is Data Payload?**

**Answer**
Mentioned in 12

14. **What is the relationship between PDU and Data Payload?**

**Answer**
Mentioned in 12

15. **Explain How lower-level protocols work in general?**

**Answer**

In the physical layer, data is in the from bits (binary data) and these are converted to signals in order to be transmitted. The protocols at the lower level provide structure to this stream of bits separating them into different metadata (headers) and the data payload. The lower level protocols add logic to the stream of bits and also enables the transport of the data to the intended device.

16. **What is encapsulation in the context of networking?**

**Answer**

In the context of networking PDU (Protocol Data Unit) is a block of data transferred over a network. It consists of a header, data payload and sometimes a trailer or hooter. The header provides the metadata and the data payload is the actual data being transported.

Now, the PDU from one layer becomes the data payload of the layer below it. This is the key to how encapsulation is implemented in networking. This creates a separation between layers. By way of encapsulation, protocols at one layer dont need to know how the protocols at other layers are being implemented. It can idependently complete its specific communication tast without information from other layers. Here, essentially a lower layer provides a service to the layer above it.

Example, a TCP segment isn't concerned whether its data payload is an HTTP request, SMTP command or some other sort of application layer data. It just knows that it needs to encapsulate some data from the layer above and provide the result of this to the layer below.

This separation and encapsulation provides a level abstraction which allows us to use different protocols without having to worry about other layers. 

Example, email client using SMTP, web browser using HTTP and file transfer program using FTP can all use TCP at transport layer to trasfer the application layer data.

17. **Why do we need encapsulation?** 

**Answer**
Mentioned in 16

18. **What are the characteristics of a physical network?** 

**Answer**

The physical network comprises of the tabgible part of the network like networked devices, wires, cables, radio waves (wireless networks) etc. and are governed by physical laws and rules.

These rules determine how data is transported from one place to another and is bound by physical and real world limitations. Data is transmitted in the binary form (bits). These are converted into signals depending on the medium like electrical signals, light signals or radio waves.

The two main characteristics of the physical network are:
  - Latency -  This is the time taken for data to get from one point in a network to another. There are several types of delays that determine the overall latency of a network like propagation delay, transmission delay, processing delay, queuing delay. Last mile latency involves delay in getting the signal from ISPs to home / office network. Typically the hops within the core network is longer with less interruptions and at the network edge there are more frequent and shorter hops as data is directed down the network hierarchy to the sub network. RTT (round trip time) - length of time for a signal to be sent added to the length of time for ancknowledgement or response to be received.

  - Bandwith - is the amount of data that can be sent in a particular unit of time (seconds). This varies and is not constant from the start point to end point. It is determined by the lowest amount at a particular point in the overall connection. This also depends on the physical layer and is governed by the physical laws.

19. **How can we as developers deals with the limitations of physical network?**

**Answer**

The physical network comes with limitation due to physical laws and real world limitations. These limitations cannot be changed and developers must considering when building applications. To imporove performance of apps, the implementation must be made in the higher level protocols because the physical limitations cannot be changed or mitigated.

(Must be elaborated further)

20. **What is Latency?**

**Answer**

Mentioned in 18

21. **What is** **Bandwidth?**

**Answer**

Mentioned in 18

22. **What are** **Network 'Hops'?**

**Answer**

Data tranported over a network doesn't go directly from one point to another. There are several journeys between different nodes on the netowrk. These journeys are Network Hops. Nodes can be thought of as routers that process and forward the data to the next node.


23. **What is the relationship between network 'Hops' and latency?**

**Answer**

Network hops are the several journeys between nodes (routers) that data takes when being transported from one point to another. Every node or router will further push or transmit the data along the network to the next node, and this results in some transmission delays along the network which adds to the overall latency. Also, at every node, the data is processed and trasnmitted further which further adds processing delay. Also, network devices such as routers which comprise the nodes can process a certain amount of data at one time. If there is more data than that then the data is queued or buffered. This accounts for some waiting time which is the queuing delay which also adds to the latency of the network.

24. **What is a switch and what is it used for?**

**Answer**

Switch is networking device. It is used to connect multiple devices in a network. A switch operates on the link layer and has the ability to forward the data to the intended device.

25. **What is a hub and what is it used for?**

**Answer**

Hub is a networking device. It is used to connect several devices in a network. Hub operates on the physical layer and the broadcasts the data to all devices (expect the one that is sending the data) of the network.


26. **What is a modem and what it is used for?**

**Answer**

Modulator-demodulator. It is used to convert analouge signal of a phone line to a digital signal that can be processed by a computer and vice versa.

27. **What is a router and what is it used for?**

**Answer**

A router is a device that transmits data between different networks. 

28. **What is the difference between a switch, hub, modem, and router?**

**Answer**

Previous answers

29. **How does the Internet works?**

**Answer**

(marked for later)

30. **What is a MAC address and what is its role in network communication?** 

**Answer**

MAC address or media access control address is the physical identifier of every network device. MAC address is combination 6 two digit hexadecimal numbers and every device in the world has a unique MAC address. The MAC addresses are non logical and arbitrary, they are flat and not hierarchical. The MAC address is tied or physically burned in to a device. 

31. **Give an overview of the Link/Data Layer**

**Answer**

The link/data layer comes in between the physical layer and the internet layer. This layer is involving in provoding logic to the stream of bits from the physical layer. Here the PDU are called frames. The prevalent protocol at this layer is ethernet. The PDU headers contain the source MAC address and the destination MAC address amongst other things. The data payload is the PDU that is a packet from the layer about, internet layer. Frames also provide a footer field called Frame Check Sequence (FCS) which is a checksum where the data is used to generate an FCS using an algorithm. The receiving device uses the same algorithm to compute a value and if this is equal to the FCS then the integrity of the frame is verified. However, protocols at this layer don't provide retransmission of dropped frames. That responsobility is left to the higher level protocols.


32. **What is included in an Ethernet frame?**

**Answer**

PDU - Ethernet Frame
  - Header - source MAC, destination MAC, length etc.
  - Data payload - PDU from internet layer or frame
  - Footer - FCS - Frame check sequence

33. **Give an overview of the Internet/Network Layer and it's role.**

**Answer**
The main purpose of the internet/network layer is to transmit data between hosts on different networks. It helps inter-network communication.

The prevalent protocol in this layer is IP (internet protocol). This uses IP addresses to communicate between different devices on different networks. The PDU here are called packets. Which consists of the source and destination IP addresses amongst other header fields and the data payload which is the PDU from the transport layer (segment). This layer provides for communication between different devices on the network however it does not provide for communication between applications or processes, the higher layers must be used for that.


34. **What is IP?**
35. **What is IP address?** 
36. **What are the components of IP addresses?** 
37. **What is a packet in computer networking?**
38. **Why do we need both MAC addresses and IP addresses?** 
39. **What is DNS and how does it work?**
40. **How do port numbers and IP addresses work together?**
41. **What is a checksum and what is it used for? How is it used?**
42. **Give an overview of the Transport Layer.** 
43. **What are the fundamental elements of reliable protocol?**
44. **What is pipe-lining protocols? What are the benefits of it?**
45. **What is a network port?**
46. **What is a port number?**
47. **What is a network socket?**
48. **Is TCP connectionless? Why?**
49. **How do sockets on the implementation level relate to the idea of protocols being connectionless or connection-oriented?** 
50. **What are sockets on implementation and on a theoretical level?** 
51. **What does it mean that the protocol is connection-oriented?**
52. **What is a three-way handshake? What is it used for?**
53. **What are the advantages and disadvantages of a Three-way handshake?** 
54. **What are multiplexing and demultiplexing?**
55. **How does TCP facilitate efficient data transfer?**
56. **What is flow control? How does it work and why do we need it?**
57. **How TCP prevents from receiver's buffer to get overloaded with data?**
58. **What is congestion avoidance?**
59. **What is network congestion?**
60. **How do transport layer protocols enable communication between processes?**
61. **Compare UDP and TCP. What are similarities, what are differences? What are pros and cons of using each one?** 
62. **What does it mean that network reliability is engineered?**
63. **Give an overview of the Application Layer.** 
64. **What is HTML?**
65. **What is a URL and what components does it have?**
66. **What is a Query string? What it is used for?**
67. **What URL encoding is and when it might be used for?**
68. **Which characters have to be encoded in the URL? Why?**
69. **What is www in the URL?** 
70. **What is URI?**
71. **What is the difference between scheme and protocol in URL?**
72. **What is HTTP?**
73. **What is the role of HTTP?**
74. **Explain the client-server model of web interactions, and the role of HTTP as a protocol within that model**
75. **What are HTTP requests and responses? What are the components of each?**
76. **Describe the HTTP request/response cycle.**
77. **What is a** s**tate in the context of the 'web'?**
78. **What is** s**tatelessness?**
79. **What is a stateful Web Application?**
80. **How can we mimic a stateful application?**
81. **What is the difference between stateful and stateless applications?**
82. **What does it mean that HTTP is a 'stateless protocol?** 
83. **Why HTTP makes it difficult to build a stateful application?**
84. **How the idea that HTTP is a stateless protocol makes the web difficult to secure?** 
85. **What is a `GET` request and how does it work?** 
86. **How is `GET` request initiated?**
87. **What is the HTTP response body and what do we use it for?**
88. **What are the obligatory components of HTTP requests?** 
89. **What are the obligatory components of HTTP response?**
90. **Which HTTP method would you use to send sensitive information to a server? Why?**
91. **Compare `GET` and `POST` methods.**
92. **Describe how would you send a `GET` request to a server and what would happen at each stage.**
93. **Describe how would you send `POST` requests to a server and what is happening at each stage.**
94. **What is a status code? What are some of the status codes types? What is the purpose of status codes?** 
95. **Imagine you are using an HTTP tool and you received a status code `302`. What does this status code mean and what happens if you receive a status code like that?** 
96. **How do modern web applications 'remember' state for each client?**
97. **What role does AJAX play in displaying dynamic content in web applications?**
98. **Describe some of the security threats and what can be done to minimize them?**
99.  **What is the Same Origin Policy? How it is used to mitigate certain security threats?**  
100. **What determines whether a request should use `GET` or `POST` as its HTTP method?**
101. **What is the relationship between a scheme and a protocol in the context of a URL?**
102. **In what ways can we pass information to the application server via the URL?**
103. **How insecure HTTP message transfer looks like?**
104. **What services does HTTP provide and what are the particular problems each of them aims to address?**
105. **What is TLS Handshake?**
106. **What is symmetric key encryption? What is it used for?**
107. **What is asymmetric key encryption? What is it used for?**
108. **Describe SSL/TLS encryption process.**
109. **Describe the pros and cons of TLS Handshake**
110. **Why do we need digital TLS/SSL certificates?** 
111. **What is it CA hierarchy and what is its role in providing secure message transfer?**
112. **What is Cipher Suites and what do we need it for?**
113. **How does TLS add a security layer to HTTP?**
114. **Compare HTTP and HTTPS.**
115. **Does HTTPS use other protocols?** 
116. **How do you know a website uses HTTPS?**
117. **Give examples of some protocols that would be used when a user interacts with a banking website. What would be the role of those protocols?** 
118. **What is server-side infrastructure? What are its basic components?**
119. **What is a server? What is its role?** 
120. **What are optimizations that developers can do in order to improve performance and minimize latency?**