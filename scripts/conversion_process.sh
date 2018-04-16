#!/usr/bin/env bash




python src/inference.py --model new_mobilenet_thin
python3 -m tensorflow.python.tools.freeze_graph --input_graph=graph-tmp.pb  --output_graph=new_frozen.pb --input_checkpoint=/home/navarro/data/learningmodels_local/tensorflow/mobilepose/models/mobilenet_thin_batch:32_lr:0.001_gpus:4_368x368_/model-80000 --output_node_names="Openpose/concat_stage7"
python3 -m tensorflow.python.tools.optimize_for_inference  --input new_frozen.pb --output new_opt_frozen.pb --input_names=image  --output_names Openpose/concat_stage7

# cp new_opt_frozen.pb models/graph/new_mobilenet_thin