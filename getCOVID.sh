#!/bin/bash

covidData=$(wget -q -O - https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Hungary)

#lastday=$(date +%Y-%m-%d -d "yesterday") &&
#datum=$(date +%Y-%m-%d) &&

#activToday=$(echo "$covidData" | grep -A5 "$datum" | grep "Tomato" | cut -d'"' -f2) &&
#activToday=$(echo "$covidData" | grep -A5 "$datum" | grep "bb-c" | cut -d '"' -f16) &&


#if [ -z "$activToday" ]
#then
#    echo "There is no new data on the wikipedia site."
#    exit 0
#fi

### old
#activToday=$(echo "$covidData" | grep -A5 "$datum" | grep "bb-c" | cut -d '"' -f16) &&
#activYeste=$(echo "$covidData" | grep -A5 "$lastday" | grep "bb-b" | cut -d '"' -f16) &&
#
#recovYeste=$(echo "$covidData" | grep -A5 "$lastday" | grep "bb-b" | cut -d '"' -f10) &&
#recovToday=$(echo "$covidData" | grep -A5 "$datum" | grep "bb-b" | cut -d '"' -f10) &&
#
#deathsYeste=$(echo "$covidData" | grep -A5 "$lastday" | grep "bb-b" | cut -d '"' -f4) &&
#deathsToday=$(echo "$covidData" | grep -A5 "$datum" | grep "bb-b" | cut -d '"' -f4) &&
### old end


activToday=$(echo "$covidData" | grep "mcc-d" | tail -n1 | cut -d'"' -f16)
activYeste=$(echo "$covidData" | grep "mcc-d" | tail -n2 | head -n1 | cut -d'"' -f16)

recovToday=$(echo "$covidData" | grep "mcc-d" | tail -n1 | cut -d'"' -f10)
recovYeste=$(echo "$covidData" | grep "mcc-d" | tail -n2 | head -n1 | cut -d'"' -f10)

deathsToday=$(echo "$covidData" | grep "mcc-d" | tail -n1 | cut -d'"' -f4)
deathsYeste=$(echo "$covidData" | grep "mcc-d" | tail -n2 | head -n1 | cut -d'"' -f4)

confCases=$(echo "$covidData" | grep -A2 "Confirmed cases in Hungary" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')
activeCases=$(echo "$covidData" | grep -A2 "Active cases in Hungary" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')
numOfRecov=$(echo "$covidData" | grep -A2 "Number of recoveries" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')
numOfDeaths=$(echo "$covidData" | grep -A2 "Number of deaths" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')
numOfQuar=$(echo "$covidData" | grep -A2 "Number of home quarantined" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')
numOfSamp=$(echo "$covidData" | grep -A2 "Number of PCR samples" | tail -1 | rev | cut -d">" -f1 | rev | sed -r 's/,//g')
vent=$(echo "$covidData" | grep -B10 'rowspan="2"' | grep '<td>' | rev | cut -d">" -f1 | rev | cut -d " " -f10)
numVent=$(echo $vent | rev | cut -d " " -f1 | rev)
hosp=$(echo "$covidData" | grep -B10 'rowspan="2"' | grep '<td>' | rev | cut -d">" -f1 | rev | cut -d " " -f10)
numHosp=$(echo $vent | rev | cut -d " " -f2 | rev)

# Print data
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
echo "  Number of PCR samples:      " $numOfSamp &&
echo "  Hospitalized:               " $numHosp &&
echo "  Ventilated:                 " $numVent &&

#echo "##############################################################"
#echo "Tegnap - Yesterday:" $lastday &&
#echo "Ma - Today:        " $datum &&
echo "##############################################################"
echo "                     Új esetek - New cases"
echo "Aktív fertőzött - Active infected:" $((activToday-activYeste)) &&
echo "Gyógyultak - Healed:" $((recovToday-recovYeste)) &&
echo "Elhunytak - Died:" $((deathsToday-deathsYeste)) &&
echo "##############################################################"
