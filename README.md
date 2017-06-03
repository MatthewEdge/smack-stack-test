# smack-stack-test

Exploration of the SMACK stack + Ansible for provisioning

Heavily inspired by: https://github.com/ftrossbach/intro-to-dcos

## Environment variables

Export
- SMACK_TEST_AWS_REGION, e.g. with "eu-central-1"
- SMACK_TEST_AWS_ACCESS_KEY, your AWS access key
- SMACK_TEST_AWS_SECRET_KEY, your AWS secret key

## Setup 

Ansible provides SMACK Stack setup on AWS instances:

* Master instance sits on a `t2.large` instance
* Slave instances sit on `t2.medium` instances

Note: these values are configurable in `provisioning/roles/cloudformation/files/dcos-template` (DC/OS CloudFormation template)

(http://<MASTER_LOAD_BALANCER_IP>/marathon) should eventually show all apps are running and healthy

- MASTER_LOAD_BALANCER_IP can be obtained from the AWS Dashboard

## SBT Build for App

```
cd app
sbt assembly
```

- Fat Jar will contain both Spark job and ingestion job. You would not have this normally, this is a simplification for the sake of the example

## Docker

SBT manages creating the Docker Container through the DockerPlugin:

`sbt docker`
