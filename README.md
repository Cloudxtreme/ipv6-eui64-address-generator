ipv6-eui64-address-generator
============================

Script that generates IPv6 EUI-64 addresses (or the appropriate commands for Nmap) based on a vendor's OUI.

Usage: ```lua eui64_address_generator.lua <vendors> <filename> <network address> <nmap's flag>```

```vendors```: is the name of the chosen vendors. Example: ```Sony,Ibm```.
```filename```: contains the names of the vendors and their respective OUIs.
```network address```: the network address.
```nmap flag```: this must be true should Nmap commands be generated instead of all the addresses.


Executing ```lua eui64_address_generator.lua Sony,Xerox vendors.csv fe80:0000:0000:0000 true``` will generate:


```
# Xerox
nmap -6 fe80:0000:0000:0000FFFE:0000:01::/104
nmap -6 fe80:0000:0000:0000FFFE:0000:02::/104
nmap -6 fe80:0000:0000:0000FFFE:0000:03::/104
nmap -6 fe80:0000:0000:0000FFFE:0000:04::/104
nmap -6 fe80:0000:0000:0000FFFE:0000:05::/104
nmap -6 fe80:0000:0000:0000FFFE:0000:06::/104
nmap -6 fe80:0000:0000:0000FFFE:0000:07::/104
nmap -6 fe80:0000:0000:0000FFFE:0000:08::/104
nmap -6 fe80:0000:0000:0000FFFE:0000:09::/104
nmap -6 fe80:0000:0000:0000FFFE:0000:AA::/104
nmap -6 fe80:0000:0000:0000FFFE:0055:00::/104
nmap -6 fe80:0000:0000:0000FFFE:9C93:4E::/104
# Sony
nmap -6 fe80:0000:0000:0000FFFE:0001:4A::/104
nmap -6 fe80:0000:0000:0000FFFE:0013:A9::/104
nmap -6 fe80:0000:0000:0000FFFE:001A:80::/104
nmap -6 fe80:0000:0000:0000FFFE:001D:BA::/104
nmap -6 fe80:0000:0000:0000FFFE:0024:BE::/104
nmap -6 fe80:0000:0000:0000FFFE:0800:46::/104
nmap -6 fe80:0000:0000:0000FFFE:30F9:ED::/104
nmap -6 fe80:0000:0000:0000FFFE:3C07:71::/104
nmap -6 fe80:0000:0000:0000FFFE:5442:49::/104
nmap -6 fe80:0000:0000:0000FFFE:5453:ED::/104
nmap -6 fe80:0000:0000:0000FFFE:7884:3C::/104
nmap -6 fe80:0000:0000:0000FFFE:D8D4:3C::/104
nmap -6 fe80:0000:0000:0000FFFE:F0BF:97::/104
nmap -6 fe80:0000:0000:0000FFFE:FCF1:52::/104
```


Executing ```lua eui64_address_generator.lua Sony,Xerox vendors.csv fe80:0000:0000:0000``` will generate:


```
...
...
fe80:0000:0000:0000:0001:4AFF:FE4B:D211
fe80:0000:0000:0000:0001:4AFF:FE5B:D211
fe80:0000:0000:0000:0001:4AFF:FE6B:D211
fe80:0000:0000:0000:0001:4AFF:FE7B:D211
fe80:0000:0000:0000:0001:4AFF:FE8B:D211
fe80:0000:0000:0000:0001:4AFF:FE9B:D211
fe80:0000:0000:0000:0001:4AFF:FEAB:D211
fe80:0000:0000:0000:0001:4AFF:FEBB:D211
fe80:0000:0000:0000:0001:4AFF:FECB:D211
fe80:0000:0000:0000:0001:4AFF:FEDB:D211
fe80:0000:0000:0000:0001:4AFF:FEEB:D211
fe80:0000:0000:0000:0001:4AFF:FEFB:D211
fe80:0000:0000:0000:0001:4AFF:FE0B:D211
fe80:0000:0000:0000:0001:4AFF:FE1C:D211
fe80:0000:0000:0000:0001:4AFF:FE2C:D211
fe80:0000:0000:0000:0001:4AFF:FE3C:D211
fe80:0000:0000:0000:0001:4AFF:FE4C:D211
fe80:0000:0000:0000:0001:4AFF:FE5C:D211
fe80:0000:0000:0000:0001:4AFF:FE6C:D211
fe80:0000:0000:0000:0001:4AFF:FE7C:D211
fe80:0000:0000:0000:0001:4AFF:FE8C:D211
...
...
```
