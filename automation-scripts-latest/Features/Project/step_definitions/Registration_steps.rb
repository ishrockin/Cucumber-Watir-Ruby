require 'watir'
require 'rubygems'
require 'cucumber'
require 'page-object'
require 'cucumber/rb_support/rb_hook'
require 'rspec/expectations'
require 'rspec'

caps = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)

Given(/^I am on selected Development$/) do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  @browser = Watir::Browser.new :firefox, desired_capabilities: caps
  @browser.window.maximize
  @registration = RegistrationPage.new(@browser)
  @registration.visit
end

And(/^I click on Enquire link$/) do
  @registration.clickEnquireLink
end

When(/^I fill out textField with text$/) do
  @registration.enterTextInTextField("Mrs","Internet_test","Test_test","test@gmail.com")
end

When(/^I click on Submit$/) do
  @registration.clickCreateAccountButton
end

Then(/^I should see Thank You message$/) do
  @registration.verifyMessage

  @browser.close
end

