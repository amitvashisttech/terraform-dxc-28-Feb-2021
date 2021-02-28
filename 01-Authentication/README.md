# Authentcation with Azure 

## Create a Service Principal on Subscription Level 
```
az ad sp create-for-rbac -n "Terraform-Demo" --role="Contributor" --scopes="/subscriptions/<id>"
```

## Create a Service Principal on Resource Group Level 
```
az ad sp create-for-rbac -n "Terraform-Demo" --role="Contributor" --scopes="/subscriptions/<id>/resourcegroups/<id>"
```
## Please make note of your credentions.
```
{
  "appId": "XXXXYXYXYXYXYXYXYYXYXYX",
  "displayName": "Terraform-Demo",
  "name": "http://Terraform-Demo",
  "password": "XXXXYXYXYXYXYXYXYYXYXYX",
  "tenant": "XXXXYXYXYXYXYXYXYYXYXYX"
}
``` 
