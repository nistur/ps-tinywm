TARGET=tinywm

# These are currently scheme modules
SRCDIR=src
OBJDIR=obj

OBJS:=$(patsubst %.scm,%.o,$(wildcard ${SRCDIR}/*.scm))
OBJS:=$(subst ${SRCDIR},${OBJDIR},${OBJS})

CC?=gcc

CFLAGS= -Iextern/scheme48/c -Isrc
LDFLAGS= -Lextern/scheme48/c -lscheme48 -ldl -lX11

SCM=./scm.sh

.phony: all buildenv dir clean

all: dir $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $< $(LDFLAGS) -o $@

$(OBJDIR)/%.o : $(OBJDIR)/%-generated.c
	$(CC) $< $(CFLAGS) -c -o $@ -MMD -MP -MF $@.d

$(OBJDIR)/%-generated.c : $(SRCDIR)/%.scm
	$(SCM) $< $@

dir:
	@mkdir -p ${OBJDIR}

buildenv:
	./scripts/make-buildenv.sh

clean:
	@rm -rf ${OBJDIR}

.PRECIOUS: $(OBJDIR)/%-generated.c

-include $(OBJDIR)/*.d
