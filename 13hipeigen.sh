git clone -b develop https://streamhsa:AH64_uh1@github.com/rocmsoftwareplatform/hipeigen && cd hipeigen
cd ~/Desktop/rocm/workloads/hip_tests/hipeigen

echo AH64_uh1 | sudo rm -rf build
mkdir build && cd build
cmake .. >> ~/Desktop/logs/13hipeigen_build.log 2>&1
make install >> ~/Desktop/logs/13hipeigen_build.log 2>&1

make check -j$(nproc) >> ~/Desktop/logs/13hipeigen_test.log 2>&1



