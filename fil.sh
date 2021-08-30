#rm final_cata.text
mkdir bad
mkdir h_600
mkdir l_600
cat LgQ_catalog.dat | while read line
do
file=`echo $line | awk -F " " '{print $1}'`
Q=`echo $line | awk -F" " '{print $9}'`
Qn=`echo $Q | awk -F"." '{print $1}'`
evlon=`echo $line | awk -F" " '{print $5}' | awk -F"." '{print $1}'`
Qerr=`echo $line | awk -F " " '{print $10}'`
eta=`echo $line | awk -F " " '{print $11}'`
etan=`echo $line | awk -F "." '{print $1+1}'`
etaerr=`echo $line | awk -F " " '{print $12}'`
dist=`echo $line | awk -F " " '{print $2}'|awk -F"." '{print $1}'`
codal=`echo $line | awk -F " " '{print  $14}'`
codaln=`echo $codal | awk -F"." '{print $1}'`

if [ $Qn -le 1005 ] && [ $etan -ge 1 ] && [ $codaln -ge 256 ] && [ $Qn -ge 600 ]
then
echo $line >> final_cata.text
#mv $file ./h_600
elif [ $Qn -lt 600 ] && [ $etan -ge 1 ] && [ $codaln -ge 256 ] && [ $Qn -ge 0 ]
then 
#mv $file ./l_600
echo $line >> final_cata.text
#mv $file ./bad
fi
done


