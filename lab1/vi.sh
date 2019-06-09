#echo "$HOME"
#echo "$PWD"
if [[ $HOME == $PWD ]]
then 
	echo "$HOME"
	exit 0
else
	echo ":("
	exit 1;
fi
