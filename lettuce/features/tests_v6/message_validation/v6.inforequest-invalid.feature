Feature: Standard DHCPv6 information request message 
    This feature is designed for checking server response for invalid information request messages. RFC 3315 section 15.12 Tests expecting lack of response, so each test also send valid massage to make sure that server is still running.
    
@v6 @inforequest_invalid
    Scenario: v6.inforequest.invalid.with_server_id
    #server_id are included in Info-request that are sent in response to a Reconfigure msg. 
    
	Test Procedure:
	Client requests option 7.
	Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies server-id option from received message.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	Test Procedure:
	Client requests option 7.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	References: RFC3315 section 15.12, table A: Appearance of Options in Message Types

@v6 @inforequest_invalid
    Scenario: v6.inforequest.invalid.with_IA_NA
    
	Test Procedure:
	Client requests option 7.
	Client sends SOLICIT message.

	Pass Criteria:
	Server MUST respond with ADVERTISE message.

	Test Procedure:
	Client copies IA_NA option from received message.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	Test Procedure:
	Client requests option 7.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	References: RFC3315 section 15.12, table A: Appearance of Options in Message Types

@v6 @inforequest_invalid @invalid_option @outline
    Scenario: v6.inforequest.invalid.options.relay-msg 

	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Server is started.

	Test Procedure:
	Client does include relay-msg.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	Test Procedure:
	Client requests option 7.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	References: RFC3315 section 15.12 table A: Appearance of Options in Message Types

@v6 @inforequest_invalid @invalid_option @outline
    Scenario: v6.inforequest.invalid.options.rapid-commit 

	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Server is started.

	Test Procedure:
	Client does include rapid-commit.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	Test Procedure:
	Client requests option 7.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	References: RFC3315 section 15.12 table A: Appearance of Options in Message Types

@v6 @inforequest_invalid @invalid_option @outline
    Scenario: v6.inforequest.invalid.options.interface-id 

	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Server is started.

	Test Procedure:
	Client does include interface-id.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	Test Procedure:
	Client requests option 7.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	References: RFC3315 section 15.12 table A: Appearance of Options in Message Types

@v6 @inforequest_invalid @invalid_option @outline
    Scenario: v6.inforequest.invalid.options.preference 

	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Server is started.

	Test Procedure:
	Client does include preference.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	Test Procedure:
	Client requests option 7.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	References: RFC3315 section 15.12 table A: Appearance of Options in Message Types

@v6 @inforequest_invalid @invalid_option @outline
    Scenario: v6.inforequest.invalid.options.server-unicast 

	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Server is started.

	Test Procedure:
	Client does include server-unicast.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	Test Procedure:
	Client requests option 7.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	References: RFC3315 section 15.12 table A: Appearance of Options in Message Types

@v6 @inforequest_invalid @invalid_option @outline
    Scenario: v6.inforequest.invalid.options.status-code

	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Server is started.

	Test Procedure:
	Client does include status-code.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	Test Procedure:
	Client requests option 7.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	References: RFC3315 section 15.12 table A: Appearance of Options in Message Types

@v6 @inforequest_invalid @invalid_option @outline
    Scenario: v6.inforequest.invalid.options.reconfigure

	Test Setup:
	Server is configured with 3000::/64 subnet with 3000::1-3000::ff pool.
	Server is started.

	Test Procedure:
	Client does include reconfigure.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST NOT respond with REPLY message.

	Test Procedure:
	Client requests option 7.
	Client sends INFOREQUEST message.

	Pass Criteria:
	Server MUST respond with REPLY message.

	References: RFC3315 section 15.12 table A: Appearance of Options in Message Types
	