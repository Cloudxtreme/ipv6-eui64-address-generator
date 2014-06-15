ipv6-eui64-address-generator
============================

Script that generates IPv6 EUI-64 addresses (or the appropriate commands for Nmap) based on a vendor's OUI.

Usage: ```lua eui64_address_generator.lua <vendors> <filename> <network address> <nmap's flag>```

```vendors```: name of the chosen vendors (```Sony,Ibm,Xerox```).

```filename```: path to file that contains the names of the vendors and their respective OUIs.

```network address```: the network address.

```nmap flag```: this must be true should Nmap commands be generated instead of all the addresses.


Executing ```lua eui64_address_generator.lua Sony,Xerox vendors.csv fe80:0000:0000:0000 true``` will generate:


```
# Xerox
nmap -6 fe80:0000:0000:0000:0000:01FF:FE::/104
nmap -6 fe80:0000:0000:0000:0000:02FF:FE::/104
nmap -6 fe80:0000:0000:0000:0000:03FF:FE::/104
nmap -6 fe80:0000:0000:0000:0000:04FF:FE::/104
nmap -6 fe80:0000:0000:0000:0000:05FF:FE::/104
nmap -6 fe80:0000:0000:0000:0000:06FF:FE::/104
nmap -6 fe80:0000:0000:0000:0000:07FF:FE::/104
nmap -6 fe80:0000:0000:0000:0000:08FF:FE::/104
nmap -6 fe80:0000:0000:0000:0000:09FF:FE::/104
nmap -6 fe80:0000:0000:0000:0000:AAFF:FE::/104
nmap -6 fe80:0000:0000:0000:0055:00FF:FE::/104
nmap -6 fe80:0000:0000:0000:9C93:4EFF:FE::/104
# Sony
nmap -6 fe80:0000:0000:0000:0001:4AFF:FE::/104
nmap -6 fe80:0000:0000:0000:0013:A9FF:FE::/104
nmap -6 fe80:0000:0000:0000:001A:80FF:FE::/104
nmap -6 fe80:0000:0000:0000:001D:BAFF:FE::/104
nmap -6 fe80:0000:0000:0000:0024:BEFF:FE::/104
nmap -6 fe80:0000:0000:0000:0800:46FF:FE::/104
nmap -6 fe80:0000:0000:0000:30F9:EDFF:FE::/104
nmap -6 fe80:0000:0000:0000:3C07:71FF:FE::/104
nmap -6 fe80:0000:0000:0000:5442:49FF:FE::/104
nmap -6 fe80:0000:0000:0000:5453:EDFF:FE::/104
nmap -6 fe80:0000:0000:0000:7884:3CFF:FE::/104
nmap -6 fe80:0000:0000:0000:D8D4:3CFF:FE::/104
nmap -6 fe80:0000:0000:0000:F0BF:97FF:FE::/104
nmap -6 fe80:0000:0000:0000:FCF1:52FF:FE::/104
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
