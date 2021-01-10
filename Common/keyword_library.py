from robot.libraries.BuiltIn import BuiltIn

def get_current_driver():
    return BuiltIn().get_library_instance('Selenium2Library').driver

def clear_local_storage():
    driver = get_current_driver()
    current_url = driver.current_url
    if current_url != 'about:blank':
        driver.delete_all_cookies()
        driver.execute_script('window.localStorage.clear();')