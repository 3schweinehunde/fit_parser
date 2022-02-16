Map watchfaceSettingsFields = {
  254: {
    'field_name': 'message_index',
    'field_type': 'message_index',
  },
  0: {
    'field_name': 'mode',
    'field_type': 'watchface_mode',
  },
  1: {
    'field_name': 'layout',
    'data_type': 'byte',
    'reference_field_name': 'mode',
    'reference_field_value': {
      'digital': {
        'field_name': 'digital_layout',
        'field_type': 'digital_watchface_layout',
      },
      'analog': {
        'field_name': 'analog_layout',
        'field_type': 'analog_watchface_layout',
      },
    }
  },
};
