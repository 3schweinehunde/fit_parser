Map gpsMetadataFields = {
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
    'field_name': 'position_lat',
    'data_type': 'sint32',
    'units': 'semicircles',
  },
  2: {
    'field_name': 'position_long',
    'data_type': 'sint32',
    'units': 'semicircles',
  },
  3: {
    'field_name': 'enhanced_altitude',
    'data_type': 'uint32',
    'scale': 5,
    'offset': 500,
    'units': 'm',
  },
  4: {
    'field_name': 'enhanced_speed',
    'data_type': 'uint32',
    'scale': 1000,
    'units': 'm/s',
  },
  5: {
    'field_name': 'heading',
    'data_type': 'uint16',
    'scale': 100,
    'units': 'degrees',
  },
  6: {
    'field_name': 'utc_timestamp',
    'data_type': 'date_time',
    'units': 's',
  },
  7: {
    'field_name': 'velocity',
    'data_type': 'sint16',
    'scale': 100,
    'units': 'm/s',
    'array': true,
    'fields': {
      'lon_velocity': {},
      'lat_velocity': {},
      'altitude_velocity': {},
    },
  },
};
