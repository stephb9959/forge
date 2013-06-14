from lettuce import world, step
from init_all import PROTO
import importlib
from logging_facility import *

# Tomek: For some reason importing terrain does not help, as the
# @before.each_scenario is not called, so the world do not have proto set up.
# Therefore I imported PROTO constant and use it directly. It's a hack, but it
# works. If you know how to fix is properly, plese do so.

dhcpmsg = importlib.import_module("protosupport.%s.msg"  % (PROTO))


#building messages 
@step('Client requests option (\d+).')
def client_requests_option(step, opt_type):
    dhcpmsg.client_requests_option(step, opt_type)

@step('Client sends (\w+) message( with (\w+) option)?')
def client_send_msg(step, msgname, opt_type, unknown):
    dhcpmsg.client_send_msg(step, msgname, opt_type, unknown)

@step('Client does (NOT )?include (\S+).')
def client_does_include(step, yes_or_not, opt_type):
    dhcpmsg.client_does_include(step, opt_type)

@step('Client chooses UNICAST address.')
def unicast_addres(step):
    dhcpmsg.unicast_addres(step)

@step('...using relay-agent encapsulated in (\w+) level(s)?.')
def create_relay_forward(step, level, s):
    dhcpmsg.create_relay_forward(step, level)

#checking respond
@step('Server MUST (NOT )?respond with (\w+) message')
def send_wait_for_message(step, yes_or_no, message):
    get_common_logger().debug("client_send_msg:{message}.\n".format(**locals()))
    presence = True if yes_or_no == None else False 
    dhcpmsg.send_wait_for_message(step, presence ,message)

@step('Response MUST (NOT )?include (\w+) (\d+).')
def response_check_include_option(step, yes_or_no, type, opt_code):
    include = not (yes_or_no == "NOT ")
    if type == "option":
        dhcpmsg.response_check_include_option(step, include, opt_code)
    elif type == "message":
        dhcpmsg.response_check_include_message(step, include, opt_code)

@step('Response option (\d+) MUST (NOT )?contain (\S+) (\S+).')
def response_check_option_content(step, opt_code, expect, data_type, expected):
    dhcpmsg.response_check_option_content(step, opt_code, expect, data_type, expected)

#save option from received message
@step('Client copies (\S+) option from received message.')
def client_copy_option(step, option_name):
    assert len(world.srvmsg), "No messages received, nothing to copy."
    dhcpmsg.client_copy_option(step, option_name)
