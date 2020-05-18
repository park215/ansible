#LDAP
gcloud compute instances create ldap \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/LDAP.sh \
--private-network-ip=10.128.0.9
