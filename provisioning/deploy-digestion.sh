#!/bin/bash

dcos spark run --submit-args='--class edge.smack-test.spark.TweetJob https://s3.eu-central-1.amazonaws.com/smack-test/smack-test.jar tweets node-0.cassandra.mesos 9042 broker-0.kafka.mesos:9092'