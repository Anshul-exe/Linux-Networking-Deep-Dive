# SS Command

`ss` stands for _socket statistics_. It is a modern Linux command used to inspect network sockets.  
You can think of it as the faster and cleaner replacement of `netstat` for most day-to-day debugging.

### What `ss` can do?

- Show active TCP/UDP connections
- Show listening ports/services
- Show process using a port
- Filter output by state, port, protocol, or address
- Show socket memory and timers (advanced troubleshooting)

> [!NOTE]
> `ss` gets data directly from the kernel (`netlink`), so output is usually faster and more accurate than older tools.

---

## Useful Commands I Actually Use

### 1) Show all TCP connections

```bash
ss -t
```

- `-t` = TCP sockets

### 2) Show all UDP connections

```bash
ss -u
```

- `-u` = UDP sockets

### 3) Show listening sockets only (most useful while debugging server issues)

```bash
ss -l
```

- `-l` = listening only

### 4) Show listening TCP + UDP ports in numeric format

```bash
ss -tuln
```

- `-t` = TCP
- `-u` = UDP
- `-l` = listening
- `-n` = numeric output (no DNS/service name resolution)

### 5) Show which process is using which socket

```bash
ss -tulpn
```

- `-p` = process info (PID/program name)

If a port is already in use and my app is not starting, this is my go-to command.

### 6) Filter by port

```bash
ss -tulpn | grep :8080
```

This helps quickly find who is using port `8080`.

### 7) Show established connections only

```bash
ss -t state established
```

This is useful when checking who is actively connected right now.

---

## Example Output

```bash
ss -tuln
Netid State  Recv-Q Send-Q Local Address:Port  Peer Address:Port
tcp   LISTEN 0      128    0.0.0.0:22         0.0.0.0:*
tcp   LISTEN 0      511    127.0.0.1:5432     0.0.0.0:*
udp   UNCONN 0      0      0.0.0.0:68         0.0.0.0:*
```

### How I read this output:

- `Netid` → protocol type (`tcp`, `udp`)
- `State` → socket state (`LISTEN`, `ESTAB`, etc.)
- `Recv-Q` → data waiting to be read
- `Send-Q` → data waiting to be sent
- `Local Address:Port` → local endpoint
- `Peer Address:Port` → remote endpoint (`*` means any)

---

## Practical Troubleshooting Flow (real-world)

Suppose website is not opening on my server:

1. `ping` server first to check reachability.
2. If reachable, run `ss -tulpn` and check if webserver port (80/443/3000/8080 etc.) is listening.
3. If port is not listening -> service is down.
4. If port is listening but wrong process has occupied expected port -> stop that process and restart service.
5. Recheck with `ss -tulpn` and test in browser/curl.

---

## `ss` vs `netstat`

- `ss` is newer and faster.
- `netstat` is older (from `net-tools`) and may not be installed by default in modern distros.
- For Linux troubleshooting, prefer `ss` unless specifically asked for `netstat`.

---

## Common States (quick memory)

- `LISTEN` -> waiting for incoming connections
- `ESTAB` -> active established connection
- `TIME-WAIT` -> connection closed but waiting before full cleanup
- `CLOSE-WAIT` -> remote side closed, local app still hasn’t closed

These states help in debugging stuck or overloaded network services.
