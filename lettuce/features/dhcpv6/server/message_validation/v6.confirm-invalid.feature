
Feature: Standard DHCPv6 confirm message 
    This feature is designed for checking server response for invalid confirm messages. RFC 3315 section 15.5 Tests expecting lack of response, so each test also send valid massage to make sure that server is still running.
    
@v6 @dhcp6 @confirm_invalid
    Scenario: v6.message.negative.tests.confirm-without_client_id
    ## Testing server ability to discard message that not meets 
    ## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## without CLIENT_ID	CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code
	
	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client requests option 7.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	#message wont contain client-id option
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And DONT Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 13.
	
	References: RFC3315 section 15.5 

@v6 @dhcp6 @confirm_invalid
    Scenario: v6.message.negative.tests.confirm-double_client_id
    ## Testing server ability to discard message that not meets
    ## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## without CLIENT_ID	CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code

	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client requests option 7.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include client-id.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	Test Procedure:
	Client adds saved options. And DONT Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 13.

	References: RFC3315 section 15.5


@v6 @dhcp6 @confirm_invalid @disabled
    Scenario: v6.message.negative.tests.confirm-wrong_client_id
    ## Testing server ability to discard message that not meets
    ## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with blank CLIENT_ID	CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code

	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client requests option 7.
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include wrong-client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.

	References: RFC3315 section 15.5

@v6 @dhcp6 @confirm_invalid
    Scenario: v6.message.negative.tests.confirm-blank_client_id
    ## Testing server ability to discard message that not meets 
    ## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with blank CLIENT_ID	CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code
	
	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.
	
	Test Procedure:
	Client requests option 7.
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include empty-client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.
		
	References: RFC3315 section 15.5 
	
@v6 @dhcp6 @confirm_invalid
    Scenario: v6.message.negative.tests.confirm-with_server_id
    ## Testing server ability to discard message that not meets 
    ## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with  SERVER_ID		CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code

	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client copies server-id option from received message.
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.
		
	References: RFC3315 section 15.5 

@v6 @dhcp6 @confirm_invalid
    Scenario: v6.message.negative.tests.confirm-without_IA_NA_address
    ## Testing server ability to discard message that not meets 
    ## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with IA option but
	## without IA_Address 	CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code
	
	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.
	
	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.

	References: RFC3315 18.2.2

@v6 @dhcp6 @confirm_invalid @invalid_option @outline @disabled
#TODO enable MAY condition in Forge then enable test

    Scenario: v6.message.negative.tests.confirm-options-relay-msg
	## Temporary test replacing disabled outline scenario 
	## Testing server ability to discard message that not meets 
	## content requirements. 
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with restricted 
	## option				CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code
	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include client-id.
    Client does include relay-msg.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.
	
	References: RFC3315 section 15.5. 22.8. table A: Appearance of Options in Message Types
	
@v6 @dhcp6 @confirm_invalid @invalid_option @outline @disabled
#TODO enable MAY condition in Forge then enable test

    Scenario: v6.message.negative.tests.confirm-options-rapid-commit
	## Temporary test replacing disabled outline scenario 
	## Testing server ability to discard message that not meets 
	## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with restricted 
	## option				CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code
	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	
	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include rapid-commit.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.
	
	References: RFC3315 section 15.5. 22.8. table A: Appearance of Options in Message Types
	
@v6 @dhcp6 @confirm_invalid @invalid_option @outline @disabled
#TODO enable MAY condition in Forge then enable test

    Scenario: v6.message.negative.tests.confirm-options-interface-id
	## Temporary test replacing disabled outline scenario 
	## Testing server ability to discard message that not meets 
	## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with restricted 
	## option				CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code
	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include interface-id.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.
	
	References: RFC3315 section 15.5. 22.8. table A: Appearance of Options in Message Types

@v6 @dhcp6 @confirm_invalid @invalid_option @outline @disabled
#TODO enable MAY condition in Forge then enable test

    Scenario: v6.message.negative.tests.confirm-options-reconfigure-accept
	## Temporary test replacing disabled outline scenario 
	## Testing server ability to discard message that not meets 
	## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with restricted 
	## option				CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code
	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include reconfigure-accept.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.
	
	References: RFC3315 section 15.5. 22.8. table A: Appearance of Options in Message Types

@v6 @dhcp6 @confirm_invalid @invalid_option @outline @disabled
#TODO enable MAY condition in Forge then enable test

    Scenario: v6.message.negative.tests.confirm-options-preference
	## Temporary test replacing disabled outline scenario 
	## Testing server ability to discard message that not meets 
	## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with restricted 
	## option				CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code
	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include preference.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.
	
	References: RFC3315 section 15.5. 22.8. table A: Appearance of Options in Message Types

@v6 @dhcp6 @confirm_invalid @invalid_option @outline @disabled
#TODO enable MAY condition in Forge then enable test

    Scenario: v6.message.negative.tests.confirm-options-server-unicast
	## Temporary test replacing disabled outline scenario 
	## Testing server ability to discard message that not meets 
	## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with restricted 
	## option				CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code
	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include server-unicast.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.
	
	References: RFC3315 section 15.5. 22.8. table A: Appearance of Options in Message Types

@v6 @dhcp6 @confirm_invalid @invalid_option @outline @disabled
#TODO enable MAY condition in Forge then enable test

    Scenario: v6.message.negative.tests.confirm-options-status-code
	## Temporary test replacing disabled outline scenario 
	## Testing server ability to discard message that not meets 
	## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with restricted 
	## option				CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code
	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include status-code.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.
	
	References: RFC3315 section 15.5. 22.8. table A: Appearance of Options in Message Types

@v6 @dhcp6 @confirm_invalid @invalid_option @outline @disabled
#TODO enable MAY condition in Forge then enable test

    Scenario: v6.message.negative.tests.confirm-options-reconfigure
	## Temporary test replacing disabled outline scenario 
	## Testing server ability to discard message that not meets 
	## content requirements.
	## Message details 		Client		Server
	## 						SOLICIT -->
	## 		   						<--	ADVERTISE
	## 						REQUEST -->
	## 		   						<--	REPLY
	## with restricted 
	## option				CONFIRM -->
	##					  		     X	REPLY
	## correct message 		CONFIRM -->
	##					  		    <--	REPLY
	## Pass Criteria:
	## 				REPLY MUST include option:
	##					client-id
	##					server-id
	##					status-code
	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Send server configuration using SSH and config-file.
DHCP server is started.

	Test Procedure:
	Client does include client-id.
    Client does include IA-NA.
    Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client copies server-id option from received message.
	Client does include client-id.
    Client sends REQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	Test Procedure:
	Client saves IA_NA option from received message.
	Client adds saved options. And DONT Erase.
	Client does include reconfigure.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.
	
	Test Procedure:
	Client adds saved options. And Erase.
	Client does include client-id.
    Client sends CONFIRM message.

	Pass Criteria:
	Server MUST respond with REPLY message.
	Response MUST include option 1.
	Response MUST include option 2.
	Response MUST include option 13.
	
	References: RFC3315 section 15.5. 22.8. table A: Appearance of Options in Message Types
