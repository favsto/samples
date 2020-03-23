# Manage custom types

## Choose the service type

https://content.googleapis.com/discovery/v1/apis/


```bash
$PROJECT_ID=<your project>
gcloud beta deployment-manager type-providers create servicenetworking \
       --descriptor-url='https://servicenetworking.googleapis.com/$discovery/rest?version=v1'
```