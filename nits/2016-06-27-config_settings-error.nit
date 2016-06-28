author: Carlos Camacho
title: "Error deploying the overcloud with a config_settings issue"
related-bug:
err: |
  map_merge:
    - get_attr: [CeilometerServiceBase, role_data, config_settings]
    - ceilometer::agent::central::manage_service: false
    - ceilometer::agent::central::enabled: false
    - ceilometer::agent::central::ha: false
sol: |
  map_merge:
    - get_attr: [CeilometerServiceBase, role_data, config_settings]
    - ceilometer::agent::central::manage_service: false
      ceilometer::agent::central::enabled: false
      ceilometer::agent::central::ha: false
