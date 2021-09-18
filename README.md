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
  Confirmed cases in Hungary:  814409                         
  Active cases in Hungary:     5798                           
  Number of recoveries:        778531                         
  Number of deaths:            30080                          
  Number of home quarantined:  2563                           
  Number of PCR samples:       6664898                        
  Hospitalized:                215                            
  Ventilated:                  26                             
##############################################################
Tegnap - Yesterday: 2021-09-08                                
Ma - Today:         2021-09-09                                  
##############################################################
                     Új esetek - New cases                    
Aktív fertőzött - Active infected: 212                        
Gyógyultak - Healed: 130                                      
Elhunytak - Died: 3                                           
##############################################################

 OR use this version to save actual data to txt file

> ./geCOVID.sh > data/<filename>.txt

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
 The data are calculated from the previous days data
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


2021-09-09
