#ifndef __RSTOTWI_H__
#define __RSTOTWI_H__

#include <inttypes.h>
#include <stdio.h>
#include "TwoWire.h"

class RSToTWI
{
//variables
private:
	uint8_t _dev_addr;
	uint8_t _state;
	static const size_t CMD_BUF_LEN = 40;
	static const uint32_t BAUS_RATE = 9600;
	uint8_t cmd_buf[CMD_BUF_LEN];
	uint8_t asw_buf[CMD_BUF_LEN];
	size_t _cmd_len;
	TwoWire * _twi;

	enum STATE
	{
		NONE,
		SERIAL_AVAILABLE,
		PARSE_COMMAND,
	};

	enum CMD
	{
		OK,
		SET_DEV_ADDR,
		WRITE_REGISTER,
		READ_REGISTER,
		TRANSMIT,
		RECEIVE,
		UNKNOWN_COMMAND,
	};

	struct Command
	{
		uint8_t cmd;
		uint8_t param1;
		uint8_t param2;
		size_t len;
		uint8_t * cmd_buf;
	} _command;

	struct Answer
	{
		uint8_t header;
		uint8_t errCode;
		uint8_t * data; 
	} _answer;

//functions
public:
	static RSToTWI & Instance(void);
	void proc(void);
protected:
private:
	RSToTWI();
	~RSToTWI();
	RSToTWI( const RSToTWI &c );
	RSToTWI& operator=( const RSToTWI &c );
	void init(void);
	void setDevAddress(uint8_t addr);
	uint8_t getDevAddress(void);
	void executeCommand(void);
	void sendError(uint8_t err);
	void sendAnswer(uint8_t err, uint8_t * data, size_t len);
}; 

#endif //__RSTOTWI_H__
