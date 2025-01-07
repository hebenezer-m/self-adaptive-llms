#!/bin/bash

# Task Selection
TASK="ai2_arc" # Available options: mbpp, math, ai2_arc

# First Stage Inference: Classification Expert
# Set to 'None' if not using cls expert
CLS_EXPERT_PATH="None"

# Second Stage: Expert Models
# Replace these paths with your actual model paths
CODE_EXPERT_PATH="your_path_to_code_expert"
MATH_EXPERT_PATH="your_path_to_math_expert"
REASONING_EXPERT_PATH="your_path_to_reasoning_expert"

# Start evaluation!
python svd_reinforce_hydra.py \
    base_model@_global_=llama3i8b \
    task@_global_=$TASK \
    mode@_global_=eval \
    prompt_based_eval=True \
    experts_path_dict.code=$CODE_EXPERT_PATH \
    experts_path_dict.math=$MATH_EXPERT_PATH \
    experts_path_dict.reasoning=$REASONING_EXPERT_PATH \
    load_ckpt=$CLS_EXPERT_PATH