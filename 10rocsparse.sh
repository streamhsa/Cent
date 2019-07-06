#sudo rm -rf cd ~/Desktop/rocm/workloads/mathlibs/rocsparse
#cd ~/Desktop/rocm/workloads/mathlibs/
#git clone -b master https://github.com/rocmsoftwareplatform/rocsparse && cd rocsparse


cd ~/Desktop/rocm/workloads/mathlibs/rocsparse

echo AH64_uh1 | sudo yum -y install cmake cmake-qt-gui cmake-curses-gui python-yaml libblas-dev liblapack-dev libboost-all-dev

echo AH64_uh1 | sudo rm -rf build
echo AH64_uh1 | sudo ./install.sh -cd >> ~/Desktop/logs/10rocsparse_build.log 2>&1

cd build/release/clients/tests
./rocsparse-test >> ~/Desktop/logs/10rocsparse_unittest.log 2>&1
