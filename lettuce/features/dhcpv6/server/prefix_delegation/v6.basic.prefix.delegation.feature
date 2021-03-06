Feature: DHCPv6 Prefix Delegation
  Test for basic Prefix Delegation, based on RFC 3633

@v6 @dhcp6 @PD @rfc3633
Scenario: prefix.delegation.onlyPD_advertise
  Test Setup:
  Server is configured with 3000::/64 subnet with 3000::1-3000::3 pool.
  Server is configured with 2001:db8:1:: prefix in subnet 0 with 90 prefix length and 96 delegated prefix length.
  Send server configuration using SSH and config-file.
  DHCP server is started.

  Test Procedure:
  Client does include IA-PD.
  Client does include client-id.
  Client sends SOLICIT message.

  Pass Criteria:
  Server MUST respond with ADVERTISE message.
  Response MUST include option 25.

  References: RFC 3633, Section: 9

@v6 @dhcp6 @PD @rfc3633
Scenario: prefix.delegation.IA_and_PD
  Test Setup:
  Server is configured with 3000::/64 subnet with 3000::2-3000::2 pool.
  Server is configured with 2001:db8:1:: prefix in subnet 0 with 90 prefix length and 91 delegated prefix length.
  Send server configuration using SSH and config-file.
  DHCP server is started.

  Test Procedure:
  Client does include client-id.
  Client does include IA-PD.
  Client does include IA-NA.
  Client sends SOLICIT message.

  Pass Criteria:
  Server MUST respond with ADVERTISE message.
  Response MUST include option 3.
  Response option 3 MUST contain sub-option 5.
  Response sub-option 5 from option 3 MUST contain address 3000::2.

  References: RFC 3633, Section: 9

@v6 @dhcp6 @PD @rfc3633
Scenario: prefix.delegation.without_server_configuration
  Test Setup:
  Server is configured with 3000::/64 subnet with 3000::1-3000::3 pool.
  Send server configuration using SSH and config-file.
  DHCP server is started.

  Test Procedure:
  Client does include IA-PD.
  Client does include client-id.
  Client does include IA-NA.
  Client sends SOLICIT message.

  Pass Criteria:
  Server MUST respond with ADVERTISE message.
  Response MUST include option 3.
  Response option 3 MUST contain sub-option 5.
  Response MUST include option 25.
  Response option 25 MUST contain sub-option 13.
  Response sub-option 13 from option 25 MUST contain statuscode 6.

  Test Setup:
  Server is configured with 3000::/64 subnet with 3000::3-3000::3 pool.
  Server is configured with 2001:db8:1:: prefix in subnet 0 with 90 prefix length and 96 delegated prefix length.
  Send server configuration using SSH and config-file.
  DHCP server is started.

  Test Procedure:
  Client does include IA-PD.
  Client does include client-id.
  Client does include IA-NA.
  Client sends SOLICIT message.

  Pass Criteria:
  Server MUST respond with ADVERTISE message.
  Response MUST include option 25.
  Response sub-option 26 from option 25 MUST contain prefix 2001:db8:1::.
  Response MUST include option 3.
  Response sub-option 5 from option 3 MUST contain address 3000::3.

  References: RFC 3633, Section: 9.

@v6 @dhcp6 @PD @rfc3633
Scenario: prefix.delegation.exclude-prefix
  Test Setup:
  Server is configured with 2001:db8:a::/48 subnet with 2001:db8:a::1-2001:db8:a::1 pool.
  To subnet 0 configuration section in the config file add line: ,"pd-pools":[{"prefix": "2001:db8:1::","prefix-len": 90,"delegated-len": 90,"excluded-prefix": "2001:db8:1::20:0:0","excluded-prefix-len": 91}]

  Send server configuration using SSH and config-file.
  DHCP server is started.

  Test Procedure:
  Client does include IA-PD.
  Client does include client-id.
  Client does include IA-NA.
  Client requests option 67.
  Client sends SOLICIT message.

  Pass Criteria:
  Server MUST respond with ADVERTISE message.
  Response MUST include option 3.
  Response option 3 MUST contain sub-option 5.
  Response MUST include option 25.
  Response option 25 MUST contain sub-option 26.
  #Response option 26 MUST contain sub-option 67.
  # Test works, but forge lacks support for extracting sub-options of sub-options
  References: RFC 6603