Map dive_settings_fields = {
  254: {
    'field_name': 'message_index',
    'field_type': 'message_index',
  },
  0: {
    'field_name': 'name',
    'data_type': 'string',
  },
  1: {
    'field_name': 'model',
    'field_type': 'tissue_model_type',
  },
  2: {
    'field_name': 'gf_low',
    'data_type': 'uint8',
    'units': 'percent',
  },
  3: {
    'field_name': 'gf_high',
    'data_type': 'uint8',
    'units': 'percent',
  },
  4: {
    'field_name': 'water_type',
    'field_type': 'water_type',
  },
  5: {
    'field_name': 'water_density',
    'data_type': 'float32',
    'units': 'kg/m^3',
  },
  6: {
    'field_name': 'po2_warn',
    'data_type': 'uint8',
    'scale': 100,
    'units': 'percent',
  },
  7: {
    'field_name': 'po2_critical',
    'data_type': 'uint8',
    'scale': 100,
    'units': 'percent',
  },
  8: {
    'field_name': 'po2_deco',
    'data_type': 'uint8',
    'scale': 100,
    'units': 'percent',
  },
  9: {
    'field_name': 'safety_stop_enabled',
    'data_type': 'bool',
  },
  10: {
    'field_name': 'bottom_depth',
    'data_type': 'float32',
  },
  11: {
    'field_name': 'bottom_time',
    'data_type': 'uint32',
  },
  12: {
    'field_name': 'apnea_countdown_enabled',
    'data_type': 'bool',
  },
  13: {
    'field_name': 'apnea_countdown_time',
    'data_type': 'uint32',
  },
  14: {
    'field_name': 'backlight_mode',
    'field_type': 'dive_backlight_mode',
  },
  15: {
    'field_name': 'backlight_brightness',
    'data_type': 'uint8',
  },
  16: {
    'field_name': 'backlight_timeout',
    'field_type': 'backlight_timeout',
  },
  17: {
    'field_name': 'repeat_dive_interval',
    'data_type': 'uint16',
    'scale': 1,
    'units': 's',
  },
  18: {
    'field_name': 'safety_stop_time',
    'data_type': 'uint16',
    'scale': 1,
    'units': 's',
  },
  19: {
    'field_name': 'heart_rate_source_type',
    'field_type': 'source_type',
  },
  20: {
    'field_name': 'heart_rate_source',
    'data_type': 'uint8',
    'reference_field_name': 'heart_rate_source_type',
    'reference_field_name': {
      'antplus': {
        'field_name': 'heart_rate_antplus_device_type',
        'field_type': 'antplus_device_type',
      },
      'local': {
        'field_name': 'heart_rate_local_device_type',
        'field_type': 'local_device_type',
      },
    },
  },
};
