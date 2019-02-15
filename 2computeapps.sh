# rm -rf cd ~/Desktop/rocm/workloads/computeapps
#cd ~/Desktop/rocm/workloads/
#git clone https://github.com/amdcomputelibraries/computeapps && cd computeapps

cd ~/Desktop/rocm/workloads/computeapps

#echo AH64_uh1 | sudo rm -rf computeapps_old
#echo AH64_uh1 | sudo mv -f computeapps computeapps_old

cd comd-amp/src-amp
make clean
make
cd ../bin
./CoMD-amp --nx 60 --ny 60 --nz 60 >> ~/Desktop/logs/2computeapps_comd.log 2>&1

cd ../../hpgmg-amp
make clean
make -f Makefile.hcc
cd build/bin
./hpgmg-fv-LC-clamp 6 8 >> ~/Desktop/logs/2computeapps_hpgmg.log 2>&1

cd ../../../lulesh-amp
make clean
make
./lulesh -s 80 -i 100 >> ~/Desktop/logs/2computeapps_lulesh.log 2>&1

sleep 5
cd ../snap-hcc/src
sleep 5
make clean
make
sleep 10
./snap snap_input >> ~/Desktop/logs/2computeapps_snap.log 2>&1

cd ../../xsbench-amp/src
make clean
make
./XSBench -s small >> ~/Desktop/logs/2computeapps_XSBench.log 2>&1
