#sudo rm -rf cd ~/Desktop/rocm/workloads/mathlibs/hipblas
#cd ~/Desktop/rocm/workloads/mathlibs/
#git clone -b master https://github.com/rocmsoftwareplatform/hipblas && cd hipblas


cd ~/Desktop/rocm/workloads/mathlibs/hipblas

echo AH64_uh1 | sudo yum -y --force-yes install cmake cmake-qt-gui cmake-curses-gui python-yaml libblas-dev liblapack-dev libboost-all-dev

echo AH64_uh1 | sudo rm -rf build
echo AH64_uh1 | sudo ./install.sh -cd >> ~/Desktop/logs/6hipblas_build.log 2>&1

cd build/release/clients/staging
./hipblas-test >> ~/Desktop/logs/6hipblas_unittest.log 2>&1
./example-sscal >> ~/Desktop/logs/6hipblas_example-sscal.log 2>&1
./example-sgemm >> ~/Desktop/logs/6hipblas_example-sgemm.log 2>&1
./example-sgemm-strided-batched >> ~/Desktop/logs/6hipblas_example-sgemm-strided-batched.log 2>&1
