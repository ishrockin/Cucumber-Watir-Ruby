require 'watir'
require 'rubygems'
require 'cucumber'
require 'page-object'
require 'cucumber/rb_support/rb_hook'
require 'rspec/expectations'
require 'rspec'

caps = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)

Given(/^I am on Commercial Overview Page$/) do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  @browser = Watir::Browser.new :firefox, desired_capabilities: caps
  @browser.window.maximize
  @CommercialOverviewPage = CommercialOverviewPage.new(@browser)
  @CommercialOverviewPage.visit
end

When(/^I click on View Commercial Opportunities Link$/) do
  @CommercialOverviewPage.ClickViewCommercialOpportunitiesLink
end

Then(/^I should navigate to Commercial Developments page$/) do
  @CommercialOverviewPage.verifyCommercialDevelopments
end

And(/^I click View Commercial button$/) do
  @CommercialOverviewPage.ClickViewCommercialButton
end

Then(/^It should navigate to the selected Commercial Development page$/) do
  puts 'success'

  @browser.close
end
