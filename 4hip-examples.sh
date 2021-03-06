cd ~/Desktop/DTB/src/hip/HIP-Examples

cd add4
make clean
./buildit.sh
./runhip.sh > ~/Desktop/logs/4hip-examples-add4.log 2>&1

cd ../cuda-stream
make clean
make
./stream > ~/Desktop/logs/4hip-examples-cuda-stream.log 2>&1

cd ../gpu-burn
make clean
make
./build/gpuburn-hip > ~/Desktop/logs/4hip-examples-gpuburn.log 2>&1

cd ../GPU-STREAM
make clean
./buildit
./runit > ~/Desktop/logs/4hip-examples-GPU-STREAM.log 2>&1

cd ../mini-nbody/hip
echo "-----------HIP-nbody-block----------" > ~/Desktop/logs/4hip-examples-mini-nbody.log 2>&1
./HIP-nbody-block.sh >> ~/Desktop/logs/4hip-examples-mini-nbody.log 2>&1
echo "-----------HIP-nbody-orig----------" >> ~/Desktop/logs/4hip-examples-mini-nbody.log 2>&1
./HIP-nbody-orig.sh >> ~/Desktop/logs/4hip-examples-mini-nbody.log 2>&1
echo "-----------HIP-nbody-soa-----------" >> ~/Desktop/logs/4hip-examples-mini-nbody.log 2>&1
./HIP-nbody-soa.sh >> ~/Desktop/logs/4hip-examples-mini-nbody.log 2>&1

cd ../../reduction
make clean
make
./run.sh > ~/Desktop/logs/4hip-examples-reduction.log 2>&1

cd ../rtm8
./build_hip.sh
./rtm8_hip > ~/Desktop/logs/4hip-examples-rtm8.log 2>&1

cd ../strided-access
make clean
make
./strided-access > ~/Desktop/logs/4hip-examples-strided-access.log 2>&1

cd ../vectorAdd
make clean
make > ~/Desktop/logs/4hip-examples-vectorAdd.log 2>&1
