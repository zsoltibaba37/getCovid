#!/bin/bash
#
# Created: Zsolt Pető
# Date: 2020-11-06
# 
# Create bargraph from Covid-19 Data
#

declare -a fileNames
declare -i fileNum
declare -a gyogyult
declare -a aktiv
declare -a elhunyt

#
# How many txt file in the folder
#
getFileNum() {
    fileNum=$( ls -ltrH *.txt | wc -l )
}


#
# Collect txt file names
# 
getFileNames() {
    for(( i=1; i <= $fileNum; i++ ))
        do
            fileNames[${#fileNames[@]}]=$(ls -l *.txt | head -$i | tail -n1 | cut -d " " -f12 )
        done
}


#
# Collect data from each txt file
#
getData() {
    for(( i=1; i <= $fileNum; i++ ))
        do
            aktiv[${#aktiv[@]}]=$(grep "Aktív" ${fileNames[$i-1]} | rev | cut -d" " -f1 | rev)
            gyogyult[${#gyogyult[@]}]=$(grep "Gyógyultak" ${fileNames[$i-1]} | rev | cut -d" " -f1 | rev)
            elhunyt[${#elhunyt[@]}]=$(grep "Elhunytak" ${fileNames[$i-1]} | rev | cut -d" " -f1 | rev)
        done

}

#
# Print Bargraph
#
printf_bar() {
 str=$1
 num=$2
 v=$(printf "%-${num}s" "$str")
 echo -e "${v// /█}"
}


getFileNum
getFileNames
getData

for (( y=0; y < $fileNum; y++ ))
    do
        echo -e "\e[39m"
        echo "################################"
        echo "${fileNames[$y]}"
        echo -e "\e[32m Aktív fertözött: ${aktiv[$y]}"
        echo -e "\e[33m Gyógyultak: ${gyogyult[$y]}"
        echo -e "\e[35m Elhunytak: ${elhunyt[$y]}"

        la=${aktiv[$y]}
        lg=${gyogyult[$y]}
        le=${elhunyt[$y]}
        echo -ne "\e[32m"
        printf_bar "█" $((la/100))
        echo -ne "\e[33m"
        printf_bar "█" $((lg/100))
        echo -ne "\e[35m"
        printf_bar "█" $((le/10))
    done

echo -ne "\e[39m"
echo "################################"

