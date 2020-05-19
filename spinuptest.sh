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
