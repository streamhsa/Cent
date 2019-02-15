#sudo rm -rf cd ~/Desktop/rocm/workloads/mathlibs/rocblas
#cd ~/Desktop/rocm/workloads/mathlibs/
#git clone -b master https://github.com/rocmsoftwareplatform/rocblas && cd rocblas

cd ~/Desktop/rocm/workloads/mathlibs/rocblas
echo AH64_uh1 | sudo yum install cmake cmake-qt-gui cmake-curses-gui python-yaml libblas-dev liblapack-dev libboost-all-dev

echo AH64_uh1 | sudo rm -rf build
echo AH64_uh1 | sudo ./install.sh -cd >> ~/Desktop/logs/5rocblas_build.log 2>&1

cd build/release/clients/staging
./rocblas-test >> ~/Desktop/logs/5rocblas_unittest.log 2>&1
./rocblas-bench >> ~/Desktop/logs/5rocblas_rocblas-bench.log 2>&1
./example-sscal >> ~/Desktop/logs/5rocblas_example-sscal.log 2>&1
./example-scal-template >> ~/Desktop/logs/5rocblas_example-scal-template.log 2>&1
./example-sgemm >> ~/Desktop/logs/5rocblas_example_sgemm.log 2>&1
./example-sgemm-strided-batched >> ~/Desktop/logs/5rocblas_example_sgemm_strided_batched.log 2>&1
