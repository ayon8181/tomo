#!/bin/bash

rm -f ellipse_para_l1000.dat sorted_cata_l1000.txt azimuthQ_l1000.txt cata_sorted_l1000.txt
w_dir="/home/ayon/Seismology/LgQ_calculation_scripts/OUTPUT/final_results"

cat final_cata_l1000.text | while read line
do
Q=`echo $line | awk -F" " '{print $9}'`
file=`echo $line | awk -F" " '{print $1}'`
elat=`echo $line | awk -F" " '{print $4}'`
elong=`echo $line | awk -F" " '{print $5}'`
slat=`echo $line | awk -F" " '{print $6}'`
slong=`echo $line | awk -F" " '{print $7}'`
dist=`echo $line | awk -F" " '{print $2}'`
codal=`echo $line | awk -F" " '{print $14}'`
echo $codal
t=`echo $dist $codal | awk -F" " '{print $1/2.8 + $2/2.0}'`

tmax=`echo $t | awk '{print $1}'`
majxis=`echo $tmax | awk '{print $1 * 3.225 * 0.00899928005}'`
c_lat=`echo $elat $slat | awk '{print ($1 + $2) * 0.5}'`
c_long=`echo $elong $slong | awk '{print ($1 + $2) * 0.5}'`

tmp=`python $w_dir/azcalc.py <<EOF
$elat $elong
$slat $slong
EOF`
echo $tmp
t=`echo $tmp | awk -F" " '{print $1}'| awk -F"=" '{print $2}'`
dist=`echo $tmp | awk -F" " '{print $2}'| awk -F"=" '{print $2}'`
az=`echo $tmp | awk -F" " '{print $4}'| awk -F"=" '{print $2}'`
baz=`echo $tmp | awk -F" " '{print $3}'| awk -F"=" '{print $2}'`

minxis1=`echo $majxis $t | awk '{print sqrt(($1 * $1 * 0.25)-($2 * $2 * 0.25))}'`
minxis=`echo $minxis1 | awk '{print $1*2}'`

mj=`echo $majxis | awk -F"." '{print $1}'`
codal=`echo $codal | awk -F"." '{print $1}'`
dist=`echo $dist |awk -F"." '{print $1}'`
if [ $codal -ge 256 ] 
then
echo $file $elat $elong $slat $slong $c_lat $c_long $t $majxis $minxis $az >> ellipse_para_l1000.dat
echo $line >> sorted_cata_l1000.txt
echo $az $baz $dist $Q >> azimuthQ_l1000.txt
fi
done

cat sorted_cata_l1000.txt | while read line; do echo $line | awk -F" " '{print $1, $9, $10, $11, $12, $4, $5, $6, $7, $3-$14/2.0, $2, $8, 01, $9, $10, 03, $11, $12}' >> cata_sorted_l1000.txt; done
