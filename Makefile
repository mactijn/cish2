include makeinclude

SRCS   := $(wildcard *.c)
OBJS   := $(SRCS:.c=.o)
TARGET := cish

.PHONY: all clean distclean

all: $(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)

distclean: clean
	rm -f makeinclude platform.h configure.paths

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS)

.SUFFIXES: .c .o
.c.o: 
	$(CC) $(CFLAGS) -I. -c $<
