#!/bin/bash  
#SBATCH -J=estimate_hardness  
#SBATCH -o slurm_output/out/Hardness-%j.out 
#SBATCH -e slurm_output/err/Hardness-%j.out 
#SBATCH --time=24:00:00
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1  
  
# Load any necessary modules or activate your environment  
# module load cuda
export CUDA_HOME=/local/projects/cuda12/cuda12.2.2
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

echo $CUDA_HOME
source env/bin/activate

MODEL_DIR="${SLURM_TMPDIR:-$PWD/tmp}/model"
CACHE_DIR="${SLURM_TMPDIR:-$PWD/tmp}/cache"
mkdir -p "$MODEL_DIR" "$CACHE_DIR"
  
# Run the estimate_hardness command  
python run_jobs.py -e estimate_hardness --dataset ai2_arc --model_dir $MODEL_DIR --cache_dir $CACHE_DIR