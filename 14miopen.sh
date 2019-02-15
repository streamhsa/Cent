git clone -b develop https://streamhsa:AH64_uh1@github.com/amdcomputelibraries/mlopen && cd mlopen
cd ~/Desktop/rocm/workloads/DNNs/mlopen

echo AH64_uh1 | sudo rm -rf ~/.cache/miopen/

echo AH64_uh1 | sudo rm -rf build
mkdir build && cd build
export LD_LIBRARY_PATH=/opt/rocm/hip/lib/:/opt/rocm/miopengemm/lib

echo AH64_uh1 | sudo mount -t cifs -o username=taccuser,password=AH64_uh1,vers=1.0 //hydinstreamcqe1/hsa /mnt
echo AH64_uh1 | sudo cp -rf /mnt/Taccuser/Ravi/LC_testdata/mlopen/* /opt/rocm/include/.

echo AH64_uh1 | sudo yum -y install openssl
echo AH64_uh1 | sudo ln -s /usr/include/openssl/opensslconf.h /usr/include/openssl

CXX=/opt/rocm/hcc/bin/hcc cmake -DMIOPEN_TEST_ALL=ON -DMIOPEN_BACKEND=HIP -DMIOPEN_MAKE_BOOST_PUBLIC=ON -DCMAKE_PREFIX_PATH="/opt/rocm/hcc;/opt/rocm/hip" -DCMAKE_CXX_FLAGS="-isystem /usr/include/x86_64-linux-gnu/" .. >> ~/Desktop/logs/14miopen_build.log 2>&1

export MIOPEN_CONV_PRECISE_ROCBLAS_TIMING=0
sudo make check >> ~/Desktop/logs/14miopen_test.log 2>&1

sudo make MIOpenDriver >> ~/Desktop/logs/14miopen_driver.log 2>&1

 ./bin/MIOpenDriver conv -s 0 -v 0 -t 1 -F 1 -W 28 -H 28 -c 256 -n 8 -k 512 -x 3 -y 3 -p 1 -q 1 -u 1 -v 1 >> ~/Desktop/logs/14miopen_benchmark.log 2>&1


