#!/bin/bash  
#SBATCH -J=estimate_hardness  
#SBATCH -o slurm_output/out/Hardness-%j.out #SBATCH -e slurm_output/error/Hardness-%j.out 
#SBATCH --time=24:00:00
#SBATCH --partition=gpus
#SBATCH --gres=gpu:2  
  
# Load any necessary modules or activate your environment  
# module load cuda ninja
# echo $CUDA_HOME
# source venv/bin/activate
  
# Run the estimate_hardness command  
python run_jobs.py -e estimate_hardness --dataset ai2_arc --model_dir $MODEL_DIR --cache_dir $CACHE_DIR