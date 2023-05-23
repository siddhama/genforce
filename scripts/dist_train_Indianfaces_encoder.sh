#!/bin/bash

echo "=================================================="
echo "Please ensure you have installed the requirements!"

Download data.
echo "Downloading data ..."
mkdir -p data/
wget -nv  \
     -O data/cropped_images.zip --quiet

# Launch training.
echo "Launch training job with 1 GPU."
echo "=================================================="
PORT=6666 ./scripts/dist_train.sh 1 \
    configs/stylegan_Indianfaces_encoder_y.py \
    work_dirs/stylegan_Indianfaces_encoder     
# GPUS=$1
# CONFIG=$2
# WORK_DIR=$3
# PORT=${PORT:-29500}

# python -m torch.distributed.launch \
#        --nproc_per_node=8 \
#        --master_port=${PORT} \
#        ./train.py configs/stylegan_Indianfaces256.py \
#            --work_dir work_dirs/stylegan_Indianfaces_train \
#            --launcher="pytorch" \
#            ${@:4}
