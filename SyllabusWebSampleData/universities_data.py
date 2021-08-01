import os
import requests
import dicttoxml
from collections import OrderedDict
from xml.dom.minidom import parseString
from bs4 import BeautifulSoup
from operator import itemgetter
from msedge.selenium_tools import Edge, EdgeOptions
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException


#get university data from website
class SampleICU:
  #initialize class
  def __init__(self):    
    self.link = 'https://www.4icu.org/cd/' #web page link
    self.options = EdgeOptions()
    self.options.use_chromium = True    
    self.driver = Edge(options=self.options)

    self.driver.get(self.link)
    self.page = None
    self.soup = None
    self.faculties = list()
    self.universities = list()
    self.keys = ["rank","french_name","location","faculties","postal_code","telephone","description","name","acronym","founded"]  

  #web scarpe html and append university faculty data to list  
  def extract_faculties(self):
    try:
      table = self.soup.find_all('table')
      paragraphs = table[len(table) - 1].find_all('p')
      if len(paragraphs) != 2: return None #number of elements in factories div
      else: return [x.getText() for x in paragraphs[1].find_all('strong')]
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
    try: return [postal_code.getText(),telephone.getText(),description.getText()]
    except: return None

  #find element by link name, click on link and change pages
  def navigate_to_page(self,name):
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
  def get_university_data(self,university):
    if not self.navigate_to_page(university[1]): self.driver.quit()
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
    return True
    #if uni[0].getText().isnumeric(): return True
    #else: return False 

  #get text of ranked university
  def ranked(self,rankings):
    return [rankings[t].getText() for t in range(len(rankings))]

  #for all ranked rows in table getText
  def get_table_ranks(self,table_rank):
    return [self.ranked(table_rank[x].find_all('td')) for x in range(2,10) if self.is_ranked(table_rank[x].find_all('td'))]
    #return [self.ranked(table_rank[x].find_all('td')) for x in range(2,len(table_rank) - 1) if self.is_ranked(table_rank[x].find_all('td'))]

  #web scrape universities rank data
  def extract_ranked_universities(self,link):
    self.page = requests.get(link)
    self.soup = BeautifulSoup(self.page.content,'html.parser')
    table_rank = self.soup.find_all('tr')
    ranked = self.get_table_ranks(table_rank)
    return ranked

  #match value in array with key
  def match_key_value(self,unis):
    data = {}
    for count,value in enumerate(self.keys): data[value] = unis[count]
    return data

  #return set of faculties in each university
  def add_faculties(self,faculties):
    try: 
      facts = faculties['faculties'] 
      if facts:
        for f in list(facts): self.faculties.append(f)
    except: 
      print("Error occured, could not extract faculties.")

  #write all data to xml files
  def write_file_xml(self,data,filename):
    xml = dicttoxml.dicttoxml(data)
    dom = parseString(xml).toprettyxml()
    try: 
      with open(filename,'w') as f:
        f.write(dom)
    except: print("Error occured, failed to write file " + filename)

  #get all ranked universities 
  def extract_uni_data(self):
    data = [self.get_university_data(x) for x in self.extract_ranked_universities(self.link)]
    return sorted([self.match_key_value(x) for x in data],key=itemgetter('rank'))

  #extract all universities data from website
  def extract_uni_data_to_xml(self,university,faculty):
    self.universities = self.extract_uni_data()
    [self.add_faculties(self.universities[x]) for x in range(len(self.universities))]
    self.write_file_xml(self.universities,university)
    self.write_file_xml({"faculties": sorted(set(self.faculties))},faculty)



#program execute
if __name__ == "__main__":
  university = 'universities.xml'
  faculty = 'faculties.xml'
  sample = SampleICU()
  sample.extract_uni_data_to_xml(university,faculty)
  sample.driver.quit()
  
