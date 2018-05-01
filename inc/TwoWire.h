#ifndef __TWI_H__
#define __TWI_H__

#include <inttypes.h>

class TwoWire
{
//variables
private:
	static const uint32_t F_SCL = 100000UL; // SCL frequency
	static const uint32_t Prescaler = 1;
	static const uint32_t TWBR_val = ((((F_CPU / F_SCL) / Prescaler) - 16 ) / 2);
	static const uint8_t I2C_READ = 0x01;
	static const uint8_t I2C_WRITE = 0x00;
//functions
public:
	static TwoWire & Instance(void);
	void init(void);
	uint8_t transmit(uint8_t address, uint8_t* data, uint16_t length);
	uint8_t receive(uint8_t address, uint8_t* data, uint16_t length);
	uint8_t writeReg(uint8_t devaddr, uint8_t regaddr, uint8_t* data, uint16_t length);
	uint8_t readReg(uint8_t devaddr, uint8_t regaddr, uint8_t* data, uint16_t length);
	void stop(void);
protected:
private:
	TwoWire();
	~TwoWire();
	TwoWire( const TwoWire &c );
	TwoWire& operator=( const TwoWire &c );
	uint8_t start(uint8_t address);
	uint8_t write(uint8_t data);
	uint8_t read_ack(void);
	uint8_t read_nack(void);
}; 

#endif //__TWI_H__
