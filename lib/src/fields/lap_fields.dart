Map lap_fields = {
  254: {
    'field_name': 'message_index',
    'field_type': 'message_index',
    'unit': 's',
  },
  253: {
    'field_name': 'timestamp',
    'data_type': 'date_time',
  },
  0: {
    'field_name': 'event',
    'field_type': 'event',
  },
  1: {
    'field_name': 'event_type',
    'field_type': 'event_type',
  },
  2: {
    'field_name': 'start_time',
    'data_type': 'date_time',
  },
  3: {
    'field_name': 'start_position_lat',
    'data_type': 'sint32',
    'unit': 'semicircles',
  },
  4: {
    'field_name': 'start_position_long',
    'data_type': 'sint32',
    'unit': 'semicircles',
  },
  5: {
    'field_name': 'end_position_lat',
    'data_type': 'sint32',
    'unit': 'semicircles',
  },
  6: {
    'field_name': 'end_position_long',
    'data_type': 'sint32',
    'unit': 'semicircles',
  },
  7: {
    'field_name': 'total_elapsed_time',
    'data_type': 'uint32',
    'scale': 1000,
    'unit': 's',
  },
  8: {
    'field_name': 'total_timer_time',
    'data_type': 'uint32',
    'scale': 1000,
    'unit': 's',
  },
  9: {
    'field_name': 'total_distance',
    'data_type': 'uint32',
    'scale': 100,
    'unit': 'm',
  },
  10: {
    'field_name': 'total_cycles',
    'data_type': 'uint32',
    'unit': 'cycles',
    'reference_field_name': 'sport',
    'reference_field_value': {
      'running': {
        'field_name': 'total_strides',
        'data_type': 'uint32',
        'unit': 'strides',
      },
      'walking': {
        'field_name': 'total_strides',
        'data_type': 'uint32',
        'unit': 'strides',
      },
    },
  },
  11: {
    'field_name': 'total_calories',
    'data_type': 'uint16',
    'unit': 'kcal',
  },
  12: {
    'field_name': 'total_fat_calories',
    'data_type': 'uint16',
    'unit': 'kcal',
  },
  13: {
    'field_name': 'avg_speed',
    'data_type': 'uint16',
    'scale': 1000,
    'unit': 'm/s',
  },
  14: {
    'field_name': 'max_speed',
    'data_type': 'uint16',
    'scale': 1000,
    'unit': 'm/s',
  },
  15: {
    'field_name': 'avg_heart_rate',
    'data_type': 'uint8',
    'unit': 'bpm',
  },
  16: {
    'field_name': 'max_heart_rate',
    'data_type': 'uint8',
    'unit': 'bpm',
  },
  17: {
    'field_name': 'avg_cadence',
    'data_type': 'uint8',
    'unit': 'rpm',
    'reference_field_name': 'sport',
    'reference_field_value': {
      'running': {
        'field_name': 'avg_running_cadence',
        'data_type': 'uint8',
        'unit': 'strides/min',
      },
    },
  },
  18: {
    'field_name': 'max_cadence',
    'data_type': 'uint8',
    'unit': 'rpm',
    'reference_field_name': 'sport',
    'reference_field_value': {
      'running': {
        'field_name': 'max_running_cadence',
        'data_type': 'uint8',
        'unit': 'strides/min',
      },
    },
  },
  19: {
    'field_name': 'avg_power',
    'data_type': 'uint16',
    'unit': 'watts',
  },
  20: {
    'field_name': 'max_power',
    'data_type': 'uint16',
    'unit': 'watts',
  },
  21: {
    'field_name': 'total_ascent',
    'data_type': 'uint16',
    'unit': 'm',
  },
  22: {
    'field_name': 'total_descent',
    'data_type': 'uint16',
    'unit': 'm',
  },
  23: {
    'field_name': 'intensity',
    'field_type': 'intensity',
  },
  24: {
    'field_name': 'lap_trigger',
    'field_type': 'lap_trigger',
  },
  25: {
    'field_name': 'sport',
    'field_type': 'sport',
  },
  26: {
    'field_name': 'event_group',
    'data_type': 'uint8',
  },
  32: {
    'field_name': 'num_lengths',
    'data_type': 'uint16',
    'unit': 'lengths',
  },
  33: {
    'field_name': 'normalized_power',
    'data_type': 'uint16',
    'unit': 'watts',
  },
  34: {
    'field_name': 'left_right_balance',
    'field_type': 'left_right_balance_100',
  },
  35: {
    'field_name': 'first_length_index',
    'data_type': 'uint16',
  },
  37: {
    'field_name': 'avg_stroke_distance',
    'data_type': 'uint16',
    'scale': 100,
    'unit': 'm',
  },
  38: {
    'field_name': 'swim_stroke',
    'field_type': 'swim_stroke',
  },
  39: {
    'field_name': 'sub_sport',
    'field_type': 'sub_sport',
  },
  40: {
    'field_name': 'num_active_lengths',
    'data_type': 'uint16',
    'unit': 'lengths',
  },
  41: {
    'field_name': 'total_work',
    'data_type': 'uint32',
    'unit': 'J',
  },
  42: {
    'field_name': 'avg_altitude',
    'data_type': 'uint16',
    'scale': 5,
    'offset': 500,
    'unit': 'm',
  },
  43: {
    'field_name': 'max_altitude',
    'data_type': 'uint16',
    'scale': 5,
    'offset': 500,
    'unit': 'm',
  },
  44: {
    'field_name': 'gps_accuracy',
    'data_type': 'uint8',
    'unit': 'm',
  },
  45: {
    'field_name': 'avg_grade',
    'data_type': 'sint16',
    'scale': 100,
    'unit': '%',
  },
  46: {
    'field_name': 'avg_pos_grade',
    'data_type': 'sint16',
    'scale': 100,
    'unit': '%',
  },
  47: {
    'field_name': 'avg_neg_grade',
    'data_type': 'sint16',
    'scale': 100,
    'unit': '%',
  },
  48: {
    'field_name': 'max_pos_grade',
    'data_type': 'sint16',
    'scale': 100,
    'unit': '%',
  },
  49: {
    'field_name': 'max_neg_grade',
    'data_type': 'sint16',
    'scale': 100,
    'unit': '%',
  },
  50: {
    'field_name': 'avg_temperature',
    'data_type': 'sint8',
    'unit': 'C',
  },
  51: {
    'field_name': 'max_temperature',
    'data_type': 'sint8',
    'unit': 'C',
  },
  52: {
    'field_name': 'total_moving_time',
    'data_type': 'uint32',
    'scale': 1000,
    'unit': 's',
  },
  53: {
    'field_name': 'avg_pos_vertical_speed',
    'data_type': 'sint16',
    'scale': 1000,
    'unit': 'm/s',
  },
  54: {
    'field_name': 'avg_neg_vertical_speed',
    'data_type': 'sint16',
    'scale': 1000,
    'unit': 'm/s',
  },
  55: {
    'field_name': 'max_pos_vertical_speed',
    'data_type': 'sint16',
    'scale': 1000,
    'unit': 'm/s',
  },
  56: {
    'field_name': 'max_neg_vertical_speed',
    'data_type': 'sint16',
    'scale': 1000,
    'unit': 'm/s',
  },
  57: {
    'field_name': 'time_in_hr_zone',
    'data_type': 'uint32',
    'scale': 1000,
    'unit': 's',
  },
  58: {
    'field_name': 'time_in_speed_zone',
    'data_type': 'uint32',
    'scale': 1000,
    'unit': 's',
  },
  59: {
    'field_name': 'time_in_cadence_zone',
    'data_type': 'uint32',
    'scale': 1000,
    'unit': 's',
  },
  60: {
    'field_name': 'time_in_power_zone',
    'data_type': 'uint32',
    'scale': 1000,
    'unit': 's',
  },
  61: {
    'field_name': 'repetition_num',
    'data_type': 'uint16',
  },
  62: {
    'field_name': 'min_altitude',
    'data_type': 'uint16',
    'scale': 5,
    'offset': 500,
    'unit': 'm',
  },
  63: {
    'field_name': 'min_heart_rate',
    'data_type': 'uint8',
    'unit': 'bpm',
  },
  71: {
    'field_name': 'wkt_step_index',
    'field_type': 'message_index',
  },
  74: {
    'field_name': 'opponent_score',
    'data_type': 'uint16',
  },
  75: {
    'field_name': 'stroke_count',
    'data_type': 'uint16',
    'unit': 'counts',
  },
  76: {
    'field_name': 'zone_count',
    'data_type': 'uint16',
    'unit': 'counts',
  },
  77: {
    'field_name': 'avg_vertical_oscillation',
    'data_type': 'uint16',
    'scale': 10,
    'unit': 'mm',
  },
  78: {
    'field_name': 'avg_stance_time_percent',
    'data_type': 'uint16',
    'scale': 100,
    'unit': '%',
  },
  79: {
    'field_name': 'avg_stance_time',
    'data_type': 'uint16',
    'scale': 10,
    'unit': 'ms',
  },
  80: {
    'field_name': 'avg_fractional_cadence',
    'data_type': 'uint8',
    'scale': 128,
    'unit': 'rpm',
  },
  81: {
    'field_name': 'max_fractional_cadence',
    'data_type': 'uint8',
    'scale': 128,
    'unit': 'rpm',
  },
  82: {
    'field_name': 'total_fractional_cycles',
    'data_type': 'uint8',
    'scale': 128,
    'unit': 'cycles',
  },
  83: {
    'field_name': 'player_score',
    'data_type': 'uint16',
  },
  84: {
    'field_name': 'avg_total_hemoglobin_conc',
    'data_type': 'uint16',
    'scale': 100,
    'unit': 'g/dL',
  },
  85: {
    'field_name': 'min_total_hemoglobin_conc',
    'data_type': 'uint16',
    'scale': 100,
    'unit': 'g/dL',
  },
  86: {
    'field_name': 'max_total_hemoglobin_conc',
    'data_type': 'uint16',
    'scale': 100,
    'unit': 'g/dL',
  },
  87: {
    'field_name': 'avg_saturated_hemoglobin_percent',
    'data_type': 'uint16',
    'scale': 10,
    'unit': '%',
  },
  88: {
    'field_name': 'min_saturated_hemoglobin_percent',
    'data_type': 'uint16',
    'scale': 10,
    'unit': '%',
  },
  89: {
    'field_name': 'max_saturated_hemoglobin_percent',
    'data_type': 'uint16',
    'scale': 10,
    'unit': '%',
  },
  91: {
    'field_name': 'avg_left_torque_effectiveness',
    'data_type': 'uint8',
    'scale': 2,
    'unit': '%',
  },
  92: {
    'field_name': 'avg_right_torque_effectiveness',
    'data_type': 'uint8',
    'scale': 2,
    'unit': '%',
  },
  93: {
    'field_name': 'avg_left_pedal_smoothness',
    'data_type': 'uint8',
    'scale': 2,
    'unit': '%',
  },
  94: {
    'field_name': 'avg_right_pedal_smoothness',
    'data_type': 'uint8',
    'scale': 2,
    'unit': '%',
  },
  95: {
    'field_name': 'avg_combined_pedal_smoothness',
    'data_type': 'uint8',
    'scale': 2,
    'unit': '%',
  },
  98: {
    'field_name': 'time_standing',
    'data_type': 'uint32',
    'scale': 1000,
    'unit': 's',
  },
  99: {
    'field_name': 'stand_count',
    'data_type': 'uint16',
  },
  100: {
    'field_name': 'avg_left_pco',
    'data_type': 'sint8',
    'unit': 'mm',
  },
  101: {
    'field_name': 'avg_right_pco',
    'data_type': 'sint8',
    'unit': 'mm',
  },
  102: {
    'field_name': 'avg_left_power_phase',
    'data_type': 'uint8',
    'scale': 0.7111111,
    'unit': 'degrees',
  },
  103: {
    'field_name': 'avg_left_power_phase_peak',
    'data_type': 'uint8',
    'scale': 0.7111111,
    'unit': 'degrees',
  },
  104: {
    'field_name': 'avg_right_power_phase',
    'data_type': 'uint8',
    'scale': 0.7111111,
    'unit': 'degrees',
  },
  105: {
    'field_name': 'avg_right_power_phase_peak',
    'data_type': 'uint8',
    'scale': 0.7111111,
    'unit': 'degrees',
  },
  106: {
    'field_name': 'avg_power_position',
    'data_type': 'uint16',
    'unit': 'watts',
  },
  107: {
    'field_name': 'max_power_position',
    'data_type': 'uint16',
    'unit': 'watts',
  },
  108: {
    'field_name': 'avg_cadence_position',
    'data_type': 'uint8',
    'unit': 'rpm',
  },
  109: {
    'field_name': 'max_cadence_position',
    'data_type': 'uint8',
    'unit': 'rpm',
  },
  110: {
    'field_name': 'enhanced_avg_speed',
    'data_type': 'uint32',
    'scale': 1000,
    'unit': 'm/s',
  },
  111: {
    'field_name': 'enhanced_max_speed',
    'data_type': 'uint32',
    'scale': 1000,
    'unit': 'm/s',
  },
  112: {
    'field_name': 'enhanced_avg_altitude',
    'data_type': 'uint32',
    'scale': 5,
    'offset': 500,
    'unit': 'm',
  },
  113: {
    'field_name': 'enhanced_min_altitude',
    'data_type': 'uint32',
    'scale': 5,
    'offset': 500,
    'unit': 'm',
  },
  114: {
    'field_name': 'enhanced_max_altitude',
    'data_type': 'uint32',
    'scale': 5,
    'offset': 500,
    'unit': 'm',
  },
  115: {
    'field_name': 'avg_lev_motor_power',
    'data_type': 'uint16',
    'unit': 'watts',
  },
  116: {
    'field_name': 'max_lev_motor_power',
    'data_type': 'uint16',
    'unit': 'watts',
  },
  117: {
    'field_name': 'lev_battery_consumption',
    'data_type': 'uint8',
    'scale': 2,
    'unit': '%',
  },
  118: {
    'field_name': 'avg_vertical_ratio',
    'data_type': 'uint16',
    'scale': 100,
    'unit': '%',
  },
  119: {
    'field_name': 'avg_stance_time_balance',
    'data_type': 'uint16',
    'scale': 100,
    'unit': '%',
  },
  120: {
    'field_name': 'avg_step_length',
    'data_type': 'uint16',
    'scale': 10,
    'unit': 'mm',
  },
  121: {
    'field_name': 'avg_vam',
    'data_type': 'uint16',
    'scale': 1000,
    'unit': 'm/s',
  },
};