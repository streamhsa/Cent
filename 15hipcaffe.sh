#sudo rm -rf cd ~/Desktop/rocm/workloads/DNNs/hipCaffe
#cd ~/Desktop/rocm/workloads/DNNs/
#git clone https://github.com/ROCmSoftwarePlatform/hipCaffe -b hip-centos && cd hipcaffe


cd ~/Desktop/rocm/workloads/DNNs/hipCaffe

export PATH=/opt/rocm/bin:$PATH
export LD_LIBRARY_PATH=/opt/rocm/lib:/opt/rocm/rocrand/lib:/opt/rocm/hiprand/lib:$LD_LIBRARY_PATH

echo AH64_uh1 | sudo yum -y install pkg-config protobuf-compiler libprotobuf-dev gflags-devel libleveldb-dev libsnappy-dev libhdf5-serial-dev libatlas-base-dev libboost-all-dev libgflags-dev libgoogle-glog-dev liblmdb-dev python-numpy python-scipy python3-dev python-yaml python-pip libopencv-dev libfftw3-dev libelf-dev libopenblas-base libopenblas-dev
	#libgflags-dev == gflags-devel
echo AH64_uh1 | sudo rm -rf ~/.cache/miopen/

cd ~/Desktop/rocm/workloads/DNNs/hipCaffe
cp Makefile.config.example Makefile.config

lsb_release -a >os_name.log
if grep -q 18.04 os_name.log;then
  sed -i 's/atlas/open/g' Makefile.config
  sed -i 's/# OPENCV_VERSION := 3/OPENCV_VERSION := 3/g' Makefile.config
fi

make clean
make -j16 >> ~/Desktop/logs/15hipcaffe_build.log 2>&1
make test -j16 >> ~/Desktop/logs/15hipcaffe_build.log 2>&1

#Unit tests
./build/test/test_all.testbin >> ~/Desktop/logs/15hipcaffe_directedTests.log 2>&1

#MNIST training
./data/mnist/get_mnist.sh
./examples/mnist/create_mnist.sh
./examples/mnist/train_lenet.sh >> ~/Desktop/logs/15hipcaffe_mnist.log 2>&1

#CIFAR-10 training
./data/cifar10/get_cifar10.sh
./examples/cifar10/create_cifar10.sh
./build/tools/caffe train --solver=examples/cifar10/cifar10_quick_solver.prototxt >> ~/Desktop/logs/15hipcaffe_cifar10.log 2>&1

#CaffeNet inference
./data/ilsvrc12/get_ilsvrc_aux.sh
./scripts/download_model_binary.py models/bvlc_reference_caffenet
./build/examples/cpp_classification/classification.bin \
        models/bvlc_reference_caffenet/deploy.prototxt \
    models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel \
    data/ilsvrc12/imagenet_mean.binaryproto \
    data/ilsvrc12/synset_words.txt \
    examples/images/cat.jpg >> ~/Desktop/logs/15hipcaffe_caffenetInference.log 2>&1
