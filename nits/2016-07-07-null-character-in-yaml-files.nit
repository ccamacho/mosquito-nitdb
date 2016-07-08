
author: Carlos Camacho
title: "ControllerLoadBalancerDeployment_Step1 with errors"
related-bug: 
err: |
  deploy_stderr: exception: connect
  failed\nCould not retrieve fact='mongodb_is_master', resolution='<anonymous>':
  757: unexpected token at '2016-07-05T15:07:45.841+0000 warning:
  Failed to connect to 127.0.0.1:27017, reason: errno:111 Connection
  refused\n2016-07-05T15:07:45.842+0000 Error: couldn't connect to server
  127.0.0.1:27017 (127.0.0.1), connection attempt failed at
  src/mongo/shell/mongo.js:146'\n\u001b[1;31mError: Error from DataBinding 'hiera'
  while looking up 'tripleo::packages::enable_install': (<unknown>): found character
  that cannot start any token while scanning for the next token at line 210
  column 25 on node overcloud-controller-0.localdomain\nWrapped exception:\n(<unknown>):
  found character that cannot start any token while scanning for the next token at line
  210 column 25\nWrapped exception:\n(<unknown>): found character that cannot start any
  token while scanning for the next token at line 210 column 25\u001b[0m\n\u001b[1;31mError:
  Error from DataBinding 'hiera' while looking up 'tripleo::packages::enable_install': (<unknown>):
  found character that cannot start any token while scanning for the next token at line 210 column
  25 on node overcloud-controller-0.localdomain\u001b[0m\n"
sol: |
  In this case the deployment failed with a ControllerLoadBalancerDeployment_Step1 error.
  Check for tab chars in the yaml files also validate that all hiera calls are returning data.
  For example, if using zaqar::db::mysql::host: "%{hiera('mysql_virtual_ip')}" the host is empty might
  fail.
