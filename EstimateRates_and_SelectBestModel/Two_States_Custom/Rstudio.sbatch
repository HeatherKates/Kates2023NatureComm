#!/bin/bash
#SBATCH --job-name=rserver
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8gb
#SBATCH --time=08:00:00
#SBATCH --output=rserver_%j.log
#SBATCH --account=timgarrett
#SBATCH --qos=timgarrett

rm -rf ~/.local/share/rstudio
module load R
rserver
