cnt=1
read a
let mod=$a%2;
#echo "Remainder is $mod"
while [[ $mod != 0 ]]
do 
	read a
	let mod=$a%2;
	#echo "Remainder is $mod"
	let cnt=$cnt+1
done
echo "$cnt"
