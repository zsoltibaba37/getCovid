#!/usr/bin/python3.8
# -*- coding: UTF-8 -*-

import re
from urllib.request import urlopen
from bs4 import BeautifulSoup
from sys import exit

def printline():
    print("#"*62)


list_col = [
'Confirmed cases in Hungary',
'Active cases in Hungary',
'Number of recoveries',
'Number of deaths',
'Number of home quarantined',
'Number of PCR samples',
'Number of partially vaccinated',
'Number of fully vaccinated'
]

url = "https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Hungary"

def main():
        try:
            page = urlopen(url)
        except HTTPError as e:
            print("I don't reach source page! Error code: ", e.code)
            exit("Bye\n")
        except URLError as e:
            print("i don't reach source page! Reason: ", e.code)
            exit("Bye\n")

        html = page.read().decode("utf-8")
        soup = BeautifulSoup(html,"html.parser")
        text = 'Last update'

        last_up = str(soup.find_all(lambda tag: tag.name == "td" and text in tag.text))
        last_up1 = last_up.split('>')
        last_up2 = last_up1[1].split('<')
        last_update = str(last_up2[0])

        data_nums = soup.findAll("td", { "align":"center" })
        rawnumbers = [d.text for d in data_nums]

        number: list = []
        l: int = len(rawnumbers)
        numbers: list = []

        for i in range(l):
            number.append(rawnumbers[i].replace(",", ""))

        ll: int = len(number)

        for i in range(ll):
            numbers.append(number[i].replace("\n", ""))


        printline()
        print("             The data comes from Wikipedia                    ")
        print("  https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Hungary  ")
        printline()
        print(f"  {last_update}")
        printline()

        list_num = len(list_col)
        for i in range(list_num):
            print(f"  {list_col[i]: <34}: {numbers[i]}")

        printline()
        print("")


if __name__ == "__main__":
        main()

