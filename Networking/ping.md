# Ping Command

It stands for _Packet Internet Groper_. It is a network administration utility used to check the connectivity between two devices on a network. It is used to check the availability of a network device on a network.

### What a PING Command can do?

- Check Network Connectivity
- Check Internet Connection
- Check Network Interface Card
- Check Latency on network
- DNS Resolution

Example Output:

```bash ping arch.org
PING arch.org (104.196.168.51) 56(84) bytes of data.
64 bytes from 51.168.196.104.bc.googleusercontent.com (104.196.168.51): icmp_seq=1 ttl=52 time=268 ms
64 bytes from 51.168.196.104.bc.googleusercontent.com (104.196.168.51): icmp_seq=2 ttl=52 time=267 ms
64 bytes from 51.168.196.104.bc.googleusercontent.com (104.196.168.51): icmp_seq=3 ttl=52 time=326 ms
^C
--- arch.org ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 3213ms
rtt min/avg/max/mdev = 266.757/286.797/325.615/27.453 ms
```

- ICMP = Internet Control Message Protocol

> **1. 64 bytes**
>
> - This shows the size of the ICMP Echo Reply packet received from the server.
> - By default, the ping command sends 56 bytes of data, but with additional 8 bytes for the ICMP header, the total is 64 bytes.
>
> **2. `from 51.168.196.104.bc.googleusercontent.com (104.196.168.51)`**
>
> - `51.168.196.104.bc.googleusercontent.com` -> This is the reverse DNS (PTR record) of the IP address.
> - `104.196.168.51` → This is the actual IP address of the server.
>   _Why is the order reversed?_
>   The reverse DNS lookup converts an IP address into a hostname.
>   The hostname follows a convention where the octets are reversed before the domain.
>   So:
> - The actual IP is 104.196.168.51.
> - The reverse DNS record shows it as 51.168.196.104.bc.googleusercontent.com.
>
>   > [!NOTE] Not all IPs have a reverse DNS, but in this case, Google has set one.
>
> **3. `icmp_seq=1`**
>
> - This means ICMP sequence number 1.
> - Each `ping` request is assigned a sequence number, starting from 1, then 2, 3, etc.
> - It helps track lost packets and determine if responses are out of order.
>
> **4. `ttl=52`**
>
> - TTL (Time to Live) is a value that limits how many hops (routers) the packet can pass through before being discarded.
> - Each router decreases TTL by 1 when forwarding a packet.
> - If TTL reaches 0, the packet is dropped, preventing it from looping indefinitely.
>   _How to estimate the number of hops?_
> - Most systems send pings with an initial TTL value of 64, 128, or 255.
> - Your response TTL is 52, meaning it likely passed through (64 - 52) = 12 hops. 5. time=263 ms
>
> **5. `time=263 ms`**
>
> - This is the round-trip time (RTT) in milliseconds.
> - It shows how long it took for your packet to reach the server and return.
> - Lower values mean faster response, while higher values indicate latency.
>
> **6. `56(84) bytes of data` in the first line (`PING arch.org (104.196.168.51) 56(84) bytes of data.`)**
>
> - 56 bytes → This is the payload size sent in the ping request.
> - 84 bytes → This is the total packet size, which includes:
>   - 56 bytes (actual payload)
>   - 8 bytes (ICMP header)
>   - 20 bytes (IP header)

## How is TTL Set?

- The initial TTL value is set by the server’s operating system or network configuration. Different OS and network setups use different default TTL values.
  | Operating System | Default TTL |
  | -------------- | --------------- |
  | Linux/Unix | 64 |
  | Windows | 128 |
  | Cisco Routers | 255 |

## Why Do Servers Use Different TTL Values?

- Some servers start with lower TTLs to prevent packets from traveling too far (security reasons).
- Others start with higher TTLs so they can be accessed from farther locations.
- Caching servers (like CDNs) may start with a lower TTL if they expect to be closer to users.

## Why is this Different from Traceroute?

- `ping youtube.com` only shows the return path (server → client).
- `traceroute youtube.com` shows the forward path (client → server).
- The paths may be asymmetrical (different networks for outgoing and incoming packets).

## Google's Common IPv6 Prefixes

Google uses well-known IPv6 prefixes for its infrastructure:

- `2001:4860::/32` → Used for Google's global backbone.
- **_`2404:6800::/32` → Used for Google’s services in Asia-Pacific._**
- `2607:f8b0::/32` → Used for Google’s services in North America.
- `2a00:1450::/32` → Used for Google’s European services.

## Connection Issues

- Reason that may interfere Connection (100% packet loss)
  - Firewall (isn't allowing ICMP packets)
  - Server is down
  - Network issue from your side like your net isn't working or router like hardware issue
- Connectivity issues (50% packet loss)
  - Network congestion (High traffic)
  - High latency _Latency is the time it takes for data to travel from your device to a server and back. It is measured in milliseconds (ms)_

Ping command can also be used for DNS Resolution
DNS Resolution means ki kisi bhi domain name ko IP address me convert karna. eg :- `ping arch.org` will return 104.196.168.51 as it's IP
