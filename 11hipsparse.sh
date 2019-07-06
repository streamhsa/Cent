#sudo rm -rf cd ~/Desktop/rocm/workloads/mathlibs/hipsparse
#cd ~/Desktop/rocm/workloads/mathlibs/
#git clone -b master https://github.com/rocmsoftwareplatform/hipsparse && cd hipsparse


cd ~/Desktop/rocm/workloads/mathlibs/hipsparse

echo AH64_uh1 | sudo yum -y --force-yes install cmake cmake-qt-gui cmake-curses-gui python-yaml libblas-dev liblapack-dev libboost-all-dev

echo AH64_uh1 | sudo rm -rf build
echo AH64_uh1 | sudo ./install.sh -cd >> ~/Desktop/logs/11hipsparse_build.log 2>&1

cd build/release/clients/tests
./hipsparse-test >> ~/Desktop/logs/11hipsparse_unittest.log 2>&1
