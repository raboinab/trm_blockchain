# AWS ECS on EC2 using Terraform

This sample project is part of the "Cloud Computing on AWS" article series and represents a complete, production-grade 
setup of a container-based application on ECS on EC2. [You can find the related article with in-depth 
information about this project here](https://nexgeneerz.io/aws-computing-with-ecs-ec2-terraform/).

The demo project helps you to get a basic understanding of how ECS on EC2 works and what is possible with it. 

## Before you start

> **Warning**
> 
> You may incur costs by creating resources in AWS. Therefore, always remember to use the `make destroy` command at the end to remove all resources created during this tutorial.

Please check the requirements needed for this project before you start. 

Which would be:

- Make sure you have [Docker](http://docker.com) installed on your local machine and the Docker daemon is up and running
- Install an upt-to-date version of [Terraform](http://terraform.io) on your computer
- Install the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) on your machine
- Buy and setup a top level domain in your AWS account that you can use for this demonstration (This step will incur costs for you!)
- You will need an SSH public and private key 


## Getting started

All commands are available via Makefile. Before you start, you need to add some definitions to the config file.
Generate the config file:


This command will execute the following tasks:

- Initialize Terraform
- Run the `terraform plan` command and generates a local plan file
- Run the `terraform apply` command and provisions all the ECS on EC2 resources on AWS
- Build the application Docker image and push it to ECR (the AWS Container registry)

The first time you run the deploy command and all resources are created from scratch, it can take between 5-10 minutes to finish.
When the command has finished, it might take some more minutes until ECS starts the desired amount of tasks. As long as 
the `docker push` command did not run, ECS tries to start the tasks, but fails as no Docker image is available in the registry.

> **Warning**
> 
> You should not interrupt a running Terraform command to avoid a corrupt state file.

After the process has finished, check the ECS console in your AWS account to make sure the initial task deployment has 
been finished. The ECS console should look like this:

![ECS Console](docs/ecs-console.png)

You should now be able to see the running demo app under the domain you have configured, for example 
`dev.service.example.com` (replace `example.com` with your domain). The setup is using an HTTPS connection, even if you 
call `http://dev.service.example.com`, you are still being redirected to `https://dev.service.example.com`.

## Trigger new deployment


## Known limitations

### ECS Task deployment failing because of missing Docker image/manifest

For easier setup, the deployment of the ECR repository is not separate from the deployment of the rest of the infrastructure. Thus, we need to deploy a new task version before pushing the Docker image. For a period of a few minutes between task deployment and `docker push` of the new image, we may therefore see error messages in the deployment events of the ECS Console. However, once the new Docker image has been pushed, it will be used as desired after a few minutes.
