Map exdDataFieldConfigurationFields = {
  0: {
    'field_name': 'screen_index',
    'data_type': 'uint8',
  },
  1: {
    'field_name': 'concept_field',
    'data_type': 'byte',
    'components': [
      {
        'field_id': {
          'bits': 4,
        }
      },
      {
        'concept_index': {
          'bits': 4,
        }
      },
    ]
  },
  2: {
    'field_name': 'field_id',
    'data_type': 'uint8',
  },
  3: {
    'field_name': 'concept_count',
    'data_type': 'uint8',
  },
  4: {
    'field_name': 'display_type',
    'field_type': 'exd_display_type',
  },
  5: {
    'field_name': 'title',
    'data_type': 'string',
  },
};
