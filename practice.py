from lib2to3.pgen2 import driver

from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

# Initialize the WebDriver (example for Chrome)
driver = webdriver.Chrome()
# Increase the implicit wait time
driver.implicitly_wait(10)
def div_list(dropdown, options, index_to_select):
    time.sleep(5)
    # Locate the dropdown element (the div that acts as the dropdown)
    dropdown = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div'))
    )

   # dropdown = driver.find_element(By.XPATH, '//*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div')
    # Click on the dropdown to open it
    dropdown.click()
    # Locate the options within the dropdown
    options = dropdown.find_elements(By.XPATH, '//*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div/div[1]')

    # Select the option by index (example: select the second option, which is index 1)
    index_to_select = 0
    options[index_to_select].click()
