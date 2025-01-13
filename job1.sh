#! /bin/bash
# variables
folder="/tmp"
log_file="logs.log"
log_str="$(date)"
curr_dir="/home/root/scripts"
# to check all files and folders
for a in $(ls $folder)
do
	path="$folder/$a"
	size=$(stat -c %s $path)
	# check size of 0 files, means empty files
	if [ $size -eq 0 ]
	then
		rm $path
		log_str="$log_str\n$path deleted with size $size"
	else
		# check it is directory ?
		if test -d $path;
		then
			# check for empty directories
			if `find $path -maxdepth 0 -empty -exec echo true \;`;
			then
				#echo "$path is empty directory deleting"
				log_str="$log_str\n$path is empty directory"
				: '
				Uncomment below line to remove empty directories
				'
				#rmdir $path
			fi
		fi
	fi
done
if [ -f $log_file ]
then
	log_str1=$(echo -e "`cat $curr_dir/$log_file`")
	log_str1=`cat $curr_dir/$log_file`
	rm $log_file
fi
echo -e "$log_str1\n$log_str" >> "$curr_dir/$log_file"