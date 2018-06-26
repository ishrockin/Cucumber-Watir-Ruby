require 'watir'
require 'rubygems'
require 'cucumber'
require 'page-object'
require 'cucumber/rb_support/rb_hook'
require 'rspec/expectations'
require 'rspec'

caps = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)

Given(/^I am logged into Myhomeplus$/) do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  @browser = Watir::Browser.new :firefox, desired_capabilities: caps
  @browser.window.maximize
  @mhpLogin = MyHomePlusLogin.new(@browser)
  @mhpLogin.visit
  @mhpLogin.enterEmailMHP("webtestinvestorA@berkeleygroup.co.uk")
  @mhpLogin.enterPwdMHP("B3rke3ygr0u91t")
  @mhpLogin.clickSignInBtnMHP
  @mhpLogin.clickViewMyProperties
  @tenantAccount = TenantAccountPage.new(@browser)
end

And(/^I am on property page$/) do
  @browser.goto "https://www.berkeleygroup.co.uk/my-home/developments/testkhs/property-2"
  sleep(5)
end


And(/^I click on Create a tenant account$/) do
  @tenantAccount.clickCreateATenantAccountLink
end

And(/^I should complete & submit the create account form$/) do
  @tenantAccount.enterTextInTextField("Mr", "test", "test","test10@gmail.com")
end

Then(/^I should be able to see Thank you message$/) do
  @tenantAccount.verifyMessage

  @browser.close
end