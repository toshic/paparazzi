
IMU_FLYMAPLE_CFLAGS  = -DUSE_IMU
IMU_FLYMAPLE_CFLAGS += -DIMU_TYPE_H=\"boards/flymaple/imu_flymaple.h\"

IMU_FLYMAPLE_SRCS    = $(SRC_SUBSYSTEMS)/imu.c             \
                    $(SRC_BOARD)/imu_flymaple.c

IMU_FLYMAPLE_I2C_DEVICE=i2c1
IMU_FLYMAPLE_CFLAGS += -DUSE_I2C
IMU_FLYMAPLE_CFLAGS += -DUSE_I2C1 -DI2C1_SCLL=25 -DI2C1_SCLH=25

IMU_FLYMAPLE_CFLAGS += -DITG3200_I2C_DEVICE=$(IMU_FLYMAPLE_I2C_DEVICE)
IMU_FLYMAPLE_CFLAGS += -DITG3200_I2C_ADDR=ITG3200_ADDR_ALT
IMU_FLYMAPLE_CFLAGS += -DITG3200_SMPLRT_DIV=1
IMU_FLYMAPLE_CFLAGS += -DITG3200_DLFP_CFG=5
IMU_FLYMAPLE_SRCS += peripherals/itg3200.c

IMU_FLYMAPLE_CFLAGS += -DADXL345_I2C_DEVICE=$(IMU_FLYMAPLE_I2C_DEVICE)
IMU_FLYMAPLE_CFLAGS += -DADXL345_I2C_ADDR=ADXL345_ADDR_ALT
IMU_FLYMAPLE_CFLAGS += -DADXL345_BW_RATE=0x8
IMU_FLYMAPLE_SRCS += peripherals/adxl345.i2c.c

IMU_FLYMAPLE_CFLAGS += -DHMC58XX_I2C_DEVICE=$(IMU_FLYMAPLE_I2C_DEVICE)
IMU_FLYMAPLE_SRCS += peripherals/hmc58xx.c

ap.CFLAGS += $(IMU_FLYMAPLE_CFLAGS)
ap.srcs   += $(IMU_FLYMAPLE_SRCS)

