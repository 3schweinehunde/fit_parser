Map device_info_fields = {
  253: {
    'field_name': 'timestamp',
    'data_type': 'date_time',
    'unit': 's',
  },
  0: {
    'field_name': 'device_index',
    'field_type': 'device_index',
  },
  1: {
    'field_name': 'device_type',
    'data_type': 'uint8',
    'reference_field_name': 'source_type',
    'reference_field_value': {
      'antplus': {
        'field_name': 'antplus_device_type',
        'field_type': 'antplus_device_type'
      },
      'ant': {'field_name': 'ant_device_type', 'data_type': 'uint8'},
    },
  },
  2: {
    'field_name': 'manufacturer',
    'field_type': 'manufacturer',
  },
  3: {
    'field_name': 'serial_number',
    'data_type': 'uint32z',
  },
  4: {
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
  5: {
    'field_name': 'software_version',
    'data_type': 'uint16',
    'scale': 100,
  },
  6: {
    'field_name': 'hardware_version',
    'data_type': 'uint8',
  },
  7: {
    'field_name': 'cum_operating_time',
    'data_type': 'uint32',
    'unit': 's',
  },
  10: {
    'field_name': 'battery_voltage',
    'data_type': 'uint16',
    'scale': 256,
    'unit': 'V',
  },
  11: {
    'field_name': 'battery_status',
    'field_type': 'battery_status',
  },
  18: {
    'field_name': 'sensor_position',
    'field_type': 'body_location',
  },
  19: {
    'field_name': 'descriptor',
    'data_type': 'string',
  },
  20: {
    'field_name': 'ant_transmission_type',
    'data_type': 'uint8z',
  },
  21: {
    'field_name': 'ant_device_number',
    'data_type': 'uint16z',
  },
  22: {
    'field_name': 'ant_network',
    'field_type': 'ant_network',
  },
  25: {
    'field_name': 'source_type',
    'field_type': 'source_type',
  },
  27: {
    'field_name': 'product_name',
    'data_type': 'string',
  },
};
