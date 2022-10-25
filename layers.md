# Application Layer

- protocols below are mainly concerned with maganing the establishment and flow of communications, that is rules around how messages get from one point to another. Application layer relies on the protocols at the layers below them to ensure message / data gets to where it is supposed to and focusses instead on the structure of that massage and the data that it should contain
- Applications most directly interact with the protocols of this layer. It can sometimes also interact with protocols of the transport layer, like opening a TCP socket etc. However it is uncommon for an application to interact with protocols below the transport layer
- protocols here can be thought of as rules for how applications talk to each other at a syntactical level.
- many protocols here as there are many types of applications like
  - email client communication with email server - SMTP likely along with POP or IMAP
  - web browser communication with web server
  - application for transferring files - FTP likely
  - HTTP

**HTTP**
- primary protocol used for communicating on the web

# Transport Layer
- 2 main uses / features
  - direct communication between applications or processes (end-to-end)
  - reliable network communication
- IP takes data to the host. Potentially many applications running on the host. IP not enough to provide communication between processes
- IP provides single channel between hosts. Multiple communication channels are needed
- All data inputs are transferred by IP over the single channel and then they are separated at the other end. - ***multiplexing***
- reverse of this is ***demultiplexing***
- implemented by **network ports**
- **Ports**
  - identifier for a specific process running on a host. Integer in the range 0-65535
  - `0-1023` - commonly used network services
    - `80` - HTTP
    - `20`, `21` - FTP
    - `25` - SMTP etc.
  - `1024-49151` - registered ports. 
    - assigned as requested by private entities like Microsft, IBM, Cisco
    - on some OS ports in this range also used for allocation of ephemeral (temporary) ports on client side
  - `49152-65535` - dynamic ports (aka private ports)
    - cannot be registered for a specific use
    - used for customized services or for allocation as ephemeral ports
- Data from application layer is encapsulated as the data payload here. 
- `PDU` in this layer includes:
  - source and destination port numbers
  - entire `PDU` encapsulated as data payload in an IP packet
- IP address and port number together are what enables end-to-end communication between specific applications on different hosts.
- combination of IP address + port number is a ***communication end-point*** also referred to as a ***socket***.
  - example - `216.3.128.12:8080` - IP address and port number `8080`

**TCP** - Transmission Control Protocol
- provides reliable data transfer
- provides abstraction of reliable network communication on top of an unreliable channel
- essentialy hiding much of the complexity of reliable network communication from the application layer, like data integrity, de-duplication, in-order delivery and re-transmission of lost data
- benefits of these complexities is reliability which is hidden from the application layer but yet there
- flip side, impact on performance which is attemped to be balanced by mechanisms for flow control and congestion avoidance.
- also provides data encapsulation and multiplexing through the use of TCP segments
- `PDU` - TCP segments
  
  **TCP Connections**
  - three way handshake, by flags in the header of the segment. Mainly `SYN`, `ACK` adn `FIN`. state set to `1` or `0`
  - sender sends `SYN` set to `1` -> receiver receives `SYN` segment
  - reeceiver sends `SYN` and `ACK` set to `1` -> sender receives it
  - sender sends `ACK` set to `1` -> receiver receives `ACK` segment
  - connection is established
  - sender can start sending data once it sends the `ACK` segment, receiver can start receiving after it receives the `ACK` segment
  - this is the entire round trip of latency before data can be exchanged.
  
  **Flow Control**
  - prevent sender from overwhelming receiver with too much data at once
  - receiver can process a certain amount of data in a given time, data awaited is stored in a buffer
  - buffer size depends on memory allocated by OS and physical resources available
  - each side can communicate the amount of data via `WINDOW` field of the TCP segemnt header. When buffer is getting full, `WINDOW` will be set to a lower amount
  - flow control prevents sender from overwhelming the receiver, however it does not prevent either from overwhelming the underlying network

  **Congestion Avoidance**
  - Network congestion - when more data is being transmitted than there is network capacity to process and trasnmit the data
  - In terms of routers, data is buffered and when buffer is full data starts to be dropped
  - TCP retransmits this lost data. Data loss is used as a feedback mechanism to detect, avoid network congestion
  - if lots of retransmissions occur - TCP understands that the network is congested and the transmission window size is reduced
  - various alogrithms are used to determine the initial transmission window depending on TCP variant

  **Disadvantage of TCP**
  - Latency overhead in establishing a TCP connection due to handshake
  - HOL - Head-of-Line blocking - general networking concept (not specific to TCP)
    - issues in delivering or processing one message in a sequence of messages can delay or block the delivery or processing of subsequent messages in the sequence
    - HOL occurs in TCP as it provides for in-order delivery of segments (which is although important for reliability)
    - if one segment goes missing it needs to be retransmitted, the segments after have to be buffered and can only be processed after retransmission
    - this leads to queuing delay - one of the elements of latency

  **UDP** User Datagram Protocol
  - another protocol for the transport layer
  - `PDU` - datagram
  - connectionless
  - header has only 4 fields - source port, destination port, UDP length and checksum (optional with IPv4, needed when using IPv6 since they dont provide checksum)
  - provides multiplexing but no reliability
  - it does not do the following
    - no guarantee of message delivery
    - no guarantee of message order
    - no built-in congenstion avoidance or flow-control mechanisms
    - no connection state tracking, its a connectionless protocol (apps can start sending data without having connection established or acknowledgements)
  
  - Use Cases
    - less latency - data flows in one direction - sender to receiver
    - this removes HOL blocking like in TCP
    - UDP used as a base template to build on by developers - example - in order delivery can be implemented in the application while not worrying about an occasional piece of lost data. Developer can decide what is needed. All these services which are requried must be provided at the application level
    - example can be voice or video calling app where occasional piece of dropped data is worth the trade off of the speed provided by the protocol allowing app to work even over long distancesw where there is high latency
    - another example, online gaming, slight glitch is more acceptable than a significant lag
    - responsibility of application level to provide for congestion avoidance to not overwhelm the underlying network 





# Internet / Network Layer
- primary function - facilitate communication between hosts (e.g. computers) on different networks.
- IP (Internet protocol) - predominant protocol
  - features:
  - routing capability via IP addressing
  - Encapsulation of data into packets
- `PDU` - packet
- packet - data payload and header.
- data payload is PDU from the layer above - transport layer
- IP address are logical in nature
  - assigned to devices as required as they join not tied in physically
  - 32 bits in length
  - 4 sections of 8 bits each
  - `0-255.0-255.0-255.0-255` - IPv4
  - IPv6 - 8 x 16 bit blocks
- used for communication between two networked devices anywhere in the world
- for networked applications - only communication is not sufficient - transport layer needed for that

# Link Layer

- primary function - identification of devices on the physical network and moving data over the physical network betweem the devices that comprise it, like hosts (e.g. computers), switches, routers etc.
- `PDU` - ethernet frames
- standards governed by IEEE standards
- adds logic to bits (binary data)
- fields of data delimited by the particular lengths of bytes
- key components - Source and destination MAC address and data payload
- used for communication between devices on the same local network
- MAC address not scalable for wider networks. Flat and non hierarchical. It's tied to a physical device

# Physical Layer
- wires, cables, light, radio waves etc.
- physical realm of the network
- 