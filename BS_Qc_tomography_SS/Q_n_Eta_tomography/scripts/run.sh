#!/bin/bash

w_dir="/home/ayon/Seismology/LgQ_calculation_scripts/OUTPUT/final_results/BS_Qc_tomography_SS/Q_n_Eta_tomography"
mkdir inp_files_1
#echo 'Enter the number of iterations:'
#read it

echo 'Enter the no. of iterations:'
read iter
echo 'Enter the lower longitude limit'
read longA
echo 'Enter the higher longitude limit'
read longB
echo 'Enter the lower latitude limit'
read latA
echo 'Enter the higher latitude limit'
read latB
echo 'Enter the gridsize'
read grdsz

echo $longA
#run python script to calculate weightage area of ellipse in each square

#python $w_dir/scripts/weight.py << EOF1
$longA
$longB
$latA
$latB
$grdsz
#EOF1

#compile fortran file to calculate backprojection tomography
#gfortran -o $w_dir/back_tomo $w_dir/back_proj_tomo.f90

#calculate the total number of event-receiver paths we have
N=`cat cata_sorted_l1000.txt | wc -l`

#run for all frequencies in one go
for it in `seq 1 10 $iter`
do
fname=${it}'_output.txt'
echo
echo "working on frequency" 03
$w_dir/bin/back_proj_tomo << EOF
$N
$longA
$longB
$latA
$latB
$grdsz
$it
$fname
EOF
mv *output* ./inp_files_final
done

bash $w_dir/plot/all_tomo_plot.gmt << EOF2
$iter
67
85
27
43
EOF2

#run python script to find Q0 and eta tomography
#python $w_dir/scripts/q0_calc.py
