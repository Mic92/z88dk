#------------------------------------------------------------------------------
# Z88DK Z80 Module Assembler
#
# Copyright (C) Paulo Custodio, 2011-2017
# License: http://www.perlfoundation.org/artistic_license_2_0
# Repository: https://github.com/z88dk/z88dk
#------------------------------------------------------------------------------
PROJ		:= z80asm

ifeq ($(OS),Windows_NT)
  EXE 		:= .exe
else
  EXE 		:= $(EXESUFFIX)
endif

CC 			?= gcc
INSTALL 	?= install
CROSS		?= 0

#------------------------------------------------------------------------------
# Object files
#------------------------------------------------------------------------------
SRCS		:= $(filter-out test.c,$(wildcard *.c lib/*.c))
OBJS 		:= $(SRCS:.c=.o)
DEPENDS		:= $(SRCS:.c=.d)
TEST_SRC_MAIN:= $(wildcard t/test_*.c)
TEST_SRC_LIB:=t/testlib.c

#------------------------------------------------------------------------------
# variables
#------------------------------------------------------------------------------
TARGET =		$(PROJ)$(EXE)
MSVC_TARGET =	../../win32/Debug/$(TARGET)

OPT = -O3

STD = -std=gnu11
LOCAL_LIB :=	lib
LOCAL_CFLAGS +=	-MMD -I. -I$(LOCAL_LIB) -It -g -Wall -ftabstop=4 $(STD) $(OPT)

# Use these flags both in Windows_NT and in a MinGW build in Unix
#ifeq ($(OS),Windows_NT)
ifeq ($(EXE),.exe)
LOCAL_CFLAGS	+= -I../../ext/UNIXem/include
OBJS			+= ../../ext/UNIXem/src/glob.o
endif

# uthash
LOCAL_CFLAGS	+= -I../../ext/uthash/src

#------------------------------------------------------------------------------
# main
#------------------------------------------------------------------------------
.PHONY: all

all: $(TARGET)

$(TARGET): ../config.h $(OBJS)
	$(CC) $(LOCAL_CFLAGS) $(CFLAGS) -o $(TARGET) $(OBJS) $(LDFLAGS)

../config.h:
	@echo \#define PREFIX \"/usr/local/share/z88dk\" 				 > $@
	@echo \#define UNIX 1											>> $@
	@echo \#define EXEC_PREFIX \"\"									>> $@
	@echo \#define Z88DK_VERSION \"build-$(shell date +%Y%m%d)\"	>> $@

%.o: %.c
	$(CC) $(LOCAL_CFLAGS) $(CFLAGS) -c -o $@ $<

# parser is too big to optimize with -O3
parse.o: parse.c
	$(CC) $(LOCAL_CFLAGS) $(CFLAGS) -O0 -c -o $@ $<

#------------------------------------------------------------------------------
# libraries
#------------------------------------------------------------------------------
.PHONY: z80asm_lib
all: z80asm_lib

z80asm_lib:
ifeq ($(CROSS),0)
	make -C dev/z80asm_lib
	cp dev/z80asm_lib/$(PROJ)-*.lib .
endif

clean::
	make -C dev/z80asm_lib clean
	$(RM) $(PROJ)-*.lib

#------------------------------------------------------------------------------
# developer generated source files, and test libs
#------------------------------------------------------------------------------
.PHONY: dev
dev:
	$(MAKE) -C tt
	$(MAKE) -C doc
	$(MAKE) -C lib
	$(MAKE) -f dev/Makefile
	$(MAKE) all

clean::
	$(MAKE) -C lib clean

#------------------------------------------------------------------------------
# intall
#------------------------------------------------------------------------------
install:
	$(INSTALL) $(TARGET)     $(PREFIX)/bin/$(EXEC_PREFIX)$(TARGET)
	$(INSTALL) asmpp.pl      $(PREFIX)/bin/asmpp.pl
	make -C dev/z80asm_lib install PREFIX=$(PREFIX_SHARE)

#------------------------------------------------------------------------------
# clean
#------------------------------------------------------------------------------
clean::
	$(RM) *.core $(LOCAL_LIB)/*.core $(LOCAL_LIB)/t/*.core $(LOCAL_LIB)/t/uthash/*.core
	$(RM) *.o    $(LOCAL_LIB)/*.o    $(LOCAL_LIB)/t/*.o    $(LOCAL_LIB)/t/uthash/*.o 
	$(RM) *.out  $(LOCAL_LIB)/*.out  $(LOCAL_LIB)/t/*.out  $(LOCAL_LIB)/t/uthash/*.out
	$(RM) *.orig $(LOCAL_LIB)/*.orig $(LOCAL_LIB)/t/*.orig $(LOCAL_LIB)/t/uthash/*.orig
	$(RM) *.exe  $(LOCAL_LIB)/*.exe  $(LOCAL_LIB)/t/*.exe  $(LOCAL_LIB)/t/uthash/*.exe
	$(RM) *.tmp  $(LOCAL_LIB)/*.tmp  $(LOCAL_LIB)/t/*.tmp  $(LOCAL_LIB)/t/uthash/*.tmp
	$(RM) *.bak  $(LOCAL_LIB)/*.bak  $(LOCAL_LIB)/t/*.bak  $(LOCAL_LIB)/t/uthash/*.bak
	$(RM) *.log  $(LOCAL_LIB)/*.log  $(LOCAL_LIB)/t/*.log  $(LOCAL_LIB)/t/uthash/*.log
	$(RM) *~     $(LOCAL_LIB)/*~     $(LOCAL_LIB)/t/*~     $(LOCAL_LIB)/t/uthash/*~
	$(RM) -rf Debug Release x1 x2 x3

#------------------------------------------------------------------------------
# test
#------------------------------------------------------------------------------
all: t/libtestlib.a

t/libtestlib.a : $(OBJS) $(TEST_SRC_LIB:.c=.o)
	ar rcs t/libtestlib.a $(OBJS:$(PROJ).o=) $(TEST_SRC_LIB:.c=.o)

$(TEST_SRC_MAIN:.c=.o) : t/libtestlib.a

.o.out :
	$(CC) -static $(CFLAGS) $< -o $(<:.o=$(EXE)) $(LDFLAGS) -Lt -ltestlib
	$(<:.o=$(EXE)) 2> $@~
	diff -w $(<:.o=.bmk) $@~
	mv -f $@~ $@

clean::
	$(RM) t/libtestlib.a t/*.o t/*.out lib/t/*.o lib/t/*.out $(TEST_SRC_MAIN:.c=$(EXE))

test: $(TARGET) z80asm_lib
	$(MAKE) dev
	$(MAKE) z80asm_lib
	#$(MAKE) -C dev\z80asm_lib test
	$(MAKE) prove_c
	$(MAKE) prove_perl
	$(MAKE) test_enigma

testlib:
	$(MAKE) -C lib test

prove_c: t/libtestlib.a $(TEST_SRC_MAIN:.c=.o) $(TEST_SRC_MAIN:.c=.out)

prove_perl: $(TARGET)
	perl -S prove t/*.t

testmsvc : $(MSVC_TARGET)
	make Z80ASM=$(MSVC_TARGET) prove

test_enigma: $(TARGET)
	zcc +cpm -oenigma.bin t/data/enigma.c
	echo HELLO. > enigma.in
	cpm enigma.bin < enigma.in > enigma.out
	echo 'HREXLSLEOC .' > enigma.bmk
	diff -w enigma.bmk enigma.out
	$(RM) enigma.bin enigma.in enigma.out enigma.bmk
	
clean::
	$(RM) zcc_opt.def zcc_proj.lst enigma.bin enigma.in enigma.out enigma.bmk

testzcc : $(TARGET)
	zcc +zx -lndos       -create-app -omicroman.bin ../../examples/microman.c
	zcc +zx -lndos -lmzx -create-app -omandel.bin   ../../examples/graphics/mandel.c
	eightyone microman.tap
	eightyone mandel.tap

clean::
	$(RM) zcc_opt.def microman.bin microman.tap
	$(RM) zcc_opt.def mandel.bin   mandel.tap

clean::
	$(RM) $(TARGET) $(LOCAL_LIB)/$(TARGET) test* $(LOCAL_LIB)/test*
	$(RM) t/*.tmp $(LOCAL_LIB)/t/*.tmp t/dev/*.tmp 

#------------------------------------------------------------------------------
# build with msvc - need to build manualy, devenv not available in Express
#------------------------------------------------------------------------------
$(MSVC_TARGET) : $(wildcard *.c) $(wildcard *.h)
	@echo Build $(PROJ) inside Microsoft Visual C++ 2010 Express
	@exit 1


#------------------------------------------------------------------------------
# Dependencies
#------------------------------------------------------------------------------
clean::
	rm -f $(DEPENDS)
	
-include $(DEPENDS)
