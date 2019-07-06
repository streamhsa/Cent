#sudo rm -rf cd ~/Desktop/rocm/workloads/miniapps/kokkos
#cd ~/Desktop/rocm/workloads/miniapps/
#git clone -b master https://github.com/kokkos/kokkos && cd kokkos


cd ~/Desktop/rocm/workloads/miniapps/kokkos

echo AH64_uh1 | sudo rm -rf build

#export HCC_OPT_FLUSH=0
mkdir build && cd build
~/Desktop/rocm/workloads/miniapps/kokkos/generate_makefile.bash --compiler=/opt/rocm/hcc/bin/clang++ --arch=Fiji --with-rocm --no-examples --make -j4 >> ~/Desktop/logs/17kokkos_build.log 2>&1
make test >> ~/Desktop/logs/17kokkos_test.log 2>&1
