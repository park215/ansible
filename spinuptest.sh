#django
gcloud compute instances create django \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/sxs924/NTI-310/django.sh \
--private-network-ip=10.128.0.9
