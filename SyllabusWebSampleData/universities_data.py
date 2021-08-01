import os
import requests
import dicttoxml
import xml.etree.ElementTree as ET
from xml.dom.minidom import parseString
from bs4 import BeautifulSoup
from msedge.selenium_tools import Edge, EdgeOptions
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException
from operator import itemgetter



class Sample:
  #initialize class
  def __init__(self):    
    self.options = EdgeOptions()
    self.options.use_chromium = True    
    self.driver = Edge(options=self.options)
    self.driver.get(link)

    self.page = None
    self.soup = None
    self.keys = ["rank","french_name","location","faculties","postal_code","telephone","description","name","acronym","founded"]  

  #web scarpe html and append university faculty data to list  
  def extract_faculties(self):
    try:
      table_divs = self.soup.find_all('table')
      table = table_divs[len(table_divs) - 1]
      paragraphs = table.find_all('p')
      index = 2 #number of elements in factories div
      if len(paragraphs) != index: return None
      else:
        faculties = paragraphs[1].find_all('strong')
        data = data = [x.getText() for x in list(faculties)]
        return data
    except:
      print("Error occured, Could not extract faculty at " + url)
      return None

  #extract acronym, university name and year founded from table. Index identifies data to be retrieved
  def extract_university_information(self,index):
    try:
      tables = self.soup.find_all(class_='table')
      items = tables[0].find_all('tr')
      name = items[index].find('strong').getText()
      return name
    except:
      print("Error occured, extract_university_acronym()")
      return None

  #extract postal code, telephone and description
  def extract_university_location(self):
    postal_code = self.soup.find('span',itemprop='streetAddress')
    telephone = self.soup.find('span',itemprop='telephone')
    description = self.soup.find('p',itemprop='description')
    return [postal_code.getText(),telephone.getText(),description.getText()]

  #find element by link name, click on link and change pages
  def change_pages(self,name):
    timeout = 10 #seconds
    try:
      element = WebDriverWait(self.driver,timeout).until(
        EC.presence_of_element_located((By.LINK_TEXT,name))
      )
      element.click()
      return True
    except: 
      print("Error occured, driver quit. Could not navigate to " + name + " web page")
      return False

  #navigate to uni page and scrape extract sample data
  def navitate_to_page(self,university):
    if not self.change_pages(university[1]): self.driver.quit()
    else: 
      self.page = requests.get(self.driver.current_url)
      self.soup = BeautifulSoup(self.page.content,'html.parser')
      university.append(self.extract_faculties())
      university.extend(self.extract_university_location())
      university.extend([self.extract_university_information(x) for x in range(1,4)]) #web scrape table information
      self.driver.back()
    return university
  
  #check if university is ranked
  def is_ranked(self,uni):
    if uni[0].getText().isnumeric(): return True
    else: return False 

  #get text of ranked university
  def ranked(self,rankings):
    return [rankings[t].getText() for t in range(len(rankings))]

  #web scrape universities rank data
  def extract_ranked_universities(self,link):
    self.page = requests.get(link)
    self.soup = BeautifulSoup(self.page.content,'html.parser')
    table_rank = self.soup.find_all('tr')
    #for all ranked rows in table getText
    ranked = [self.ranked(table_rank[x].find_all('td')) for x in range(2,len(table_rank) - 1) if self.is_ranked(table_rank[x].find_all('td'))]
    return ranked

  #match value in array with key
  def match_key_value(self,unis):
    data = {}
    for count,value in enumerate(self.keys): data[value] = unis[count]
    return data

  #extract all universities data from website
  def extract_uni_data_to_xml(self,link,filename):
    universities = [self.navitate_to_page(x) for x in self.extract_ranked_universities(link)]
    data = sorted([self.match_key_value(x) for x in universities],key=itemgetter('rank'))
    dom = parseString(dicttoxml.dicttoxml(data)).toprettyxml()
    with open(filename, 'w') as f:
      f.write(dom)   



if __name__ == "__main__":
  link = 'https://www.4icu.org/cd/' #web page link
  filename = 'universities.xml'
  sample = Sample()
  sample.extract_uni_data_to_xml(link,filename)
  sample.driver.quit()
  
