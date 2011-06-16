LOCAL_DIR := $(GET_LOCAL_DIR)

INCLUDES += -I$(LOCAL_DIR)/include -I$(LK_TOP_DIR)/platform/msm_shared

PLATFORM := msm8x60

MEMBASE := 0x40100000 # SMI
MEMSIZE := 0x00100000 # 1MB

BASE_ADDR        := 0x40200000

TAGS_ADDR        := BASE_ADDR+0x00000100
KERNEL_ADDR      := BASE_ADDR+0x00008000
RAMDISK_ADDR     := BASE_ADDR+0x01000000
SCRATCH_ADDR     := 0x48000000

KEYS_USE_GPIO_KEYPAD := 1

DEFINES += DISPLAY_SPLASH_SCREEN=1
DEFINES += DISPLAY_TYPE_LCDC=1
DEFINES += DISPLAY_TYPE_MIPI=0
DEFINES += DISPLAY_MIPI_PANEL_NOVATEK_BLUE=0
DEFINES += DISPLAY_MIPI_PANEL_TOSHIBA=0
DEFINES += MMC_BOOT_ADM=0

MODULES += \
	dev/keys \
	lib/ptable

DEFINES += \
	MEMSIZE=$(MEMSIZE) \
	MEMBASE=$(MEMBASE) \
	BASE_ADDR=$(BASE_ADDR) \
	TAGS_ADDR=$(TAGS_ADDR) \
	KERNEL_ADDR=$(KERNEL_ADDR) \
	RAMDISK_ADDR=$(RAMDISK_ADDR) \
	SCRATCH_ADDR=$(SCRATCH_ADDR)

OBJS += \
	$(LOCAL_DIR)/init.o \
	$(LOCAL_DIR)/atags.o \
	$(LOCAL_DIR)/keypad.o
