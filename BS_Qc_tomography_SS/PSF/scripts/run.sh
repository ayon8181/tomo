#!/bin/bash

w_dir="/home/ayon/Seismology/LgQ_calculation_scripts/OUTPUT/final_results/BS_Qc_tomography_SS/PSF/"

echo "Do you have the output of the Tomography?"
echo
echo "01_weightage.txt, sorted_cata.txt, Gmatrix.txt and box"
echo
echo "If not break now..."
sleep 2

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
echo 'Enter the limits of the box in the order lonlow, lonhigh, latlow, lathigh'
read p1lonA
read p1lonB
read p1latA
read p1latB
echo 'Enter the limits of the 2nd box in the order lonlow, lonhigh, latlow, lathigh'
read p2lonA
read p2lonB
read p2latA
read p2latB

if [ -f 01_weightage.txt ] && [ -f sorted_cata_l1000.txt ] && [ -f Gmatrix.txt ]; then

#cp $w_dir/../tomo/Gmatrix.txt $w_dir
#cp $w_dir/../tomo/01_weightage.txt $w_dir

N=`cat sorted_cata_l1000.txt | wc -l`
echo
echo "Making checker..."
#run checker file to calculate input checker
$w_dir/bin/check_make_psf << EOF
$longA
$longB
$latA
$latB
$grdsz
$p1lonA
$p1lonB
$p1latA
$p1latB
$p2lonA
$p2lonB
$p2latA
$p2latB
EOF


echo
echo "Doing forward calculatons..."
#run forward calculation
$w_dir/bin/forward_calc_psf << EOF1
$N
$longA
$longB
$latA
$latB
$grdsz
EOF1

echo
echo "Doing backward calculations to recover the checker..."
#run backward model to recover the checker
$w_dir/bin/back_proj_calc_psf << EOF2
$N
$longA
$longB
$latA
$latB
$grdsz
$iter
EOF2

#mv *output* ./psf
echo
echo "DONE!!!"

else
echo "WARNING: Any or all Input files: 01_weightage.txt sorted_cata.txt Gmatrix.txt box NOT PRESENT. Exiting"

fi

