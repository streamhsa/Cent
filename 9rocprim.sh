#sudo rm -rf cd ~/Desktop/rocm/workloads/mathlibs/rocprim
#cd ~/Desktop/rocm/workloads/mathlibs/
#git clone -b master https://github.com/rocmsoftwareplatform/rocprim && cd rocprim


cd ~/Desktop/rocm/workloads/mathlibs/rocprim

echo AH64_uh1 | sudo rm -rf build
mkdir build; cd build

CXX=/opt/rocm/hcc/bin/hcc cmake -DBUILD_BENCHMARK=OFF -DDISABLE_WERROR=ON ../. >> ~/Desktop/logs/9rocprim_build.log 2>&1
make -j4 >> ~/Desktop/logs/9rocprim_build.log 2>&1

#To run unit tests
ctest --output-on-failure >> ~/Desktop/logs/9rocprim_ctest.log 2>&1
