#!/bin/bash

#syslog
gcloud compute instances create rsyslog-server2 \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/logsrv.sh \
--private-network-ip=10.128.15.5

#postgres
gcloud compute instances create postgres2 \
--image-family centos-8 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/postgres.sh \
--private-network-ip=10.128.0.8

#LDAP
gcloud compute instances create ldap2 \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/LDAP.sh \
--private-network-ip=10.128.0.6

#django
gcloud compute instances create django2 \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/django.sh \
--private-network-ip=10.128.0.9

#nfs
gcloud compute instances create nfs2 \
--image-family centos-7 \
--image-project ubuntu-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/nfs.sh \
--private-network-ip=10.128.0.7

sleep 5m

#ubuntu with ldap and nfs
gcloud compute instances create ubuntu-client \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/ldap_client.sh \
--private-network-ip=10.128.0.10

#ubuntu with ldap and nfs
gcloud compute instances create ubuntu-client2 \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/ldap_client.sh \
--private-network-ip=10.128.0.11

