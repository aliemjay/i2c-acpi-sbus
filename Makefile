KERNEL_VERSION	:= $(shell uname -r)
KERNEL_SRC	:= /lib/modules/$(KERNEL_VERSION)/build

DRIVER  := i2c-acpi-sbus

obj-m	:= $(DRIVER).o

.PHONY: all install modules modules_install clean

all: modules

modules clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(CURDIR) $@

install: modules_install

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(CURDIR) modules_install
