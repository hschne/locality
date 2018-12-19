file=$(./locality); 
echo "FILE: $file"
[[ -f $file ]] && source $file

exit 1
