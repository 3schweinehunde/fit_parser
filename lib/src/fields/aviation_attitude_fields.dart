Map aviation_attitude_fields = {
  253: {
    'field_name': 'timestamp',
    'data_type': 'date_time',
    'units': 's',
  },
  0: {
    'field_name': 'timestamp_ms',
    'data_type': 'uint16',
    'units': 'ms',
  },
  1: {
    'field_name': 'system_time',
    'data_type': 'uint32',
    'units': 'ms',
  },
  2: {
    'field_name': 'pitch',
    'data_type': 'sint16',
    'scale': 10430.38,
    'units': 'radians',
  },
  3: {
    'field_name': 'roll',
    'data_type': 'sint16',
    'scale': 10430.38,
    'units': 'radians',
  },
  4: {
    'field_name': 'accel_lateral',
    'data_type': 'sint16',
    'scale': 100,
    'units': 'm/s^2',
  },
  5: {
    'field_name': 'accel_normal',
    'data_type': 'sint16',
    'scale': 100,
    'units': 'm/s^2',
  },
  6: {
    'field_name': 'turn_rate',
    'data_type': 'sint16',
    'scale': 1024,
    'units': 'radians/second',
  },
  7: {
    'field_name': 'stage',
    'field_type': 'attitude_stage',
  },
  8: {
    'field_name': 'attitude_stage_complete',
    'data_type': 'uint8',
    'units': '%',
  },
  9: {
    'field_name': 'track',
    'data_type': 'uint16',
    'scale': 10430.38,
    'units': 'radians',
  },
  10: {
    'field_name': 'validity',
    'field_type': 'attitude_validity',
  },
};
