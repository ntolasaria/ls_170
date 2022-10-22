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
- Data from application is layer is encapsulated as the data payload here. 
- `PDU` in this layer includes:
  - source and destination port numbers
  - entire `PDU` encapsulated as data payload in an IP packet
- IP address and port number together are what enables end-to-end communication between specific applications on different hosts.
- combination of IP address + port number is a ***communication end-point*** also referred to as a ***socket***.
  - example - `216.3.128.12:8080` - IP address and port number `8080`
  - 


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

- primary function - identification of devices on the physical network and movind data over the physical network betweem the devices that comprise it, like hosts (e.g. computers), switches, routers etc.
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