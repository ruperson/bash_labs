if [[ $# != 3 ]]
then
	echo "USAGE: 3 arguments"
	exit
fi
ans=0
if [[ $1 > $2 ]]
then ans=$1
else ans=$2
fi
if [[ $ans < $3 ]]
then ans=$3
fi
echo $ans
