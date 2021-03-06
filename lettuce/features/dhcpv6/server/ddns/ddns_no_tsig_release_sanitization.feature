Feature: DDNS without TSIG
  This feature is testing DHCPv6 + DDNS in cooperation with DNS server BIND9 without TSIG authorisation. It's primary
  target is DDNS removing forward and reverse entries in time of releasing leases.

@v6 @ddns @kea_only @notsig @forward_reverse_remove @hostname_sanitization
Scenario: ddns6.notsig-forw_and_rev-release-fqdn-sanitization-replace-1

  Test Setup:
  Server is configured with 2001:db8:1::/64 subnet with 2001:db8:1::50-2001:db8:1::50 pool.
  DDNS server is configured on 127.0.0.1 address and 53001 port.
  DDNS server is configured with enable-updates option set to true.
  DDNS server is configured with generated-prefix option set to six.
  DDNS server is configured with qualifying-suffix option set to example.com.
  DDNS server is configured with hostname-char-set option set to [^A-Za-z0-9.-].
  DDNS server is configured with hostname-char-replacement option set to x.
  Add forward DDNS with name six.example.com. and key EMPTY_KEY on address 2001:db8:1::1000 and port 53.
  Add reverse DDNS with name 1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. and key EMPTY_KEY on address 2001:db8:1::1000 and port 53.
  Send server configuration using SSH and config-file.
  DHCP server is started.

  Use DNS set no. 1.
  DNS server is started.

  Test Procedure:
  Client for DNS Question Record uses address: xsth6x.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client does include client-id.
  Client does include IA-NA.
  Client sends SOLICIT message.

  Pass Criteria:
  Server MUST respond with ADVERTISE message.
  Response MUST include option 1.
  Response MUST include option 2.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client saves into set no. 1 IA_NA option from received message.
  Client saves into set no. 1 server-id option from received message.
  Client adds saved options in set no. 1. And DONT Erase.
  Client sets FQDN_domain_name value to *sth6$(WHITE_SPACE).six.example.com..
  Client sets FQDN_flags value to S.
  Client does include fqdn.
  Client does include client-id.
  Client sends REQUEST message.

  Pass Criteria:
  Server MUST respond with REPLY message.
  Response MUST include option 1.
  Response MUST include option 2.
  Response MUST include option 39.
  Response option 39 MUST contain flags 1. #later make it 's' 'n' and 'o'
  Response option 39 MUST contain fqdn xsth6x.six.example.com.

  Test Procedure:
  Client for DNS Question Record uses address: xsth6x.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include NOT empty ANSWER part.
  Received DNS part ANSWER MUST contain rdata with value 2001:db8:1::50.

  Test Procedure:
  Client for DNS Question Record uses address: 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. type PTR class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include NOT empty ANSWER part.
  Received DNS part ANSWER MUST contain rdata with value xsth6x.six.example.com..
  Received DNS part ANSWER MUST contain rrname with value 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa..

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client adds saved options in set no. 1. And DONT Erase.
  Client does include client-id.
  Client sets FQDN_domain_name value to *sth6$(WHITE_SPACE).six.example.com..
  Client sets FQDN_flags value to S.
  Client does include fqdn.
  Client sends RELEASE message.

  Pass Criteria:
  Server MUST respond with REPLY message.
  Response MUST include option 1.
  Response MUST include option 2.

  Test Procedure:
  Client for DNS Question Record uses address: xsth6x.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client for DNS Question Record uses address: 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. type PTR class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

