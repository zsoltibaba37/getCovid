# getCovid

- As the Hungarian government does not provide me with adequate data, it misinforms me.
- That’s why I did a little script that I run daily and look at the current data.

## Usage

```sh
First use getCOVID.sh to get data from wikipedia. 
I start this script around 12pm daily, or use crontab.

---------------------------------------------------------------
> ./geCOVID.sh > <filname>.txt

ls -l
-rw-rw-r-- 1 pzsolti pzsolti  480 nov    3 09:34 2020-11-03.txt
-rw-rw-r-- 1 pzsolti pzsolti  480 nov    4 09:42 2020-11-04.txt
-rw-rw-r-- 1 pzsolti pzsolti  481 nov    5 10:56 2020-11-05.txt


---------------------------------------------------------------
If a few file is available, use createGraph.sh

> ./createGraph.sh

The output is colored:

######################################################
   Az adatok az előző napi adatból vannak számolva
 The data are calculated from the previous day's data
######################################################
              2020-11-03.txt
 Aktív fertözött - Active infected: 3525
 Gyógyultak - Healed: 380
 Elhunytak - Died: 84
█████████████████████████████████
███████
███████████████████
######################################################
              2020-11-04.txt
 Aktív fertözött - Active infected: 3753
 Gyógyultak - Healed: 376
 Elhunytak - Died: 90
███████████████████████████████████
███████
████████████████████
######################################################
              2020-11-05.txt
 Aktív fertözött - Active infected: 2252
 Gyógyultak - Healed: 1591
 Elhunytak - Died: 85
████████████████████
█████████████████████████████████████
███████████████████
######################################################
              2020-11-06.txt
 Aktív fertözött - Active infected: 4217
 Gyógyultak - Healed: 390
 Elhunytak - Died: 102
████████████████████████████████████████
███████
███████████████████████
######################################################

```

2020
