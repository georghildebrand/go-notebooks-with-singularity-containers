# --WIP--

# Using gophernotes via singularity

Running gophernotes notebooks with ipython as described under: https://github.com/gopherdata/gophernotes

# Setup

- clone or download this repo
- run 'make boostrap' on your local host
- run 'make setup' on your local host
- copy the kernel from the container image to your local home directory 'singularity exec $(IMAGE_FILE) /copy_kernel.sh'
- try out the notebook local 'make run_local' --> open browser and try to run go kernel

# requirements

- singularity installed: http://singularity.lbl.gov

# Setup on SLURM
Slurm is especially good for running experiments. So I want to share my procedure for running go on slurm as well.
Assuming you have singularity installed on you cluster this is quite easy.

- copy the created container image to your cluster/the nodes on the cluster
- copy the kernel files to your hosts or your shared home (see copy_kernel.sh)
- you should be able to do something like `sbatch <slurm parameters> --wrap="singularity run /container/image/path"`
- open the host on which the process is running in your browser
