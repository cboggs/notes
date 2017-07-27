#!/bin/bash

label_full=${1}
read label_name label_value <<< $(echo ${1} | awk -F '=' '{ print $1 " " $2 }')

for i in $(kubectl get all --all-namespaces | grep -v NAMESPACE | awk '{ print $1 ":" $2 }');
do
  read ns obj <<<$(echo ${i} | awk -F ':' '{ print $1 " " $2 }')

  kubectl label --overwrite --namespace=${ns} ${obj} ${full_label}
done

for i in $(kubectl get deployment --all-namespaces | grep -v NAMESPACE | awk '{ print $1 ":" $2 }');
do
  read ns obj <<<$(echo ${i} | awk -F ':' '{ print $1 " " $2 }')

  kubectl patch deployment --namespace=${ns} ${obj} -p '{"spec": {"template": {"metadata": {"labels": {"'${label_name}'": "'${label_value}'"}}}}}'
done