@v6 @ddns @kea_only @notsig @forward_reverse_remove @hostname_sanitization
Scenario: ddns6.notsig-forw_and_rev-release-fqdn-sanitization-replace-2

  Test Setup:
  Server is configured with 2001:db8:1::/64 subnet with 2001:db8:1::50-2001:db8:1::50 pool.
  DDNS server is configured on 127.0.0.1 address and 53001 port.
  DDNS server is configured with enable-updates option set to true.
  DDNS server is configured with generated-prefix option set to six.
  DDNS server is configured with qualifying-suffix option set to example.com.
  DDNS server is configured with hostname-char-set option set to [^A-Za-z].
  DDNS server is configured with hostname-char-replacement option set to x.
  Add forward DDNS with name six.example.com. and key EMPTY_KEY on address 2001:db8:1::1000 and port 53.
  Add reverse DDNS with name 1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. and key EMPTY_KEY on address 2001:db8:1::1000 and port 53.
  Send server configuration using SSH and config-file.
  DHCP server is started.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client does include client-id.
  Client does include IA-NA.
  Client sends SOLICIT message.

  Pass Criteria:
  Server MUST respond with ADVERTISE message.
  Response MUST include option 1.
  Response MUST include option 2.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client saves into set no. 1 IA_NA option from received message.
  Client saves into set no. 1 server-id option from received message.
  Client adds saved options in set no. 1. And DONT Erase.
  Client sets FQDN_domain_name value to *a$(WHITE_SPACE).8723()+.
  Client sets FQDN_flags value to S.
  Client does include fqdn.
  Client does include client-id.
  Client sends REQUEST message.

  Pass Criteria:
  Server MUST respond with REPLY message.
  Response MUST include option 1.
  Response MUST include option 2.
  Response MUST include option 39.
  Response option 39 MUST contain flags 1. #later make it 's' 'n' and 'o'
  Response option 39 MUST contain fqdn xax.xxxxxxx.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client adds saved options in set no. 1. And DONT Erase.
  Client does include client-id.
  Client sets FQDN_domain_name value to *a$(WHITE_SPACE).8723()+.
  Client sets FQDN_flags value to S.
  Client does include fqdn.
  Client sends RELEASE message.

  Pass Criteria:
  Server MUST respond with REPLY message.
  Response MUST include option 1.
  Response MUST include option 2.

