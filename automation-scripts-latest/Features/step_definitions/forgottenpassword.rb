require 'watir'
require 'cucumber'
require 'watir/wait'
$browser

Given(/^I am on Forgotten Your Password$/) do
  #ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  $browser=Watir::Browser.new :firefox
  $browser.window.maximize
  $browser.goto 'https://www.berkeleygroup.co.uk/forgotten-password'
end

Then(/^I should be able to see Email$/) do
  if not $browser.text_field(:id,"FORGOTTENPASSWORD_EMAIL").exists?
  then
    puts "I can't see Email textfield, page must not have loaded correctly"
  else
    puts "Email text field is present."
  end
end

When(/^I enter valid input$/) do
  $browser.text_field(:id, 'FORGOTTENPASSWORD_EMAIL').set ('test@gmail.com')
end

And(/^I click Request password change$/) do
  $browser.button(:id,"FORGOTTENPASSWORD_FORMACTION_FINISH").click
  sleep (5)
end

Then(/^I should be able to see Resetting your password$/) do
  if $browser.text.include?("Resetting your Password")
    puts 'Resetting your Password'
  else
    puts 'Not in Resetting your Password'
  end
  $browser.close
end