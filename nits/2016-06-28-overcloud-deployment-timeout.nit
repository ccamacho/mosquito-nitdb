author: Carlos Camacho
title: "Deployment timeout"
related-bug: 
err: |
  [ComputeOvercloudServicesDeployment_Step4]: CREATE_FAILED CREATE aborted
  [overcloud-ComputeNodesPostDeployment-yujqhn242rji]: CREATE_FAILED Create timed out
sol: |
  In this case the deployment failed with a timeout error. This error
  ocurred in step4, so from your current deployment, check (depending if deployed ha or non-ha)
  the puppet-tripleo changes that affects step4.
