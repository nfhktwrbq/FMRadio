################################################################################
# Automatically-generated file. Do not edit!
################################################################################

RM := rm -rf

USER_OBJS :=

LIBS := 
PROJ := 

O_SRCS := 
C_SRCS := 
S_SRCS := 
S_UPPER_SRCS := 
OBJ_SRCS := 
ASM_SRCS := 
PREPROCESSING_SRCS := 
OBJS := 
OBJS_AS_ARGS := 
C_DEPS := 
C_DEPS_AS_ARGS := 
EXECUTABLES := 
OUTPUT_FILE_PATH :=
OUTPUT_FILE_PATH_AS_ARGS :=
AVR_APP_PATH :=$$$AVR_APP_PATH$$$
QUOTE := "
ADDITIONAL_DEPENDENCIES:=
OUTPUT_FILE_DEP:=
LIB_DEP:=
LINKER_SCRIPT_DEP:=

# Every subdirectory with source files must be described here
SUBDIRS :=  \
./inc \
./src


# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS +=  \
./main.cpp \
./src/TwoWire.cpp \
./src/HardwareSerial.cpp \
./src/HardwareSerial0.cpp \
./src/HardwareSerial1.cpp \
./src/HardwareSerial2.cpp \
./src/HardwareSerial3.cpp \
./src/Print.cpp \
./src/Stream.cpp \
./src/WString.cpp \
./src/RSToTWI.cpp \
./src/wiring.c

PREPROCESSING_SRCS += 


ASM_SRCS += 


OBJS +=  \
main.o \
src/TwoWire.o \
src/HardwareSerial.o \
src/HardwareSerial0.o \
src/HardwareSerial1.o \
src/HardwareSerial2.o \
src/HardwareSerial3.o \
src/Print.o \
src/Stream.o \
src/WString.o \
src/RSToTWI.o \
src/wiring.o

OBJS_AS_ARGS +=  \
main.o \
src/TwoWire.o \
src/HardwareSerial.o \
src/HardwareSerial0.o \
src/HardwareSerial1.o \
src/HardwareSerial2.o \
src/HardwareSerial3.o \
src/Print.o \
src/Stream.o \
src/WString.o \
src/RSToTWI.o \
src/wiring.o

C_DEPS +=  \
main.d \
src/TwoWire.d \
src/HardwareSerial.d \
src/HardwareSerial0.d \
src/HardwareSerial1.d \
src/HardwareSerial2.d \
src/HardwareSerial3.d \
src/Print.d \
src/Stream.d \
src/WString.d \
src/RSToTWI.d \
src/wiring.d

C_DEPS_AS_ARGS +=  \
main.d \
src/TwoWire.d \
src/HardwareSerial.d \
src/HardwareSerial0.d \
src/HardwareSerial1.d \
src/HardwareSerial2.d \
src/HardwareSerial3.d \
src/Print.d \
src/Stream.d \
src/WString.d \
src/RSToTWI.d \
src/wiring.d

PROJECT_NAME = fm

OUTPUT_FILE_PATH += $(PROJECT_NAME).elf

OUTPUT_FILE_PATH_AS_ARGS +=$(PROJECT_NAME).elf

ADDITIONAL_DEPENDENCIES:=

OUTPUT_FILE_DEP:= ./makedep.mk

LIB_DEP+= 

LINKER_SCRIPT_DEP+= 

CC = avr-g++

OBJCOPY = avr-objcopy
SIZE = avr-size
MCU = atmega8a
CFLAGS = -funsigned-char -funsigned-bitfields -DDEBUG -DF_CPU=8000000UL  -I./inc -I/usr/lib/avr/include/ -Os -fno-threadsafe-statics -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -g2 -Wall -mmcu=$(MCU) -B "C:\Program Files (x86)\Atmel\Studio\7.0\Packs\atmel\ATmega_DFP\1.2.150\gcc\dev\atmega328p" -c -fno-threadsafe-statics -std=c++11  
# AVR32/GNU C Compiler



































./%.o: ././%.cpp
	@echo Building file: $<
	@echo Invoking: AVR8/GNU C Compiler : 5.4.0
	$(CC) $(CFLAGS) -MD -MP -MF $(@:%.o=%.d) -MT$(@:%.o=%.d) -MT$(@:%.o=%.o)   -o $@ $< 
	@echo Finished building: $<
	

src/%.o: ./src/%.cpp
	@echo Building file: $<
	@echo Invoking: AVR8/GNU C Compiler : 5.4.0
	$(CC) $(CFLAGS) -MD -MP -MF $(@:%.o=%.d) -MT$(@:%.o=%.d) -MT$(@:%.o=%.o)   -o $@ $< 
	@echo Finished building: $<
	



# AVR32/GNU Preprocessing Assembler



# AVR32/GNU Assembler




ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: $(OUTPUT_FILE_PATH) $(ADDITIONAL_DEPENDENCIES)

$(OUTPUT_FILE_PATH): $(OBJS) $(USER_OBJS) $(OUTPUT_FILE_DEP) $(LIB_DEP) $(LINKER_SCRIPT_DEP)
	@echo Building target: $@
	@echo Invoking: AVR8/GNU Linker : 5.4.0
	$(CC) -o$(OUTPUT_FILE_PATH_AS_ARGS) $(OBJS_AS_ARGS) $(USER_OBJS) $(LIBS) -Wl,-Map=geiger.map -Wl,--start-group -Wl,-lm  -Wl,--end-group -Wl,--gc-sections -mmcu=$(MCU) -B "C:\Program Files (x86)\Atmel\Studio\7.0\Packs\atmel\ATmega_DFP\1.2.150\gcc\dev\atmega328p"  
	@echo Finished building target: $@
	$(OBJCOPY) -O ihex -R .eeprom -R .fuse -R .lock -R .signature -R .user_signatures  $(PROJECT_NAME).elf $(PROJECT_NAME).hex
	$(OBJCOPY) -j .eeprom  --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0  --no-change-warnings -O ihex $(PROJECT_NAME).elf $(PROJECT_NAME).eep || exit 0
	$(OBJCOPY) -h -S $(PROJECT_NAME).elf > $(PROJECT_NAME).lss
	$(OBJCOPY) -O srec -R .eeprom -R .fuse -R .lock -R .signature -R .user_signatures $(PROJECT_NAME).elf $(PROJECT_NAME).srec
	$(SIZE) $(PROJECT_NAME).elf
	
	





# Other Targets
clean:
	-$(RM) $(OBJS_AS_ARGS) $(EXECUTABLES)  
	-$(RM) $(C_DEPS_AS_ARGS)   
	rm -rf $(PROJECT_NAME).elf $(PROJECT_NAME).a $(PROJECT_NAME).hex $(PROJECT_NAME).lss $(PROJECT_NAME).eep $(PROJECT_NAME).map $(PROJECT_NAME).srec $(PROJECT_NAME).usersignatures
	