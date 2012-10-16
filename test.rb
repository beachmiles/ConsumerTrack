require "rubygems"
require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://google.com"

element = driver.find_element(:name, 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

# execute arbitrary javascript
puts driver.execute_script("return window.location.pathname")

# pass elements between Ruby and JavaScript
element = driver.execute_script("return document.body")
driver.execute_script("return arguments[0].tagName", element) #=> "BODY"

# wait for a specific element to show up
wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
wait.until { driver.find_element(:id => "foo") }

# switch to a frame
driver.switch_to.frame "some-frame" # name or id
driver.switch_to.frame driver.find_element(:id, 'some-frame') # frame element

# switch back to the main document
driver.switch_to.default_content

driver.quit

