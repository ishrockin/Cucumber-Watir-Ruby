require 'watir'
require 'rubygems'
require 'cucumber'
require 'nokogiri'
require 'open-uri'

$browser
$doc

Given(/^The Sitemap creator schedule task is run$/) do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  $browser = Watir::Browser.new :firefox
  $browser.window.maximize
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end

When(/^I navigate to the Sitemap xml file$/) do
  #$browser.goto ('https://www.berkeleygroup.co.uk/sitemap.xml')
  $browser.goto ('https://www.berkeleygroup.co.uk/media/sitemap/sitemap-index.xml')
  #$browser.screenshot.save 'C:\AutomationProject\features\screenshots\Sitemap.png'
  $browser.screenshot.save 'C:\AutomationProject\features\screenshots\SitemapIndex.png'
  #$doc = Nokogiri::HTML(open('https://www.berkeleygroup.co.uk/sitemap.xml'))
  $doc = Nokogiri::HTML(open('https://www.berkeleygroup.co.uk/media/sitemap/sitemap-index.xml'))
end

Then(/^I should see the correct location urls$/) do
  #@str = $doc.xpath('//url[1]//loc').text -- to get the first node loc value
  #puts @str

  #if $doc.xpath('//url[1]//loc').text.include?'https://www.berkeleygroup.co.uk'
    #puts 'Test Passed'
  #else
    #puts 'Test Fail'
  #end

  #$doc.xpath('//url//loc').each do |node| - this is for Sitemap.xml
    #puts node.content + "\n"
  #end

  $doc.xpath('//sitemap//loc').each do |node| #this is for SitemapIndex.xml
    puts node.content + "\n"
  end

  #$siteMapLinks = $doc.xpath('//url//loc').inner_text -- gets all the loc node values
   # puts $siteMapLinks.to_s + "\n"
   $browser.close
end