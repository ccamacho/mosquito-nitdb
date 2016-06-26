nit:
  author: Carlos Camacho
  date: 2016-06-24
  title: Hiera map error throws controllerservices error on overcloud deployment
  description: This is a test description
  related-bug:
  err: |
    In a heat template from tripleo-heat-templates, a map_merge common error is:
    map_merge:
      - get_attr: [CeilometerServiceBase, role_data, config_settings]
      - ceilometer::agent::central::manage_service: false
      - ceilometer::agent::central::enabled: false
      - ceilometer::agent::central::ha: false
  sol: |
    Remove the additionals '-' characters
    map_merge:
      - get_attr: [CeilometerServiceBase, role_data, config_settings]
      - ceilometer::agent::central::manage_service: false
        ceilometer::agent::central::enabled: false
        ceilometer::agent::central::ha: false
