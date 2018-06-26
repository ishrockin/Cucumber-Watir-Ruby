require 'watir'
require 'rubygems'
require 'cucumber'
require 'page-object'
require 'cucumber/rb_support/rb_hook'
require 'rspec/expectations'
require 'rspec'

caps = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)

Given(/^I am logged into myhomeplus$/) do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  @browser = Watir::Browser.new :firefox, desired_capabilities: caps
  @browser.window.maximize
  @mhpLogin = MyHomePlusLogin.new(@browser)
  @mhpLogin.visit
  @mhpLogin.enterEmailMHP("webtestinvestorA@berkeleygroup.co.uk")
  @mhpLogin.enterPwdMHP("B3rke3ygr0u91t")
  @mhpLogin.clickSignInBtnMHP
  @mhpLogin.clickViewMyProperties
end

When(/^I am on Property page$/) do
  @browser.goto "https://www.berkeleygroup.co.uk/my-home/developments/testkhs/property-2"
end

And(/^I click on Access My Buying Guide$/) do
   #@guides = GuidesPage.new(@browser)
   #@guides.clickAccessMyBuyingGuidesLink
  @browser.goto "https://www.berkeleygroup.co.uk/my-home-plus/buying-guide?sitecode=A291&plotcode=P0002"
end

Then(/^I should be able to see My Buying Guide$/) do
   @guides = GuidesPage.new(@browser)
   @guides.verifyMyBuyingGuidesLink

  @browser.close
 end

