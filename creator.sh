#!/bin/sh

while getopts ":v:c:p:s:" opt; do
	
	case $opt in 
		p) 
			echo "Creating Path if needed - $OPTARG"
			DIRPATH=${OPTARG}
			mkdir -p ${OPTARG}
			;;
		v)
			echo "Creating View: ${DIRPATH}${OPTARG}View" >&2
            sed  "s/\${name}/${OPTARG}/g" ViewTemplate.txt >> "${DIRPATH}${OPTARG}View.swift"
			;;
        c)
            echo "Creating Controller: ${DIRPATH}${OPTARG}ViewController"
            sed  "s/\${name}/${OPTARG}/g" ViewControllerTemplate.txt >> "${DIRPATH}${OPTARG}ViewController.swift"
            ;;
        s) 
			echo "Creating PageViewController: ${DIRPATH}${OPTARG}ViewController"
            sed  "s/\${name}/${OPTARG}/g" PageViewControllerTemplate.txt >> "${DIRPATH}${OPTARG}PageViewController.swift"
            ;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			;;
	esac
done



