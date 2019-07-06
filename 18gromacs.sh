#sudo rm -rf cd ~/Desktop/rocm/workloads/miniapps/gromacs
#cd ~/Desktop/rocm/workloads/miniapps/
#git clone https://github.com/gromacs/gromacs && cd gromacs


cd ~/Desktop/rocm/workloads/miniapps/gromacs

echo AH64_uh1 | sudo rm -rf build
mkdir build && cd build
cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON > ~/Desktop/logs/18gromacs_build.log 2>&1

make -j 8  >> ~/Desktop/logs/18gromacs_test.log 2>&1
make -j 8 check > ~/Desktop/logs/18gromacs_test.log 2>&1
