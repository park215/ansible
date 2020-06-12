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

sleep 20

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

sleep 20

#LDAP
gcloud compute instances create ldap \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/LDAP.sh \
--private-network-ip=10.128.0.6

sleep 20

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

sleep 20

#nfs
gcloud compute instances create nfs2 \
--image-family centos-8 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/nfs.sh \
--private-network-ip=10.128.0.7

#sleeps for 5 minutes to allow the servers to boot before clients
sleep 2m

#ubuntu with ldap and nfs
gcloud compute instances create ubuntu-client \
--image-family ubuntu-1804-lts \
--image-project gce-uefi-images \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/ldap_client.sh \
--private-network-ip=10.128.0.10

#ubuntu with ldap and nfs
gcloud compute instances create ubuntu-client2 \
--image-family ubuntu-1804-lts \
--image-project gce-uefi-images \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/ldap_client.sh \
--private-network-ip=10.128.0.11

sleep 20

#nagios
gcloud compute instances create nagios \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/logsrv.sh \
--private-network-ip=10.128.15.5

sleep 20

#nagios
gcloud compute instances create cacti \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/logsrv.sh \
--private-network-ip=10.128.15.5
