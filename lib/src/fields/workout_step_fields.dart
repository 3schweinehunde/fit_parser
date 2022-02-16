Map workoutStepFields = {
  254: {
    'field_name': 'message_index',
    'field_type': 'message_index',
  },
  0: {
    'field_name': 'wkt_step_name',
    'data_type': 'string',
  },
  1: {
    'field_name': 'duration_type',
    'field_type': 'wkt_step_duration',
  },
  2: {
    'field_name': 'duration_value',
    'data_type': 'uint32',
    'reference_field_name': 'duration_type',
    'reference_field_value': {
      'time': {
        'field_name': 'duration_time',
        'data_type': 'uint32',
        'scale': 1000,
        'units': 's',
      },
      'repetition_time': {
        'field_name': 'duration_time',
        'data_type': 'uint32',
        'scale': 1000,
        'units': 's',
      },
      'distance': {
        'field_name': 'duration_distance',
        'data_type': 'uint32',
        'scale': 100,
        'units': 'm',
      },
      'hr_less_than': {
        'field_name': 'duration_hr',
        'field_type': 'workout_hr',
        'units': '% or bpm',
      },
      'hr_greater_than': {
        'field_name': 'duration_hr',
        'field_type': 'workout_hr',
        'units': '% or bpm',
      },
      'calories': {
        'field_name': 'duration_calories',
        'data_type': 'uint32',
        'units': 'calories',
      },
      'repeat_until_steps_cmplt': {
        'field_name': 'duration_step',
        'data_type': 'uint32',
      },
      'repeat_until_time': {
        'field_name': 'duration_step',
        'data_type': 'uint32',
      },
      'repeat_until_distance': {
        'field_name': 'duration_step',
        'data_type': 'uint32',
      },
      'repeat_until_calories': {
        'field_name': 'duration_step',
        'data_type': 'uint32',
      },
      'repeat_until_hr_less_than': {
        'field_name': 'duration_step',
        'data_type': 'uint32',
      },
      'repeat_until_hr_greater_than': {
        'field_name': 'duration_step',
        'data_type': 'uint32',
      },
      'repeat_until_power_less_than': {
        'field_name': 'duration_step',
        'data_type': 'uint32',
      },
      'repeat_until_power_greater_than': {
        'field_name': 'duration_step',
        'data_type': 'uint32',
      },
      'power_less_than': {
        'field_name': 'duration_power',
        'field_type': 'workout_power',
        'units': '% or watts',
      },
      'power_greater_than': {
        'field_name': 'duration_power',
        'field_type': 'workout_power',
        'units': '% or watts',
      },
      'reps': {
        'field_name': 'duration_reps',
        'data_type': 'uint32',
      },
    },
  },
  3: {
    'field_name': 'target_type',
    'field_type': 'wkt_step_target',
  },
  4: {
    'field_name': 'target_value',
    'data_type': 'uint32',
    'reference_field_name': {
      'target_type': {
        'reference_field_value': {
          'speed': {
            'field_name': 'target_speed_zone',
            'data_type': 'uint32',
          },
          'heart_rate': {
            'field_name': 'target_hr_zone',
            'data_type': 'uint32',
          },
          'cadence': {
            'field_name': 'target_cadence_zone',
            'data_type': 'uint32',
          },
          'power': {
            'field_name': 'target_power_zone',
            'data_type': 'uint32',
          },
        },
      },
      'swim_stroke': {
        'field_name': 'target_stroke_type',
        'field_type': 'swim_stroke',
      },
      'duration_type': {
        'reference_field_value': {
          'repeat_until_steps_cmplt': {
            'field_name': 'repeat_steps',
            'data_type': 'uint32',
          },
          'repeat_until_time': {
            'field_name': 'repeat_time',
            'data_type': 'uint32',
            'scale': 1000,
            'units': 's',
          },
          'repeat_until_distance': {
            'field_name': 'repeat_distance',
            'data_type': 'uint32',
            'scale': 100,
            'units': 'm',
          },
          'repeat_until_calories': {
            'field_name': 'repeat_calories',
            'data_type': 'uint32',
            'units': 'calories',
          },
          'repeat_until_hr_less_than': {
            'field_name': 'repeat_hr',
            'data_type': 'workout_hr',
            'units': '% or bpm',
          },
          'repeat_until_hr_greater_than': {
            'field_name': 'repeat_hr',
            'data_type': 'workout_hr',
            'units': '% or bpm',
          },
          'repeat_until_power_less_than': {
            'field_name': 'repeat_power',
            'field_type': 'workout_power',
            'units': '% or watts',
          },
          'repeat_until_power_greater_than': {
            'field_name': 'repeat_power',
            'field_type': 'workout_power',
            'units': '% or watts',
          },
        },
      },
    },
  },
  5: {
    'field_name': 'custom_target_value_low',
    'data_type': 'uint32',
    'reference_field_name': 'target_type',
    'reference_field_value': {
      'speed': {
        'field_name': 'custom_target_speed_low',
        'data_type': 'uint32',
        'scale': 1000,
        'units': 'm/s',
      },
      'heart_rate': {
        'field_name': 'custom_target_heart_rate_low',
        'field_type': 'workout_hr',
        'units': '% or bpm',
      },
      'cadence': {
        'field_name': 'custom_target_cadence_low',
        'data_type': 'uint32',
        'units': 'rpm',
      },
      'power': {
        'field_name': 'custom_target_power_low',
        'field_type': 'workout_power',
        'units': '% or watts',
      },
    },
  },
  6: {
    'field_name': 'custom_target_value_high',
    'data_type': 'uint32',
    'reference_field_name': 'target_type',
    'reference_field_value': {
      'speed': {
        'field_name': 'custom_target_speed_high',
        'data_type': 'uint32',
        'scale': 1000,
        'units': 'm/s',
      },
      'heart_rate': {
        'field_name': 'custom_target_heart_rate_high',
        'field_type': 'workout_hr',
        'units': '% or bpm',
      },
      'cadence': {
        'field_name': 'custom_target_cadence_high',
        'data_type': 'uint32',
        'units': 'rpm',
      },
      'power': {
        'field_name': 'custom_target_power_high',
        'field_type': 'workout_power',
        'units': '% or watts',
      },
    },
  },
  7: {
    'field_name': 'intensity',
    'field_type': 'intensity',
  },
  8: {
    'field_name': 'notes',
    'data_type': 'string',
  },
  9: {
    'field_name': 'equipment',
    'field_type': 'workout_equipment',
  },
  10: {
    'field_name': 'exercise_category',
    'field_type': 'exercise_category',
  },
  11: {
    'field_name': 'exercise_name',
    'data_type': 'uint16',
  },
  12: {
    'field_name': 'exercise_weight',
    'data_type': 'uint16',
    'scale': 100,
    'units': 'kg',
  },
  13: {
    'field_name': 'weight_display_unit',
    'field_type': 'fit_base_unit',
  },
};