@v6 @ddns @kea_only @notsig @forward_reverse_remove @hostname_sanitization
Scenario: ddns6.notsig-forw_and_rev-release-fqdn-sanitization-omit-1

  Test Setup:
  Server is configured with 2001:db8:1::/64 subnet with 2001:db8:1::50-2001:db8:1::50 pool.
  DDNS server is configured on 127.0.0.1 address and 53001 port.
  DDNS server is configured with enable-updates option set to true.
  DDNS server is configured with generated-prefix option set to six.
  DDNS server is configured with qualifying-suffix option set to example.com.
  DDNS server is configured with hostname-char-set option set to [^A-Za-z0-9.-].
  DDNS server is configured with hostname-char-replacement option set to $(EMPTY).
  Add forward DDNS with name six.example.com. and key EMPTY_KEY on address 2001:db8:1::1000 and port 53.
  Add reverse DDNS with name 1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. and key EMPTY_KEY on address 2001:db8:1::1000 and port 53.
  Send server configuration using SSH and config-file.
  DHCP server is started.

  Use DNS set no. 1.
  DNS server is started.

  Test Procedure:
  Client for DNS Question Record uses address: sth6.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client does include client-id.
  Client does include IA-NA.
  Client sends SOLICIT message.

  Pass Criteria:
  Server MUST respond with ADVERTISE message.
  Response MUST include option 1.
  Response MUST include option 2.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client saves into set no. 1 IA_NA option from received message.
  Client saves into set no. 1 server-id option from received message.
  Client adds saved options in set no. 1. And DONT Erase.
  Client sets FQDN_domain_name value to $(WHITE_SPACE)*sth6*.si^x.exa(mple.c)om(.
  Client sets FQDN_flags value to S.
  Client does include fqdn.
  Client does include client-id.
  Client sends REQUEST message.

  Pass Criteria:
  Server MUST respond with REPLY message.
  Response MUST include option 1.
  Response MUST include option 2.
  Response MUST include option 39.
  Response option 39 MUST contain flags 1. #later make it 's' 'n' and 'o'
  Response option 39 MUST contain fqdn sth6.six.example.com.

  Test Procedure:
  Client for DNS Question Record uses address: sth6.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include NOT empty ANSWER part.
  Received DNS part ANSWER MUST contain rdata with value 2001:db8:1::50.

  Test Procedure:
  Client for DNS Question Record uses address: 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. type PTR class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include NOT empty ANSWER part.
  Received DNS part ANSWER MUST contain rdata with value sth6.six.example.com..
  Received DNS part ANSWER MUST contain rrname with value 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa..

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client adds saved options in set no. 1. And DONT Erase.
  Client does include client-id.
  Client sends RELEASE message.

  Pass Criteria:
  Server MUST respond with REPLY message.
  Response MUST include option 1.
  Response MUST include option 2.

  Test Procedure:
  Client for DNS Question Record uses address: sth6.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client for DNS Question Record uses address: 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. type PTR class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

@v6 @ddns @kea_only @notsig @forward_reverse_remove @hostname_sanitization
Scenario: ddns6.notsig-forw_and_rev-release-fqdn-sanitization-omit-identical-name

  Test Setup:
  Server is configured with 2001:db8:1::/64 subnet with 2001:db8:1::50-2001:db8:1::51 pool.
  DDNS server is configured on 127.0.0.1 address and 53001 port.
  DDNS server is configured with enable-updates option set to true.
  DDNS server is configured with generated-prefix option set to six.
  DDNS server is configured with qualifying-suffix option set to example.com.
  DDNS server is configured with hostname-char-set option set to [^A-Za-z.-].
  DDNS server is configured with hostname-char-replacement option set to $(EMPTY).
  Add forward DDNS with name six.example.com. and key EMPTY_KEY on address 2001:db8:1::1000 and port 53.
  Add reverse DDNS with name 1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. and key EMPTY_KEY on address 2001:db8:1::1000 and port 53.
  Send server configuration using SSH and config-file.
  DHCP server is started.

  Use DNS set no. 1.
  DNS server is started.

  Test Procedure:
  Client for DNS Question Record uses address: client.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client for DNS Question Record uses address: client1.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client for DNS Question Record uses address: client2.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client does include client-id.
  Client does include IA-NA.
  Client sends SOLICIT message.

  Pass Criteria:
  Server MUST respond with ADVERTISE message.
  Response MUST include option 1.
  Response MUST include option 2.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client saves into set no. 1 IA_NA option from received message.
  Client saves into set no. 1 server-id option from received message.
  Client adds saved options in set no. 1. And DONT Erase.
  Client sets FQDN_domain_name value to client1.six.example.com..
  Client sets FQDN_flags value to S.
  Client does include fqdn.
  Client does include client-id.
  Client sends REQUEST message.

  Pass Criteria:
  Server MUST respond with REPLY message.
  Response MUST include option 1.
  Response MUST include option 2.
  Response MUST include option 39.
  Response option 39 MUST contain flags 1. #later make it 's' 'n' and 'o'
  Response option 39 MUST contain fqdn client.six.example.com.

  Test Procedure:
  Client for DNS Question Record uses address: client.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include NOT empty ANSWER part.
  Received DNS part ANSWER MUST contain rdata with value 2001:db8:1::50.

  Test Procedure:
  Client for DNS Question Record uses address: 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. type PTR class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include NOT empty ANSWER part.
  Received DNS part ANSWER MUST contain rdata with value client.six.example.com..
  Received DNS part ANSWER MUST contain rrname with value 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa..

  Test Procedure:
  Client for DNS Question Record uses address: client1.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:11.
  Client does include client-id.
  Client does include IA-NA.
  Client sends SOLICIT message.

  Pass Criteria:
  Server MUST respond with ADVERTISE message.
  Response MUST include option 1.
  Response MUST include option 2.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:11.
  Client saves into set no. 2 IA_NA option from received message.
  Client saves into set no. 2 server-id option from received message.
  Client adds saved options in set no. 2. And DONT Erase.
  Client sets FQDN_domain_name value to client2.six.example.com..
  Client sets FQDN_flags value to S.
  Client does include fqdn.
  Client does include client-id.
  Client sends REQUEST message.

  Pass Criteria:
  Server MUST respond with REPLY message.
  Response MUST include option 1.
  Response MUST include option 2.
  Response MUST include option 39.
  Response option 39 MUST contain flags 1. #later make it 's' 'n' and 'o'
  Response option 39 MUST contain fqdn client.six.example.com.

  Test Procedure:
  Client for DNS Question Record uses address: client2.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client for DNS Question Record uses address: client.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include NOT empty ANSWER part.
  Received DNS part ANSWER MUST contain rdata with value 2001:db8:1::50.

  Test Procedure:
  Client for DNS Question Record uses address: 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. type PTR class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include NOT empty ANSWER part.
  Received DNS part ANSWER MUST contain rdata with value client.six.example.com..
  Received DNS part ANSWER MUST contain rrname with value 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa..

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client adds saved options in set no. 1. And DONT Erase.
  Client does include client-id.
  Client sends RELEASE message.

  Pass Criteria:
  Server MUST respond with REPLY message.
  Response MUST include option 1.
  Response MUST include option 2.

  Test Procedure:
  Client for DNS Question Record uses address: client.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client for DNS Question Record uses address: 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. type PTR class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.


@v6 @ddns @kea_only @notsig @ddns_expired @hostname_sanitization
Scenario: ddns6.notsig-expired-fqdn-sanitization

  Test Setup:
  Time renew-timer is configured with value 1.
  Time rebind-timer is configured with value 2.
  Time preferred-lifetime is configured with value 3.
  Time valid-lifetime is configured with value 4.
  Server is configured with 2001:db8:1::/64 subnet with 2001:db8:1::50-2001:db8:1::50 pool.
  DDNS server is configured on 127.0.0.1 address and 53001 port.
  DDNS server is configured with enable-updates option set to true.
  DDNS server is configured with generated-prefix option set to six.
  DDNS server is configured with qualifying-suffix option set to example.com.
  DDNS server is configured with hostname-char-set option set to [^A-Za-z.-].
  DDNS server is configured with hostname-char-replacement option set to $(EMPTY).
  Add forward DDNS with name six.example.com. and key EMPTY_KEY on address 2001:db8:1::1000 and port 53.
  Add reverse DDNS with name 1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. and key EMPTY_KEY on address 2001:db8:1::1000 and port 53.
  Send server configuration using SSH and config-file.
  DHCP server is started.

  Use DNS set no. 1.
  DNS server is started.

  Test Procedure:
  Client for DNS Question Record uses address: sth.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client does include client-id.
  Client does include IA-NA.
  Client sends SOLICIT message.

  Pass Criteria:
  Server MUST respond with ADVERTISE message.
  Response MUST include option 1.
  Response MUST include option 2.

  Test Procedure:
  Client sets DUID value to 00:03:00:01:ff:ff:ff:ff:ff:01.
  Client copies IA_NA option from received message.
  Client copies server-id option from received message.
  Client sets FQDN_domain_name value to sth6.six.example.com..
  Client sets FQDN_flags value to S.
  Client does include fqdn.
  Client does include client-id.
  Client sends REQUEST message.

  Pass Criteria:
  Server MUST respond with REPLY message.
  Response MUST include option 1.
  Response MUST include option 2.
  Response MUST include option 39.
  Response option 39 MUST contain flags 1. #later make it 's' 'n' and 'o'
  Response option 39 MUST contain fqdn sth.six.example.com.

  Test Procedure:
  Client for DNS Question Record uses address: sth.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include NOT empty ANSWER part.
  Received DNS part ANSWER MUST contain rdata with value 2001:db8:1::50.

  Test Procedure:
  Client for DNS Question Record uses address: 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. type PTR class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include NOT empty ANSWER part.
  Received DNS part ANSWER MUST contain rdata with value sth.six.example.com..
  Received DNS part ANSWER MUST contain rrname with value 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa..

  Sleep for 15 seconds.

  Test Procedure:
  Client for DNS Question Record uses address: sth.six.example.com type AAAA class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.

  Test Procedure:
  Client for DNS Question Record uses address: 0.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. type PTR class IN.
  Client sends DNS query.

  Pass Criteria:
  DNS server MUST respond with DNS query.
  Received DNS query MUST include empty ANSWER part.