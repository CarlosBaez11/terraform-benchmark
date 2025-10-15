#!/bin/bash
EXPERIMENT=$1
DATASIZE=$2
BUCKET="cebaezc1-5615fae7e5b2bd6b"
SOURCE=s3://${BUCKET}/${EXPERIMENT}/generator
aws s3 cp  "./${EXPERIMENT}/main.py"  s3://${BUCKET}/scripts/${EXPERIMENT}/main.py
rm -rf ${EXPERIMENT}/infrastructure
mkdir -p ${EXPERIMENT}/infrastructure
cp -r ./infrastructure/ec2/. ${EXPERIMENT}/infrastructure/

cd "${EXPERIMENT}/infrastructure"

terraform init  -backend-config="key=${EXPERIMENT}/backend.tfstate"

terraform destroy -var="script_path=../../${EXPERIMENT}/user_data.sh"\
                -var="source_name=${SOURCE}"\
                -var="bucket_name=${BUCKET}"\
                -var="experiment_name=${EXPERIMENT}"\
                -var="data_size=${DATASIZE}"\
                -auto-approve 

# uv run $EXPERIMENT/main.py $SOURCE