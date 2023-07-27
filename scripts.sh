#!/bin/sh
#SBATCH -J obs_test
#SBATCH -N 1
#SBATCH --mem=0
#SBATCH -n 1
#SBATCH -c 4
#sbatch --gres=gpu:1
#SBATCH -p jepyc
#SBATCH -o %x.out
#SBATCH -e %x.err
#SBATCH -D /mnt/lustre/ibs/dscig/kdkyum/workdir/pydreamer-test

__conda_setup="$('/opt/olaf/anaconda3/2020.11/GNU/4.8/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
eval "$__conda_setup"
unset __conda_setup
conda activate pydreamer
export WANDB_MODE=offline
export PYTHONPATH='.'

python launch.py --configs defaults mpg