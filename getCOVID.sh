#!/bin/bash

lastday=$(date +%Y-%m-%d -d "yesterday") &&
datum=$(date +%Y-%m-%d) &&

covidData=$(wget -q -O - https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Hungary)

activToday=$(echo "$covidData" | grep -A5 "$datum" | grep "Tomato" | cut -d'"' -f2) &&

if [ -z "$activToday" ]
then
    echo "There is no new data on the wikipedia site."
    exit 0
fi

activYeste=$(echo "$covidData" | grep -A5 "$lastday" | grep "Tomato" | cut -d'"' -f2) &&

recovYeste=$(echo "$covidData" | grep -A5 "$lastday" | grep "SkyBlue" | cut -d'"' -f2) &&
recovToday=$(echo "$covidData" | grep -A5 "$datum" | grep "SkyBlue" | cut -d'"' -f2) &&

deathsYeste=$(echo "$covidData" | grep -A5 "$lastday<" | grep "#A50026" | cut -d'"' -f2) &&
deathsToday=$(echo "$covidData" | grep -A5 "$datum<" | grep "#A50026" | cut -d'"' -f2) &&

confCases=$(echo "$covidData" | grep -A2 "Confirmed cases in Hungary" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')
activeCases=$(echo "$covidData" | grep -A2 "Active cases in Hungary" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')
numOfRecov=$(echo "$covidData" | grep -A2 "Number of recoveries" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')
numOfDeaths=$(echo "$covidData" | grep -A2 "Number of deaths" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')
numOfQuar=$(echo "$covidData" | grep -A2 "Number of home quarantined" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')
numOfSamp=$(echo "$covidData" | grep -A2 "Number of samples" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')

#clear
echo ""
echo "##############################################################"
echo "       Az adatok a Wikipedia oldaláról származnak             "
echo "             The data comes from Wikipedia                    "
echo "  https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Hungary  "
echo "##############################################################"
echo "  Confirmed cases in Hungary: " $confCases &&
echo "  Active cases in Hungary:    " $activeCases &&
echo "  Number of recoveries:       " $numOfRecov &&
echo "  Number of deaths:           " $numOfDeaths &&
echo "  Number of home quarantined: " $numOfQuar &&
echo "  Number of samples:          " $numOfSamp &&
echo "##############################################################"
echo "Tegnap - Yesterday:" $lastday &&
echo "Mai dátum - Date:" $datum &&
echo "##############################################################"
echo "                     Új esetek - New cases"
echo "Aktív fertőzött - Active infected:" $((activToday-activYeste)) &&
echo "Gyógyultak - Healed:" $((recovToday-recovYeste)) &&
echo "Elhunytak - Died:" $((deathsToday-deathsYeste)) &&
echo "##############################################################"
