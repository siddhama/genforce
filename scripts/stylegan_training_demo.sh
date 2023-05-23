#!/bin/bash

echo "=================================================="
echo "Please ensure you have installed the requirements!"

# Download data.
echo "Downloading data ..."
mkdir -p data/
wget -nv  \
     -O data/demo.zip --quiet

# Launch training.
echo "Launch training job with 1 GPU."
echo "=================================================="
PORT=6666 ./scripts/dist_train.sh 1 \
    configs/stylegan_demo.py \
    work_dirs/stylegan_demo
