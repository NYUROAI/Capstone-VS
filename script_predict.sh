#!/bin/bash
#SBATCH --partition=gpu4_dev
#SBATCH --job-name=baseline
#SBATCH --mem-per-cpu=8G
#SBATCH --time=0-02:00:00
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
export PYTHONPATH=/gpfs/data/yuanlab/projects/VS_Proj20/src/notebooks_capstone:$PYTHONPATH
python ./3DUnetCNN/unet3d/scripts/predict.py --segment --output_directory ./predictions_censor --config_filename ./VS_config_auto.json --model_filename ./model/brats_pretrained_99.h5 --group test --subjects_config_filename ./VS_subject_censor.json --output_template "VS_TEST_{subject}.nii.gz" --output_prob_template "VS_TEST_prob_{subject}.nii.gz" --nthreads 1 --ngpus 1 
