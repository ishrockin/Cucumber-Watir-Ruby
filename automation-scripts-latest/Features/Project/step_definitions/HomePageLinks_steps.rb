require 'watir'
require 'cucumber'
$browser

Given(/^I navigate to the home page$/) do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  $browser = Watir::Browser.new :firefox
  $browser.window.maximize
  $browser.goto 'https://www.berkeleygroup.co.uk/'
end

When(/^I click the links on the page$/) do
  $browser.links(:class => 'page-article').map(&:title).each do |titles| #to get all the titles for the links on the page
    puts titles
  end
end

Then(/^I should be navigated to the page$/) do
  $browser.links(:class => 'page-article').map(&:href).each do |url| #to click all the links on the page
    $browser.goto url
    sleep (3)
    str = $browser.title.chomp ('| Berkeley Group')
    str.delete! (' ')
    puts 'I am on ' + str + ' page'
    $browser.screenshot.save 'C:\AutomationProject\features\HomePageLinks_Screenshots\ ' + str + '.png'
    sleep (3)
  end
  $browser.close
end