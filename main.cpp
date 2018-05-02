#include <avr/io.h>
#include <util/delay.h>

#include "portability.h"
#include "RSToTWI.h"

int main(void)
{
	RSToTWI * rstotwi = &RSToTWI::Instance();
	while(1)
	{
		rstotwi->proc();
	}
}
