#sudo rm -rf cd ~/Desktop/rocm/workloads/mathlibs/rocfft
#cd ~/Desktop/rocm/workloads/mathlibs/
#git clone -b master https://github.com/rocmsoftwareplatform/rocfft && cd rocfft


cd ~/Desktop/rocm/workloads/mathlibs/rocfft

echo AH64_uh1 | sudo yum -y install cmake-qt-gui cmake-curses-gui python-yaml libblas-dev liblapack-dev libboost-all-dev

echo AH64_uh1 | sudo rm -rf build
echo AH64_uh1 | sudo ./install.sh -cd >> ~/Desktop/logs/7rocfft_build.log 2>&1
export LD_LIBRARY_PATH=/opt/rocm/rocfft/lib:$LD_LIBRARY_PATH

cd build/release/clients/staging
./fixed-16-double >> ~/Desktop/logs/7rocfft_fixed-16-double.log 2>&1
./fixed-16-float >> ~/Desktop/logs/7rocfft_fixed-16-float.log 2>&1
./fixed-large-double  >> ~/Desktop/logs/7rocfft_fixed-large-double.log 2>&1
./fixed-large-float  >> ~/Desktop/logs/7rocfft_fixed-large-float.log 2>&1
./rocfft-rider  >> ~/Desktop/logs/7rocfft_rocfft-rider.log 2>&1
./rocfft-test  >> ~/Desktop/logs/7rocfft_rocfft-test.log 2>&1
