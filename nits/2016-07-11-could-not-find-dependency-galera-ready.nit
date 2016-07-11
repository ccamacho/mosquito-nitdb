author: Carlos Camacho
title: "Could not find dependency Exec[galera-ready]"
related-bug: 
err: |
  Could not find dependency Exec[galera-ready] for
  Class[Gnocchi::Db::Mysql] at
  /etc/puppet/modules/tripleo/manifests/profile/pacemaker/gnocchi.pp:66
sol: |
  In this case the galera-ready (clustercheck) was executed on
  step 3 which was the same of the dbsync, and we can not guarantee
  about clustercheck being installed on the same node.
  The dbsync remains on step 3 and the clustercheck will be moved to step 5.
