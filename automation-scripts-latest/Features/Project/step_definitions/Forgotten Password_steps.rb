require 'watir'
require 'rubygems'
require 'cucumber'
require 'page-object'
require 'cucumber/rb_support/rb_hook'
require 'rspec/expectations'
require 'rspec'
@str='Resetting your Password'

caps = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)

Given(/^I am on my home sign in page$/) do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  @browser = Watir::Browser.new :firefox,  desired_capabilities: caps
  @browser.window.maximize
  @ForgottenPasswordPage = ForgottenPasswordPage.new(@browser)
  @ForgottenPasswordPage.visit
end

And(/^I click on Forgotten password link$/) do
  @ForgottenPasswordPage.clickForgottenPasswordLink
end

Then(/^I should be on Forgotten password page$/) do
  @ForgottenPasswordPage.verifyForgottenPasswordHeader
end

When(/^I enter valid input$/) do
  @ForgottenPasswordPage.enterEmailTextField("test@gmail.com")
end

And(/^I click Request password change$/) do
  @ForgottenPasswordPage.clickRequestPasswordButton
end

Then(/^I should be able to see Resetting your password$/) do
  puts @ForgottenPasswordPage.verifyResettingPasswordConfirmation.text
  if  @ForgottenPasswordPage.verifyResettingPasswordConfirmation.text == @str
    puts 'TestPassed'
  else
    puts 'TestFailed'
  end
@browser.close
end