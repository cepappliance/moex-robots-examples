TARGET  = pcie-test

CC      = gcc

SRCDIR  = .
OBJDIR  = .
LDFLAGS = -L../adapter -lcepappliance-pcie-adapter
CFLAGS  = -Wall -O2 -std=c99 -I../adapter

SRC    := $(wildcard *.c)
OBJ    := $(patsubst %, $(OBJDIR)/%, $(SRC:%.c=%.o))

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) -c $< -o $@ $(CFLAGS) 

$(TARGET): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

all: $(TARGET)

clean:
	rm -f $(OBJDIR)/%.o $(TARGET)