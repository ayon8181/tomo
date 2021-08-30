cat final_cata_l1000.text | while read line
do
event=`echo $line | awk -F " " '{print $1}'`
eventid=`echo $event | awk -F "_" '{print $3}'`
station=`echo $event | awk -F "_" '{print $5}' | awk -F "." '{print $1}'`
evla=`echo $line | awk -F " " '{print $4}'`
evlo=`echo $line | awk -F " " '{print $5}'`
stla=`echo $line | awk -F " " '{print $6}'`
stlo=`echo $line | awk -F " " '{print $7}'`
Q=`echo $line | awk -F " " '{print $9}'`
Qer=`echo $line | awk -F " " '{print $10}'`
eta=`echo $line |awk -F " " '{print $11}'`
etaer=`echo $line | awk -F " " '{print $12}'`
dist=`echo $line | awk -F " " '{print $2}'`
echo $eventid $evla $evlo $station $stla $stlo $Q $Qer $eta $etaer $dist>> Qo_eta.txt
done
