#!/bin/sh
#SBATCH -J train #job name
#SBATCH --time=03-00:00:00    # Requested time (DD-HH:MM:SS), adjust based on your expected training time
#SBATCH -p gpu                # Queue/partition name for GPU nodes
#SBATCH -N 1                  # Number of nodes requested (1 node)
#SBATCH -n 1                  # Number of tasks (1 task per GPU is common for YOLO training)
#SBATCH --gres=gpu:p100:1     # Request 1 NVIDIA p100 GPU
#SBATCH --mem=10g #requesting 10GB of RAM total
#SBATCH --output=train.out
#SBATCH --error=train.err
#SBATCH --mail-type=ALL #email optitions
#SBATCH --mail-user=simon.minami@tufts.edu

module load anaconda/2021.11

source activate Pipeline

export CUBLAS_WORKSPACE_CONFIG=:4096:8

python kalicalib/train.py --config_file configs/train_sviewds.yml

conda deactivate