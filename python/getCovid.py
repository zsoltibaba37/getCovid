#!/usr/bin/env python3.8
# -*- coding: UTF-8 -*-

from os import walk, system, path, getuid
from sys import argv, platform, exit
import codecs
import subprocess
import re
from datetime import date
import requests
from bs4 import BeautifulSoup

today = date.today()

url = "https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Hungary"
urlData = requests.get(url).text
fileData = urlData.split('\n')

"""
fileName = '/home/pzsolti/sh/data.html'
fileData = []

with codecs.open(fileName, 'r', 'UTF-8') as f:
     for i in f:
         fileData.append(i)
"""

# Today data
deaT = [ s for s in fileData if "#A50026" in s]
deaTA = deaT[-1]
deaTA = deaTA.split('\"')[1]

actT = [ s for s in fileData if "Tomato" in s]
actTA = actT[-1]
actTA = actTA.split('\"')[1]


recT = [ s for s in fileData if "SkyBlue" in s]
recTA = recT[-1]
recTA = recTA.split('\"')[1]

# Yesterday data
deaY = [ s for s in fileData if "#A50026" in s]
deaYA = deaY[-2]
deaYA = deaYA.split('\"')[1]

actY = [ s for s in fileData if "Tomato" in s]
actYA = actY[-2]
actYA = actYA.split('\"')[1]


recY = [ s for s in fileData if "SkyBlue" in s]
recYA = recY[-2]
recYA = recYA.split('\"')[1]

Ndea = int(deaTA) - int(deaYA)
Nact = int(actTA) - int(actYA)
Nrec = int(recTA) - int(recYA)



print("""
##############################################################
             The data is comes from Wikipedia
  https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Hungary
##############################################################""")
c = 62
print(f"Date: {today}".center(c))
print("#"*c)
print(f" Active cases in Hungary: {actTA}")
print(f" Number of recoveries:    {recTA}")
print(f" Number of deaths:        {deaTA}")
print("#"*c)
print("New cases    ".center(c))
print(f" Active infected - Aktív: {Nact}")
print(f" Healed - Gyógyultak:     {Nrec}")
print(f" Died - Elhunytak:        {Ndea}")
print("#"*c)


