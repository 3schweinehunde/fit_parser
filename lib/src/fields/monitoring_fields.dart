Map monitoring_fields = {
  253: {
    'field_name': 'timestamp',
    'data_type': 'date_time',
    'units': 's',
  },
  0: {
    'field_name': 'device_index',
    'field_type': 'device_index',
  },
  1: {
    'field_name': 'calories',
    'data_type': 'uint16',
    'units': 'kcal',
  },
  2: {
    'field_name': 'distance',
    'data_type': 'uint32',
    'scale': 100,
    'units': 'm',
  },
  3: {
    'field_name': 'cycles',
    'data_type': 'uint32',
    'scale': 2,
    'units': 'cycles',
    'reference_field_name': 'activity_type',
    'reference_field_value': {
      'walking': {
        'field_name': 'steps',
        'data_type': 'uint32',
        'scale': 1,
        'units': 'steps',
      },
      'running': {
        'field_name': 'steps',
        'data_type': 'uint32',
        'scale': 1,
        'units': 'steps',
      },
      'cycling': {
        'field_name': 'strokes',
        'data_type': 'uint32',
        'scale': 2,
        'units': 'strokes',
      },
      'swimming': {
        'field_name': 'strokes',
        'data_type': 'uint32',
        'scale': 2,
        'units': 'strokes',
      },
    },
  },
  4: {
    'field_name': 'active_time',
    'data_type': 'uint32',
    'scale': 1000,
    'units': 's',
  },
  5: {
    'field_name': 'activity_type',
    'field_type': 'activity_type',
  },
  6: {
    'field_name': 'activity_subtype',
    'field_type': 'activity_subtype',
  },
  7: {
    'field_name': 'activity_level',
    'field_type': 'activity_level',
  },
  8: {
    'field_name': 'distance_16',
    'data_type': 'uint16',
    'units': '100 * m',
  },
  9: {
    'field_name': 'cycles_16',
    'data_type': 'uint16',
    'units': '2 * cycles (steps)',
  },
  10: {
    'field_name': 'active_time_16',
    'data_type': 'uint16',
    'units': 's',
  },
  11: {
    'field_name': 'local_timestamp',
    'data_type': 'local_date_time',
  },
  12: {
    'field_name': 'temperature',
    'data_type': 'sint16',
    'scale': 100,
    'units': 'C',
  },
  14: {
    'field_name': 'temperature_min',
    'data_type': 'sint16',
    'scale': 100,
    'units': 'C',
  },
  15: {
    'field_name': 'temperature_max',
    'data_type': 'sint16',
    'scale': 100,
    'units': 'C',
  },
  16: {
    'field_name': 'activity_time',
    'data_type': 'uint16',
    'units': 'minutes',
  },
  19: {
    'field_name': 'active_calories',
    'data_type': 'uint16',
    'units': 'kcal',
  },
  24: {
    'field_name': 'current_activity_type_intensity',
    'data_type': 'byte',
  },
  25: {
    'field_name': 'timestamp_min_8',
    'data_type': 'uint8',
    'units': 'min',
  },
  26: {
    'field_name': 'timestamp_16',
    'data_type': 'uint16',
    'units': 's',
  },
  27: {
    'field_name': 'heart_rate',
    'data_type': 'uint8',
    'units': 'bpm',
  },
  28: {
    'field_name': 'intensity',
    'data_type': 'uint8',
    'scale': 10,
  },
  29: {
    'field_name': 'duration_min',
    'data_type': 'uint16',
    'units': 'min',
  },
  30: {
    'field_name': 'duration',
    'data_type': 'uint32',
    'units': 's',
  },
  31: {
    'field_name': 'ascent',
    'data_type': 'uint32',
    'scale': 1000,
    'units': 'm',
  },
  32: {
    'field_name': 'descent',
    'data_type': 'uint32',
    'scale': 1000,
    'units': 'm',
  },
  33: {
    'field_name': 'moderate_activity_minutes',
    'data_type': 'uint16',
    'units': 'minutes',
  },
  34: {
    'field_name': 'vigorous_activity_minutes',
    'data_type': 'uint16',
    'units': 'minutes',
  },
};
