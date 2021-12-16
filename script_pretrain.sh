#!/bin/bash
#SBATCH --partition=gpu4_medium,gpu4_long
#SBATCH --job-name=baseline
#SBATCH --mem-per-cpu=8G
#SBATCH --time=0-24:00:00
#SBATCH --nodes=1
#SBATCH --gres=gpu:1


module purge
#module load anaconda3/gpu/5.2.0
#source /gpfs/share/apps/anaconda3/gpu/5.2.0/etc/profile.d/conda.sh
#conda activate /gpfs/data/yuanlab/projects/VS_Proj20/conda_cc7027
#export PYTHONPATH=/gpfs/data/yuanlab/projects/VS_Proj20/notebooks_capstone:/gpfs/data/yuanlab/projects/VS_Proj20/conda_cc7027/lib/python3.9/site-packages/
#export LD_LIBRARY_PATH=/gpfs/data/yuanlab/projects/VS_Proj20/conda_cc7027/lib:$LD_LIBRARY_PATH
#export CPATH=/gpfs/data/yuanlab/projects/VS_Proj20/conda_cc7027/include
#source /gpfs/data/yuanlab/projects/VS_Proj20/env_cc7027/bin/activate
#export PYTHONPATH="/gpfs/data/yuanlab/projects/VS_Proj20/env_cc7027/lib/python3.6/site-packages":/gpfs/data/yuanlab/projects/VS_Proj20/notebooks_capstone:"${PYTHONPATH}"
module load condaenvs/gpu/machinelearning
export PYTHONPATH=/gpfs/data/yuanlab/projects/VS_Proj20/notebooks_capstone:$PYTHONPATH
python ./3DUnetCNN/unet3d/scripts/train.py --config_filename ./VS_config.json --model_filename ./model/VS_hausdorff_pre.h5 --training_log_filename VS_hausdorff_pre_log.csv --nthreads 1 --ngpus 1 --fit_gpu_mem 8
