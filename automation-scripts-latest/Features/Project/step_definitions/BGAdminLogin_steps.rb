require 'watir'
require 'rubygems'
require 'cucumber'
require 'page-object'
require 'cucumber/rb_support/rb_hook'
require 'rspec/expectations'
require 'rspec'

caps = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)

Given(/^I navigate to the login page$/) do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  @browser = Watir::Browser.new :firefox, desired_capabilities: caps
  @browser.window.maximize
  @BGAdminLoginPage = BGAdminLoginPage.new(@browser)
  @BGAdminLoginPage.visit
end

When(/^I enter a valid username$/) do
  @BGAdminLoginPage.enterUsername(‘Ishan Soni’)
end

When(/^I enter a valid password$/) do
  @BGAdminLoginPage.enterPassword('Password1')
end

And(/^I click Login$/) do
  @BGAdminLoginPage.clickLoginButton
end

Then(/^I should be navigated to the Dashboard$/) do
  @BGAdminLoginPage.verifyDashboardHeader
  @browser.screenshot.save 'C:\AutomationProject\features\screenshots\BGAdmin.png'
  if @BGAdminLoginPage.verifyPageHeader.text.should == 'BERKELEY GROUP ADMINISTRATION'
  #@str = @BGAdminLoginPage.verifyPageHeader.text
  #if @str == 'BERKELEY GROUP ADMINISTRATION'
    puts 'Logged in successfully and the Dashboard page displays text ' + @BGAdminLoginPage.verifyPageHeader.text
  else
    puts 'TEST FAILED - Could not find exact text match'
  end
  @browser.close
end
