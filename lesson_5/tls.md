# TLS

TLS (Transport Layer Security) protocol - started as SSL (Secure Sockets Layer), developed by netscape

Most recent version - TLS 1.3

Three important services provided:
- Encryption
- Authentication
- Integrity

All three services are not mandatory to be used togther, however all three are used together to provide the most secure connection possible.

## Encryption

**Symmetric key encryption**

- Cryptography has evolved but the underlying concept is that of Vigenere cipher, where sender and receiver share a common encryption key. Shared key system is called symmetric key encryption. 

- 2 parties want to exchange messages securely, they agree of a secret key and keep a copy of it. A encrypts the message using the key and sends it and B receives it and decrypts it using the his copy of the same key. This can be carried out in both directions.
  - The problem in is that the part of the key exchange and how securely it is done. If a party intercepts the key, they could use it to decrypt the messages between the sender and receiver
  - required: mechanism where the encryption key can be encrypted, so that even if intercepted cant be used

**Asymmetric key encryption**

- aka public key encryption. uses a pair of keys - public key and private key
  - keys are non identical - public key to encrypt, private key to decrypt
- messages encrypted with the public key can only be decrypted with the private key
- public key is openly available, private is kept in sole possession of the message receiver

  Example:
  - A wants to receive encrypted messages
  - A generates a public and private key
  - A makes the public key available but keeps the private key
  - B uses A's public key to encrypt the message and send to A
  - A receives the message and decrypts with the private key

- This is primlarily uni directional. B can send to A, however in this case A cant send to B

**TLS handshake**

- For HTTP request/response both must be encrypted and only decrypted by the intended recepient. Most efficient way is symmetric key cryptography.
- However, for this a secure exchange of the symmetric key is required
- TLS handles this using a combination of symmetric and asymmetric
  - bulk of message exchange is conducted via symmetric key exchange
  - initial symmetric key exchange is conducted using asymmetric key encryption, this process by which initial secure connection is set up is conducted during what is known as TLS handshake

Parts of a TLS handshake
- client sends the `ClientHello` message immediately after the TCP `ACK` (after the three way handshake) - contains among other things, maximum version of TLS protocol that the client can support, list of Cipher Suites that the client is able to use
- server recieves `ClientHello` - responds with a message including `ServerHello` which sets protocol version and Cipher Suite amongst other information. This message also includes its certificate (containing its public key) and a `SeverHelloDone` marker - indicating to the client that this step of handshake is finished
- client receives `ServerHelloDone` marker - initiates the key exchange process. This enables client and server to securely obtain a copy of symmetric encryption key (to be used for bulk of message transfer). Process of generating symmetric keys vary according to the key exchange algorithm selected as part of Cipher Suite (like RSA , Diffie-Hellman etc.)
  - Example using RSA
  - client generates `pre-master secret` encrypts with server's public key and sends to server
  - server receives `pre-master secret` and decrypts it using its private key
  - client and server use `pre-master secret` along with other pre-agreed parameters to generate the same symmetric key
  - As part of this communication, which includes `ClientKeyExchange` message (e.g. pre-master secret), client also sends `ChangeCipherSpec` flag which tells the server that encrypted communications should start using the symmetric keys. Also, it includes a `Finished` flag to indicate that the client is now done with the TLS handshake
  - server also sends a message with `ChangeCipherSpec` and `Finished` flag. Now, secure communication begins using the symmetric key

Key points about TLS handshake:
  - used to agree on the version of TLS used
  - used to agree on various algorithms to be included in the cipher suite
  - used to enable exchange of symmetric keys that will be used for message encryption

Adds up to two round trips of latency (depending on TLS version). This over the intial round trip from TCP three way handshake

**DTLS** - Datagram Transport Layer Security - based on TLS - for use with connections that use UDP at Transport Layer

**Cipher** - cryptographic algorithm or set of steps for performing encryption, decryption and other tasks. 
**Cipher suite** - set of ciphers

## Authentication

encryption provides one kind of protection but what if the source of that encrypted data is malicious like a third-party impersonating a bank and get confidential information. Means of identifying the other party in message exchange is where authentication comes in

Server sends certificate as response to `ClientHello` message. This contains public key and also a means of identification for the party providing it. It contains various information like owner etc. This can also be presented by a third party as its own as it is publicly available hence this is just one part of authentication.

Exact way Public Key is used depends on authentication algorithm selected as part of cipher suite. Looks something like:
- server sends its certificate, which has public key
- server creates a signature in form of some data encrypted with server's private key
- signature and message are transmitted
- client receives and decrypts signature using server's public key and compares decrypted data to original version
- if its match that means it was sent by a party in possession of th private key

This is good but still not enough. Malicious third party can still create thier own key pair and certificate identifying them as someone else. Here, Certificate Authorities

**Certificate Authorities**

Trustworthy sources that issue certificates

CA does the following when issuing certificates:
- verify the identity of the party. The way depends on the CA and also on the type of certificate. Example, for domain validated server ownership of domain can be proved by uploading a specific file to a server that is accessible by the domain
- digitally signs the certificate being issued - done by encrypting data with the CA's own private key and using this encrypted data as signature. Unencrypted version of data is also added to certificate. It can be decrypted by CA's public key on receiving and checked for a match

CA's have levels
- intermidiate CA - company or body authorised by Root CA to issue certificates on its behalf. Example, Let's Encrypt - provides free automated certifactes

Google has own CA - Google Internet Authority

Chain of trust 

Root CA issues to -> Intermediate CA -> website

browser checks certificate and goes up the chain to the Root CA. Root certificates are self signed and are end point of chain of trust. Root CA private keys have many layers of security to make them inaccessible. 

Root CA - doesn't issue end user certificates
        - leaves it intermediate CA's
        - if private key of intermediate gets compromised, Root CA can revoke it's certificate
        - End points, reputation gained through prominence and longevity - group of organisations approved by browser OS vendors

Whole system is on trust and can still have failures - 2015 Symantec issuing fake Google Certificates

## Integrity

Functionality to check integrity of data transported via protocol, ie to test if some data was corrupted during transport

**TLS Encapsulation**

OSI model - TLS - session layer - ie, between application layer (HTTP) and Transport Layer (TCP)

Basically - TLS operates between HTTP and TCP

TLS sends data (TLS Record - PDU) in similar format as other PDUs:
  - data forms payload
  - meta data as header and trailer fields
  - main field - MAC (Message Authentication Code) name same but completely different to MAC Address (media access control address)

**Message Authentication Code (MAC)**

It's similar to checksum fields seen in other PDUs. There is difference in implementation and intention
  - checksum for example in TCP segment - error detection (check if data was corrupted during transport)
  - MAC - add layer of security providing means of checking message hasn't been altered or tampered with in transit

Implemented using a hashing algorithm as follows:
  - sender creates a digest of the data payload which is a small amount of data derived from actual data. Created using specific hashing algorithm combined with pre-agrees hash value. Algorithm agreed as part of TLS Handshake with cipher suite
  - sender encrypts data payload using symmetric key, encapsulate into TLS record and passes down to transport layer to be sent to receiver
  - receiver receives and decrypts usign symmetric key. Receiver also creates digest using same algorithm and hash value. If digests match, integrity of data is confirmed

