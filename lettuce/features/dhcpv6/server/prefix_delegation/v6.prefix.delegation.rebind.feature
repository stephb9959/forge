Feature: DHCPv6 Prefix Delegation 
    Test for Prefix Delegation using Request messages, based on RFC 3633.

@v6 @dhcp6 @PD @rfc3633
    Scenario: prefix.delegation.rebind_success

 	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::3 pool.
	Server is configured with 2001:db8:1:: prefix in subnet 0 with 90 prefix length and 92 delegated prefix length.
	Send server configuration using SSH and config-file.
DHCP server is started.
	
	Test Procedure:
	Client does include IA-PD.
	Client does include client-id.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.
	Response MUST include option 25.
	Response option 25 MUST contain sub-option 26. 
	Response sub-option 26 from option 25 MUST contain prefix 2001:db8:1::.
	
	Test Procedure:
	Client copies server-id option from received message.
	Client saves IA_PD option from received message.
	Client adds saved options. And DONT Erase.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 25.
	Response option 25 MUST contain sub-option 26.
	Response sub-option 26 from option 25 MUST contain prefix 2001:db8:1::.

	Test Procedure:
	Client adds saved options. And DONT Erase.
	Client does include client-id.
    Client sends REBIND message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 25.
	#Response option 25 MUST contain T1 . #set this after server configuration!
	
	References: RFC 3633, Section: 12.2

@v6 @dhcp6 @PD @rfc3633 @disabled
    #disabled after RFC 7550
    Scenario: prefix.delegation.rebind_fail

 	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::3 pool.
	Server is configured with 2001:db8:1:: prefix in subnet 0 with 90 prefix length and 92 delegated prefix length.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
	Client does include IA-PD.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client does include client-id.
	Client copies server-id option from received message.
	Client saves IA_PD option from received message.
	Client adds saved options. And DONT Erase.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.


	Test Procedure:
    Client does include IA-PD.
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
    Client does include client-id.
    Client sets plen value to 90.
    Client sets prefix value to 3001::.
    Client does include IA_Prefix.
    Client does include IA-PD.
    Client sends REBIND message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 25.
	Response option 25 MUST contain T1 0.

	References: RFC 3633, Section: 12.2   

@v6 @dhcp6 @PD @rfc3633
    Scenario: prefix.delegation.rebind_fail_dropped

 	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::3 pool.
	Server is configured with 2001:db8:1:: prefix in subnet 0 with 90 prefix length and 92 delegated prefix length.
	Send server configuration using SSH and config-file.
DHCP server is started.
	
	Test Procedure:
	Client does include IA-PD.
	Client does include client-id.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.
	Response MUST include option 25.
	
	Test Procedure:
	Client copies server-id option from received message.
	Client copies IA_PD option from received message.
 	
 	Test Setup:
	Server is configured with 3001::/64 subnet with 3001::1-3001::ffff pool.
	Server is configured with 2001:db8:2:: prefix in subnet 0 with 90 prefix length and 92 delegated prefix length.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client sends REBIND message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	References: RFC 3633, Section: 12.2   
