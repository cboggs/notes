# Cheat Sheet

## Get all series (including all label sets)
```
curl -g -s 'http://p8s-host:9090/api/v1/series?match[]={__name__!=""}'
```

## Pretty-print all series that contain label _name_ "foo", filtered by Prometheus
```
curl -g -s 'http://p8s-host:9090/api/v1/series?match[]={foo!=""}' | jq '.'
```
