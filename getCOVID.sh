#!/bin/bash

covidData=$(wget -q -O - https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Hungary)

lastday=$(date +%Y-%m-%d -d "yesterday") &&
datum=$(date +%Y-%m-%d) &&


activYeste=$(echo "$covidData" | grep -A5 "$lastday" | grep "Tomato" | cut -d'"' -f2) &&
activToday=$(echo "$covidData" | grep -A5 "$datum" | grep "Tomato" | cut -d'"' -f2) &&

recovYeste=$(echo "$covidData" | grep -A5 "$lastday" | grep "SkyBlue" | cut -d'"' -f2) &&
recovToday=$(echo "$covidData" | grep -A5 "$datum" | grep "SkyBlue" | cut -d'"' -f2) &&

deathsYeste=$(echo "$covidData" | grep -A5 "$lastday<" | grep "#A50026" | cut -d'"' -f2) &&
deathsToday=$(echo "$covidData" | grep -A5 "$datum<" | grep "#A50026" | cut -d'"' -f2) &&

echo ""
echo "##############################################################"
echo "       Az adatok a Wikipedia oldaláról származnak             "
echo "             The data comes from Wikipedia                    "
echo "  https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Hungary  "
echo "##############################################################"
echo "Tegnap - Yesterday:" $lastday &&
echo "Mai dátum - Date:" $datum &&
echo "##############################################################"
echo "Aktív fertőzött - Active infected:" $((activToday-activYeste)) &&
echo "Gyógyultak - Healed:" $((recovToday-recovYeste)) &&
echo "Elhunytak - Died:" $((deathsToday-deathsYeste)) &&
echo "##############################################################"

