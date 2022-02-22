TARGET=hello

# These are currently scheme modules
SRCDIR=src
OBJDIR=obj
OUTDIR=bin

OBJS:=$(patsubst %.scm,%.o,$(wildcard ${SRCDIR}/*.scm))
OBJS:=$(subst ${SRCDIR},${OBJDIR},${OBJS})

CC=gcc

CFLAGS= -I/usr/local/include/scheme48
LDFLAGS= -lscheme48

SCM=./scm.sh

.phony: all dir clean

all: $(TARGET)

$(TARGET): dir $(OBJS)
	$(CC) $< $(LDFLAGS) -o $@

$(OBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) $< $(CFLAGS) -c -o $@

$(SRCDIR)/%.c : $(SRCDIR)/%.scm
	$(SCM) $< $@

dir:
	@mkdir -p ${OBJDIR} ${OUTDIR}


clean:
	@rm -rf ${OBJDIR}
	@rm -rf ${OUTDIR}

