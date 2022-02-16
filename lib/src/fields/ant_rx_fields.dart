Map antRxFields = {
  253: {
    'field_name': 'timestamp',
    'data_type': 'date_time',
    'units': 's',
  },
  0: {
    'field_name': 'fractional_timestamp',
    'data_type': 'uint16',
    'scale': 32768,
    'units': 's',
  },
  1: {
    'field_name': 'mesg_id',
    'data_type': 'byte',
  },
  2: {
    'field_name': 'mesg_data',
    'data_type': 'byte',
    'bits': 8,
    'components': [
      {
        'channel_number': {
          'bits': 8,
        }
      },
      {
        'data': {
          'bits': 8,
        }
      },
      {
        'data': {
          'bits': 8,
        }
      },
      {
        'data': {
          'bits': 8,
        }
      },
      {
        'data': {
          'bits': 8,
        }
      },
      {
        'data': {
          'bits': 8,
        }
      },
      {
        'data': {
          'bits': 8,
        }
      },
      {
        'data': {
          'bits': 8,
        }
      },
      {
        'data': {
          'bits': 8,
        }
      },
    ]
  },
  3: {
    'field_name': 'channel_number',
    'data_type': 'uint8',
  },
  4: {
    'field_name': 'data',
    'data_type': 'byte',
  },
};
