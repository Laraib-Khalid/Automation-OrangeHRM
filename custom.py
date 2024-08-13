from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword
import time

def div_list(dropdown_xpath, option_xpath, index_to_select):
    selenium_lib = BuiltIn().get_library_instance('SeleniumLibrary')
    time.sleep(5)

    # Locate the dropdown element (the div that acts as the dropdown)
    selenium_lib.wait_until_element_is_visible(dropdown_xpath, timeout=10)

    # Click on the dropdown to open it
    selenium_lib.click_element(dropdown_xpath)

    # Locate the options within the dropdown
    options = selenium_lib.get_webelements(option_xpath)

    try:
 # Select the option by index
        options[int(index_to_select)].click()

    except IndexError as e:
        raise IndexError(f"The specified index {index_to_select} is out of range. Available options: {len(options)}") from e

