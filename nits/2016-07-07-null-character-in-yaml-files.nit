
author: Carlos Camacho
title: "ControllerLoadBalancerDeployment_Step1 with errors"
related-bug: 
err: |
  deploy_stderr: Error: Error from DataBinding 'hiera' while looking up
  'tripleo::packages::enable_install': (<unknown>): found character
  that cannot start any token while scanning for the next token at line 210
  column 25 on node overcloud-controller-0.localdomain\n Wrapped exception:\n(<unknown>):
  found character that cannot start any token while scanning for the next token at line
  210 column 25
sol: |
  In this case the deployment failed with a ControllerLoadBalancerDeployment_Step1 error.
  Check for tab chars in the yaml files also validate that all hiera calls are returning data.
  For example, if using zaqar::db::mysql::host: "%{hiera('mysql_virtual_ip')}" the host is empty might
  fail.
