Map slave_device_fields = {
  0: {
    'field_name': 'manufacturer',
    'data_type': 'manufacturer',
  },
  1: {
    'field_name': 'product',
    'data_type': 'uint16',
    'reference_field_name': 'manufacturer',
    'reference_field_value': {
      'favero_electronics': {
        'field_name': 'favero_product',
        'data_type': 'favero_product',
      },
      'garmin': {
        'field_name': 'garmin_product',
        'data_type': 'garmin_product',
      },
      'dynastream': {
        'field_name': 'garmin_product',
        'data_type': 'garmin_product',
      },
      'dynastream_oem': {
        'field_name': 'garmin_product',
        'data_type': 'garmin_product',
      },
    },
  },
};
