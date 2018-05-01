#include <avr/io.h>
#include <util/delay.h>

#include <TwoWire.h>
#include "portability.h"

int main(void)
{
	TwoWire * twi = &TwoWire::Instance();
	twi->init();
	while(1)
	{
		_delay_ms(1000);
	}
}
