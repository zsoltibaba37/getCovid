#!/bin/bash
#
# Created: Zsolt Pető
# Date: 2020-11-06
# 
# Create bargraph from Covid-19 Data
#
clear
echo "######################################################"
echo "   Az adatok az előző napi adatból vannak számolva    "
echo " The data are calculated from the previous day's data "
#echo "######################################################"

declare -a fileNames
declare -i fileNum
declare -a gyogyult
declare -a aktiv
declare -a elhunyt

#
# How many txt file in the folder
#
getFileNum() {
    fileNum=$( ls -ltrH data/*.txt | wc -l )
}


#
# Collect txt file names
# 
getFileNames() {
    for(( i=1; i <= $fileNum; i++ ))
        do
            fileNames[${#fileNames[@]}]=$(ls -l data/*.txt | head -$i | tail -n1 | rev | cut -d " " -f1 | rev )
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

#
# Map value 5000 -> 50
#
mapValue() {
	f=$1
    t=$2
    res=$(($f*50/$t))
    echo $res
}


getFileNum
getFileNames
getData

for (( y=0; y < $fileNum; y++ ))
    do

        la=$(mapValue ${aktiv[$y]} 5000)
        lg=$(mapValue ${gyogyult[$y]} 2000)
        le=$(mapValue ${elhunyt[$y]} 200)
        echo -ne "\e[39m"
        echo "######################################################"
        echo "                ${fileNames[$y]}"
        echo "            Új esetek - New cases"
        echo -e "\e[32m Aktív fertözött - Active infected: ${aktiv[$y]}"
        echo -ne " "
        printf_bar "█" $((la))
        echo -e "\e[33m Gyógyultak - Healed: ${gyogyult[$y]}"
        echo -ne " "
        printf_bar "█" $((lg))
        echo -e "\e[35m Elhunytak - Died: ${elhunyt[$y]}"
        echo -ne " "
        printf_bar "█" $((le))

        #echo -ne "\e[32m"
        #printf_bar "█" $((la))
        #echo -ne "\e[33m"
        #printf_bar "█" $((lg))
        #echo -ne "\e[35m"
        #printf_bar "█" $((le))
    done

echo -ne "\e[39m"
echo "######################################################"

