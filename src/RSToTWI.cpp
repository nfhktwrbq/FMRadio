#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/twi.h>

#include "Arduino.h"

#include "RSToTWI.h"


// default constructor
RSToTWI::RSToTWI()
{
	_twi = &TwoWire::Instance();
	_state = NONE;
	Serial.begin(BAUS_RATE);
} //RSToTWI

// default destructor
RSToTWI::~RSToTWI()
{
} //~RSToTWI

RSToTWI & RSToTWI::Instance(void)
{
	static RSToTWI s;
	return s;
}

void RSToTWI::init(void)
{
	_twi->init();
}

void RSToTWI::setDevAddress(uint8_t addr)
{
	_dev_addr = addr;
}

uint8_t RSToTWI::getDevAddress(void)
{
	return _dev_addr;
}

void RSToTWI::proc(void)
{
	switch(_state)
	{
		case NONE:
			if(Serial.available())
			{
				_state = SERIAL_AVAILABLE;
			}
		break;
		case SERIAL_AVAILABLE:
			_cmd_len = Serial.readBytes((uint8_t *)&_command, sizeof(_command));
			if(_cmd_len)
			{
				_state = PARSE_COMMAND;
			}
			else
			{
				_state = NONE;	
			}
		break;
		case PARSE_COMMAND:
			executeCommand();
			_state = NONE;
		break;
		default:
		break;
	}
}

void RSToTWI::executeCommand(void)
{
	switch(_command.cmd)
	{
		case NONE:
		break;
		case SET_DEV_ADDR:
			_dev_addr = _command.param1;
		break;
		case READ_REGISTER:
			if(_twi->readReg( _dev_addr, _command.param1, asw_buf, (uint16_t)_command.len))
			{
				sendError(READ_REGISTER);
			}
			else
			{
				sendAnswer(OK, asw_buf, _command.len);
			}
		break;
		case WRITE_REGISTER:
			if(_twi->writeReg(_dev_addr, _command.param1, _command.cmd_buf, (uint16_t)_command.len))
			{
				sendError(WRITE_REGISTER);
			}
			else
			{
				sendAnswer(OK, 0, 0);
			}
		break;
		case TRANSMIT:
			if(_twi->transmit(_dev_addr, _command.cmd_buf, (uint16_t)_command.len))
			{
				sendError(TRANSMIT);
			}
			else
			{
				sendAnswer(OK, 0, 0);
			}
		break;
		case RECEIVE:
			if(_twi->receive(_dev_addr, asw_buf, (uint16_t)_command.len))
			{
				sendError(RECEIVE);
			}
			else
			{
				sendAnswer(OK, asw_buf, _command.len);
			}
		break;
		default:
			sendError(UNKNOWN_COMMAND);
	}
}

void RSToTWI::sendError(uint8_t err)
{
	sendAnswer( err, 0 , 0);
}

void RSToTWI::sendAnswer(uint8_t err, uint8_t * data, size_t len)
{
	_answer.header = 0xAA;
	_answer.errCode = err;
	if(data)
	{
		_answer.data = data;
	}
	Serial.write((uint8_t *)&_answer, sizeof(_answer.header) + sizeof(_answer.errCode) + len);
}


