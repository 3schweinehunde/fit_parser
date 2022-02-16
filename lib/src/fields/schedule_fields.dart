Map scheduleFields = {
  0: {
    'field_name': 'manufacturer',
    'field_type': 'manufacturer',
  },
  1: {
    'field_name': 'product',
    'data_type': 'uint16',
    'reference_field_name': '',
    'reference_field_value': {
      'favero_electronics': {
        'field_name': 'favero_product',
        'field_type': 'favero_product',
      },
      'garmin': {
        'field_name': 'garmin_product',
        'field_type': 'garmin_product',
      },
      'dynastream': {
        'field_name': 'garmin_product',
        'field_type': 'garmin_product',
      },
      'dynastream_oem': {
        'field_name': 'garmin_product',
        'field_type': 'garmin_product',
      },
    },
  },
  2: {
    'field_name': 'serial_number',
    'data_type': 'uint32z',
  },
  3: {
    'field_name': 'time_created',
    'data_type': 'date_time',
  },
  4: {
    'field_name': 'completed',
    'data_type': 'bool',
  },
  5: {
    'field_name': 'type',
    'data_type': 'schedule',
  },
  6: {
    'field_name': 'scheduled_time',
    'field_type': 'local_date_time',
  },
};
