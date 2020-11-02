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
echo "  https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Hungary  "
echo "##############################################################"
echo "Tegnap:" $lastday &&
echo "Mai dátum:" $datum &&
echo "##############################################################"
echo "Aktív fertőzött:" $((activToday-activYeste)) &&
echo "Gyógyultak:" $((recovToday-recovYeste)) &&
echo "Elhunytak:" $((deathsToday-deathsYeste)) &&
echo "##############################################################"

