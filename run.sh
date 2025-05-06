#!/bin/bash  
#SBATCH -J=estimate_hardness  
#SBATCH -o slurm_output/out/Hardness-%j.out #SBATCH -e slurm_output/err/Hardness-%j.out 
#SBATCH --time=24:00:00
#SBATCH --partition=gpus
#SBATCH --gres=gpu:2  
  
# Load any necessary modules or activate your environment  
source /etc/profile.d/modules.sh
module load cuda ninja
echo $CUDA_HOME
source venv/bin/activate

MODEL_DIR="${SLURM_TMPDIR:-$PWD/tmp}/model"
CACHE_DIR="${SLURM_TMPDIR:-$PWD/tmp}/cache"
mkdir -p "$MODEL_DIR" "$CACHE_DIR"
  
# Run the estimate_hardness command  
python run_jobs.py -e estimate_hardness --dataset ai2_arc --model_dir $MODEL_DIR --cache_dir $CACHE_DIR