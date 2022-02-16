Map fileIdFields = {
  0: {
    'field_name': 'type',
    'field_type': 'file',
  },
  1: {
    'field_name': 'manufacturer',
    'field_type': 'manufacturer',
  },
  2: {
    'field_name': 'product',
    'data_type': 'uint16',
    'reference_field_name': 'manufacturer',
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
  3: {
    'field_name': 'serial_number',
    'data_type': 'uint32z',
  },
  4: {
    'field_name': 'time_created',
    'data_type': 'date_time',
  },
  5: {
    'field_name': 'number',
    'data_type': 'uint16',
  },
  8: {
    'field_name': 'product_name',
    'data_type': 'string',
  },
};
