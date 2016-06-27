nit:
  author: Carlos Camacho
  date: 2016-06-24
  title: This is a dummy nit title
  related-bug: https://bugs.launchpad.net/tripleo/+bug/1590755
  err: |
    Multiline nit error:
    map_merge:
      - get_attr: [CeilometerServiceBase, role_data, config_settings]
      - ceilometer::agent::central::manage_service: false
      - ceilometer::agent::central::enabled: false
      - ceilometer::agent::central::ha: false
  sol: |
    Multiline nit sol:
    map_merge:
      - get_attr: [CeilometerServiceBase, role_data, config_settings]
      - ceilometer::agent::central::manage_service: false
        ceilometer::agent::central::enabled: false
        ceilometer::agent::central::ha: false
