#!/bin/bash
#BSUB -P GEN186
#BSUB -W 00:10
#BSUB -nnodes 1
#BSUB -J AthenaPK

module load cuda/11.4.2  gcc  cmake/3.22.2 python hdf5
#module load cuda/11.5.2 gcc cmake python hdf5
module -t list
#smpiargs='gpu' //default
jsrun -n 1 -g 6 -c 42 -r 1 -d packed -b packed:7 --smpiargs='-gpu' \
     /gpfs/wolf/stf016/scratch/e4j/winter-classic23/athenapk/build/bin/athenaPK \
     -i /gpfs/wolf/stf016/scratch/e4j/winter-classic23/athenapk/inputs/blast_image.in \
     problem/blast/input_image=/gpfs/wolf/stf016/scratch/e4j/winter-classic23/athenapk/inputs/parthenon_athena.pbm  \
     problem/blast/pressure_ratio=1000 \
     parthenon/time/nlim=50 \
     parthenon/mesh/numlevel=5 \
     parthenon/mesh/nx1=32 parthenon/mesh/nx2=48 parthenon/mesh/nx3=1 \
     parthenon/meshblock/nx1=4 parthenon/meshblock/nx2=4 parthenon/meshblock/nx3=1 \
     parthenon/output0/dt=0.05


#jsrun -n 1 -g 6 -c 42 -r 1 -d packed -b packed:7 --smpiargs='-gpu' \
#     /gpfs/wolf/stf016/scratch/e4j/winter-classic23/athenapk/build/bin/athenaPK \
#     -i /gpfs/wolf/stf016/scratch/e4j/winter-classic23/athenapk/inputs/blast_image.in \
#     problem/blast/input_image=/gpfs/wolf/stf016/scratch/e4j/winter-classic23/athenapk/inputs/image.pbm      #parthenon_athena.pbm #original image
