Feature: DHCPv6 Prefix Delegation 
    Test for basic Prefix Delegation, based on RFC 3633

@v6 @PD @rfc3633
    Scenario: prefix.delegation.onlyPD
  
 	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::3 pool.
	#Server is configured with prefix-delegation option with value 3000:1::.
	Server is started.
	
	Test Procedure:
	Client does NOT include IA-NA.
	Client does include IA-PD.
	Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.
	Response MUST include option 25.
	Response option 25 MUST contain prefix 3000:1:.

@v6 @PD @rfc3633
    Scenario: prefix.delegation.IA.and.PD
  
	Server is configured with 3000::/64 subnet with 3000::1-3000::3 pool.
	#Server is configured with prefix-delegation option with value 3000:1::.
	Server is started.
	
	Test Procedure:
	Client requests option 7.
	Client does include IA-PD.
	Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.
	Response MUST include option 25.
	Response option 25 MUST contain prefix 3000:1:.
	Response MUST include option 3.
	Response option 3 MUST contain address 3000::.
	
@v6 @PD @rfc3633
    Scenario: prefix.delegation.without.server.configuration
  
	Server is configured with 3000::/64 subnet with 3000::1-3000::3 pool.
	Server is started.
	
	Test Procedure:
	Client requests option 7.
	Client does include IA-PD.
	Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.
	Response MUST NOT include option 25.