Map oneDSensorCalibrationFields = {
  253: {
    'field_name': 'timestamp',
    'data_type': 'date_time',
    'units': 's',
  },
  0: {
    'field_name': 'sensor_type',
    'field_type': 'sensor_type',
  },
  1: {
    'field_name': 'calibration_factor',
    'data_type': 'uint32',
    'reference_field_name': 'sensor_type',
    'reference_field_value': {
      'barometer': {
        'field_name': 'baro_cal_factor',
        'data_type': 'uint32',
        'units': 'Pa',
      },
    },
  },
  2: {
    'field_name': 'calibration_divisor',
    'data_type': 'uint32',
    'units': 'counts',
  },
  3: {
    'field_name': 'level_shift',
    'data_type': 'uint32',
  },
  4: {
    'field_name': 'offset_cal',
    'data_type': 'sint32',
  },
};
