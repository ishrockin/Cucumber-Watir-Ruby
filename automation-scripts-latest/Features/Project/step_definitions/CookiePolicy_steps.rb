require 'watir'
require 'cucumber'
require 'rubygems'
require 'page-object'
require 'cucumber/rb_support/rb_hook'
require 'rspec/expectations'
require 'rspec'

caps = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)

Given(/^The browser cache is cleared$/) do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  @browser = Watir::Browser.new :firefox, desired_capabilities: caps
  @cp = CookiePolicy.new(@browser)
end

When(/^I navigate to the home page for the first time$/) do
  @cp.visit
end

Then(/^The Cookie Policy notification pop up window should be displayed$/) do
  if @cp.notification_text.should == 'The Berkeley Group PLC Cookie Policy'
    puts 'Cookie Policy Notification pop up window is displayed'
  else
    puts 'Does not show the Cookie Policy Window'
  end
end

And(/^The user clicks 'change your cookie setting' from the pop up window$/) do
  @cp.cookie_settings
end

Then(/^I should be navigated to Cookie Policy page with About Cookies tab highlighted$/) do
  if @cp.cookiepolicypage.should == 'Cookie Policy'
    puts 'I am on Cookie Policy page'
  else
    puts 'Oops something went wrong'
  end
end

And(/^I click the browser back button$/) do
  @browser.back
end

And(/^I click the close \(X\) button in the Cookie Policy notification pop up window$/) do
  @cp.notification_close
  sleep(3)
end

Then(/^The Cookie Policy notification pop up window should be closed$/) do
  if @cp.verify_popupclose.should == ''
    puts 'Cookie Policy Notification pop up closed successfully'
  else
    puts 'Oops something went wrong'
  end
  @browser.close
end