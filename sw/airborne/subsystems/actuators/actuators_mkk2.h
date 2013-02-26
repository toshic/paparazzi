/*
 * Copyright (C) 2008-2009 Antoine Drouin <poinix@gmail.com>
 *
 * This file is part of paparazzi.
 *
 * paparazzi is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * paparazzi is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with paparazzi; see the file COPYING.  If not, write to
 * the Free Software Foundation, 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

/** @file actuators_mkk.h
 *  Actuators driver for Mikrokopter motor controllers.
 */

#ifndef ACTUATORS_MKK_H
#define ACTUATORS_MKK_H

#include "std.h"
#include "mcu_periph/i2c.h"

#include "generated/airframe.h"


struct ActuatorsMkk2 {
  bool_t   actuators_delay_done;    // mkk_config module wants to know state
  uint16_t setpoint[ACTUATORS_MKK2_NB];
  struct i2c_transaction trans[ACTUATORS_MKK2_NB];
};

extern struct ActuatorsMkk2 actuators_mkk2;

extern void actuators_mkk2_init(void);
extern void actuators_mkk2_set(void);

#define ActuatorMkk2Set(_i, _v) { actuators_mkk2.setpoint[_i] = _v; }
#define ActuatorsMkk2Init() actuators_mkk2_init()
#define ActuatorsMkk2Commit() actuators_mkk2_set()

#endif /* ACTUATORS_MKK_H */
