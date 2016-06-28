author: Carlos Camacho
title: [overcloud]: CREATE_FAILED Resource CREATE failed: The Referenced Attribute (ControllerServiceChain config_settings) is incorrect.
related-bug: https://bugs.launchpad.net/tripleo/+bug/1590755
err: |
  The puppet manifest gnocchi::db::database_connection: *gnocchi_dsn don't exist
sol: |
  Check when configuring parameters in the templates, that the puppet parameters actually exist.
