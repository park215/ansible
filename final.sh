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

#nfs
gcloud compute instances create nfs2 \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/nfs.sh \
--private-network-ip=10.128.0.7

#postgres
gcloud compute instances create postgres2 \
--image-family centos-8 \
--image-project centos-cloud \
--zone us-central-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/postgres.sh \
--private-network-ip=10.128.0.8


#django
gcloud compute instances create django2 \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/django.sh \
--private-network-ip=10.128.0.9

#ubuntu with ldap and nfs
gcloud compute instances create ubuntu-client \
--image-family ubuntu 18.04 \
--image-project centos-cloud \
--zone us-central-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/ldap_client.sh \
--private-network-ip=10.128.0.10

#ubuntu with ldap and nfs
gcloud compute instances create ubuntu-client2 \
--image-family ubuntu 18.04 \
--image-project centos-cloud \
--zone us-central-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/ldap_client.sh \
--private-network-ip=10.128.0.11

