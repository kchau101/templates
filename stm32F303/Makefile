# Courtesy of Jeremy Herbert (https://github.com/jeremyherbert/stm32-templates/blob/master/stm32f4-discovery/Makefile)
# Based on his script for STM32F4 targets. 
# put your *.o targets here, make should handle the rest!

MSG = "Configurations were pre-built into the library, please use the regular makefile if you want more control."

SRCS = main.c

# all the files will be generated with this name (main.elf, main.bin, main.hex, etc)

PROJ_NAME=main

# that's it, no need to change anything below this line!

###################################################

CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy

CFLAGS = -g -O2 -Wall -Tstm32_flash.ld
CFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m4 -mthumb-interwork
CFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16

###################################################

vpath %.c src
vpath %.a lib

ROOT=$(shell pwd)

#May need to change these CFLAG includes
CFLAGS += -Iinc -Ilib -Ilib/inc
CFLAGS += -Ilib/inc/core -Ilib/inc/peripherals

#SRCS += startup_stm32f4xx.s # add startup file to build

OBJS = $(SRCS:.c=.o)

###################################################

.PHONY: lib proj link_static

all: lib proj

lib:
        $(MAKE) -C lib

proj:         $(PROJ_NAME).elf

$(PROJ_NAME).elf: $(SRCS)
        $(CC) $(CFLAGS) $^ -o $@ -Llib
        $(OBJCOPY) -O ihex $(PROJ_NAME).elf $(PROJ_NAME).hex
        $(OBJCOPY) -O binary $(PROJ_NAME).elf $(PROJ_NAME).bin
        echo $(MSG)

link_static: $(SRCS)
		$(CC) $(CFLAGS) $^ -o $@ -Llib -lcm3_periph
        $(OBJCOPY) -O ihex $(PROJ_NAME).elf $(PROJ_NAME).hex
        $(OBJCOPY) -O binary $(PROJ_NAME).elf $(PROJ_NAME).bin
        echo $(MSG)
clean:
        rm -f *.o
        rm -f $(PROJ_NAME).elf
        rm -f $(PROJ_NAME).hex
        rm -f $(PROJ_NAME).bin
