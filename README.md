# cirrus-sample
this repo is to illustrate the general process to deploy an python application to cirrus platform


1. Create the Dockerfile in the repository  
2. Create the docker image in your local machine, using the following command:   
```
docker build -t cirrus-sample:latest .

```
1. Run your docker image in your local machine   
```
docker run -it -p 5000:5000 -e TEST=ODMUAT cirrus-sample
```

1. Open your web browser, and input the url https://localhost:5000  and https://localhost:5000/test to test the 2 endpoints.   

1. Now, your image is ready to be deployed to Cirrus platform. Open the following link to open Cirrus.   
```
https://brokered.ciocloudservices.ibm.com/projects
```
1. commit all your change to git and then push it to github.
1. Create a project. For the testing purpose, you can choose type as "trial 30 days" . 
1. Create the pipeline: 
   +  select "GitHub Enterprise integrated (Source-to-Image or Dockerfile)"
   +  select Runtime as "Dockerfile"
   +  select repo as "https://github.ibm.com/odm-odmr/cirrus-sample"
   +  select the branch name. In our example, we just select the "master" branch.

1. Once pipeline is created, the cirrus will start to pull the code from the master branch, check the Dockerfile and then start to build the docker image in Cirrus side. 

1. after a few minutes, you will see the docker image is build successfully in Cirrus. 
1. Now, let start to create the application based on the image we created. 
  + select "application" tab, 
  + select "new application"
  + select "non-production"
  + select the pipeline. 
  + select a target
  + leave EAL, and autodeploy as it is. 
  + runtime , container port input '5000'
  + replica, choose 1 is enough and choose the lowest menory tier
  + then , click "deploy" button
  + after a few minutes, you can see the application is deployed. Go to the "External Route", edit it to give a host name
  + click the link to test the application works. 

