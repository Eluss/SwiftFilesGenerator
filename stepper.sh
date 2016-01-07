#!/bin/sh

FILE=$1


while read line
do
	fileType=`echo $line | cut -d "[" -f2 | cut -d "]" -f1`
	fileName=`cut -d "]" -f 2 <<< "$line"`
	foldersPath=`cut -f1 -d"[" <<< $line`

	echo "type: $fileType name: $fileName path: $foldersPath"

	if [ "$fileType" == "V" ]; then
		if [ "$foldersPath" != "" ]; then 
			sh ./creator.sh -p $foldersPath -v $fileName
		else
			sh ./creator.sh -v $fileName
		fi
		
		echo "Creating View: $fileName"
	elif [ "$fileType" = "VC" ]; then
		if [ "$foldersPath" != "" ]; then 
			sh ./creator.sh -p $foldersPath -v $fileName
			sh ./creator.sh -p $foldersPath -c $fileName
		else
			sh ./creator.sh -v $fileName
			sh ./creator.sh -c $fileName
		fi
		
		echo "Creating ViewController + View: $fileName"
	elif [ "$fileType" = "PVC" ]; then 
		if [ "$foldersPath" != "" ]; then 
			sh ./creator.sh -p $foldersPath -s $fileName
			sh ./creator.sh -p $foldersPath -v ${fileName}SinglePage
			sh ./creator.sh -p $foldersPath -c ${fileName}SinglePage
		else
			sh ./creator.sh -s $fileName
			sh ./creator.sh -v ${fileName}SinglePage
			sh ./creator.sh -c ${fileName}SinglePage
		fi
	else 
		echo "ERROR: UNKNOWN FILE TYPE"
	fi
	echo "----"

done <${FILE}	
