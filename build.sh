git clone https://github.com/parthenon-hpc-lab/athenapk.git athenapk
cd athenapk
git checkout pgrete/update-blast
git submodule init
git submodule update

module load cuda/11.4.2  gcc  cmake/3.22.2 python hdf5
module -t list

cmake -DMACHINE_CFG=./external/parthenon/cmake/machinecfg/Summit.cmake -Bbuild #-DPARTHENON_H5_meta_block_size=ON
cmake --build build -j 8 # -j 8 is required to ensure memory doesn't run out.   
