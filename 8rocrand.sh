#sudo rm -rf cd ~/Desktop/rocm/workloads/mathlibs/rocrand
#cd ~/Desktop/rocm/workloads/mathlibs/
#git clone -b master https://github.com/rocmsoftwareplatform/rocrand && cd rocrand

cd ~/Desktop/rocm/workloads/mathlibs/rocrand

echo AH64_uh1 | sudo rm -rf build
mkdir build; cd build

sudo mv /usr/local/lib/libgtest.a /usr/local/lib/libgtest.aa

CXX=/opt/rocm/hcc/bin/hcc cmake -DBUILD_BENCHMARK=ON -DBUILD_TEST=ON -DBUILD_CRUSH_TEST=ON -DDEPENDENCIES_FORCE_DOWNLOAD=ON ../. >> ~/Desktop/logs/8rocrand_build.log 2>&1
make -j4 >> ~/Desktop/logs/8rocrand_build.log 2>&1

#To run unit tests
ctest --output-on-failure >> ~/Desktop/logs/8rocrand_ctest.log 2>&1
#To run benchmark for generate functions
./benchmark/benchmark_rocrand_generate --engine all --dis all >> ~/Desktop/logs/8rocrand_benchmark_rocrand-generate.log 2>&1
#To run benchmark for device kernel functions
./benchmark/benchmark_rocrand_kernel --engine all --dis all >> ~/Desktop/logs/8rocrand_benchmark_rocrand-kernel.log 2>&1
