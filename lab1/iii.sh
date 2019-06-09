b=""
read a
b="$a"
while [[ "$a" != "q" ]]
do 
read a
b="$b$a"
done
echo "$b"
