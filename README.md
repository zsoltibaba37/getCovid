# getCovid

- I live in Hungary, and want to know correct data from Covid-19 pandemic. 
- That’s why I did a little script that I run daily and look at the current data.

## Usage
- I made two script. The first one is collect data from wikipedia,
  the second one is made bar graph from '*.txt' files.


```sh
First use getCOVID.sh to get data from wikipedia. 
I start this script around 12pm daily, or use crontab.

---------------------------------------------------------------
> ./getCOVID.sh

##############################################################
       Az adatok a Wikipedia oldaláról származnak
             The data comes from Wikipedia
  https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Hungary
##############################################################
  Confirmed cases in Hungary:  109616
  Active cases in Hungary:     82108
  Number of recoveries:        25070
  Number of deaths:            2438
  Number of home quarantined:  34287
  Number of samples:           1209151
##############################################################
Tegnap - Yesterday: 2020-11-07
Mai dátum - Date: 2020-11-08
##############################################################
                     Új esetek - New cases
Aktív fertőzött - Active infected: 4369
Gyógyultak - Healed: 223
Elhunytak - Died: 81
##############################################################

 OR use this version to save actual data to txt file

> ./geCOVID.sh > data/<filname>.txt

ls -l
-rw-rw-r-- 1 user user  480 nov    3 09:34 2020-11-03.txt
-rw-rw-r-- 1 user user  480 nov    4 09:42 2020-11-04.txt
-rw-rw-r-- 1 user user  481 nov    5 10:56 2020-11-05.txt


---------------------------------------------------------------
If a few file is available in data folder, use createGraph.sh

> ./createGraph.sh

The output is colored:
######################################################
   Az adatok az előző napi adatból vannak számolva
 The data are calculated from the previous day's data
######################################################
                data/2020-11-03.txt
            Új esetek - New cases
 Aktív fertözött - Active infected: 3525
 █████████████████████████████████
 Gyógyultak - Healed: 380
 ███████
 Elhunytak - Died: 84
 ███████████████████
######################################################
                data/2020-11-04.txt
            Új esetek - New cases
 Aktív fertözött - Active infected: 3753
 ███████████████████████████████████
 Gyógyultak - Healed: 376
 ███████
 Elhunytak - Died: 90
 ████████████████████
######################################################
                data/2020-11-05.txt
            Új esetek - New cases
 Aktív fertözött - Active infected: 2252
 ████████████████████
 Gyógyultak - Healed: 1591
 █████████████████████████████████████
 Elhunytak - Died: 85
 ███████████████████
######################################################
```

2020
