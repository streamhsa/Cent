#sudo rm -rf cd ~/Desktop/rocm/workloads/mathlibs/rocalution
#cd ~/Desktop/rocm/workloads/mathlibs/
#git clone -b master https://github.com/rocmsoftwareplatform/rocalution && cd rocalution


cd ~/Desktop/rocm/workloads/mathlibs/rocalution

echo AH64_uh1 | sudo yum -y install cmake cmake-qt-gui cmake-curses-gui python-yaml libblas-dev liblapack-dev libboost-all-dev

echo AH64_uh1 | sudo rm -rf build
echo AH64_uh1 | sudo ./install.sh -cd >> ~/Desktop/logs/12rocalution_build.log 2>&1

cd build/release/clients/tests
./rocalution-test >> ~/Desktop/logs/12rocalution_unittest.log 2>&1
