#!/bin/bash

#syslog
gcloud compute instances create rsyslog-server2 \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/logsrv.sh \
--private-network-ip=10.128.15.5

#LDAP
gcloud compute instances create ldap2 \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/LDAP.sh \
--private-network-ip=10.128.0.6

#django
gcloud compute instances create django2 \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/django.sh \
--private-network-ip=10.128.0.6

#postgres
gcloud compute instances create postgres2 \
--image-family centos-8 \
--image-project centos-cloud \
--zone us-central-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/postgres.sh \
--private-network-ip=10.128.0.7

#nsf
gcloud compute instances create nsf2 \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/nsf.sh \
--private-network-ip=10.128.0.8



