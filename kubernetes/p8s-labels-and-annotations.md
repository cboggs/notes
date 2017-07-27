Apply a label to all entities of a particular object type:

`kubectl label --all deployments labelName=labelValue`

Update a deployment's pod template such that all pods it starts are labeled:

`kubectl patch deployment myDeployment -p '{"spec": {"template": {"metadata": {"labels": {"labelName": "labelValue"}}}}}'`
