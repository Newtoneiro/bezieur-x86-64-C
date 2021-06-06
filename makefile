CC=gcc

ASMBIN=nasm

CFLAGS= -m64 -Wall

LDFLAGS=-L/usr/lib -lallegro -lallegro_primitives -lm

INCLUDE=-I. -I/usr/local/include/allegro5/



all : asm cc link

asm :

	$(ASMBIN) -o f.o -f elf64 -g -l f.lst f.s

cc :

	$(CC) $(CFLAGS) -c -g -O0 main.c -std=c11 -lm

link :

	$(CC) $(CFLAGS) -g -o program main.o f.o $(INCLUDE) $(LDFLAGS)

gdb :
	gdb program

clean :
	rm *.o
	rm *.lst
	rm program

debug :    all gdb