Apply a label to all entities of a particular object type:

`kubectl label --all deployments labelName=labelValue`

Update a deployment's pod template such that all pods it starts are labeled:

`kubectl patch deployment myDeployment -p '{"spec": {"template": {"metadata": {"labels": {"labelName": "labelValue"}}}}}'`

Handy script to do this for you: [label-all-the-things.sh](./scripts/label-all-the-things.sh)

```
Usage: ./label-all-the-things.sh labelName=labelValue
```
