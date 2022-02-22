TARGET=hello

# These are currently scheme modules
OBJS=hello.o

CC=gcc

CFLAGS= -I/usr/local/include/scheme48
LDFLAGS= -lscheme48

SCM=./scm.sh

$(TARGET): $(OBJS)
	$(CC) $< $(LDFLAGS) -o $@

%.o : %.c
	$(CC) $< $(CFLAGS) -c -o $@

%.c : %.scm
	$(SCM) $< $@
