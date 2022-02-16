Map mesgCapabilitiesFields = {
  254: {
    'field_name': 'message_index',
    'field_type': 'message_index',
  },
  0: {
    'field_name': 'file',
    'field_type': 'file',
  },
  1: {
    'field_name': 'mesg_num',
    'field_type': 'mesg_num',
  },
  2: {
    'field_name': 'count_type',
    'field_type': 'mesg_count',
  },
  3: {
    'field_name': 'count',
    'data_type': 'uint16',
    'reference_field_name': 'count_type',
    'reference_field_value': {
      'num_per_file': {
        'field_name': 'num_per_file',
        'data_type': 'uint16',
      },
      'max_per_file': {
        'field_name': 'max_per_file',
        'data_type': 'uint16',
      },
      'max_per_field_type': {
        'field_name': 'max_per_file_type',
        'data_type': 'uint16',
      },
    }
  },
};
