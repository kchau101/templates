PROCESSOR   = 16f88
ASM         = gpasm
LINK        = gplink
DEL         = rm -f
BURN        = pk2cmd
SRCS = main.asm setup.asm isr.asm
OBJS = main.o setup.o isr.o
LIBS = 
RELOCATABLE = TRUE

.PHONY: clean burn
all: main.hex

main.hex: $(SRCS)
ifeq ($(RELOCATABLE), TRUE)
	$(foreach src,$(SRCS), $(ASM) -r hex -p $(PROCESSOR) $(src) -c;)
	$(LINK) $(OBJS) $(LIBS) -o main
else
	$(ASM) -r hex -p $(PROCESSOR) main.asm
endif

burn:
	$(BURN) -M -PPIC$(PROCESSOR) -F main.hex

clean:
	$(DEL) *.hex
	$(DEL) *.o
	$(DEL) *.map
	$(DEL) *.lst
	$(DEL) *.obj
	$(DEL) *.cod