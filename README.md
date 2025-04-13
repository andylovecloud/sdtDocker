# Sample Web deployment from Docker image to Azure Cloud

## If student trying to test the Deployment in Docker (only), they can do the step 1 - 3 only:

## 1. This GitHub Repo includes Docker file and sample HTML code 
Link: https://github.com/dipaish/sdtDocker 


## 2.You must have Docker installed in your local machine (Docker Desktop https://www.docker.com/ + Visual Studio Code )
You will need a Docker file to build your image

The Docker File specifies the configuration, dependencies, and requirements of your app. 

```
docker build  -t webapp .  #Remember to include the dot at the end (.)
```

## 3. To run your newly built Docker image locally

```
docker run -d -p 89:80 webapp
```

## 4. Create the Container Registry in Azure cloud
You can create a Container Registry by using  Azure portal or the Azure CLI command.

![Screenshot 2025-04-13 at 21 19 10](https://github.com/user-attachments/assets/020dae57-5b33-4e18-af5b-cd14387205f3)

## 5. Create Token  along with a password lets you authenticate with the registry

![Screenshot 2025-04-13 at 21 21 08](https://github.com/user-attachments/assets/c6181865-82ec-48c4-b0ab-2be06a4213b3)

Click to the token and generate the **password**. The Docker login command will be there.

## 6. Log in to your Azure Container Registry from your local development machine

From local machine, use below command to access to Azure Container Registry:

```
docker login -u token1 -p StringOfYourToken YourAzureContainer.azurecr.io

```
<img width="796" alt="Screenshot 2025-04-13 at 21 26 01" src="https://github.com/user-attachments/assets/61ac5db4-feab-46cb-8178-5b9d87c32a21" />

You can use the command docker images to see your image in local machine.


## 7. Tag the image and Push the container image to the specified Azure Container Registry with the desired image name

- Tag the image

docker tag <IMAGE_ID> <NEW_IMAGE_NAME>:<NEW_TAG>

```
docker tag webapp YourAzureContainer.azurecr.io/webapp:v1
```

- Docker Push
<img width="819" alt="Screenshot 2025-04-13 at 21 32 10" src="https://github.com/user-attachments/assets/3cd924fc-110c-48fc-bd48-3f0739eb59ff" />


## 8. Verify the image pushed into your Respository

This is the Docker image for the sample web app which is now available in your registry for deployment to App Service.

<img width="819" alt="Screenshot 2025-04-13 at 21 32 10" src="https://github.com/user-attachments/assets/bcfb475e-2925-4f8a-bc06-1793055bfafd" />


## 9. Enable Docker Access
We will create Azure App Service to retrieve the image for the web app from a repository in Azure Container Registry.
- Before Creating Web App Azure Service, we will enable Docker Access to the Azure Container Registry
- In the Azure portal, click All resources.
- Select the container registry you created earlier to go to its Overview page.
- In the left menu pane, under Settings, select Access keys.
- Set the Admin user option to Enabled. This change saves automatically.

![Screenshot 2025-04-13 at 21 40 34](https://github.com/user-attachments/assets/5e6f123e-ac9d-4c50-aa07-f4b63d38294c)


## 10. Create a Web APP Service in Azure

![Screenshot 2025-04-13 at 21 38 20](https://github.com/user-attachments/assets/d3463449-27ae-4779-8b97-41fbafb76a41)

App Service is now hosting the app from your Docker image. Type the url of the App service, you should see a web page. :)

# Troubleshoot

If you found the error like below:

```
ERROR - no matching manifest for linux/amd64 in the manifest list entriesErr: 0, Message: no matching manifest for linux/amd64 in the manifest list entries
```
<img width="1162" alt="Screenshot 2025-04-13 at 21 13 20" src="https://github.com/user-attachments/assets/ba7db949-7056-48ea-88bc-888852ad3e91" />


This means your Docker image was built for a different architecture (like linux/arm64), but Azure App Service runs on linux/amd64 by default, then do the following:

### Rebuild your Docker image in your locally with the correct platform

```
docker buildx build --platform linux/amd64 -t YourAzure.azurecr.io/webapp:latest . (including the dot(.))
```

### Then push it again: 
```
docker push YourAzure.azurecr.io/webapp:latest
```

Then Rebuild the image for linux/amd64 using docker buildx.
