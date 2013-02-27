# Hey Emacs, this is a -*- makefile -*-
#
# flymapple_1.0.makefile
#
# http://paparazzi.enac.fr/wiki/Lisa/M_v20
#

BOARD=flymaple
BOARD_VERSION=1.0
BOARD_CFG=\"boards/$(BOARD)_$(BOARD_VERSION).h\"

ARCH=stm32
$(TARGET).ARCHDIR = $(ARCH)
# not needed?
$(TARGET).OOCD_INTERFACE=flossjtag
#$(TARGET).OOCD_INTERFACE=jtagkey-tiny

# -----------------------------------------------------------------------

ifndef FLASH_MODE
FLASH_MODE = DFU
#FLASH_MODE = JTAG
#FLASH_MODE = SERIAL
endif

ifndef NO_LUFTBOOT
$(TARGET).CFLAGS+=-DLUFTBOOT
$(TARGET).LDSCRIPT = $(SRC_ARCH)/lisa_m_2.0_luftboot.ld
endif

#
#
# some default values shared between different firmwares
#
#


#
# default LED configuration
#
ifndef RADIO_CONTROL_LED
RADIO_CONTROL_LED  = 4
endif

ifndef BARO_LED
BARO_LED = none
endif

ifndef AHRS_ALIGNER_LED
AHRS_ALIGNER_LED = 2
endif

ifndef GPS_LED
GPS_LED = 3
endif

ifndef SYS_TIME_LED
SYS_TIME_LED = 1
endif

#
# default uart configuration
#
ifndef RADIO_CONTROL_SPEKTRUM_PRIMARY_PORT
RADIO_CONTROL_SPEKTRUM_PRIMARY_PORT   = UART1
endif

ifndef RADIO_CONTROL_SPEKTRUM_SECONDARY_PORT
RADIO_CONTROL_SPEKTRUM_SECONDARY_PORT = UART5
endif

ifndef MODEM_PORT
MODEM_PORT=UART2
endif
ifndef MODEM_BAUD
MODEM_BAUD=B57600
endif


ifndef GPS_PORT
GPS_PORT=UART3
endif
ifndef GPS_BAUD
GPS_BAUD=B38400
endif


