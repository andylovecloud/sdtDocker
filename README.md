# Sample Web deployment

# If student trying to do the deployment in local computer, to test the Continous Deployment in Docker, they can do the following:

## 1. This GitHub Repo includes Docker file and sample HTML code 
Link: https://github.com/dipaish/sdtDocker 


## 2.You must have Docker installed in your local machine (Docker Desktop https://www.docker.com/ + Visual Studio Code )
## You will need a Docker file to build your image
## The Docker File specifies the configuration, dependencies, and requirements of your app. 
´´´
docker build  -t webapp .  #Remember to include the dot at the end (.)
´´´

## 3. To run your newly built Docker image locally
´´´
docker run -d -p 89:80 webapp
´´´
