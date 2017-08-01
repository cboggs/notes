# Cheat Sheet

## Get all series (including all label sets)
```
curl -g -s 'http://p8s-host:9090/api/v1/series?match[]={__name__!=""}'
```

## Pretty-print all series that contain label _name_ "foo"
```
curl -g -s 'http://p8s-host:9090/api/v1/series?match[]={__name__!=""}' | jq '.data[] | select(.deployment != null) | .'
```
