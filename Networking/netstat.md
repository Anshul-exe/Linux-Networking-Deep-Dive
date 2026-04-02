# Netstat Command

### `netstat` command displays network connections, routing tables, interface statistics, masquerade connections, and multicast memberships. It can display:

- Active network connections (who your computer is talking to).
- Routing tables (how data moves between networks).
- Network interface stats (how much data is being sent/received).
- Masquerade connections (used in NAT for internet sharing).
- Multicast memberships (group communication in networks).

For example I want to access a webserver but it isn't working coz...

1. _Webserver may be down or is listening on a different port_
2. _webserver ka port kisi aur process ne le liya hoga_

- first I can `ping` and see if the server is reachable.
- if the server is reachable then I can use `netstat -tuln` which will show me all the listening ports on the server. and then I can specify the port where webserver is hosted by `grep`ing the port id as there's a chance that the webserver port is getting by another process
- now I can kill that process and access the webserver.

> [!NOTE]
> Identify connections on a given port or IP by using
> `bash netstat -putan | grep <Port/IP>`
>
> flags:
>
> - `-p` - PID/process
> - `-u` - udp
> - `-t` - tcp
> - `-a` - all
> - `-n` - numeric
> - `-l` - listening

Example Output:

## Active Internet Connections meaning the connections that are from the outside of the server on internet level **Most work is done in this part**

```bash netstat
Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 ARCH:44416              ns5022367.ip-1:www-http TIME_WAIT
tcp        0      0 ARCH:33336              202.241.199.104.b:tripe ESTABLISHED
tcp        0      0 ARCH:59136              ns5022367.ip-1:www-http TIME_WAIT
```

## Active UNIX domain sockets meaning the connections that are from the inside of the server on system level

```bash Active UNIX domain sockets (w/o servers)
Proto RefCnt Flags       Type       State         I-Node   Path
unix  3      [ ]         STREAM     CONNECTED     1297943
unix  3      [ ]         STREAM     CONNECTED     457083
unix  3      [ ]         STREAM     CONNECTED     666      /run/systemd/journal/stdout
```

## Difference Between TCP and UDP

### 1. What is TCP?

**TCP (Transmission Control Protocol)** is a connection-based protocol that ensures data is sent and received correctly. It is reliable and used when accuracy is important.

---

### 2. What is UDP?

**UDP (User Datagram Protocol)** is a connectionless protocol that sends data without checking if it arrives correctly. It is used when speed is more important than reliability.

---

#### Simple Analogy:

- **TCP** is like sending a certified letter: You get a confirmation when it's delivered.
- **UDP** is like sending a postcard: It may arrive, but there's no guarantee.

### Key Differences Between TCP and UDP

| Feature     | TCP                                   | UDP                            |
| ----------- | ------------------------------------- | ------------------------------ |
| Connection  | Connection-oriented                   | Connectionless                 |
| Reliability | High (error checking, retransmission) | Low (no guarantee of delivery) |
| Speed       | Slower due to reliability checks      | Faster, but data may be lost   |
| Use Case    | Web browsing, file transfers, emails  | Streaming, gaming, voice calls |
