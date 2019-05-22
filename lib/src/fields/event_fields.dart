Map event_fields = {
  253: {
    'field_name': 'timestamp',
    'data_type': 'date_time',
    'units': 's',
  },
  0: {
    'field_name': 'event',
    'field_type': 'event',
    'units': 'watts',
  },
  1: {
    'field_name': 'event_type',
    'field_type': 'event_type',
  },
  2: {
    'field_name': 'data16',
    'data_type': 'uint16',
  },
  3: {
    'field_name': 'data',
    'data_type': 'uint32',
    'reference_field_name': 'event',
    'reference_field_value': {
      'timer': {
        'field_name': 'timer_trigger',
        'field_type': 'timer_trigger',
      },
      'course_point': {
        'field_name': 'course_point_index',
        'field_type': 'message_index',
      },
      'battery': {
        'field_name': 'battery_level',
        'data_type': 'uint16',
        'scale': 1000,
        'units': 'V',
      },
      'virtual_partner_pace': {
        'field_name': 'virtual_partner_speed',
        'data_type': 'uint16',
        'scale': 1000,
        'units': 'm/s',
      },
      'hr_high_alert': {
        'field_name': 'hr_high_alert',
        'data_type': 'uint8',
        'units': 'bpm',
      },
      'hr_low_alert': {
        'field_name': 'hr_low_alert',
        'data_type': 'uint8',
        'units': 'bpm',
      },
      'speed_high_alert': {
        'field_name': 'speed_high_alert',
        'data_type': 'uint32',
        'scale': 1000,
        'units': 'm/s',
      },
      'speed_low_alert': {
        'field_name': 'speed_low_alert',
        'data_type': 'uint32',
        'scale': 1000,
        'units': 'm/s',
      },
      'cad_high_alert': {
        'field_name': 'cad_high_alert',
        'data_type': 'uint16',
        'units': 'rpm',
      },
      'cad_low_alert': {
        'field_name': 'cad_low_alert',
        'data_type': 'uint16',
        'units': 'rpm',
      },
      'power_high_alert': {
        'field_name': 'power_high_alert',
        'data_type': 'uint16',
        'units': 'watts',
      },
      'power_low_alert': {
        'field_name': 'power_low_alert',
        'data_type': 'uint16',
        'units': 'watts',
      },
      'time_duration_alert': {
        'field_name': 'time_duration_alert',
        'data_type': 'uint32',
        'scale': 1000,
        'units': 's',
      },
      'distance_duration_alert': {
        'field_name': 'distance_duration_alert',
        'data_type': 'uint32',
        'scale': 1000,
        'units': 'm',
      },
      'calorie_duration_alert': {
        'field_name': 'calorie_duration_alert',
        'data_type': 'uint32',
        'units': 'calories',
      },
      'fitness_equipment': {
        'field_name': 'fitness_equipment_state',
        'field_type': 'fitness_equipment_state',
      },
      'sport_point': {
        'field_name': 'sport_point',
        'data_type': 'uint32',
        'components': [
          {
            'score': {
              'bits': 16,
            }
          },
          {
            'opponent_score': {
              'bits': 16,
            }
          },
        ]
      },
      'front_gear_change': {
        'field_name': 'gear_change_data',
        'data_type': 'uint32',
        'components': [
          {
            'rear_gear_num': {
              'bits': 8,
            }
          },
          {
            'rear_gear': {
              'bits': 8,
            }
          },
          {
            'front_gear_num': {
              'bits': 8,
            }
          },
          {
            'front_gear': {
              'bits': 8,
            }
          },
        ],
      },
      'rear_gear_change': {
        'field_name': 'gear_change_data',
        'data_type': 'uint32',
        'components': [
          {
            'rear_gear_num': {
              'bits': 8,
            }
          },
          {
            'rear_gear': {
              'bits': 8,
            }
          },
          {
            'front_gear_num': {
              'bits': 8,
            }
          },
          {
            'front_gear': {
              'bits': 8,
            }
          },
        ],
      },
      'rider_position_change': {
        'field_name': 'rider_position',
        'field_type': 'rider_position_type',
      },
      'comm_timeout': {
        'field_name': 'comm_timeout',
        'field_type': 'comm_timeout_type',
      },
    },
  },
  4: {
    'field_name': 'event_group',
    'data_type': 'uint8',
  },
  7: {
    'field_name': 'score',
    'data_type': 'uint16',
  },
  8: {
    'field_name': 'opponent_score',
    'data_type': 'uint16',
  },
  9: {
    'field_name': 'front_gear_num',
    'data_type': 'uint8z',
  },
  10: {
    'field_name': 'front_gear',
    'data_type': 'uint8z',
  },
  11: {
    'field_name': 'rear_gear_num',
    'data_type': 'uint8z',
  },
  12: {
    'field_name': 'rear_gear',
    'data_type': 'uint8z',
  },
  13: {
    'field_name': 'device_index',
    'field_type': 'device_index',
  },
};
