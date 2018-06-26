require 'watir'
require 'cucumber'
require 'rubygems'
require 'page-object'
require 'cucumber/rb_support/rb_hook'
require 'rspec/expectations'
require 'rspec'
require 'nokogiri'
require 'open-uri'

$doc
@expectedRobotTextBlock = Array.new


@actualRobotTextBlock = Array.new

caps = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)

Given(/^I navigate to the robots\.txt page$/) do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  @browser = Watir::Browser.new :firefox, desired_capabilities: caps
  @robotFiles = RobotsFilePage.new(@browser)
  @robotFiles.visit
end

Then(/^I should be able to see xml block$/) do
  $doc = Nokogiri::HTML(open('https://www.berkeleygroup.co.uk/robots.txt'))
  @actualRobotTextBlock = [$doc.content]

  @expectedRobotTextBlock = ['User-agent: MJ12bot\r\nDisallow: /\r\n\r\nUser-agent: AhrefsBot \r\nDisallow: /\r\n\r\nUser-agent: Sosospider\r\nDisallow: /\r\n\r\nUser-agent: ccbot\r\nCrawl-delay: 60\r\n\r\nUser-agent: Zing-BottaBot/1.0\r\nDisallow: /\r\n\r\nUser-agent: Zing-BottaBot/2.0\r\nDisallow: /\r\n\r\nUser-agent: Yandex\r\nDisallow: /\r\nCrawl-delay: 300\r\n\r\nUser-agent: rogerbot\r\nDisallow: /\r\nCrawl-delay: 300\r\n\r\nUser-agent: Mozilla/4.0+(compatible;+MSIE+4.01;+Windows+NT;+MS+Search+6.0+Robot)\r\nDisallow: /\r\n\r\nUser-agent: 008\r\nDisallow: /\r\n\r\nUser-agent: sistrix\r\nDisallow: /\r\n\r\nUser-agent: grapeshot\r\nDisallow: /\r\n\r\nUser-agent: WordPress*\r\nCrawl-delay: 10\r\n\r\nUser-agent: proximic\r\nDisallow: /\r\n\r\nUser-agent: MaxPoint Bot\r\nDisallow: /\r\n\r\nUser-agent: MaxPointCrawler\r\nDisallow: /\r\n\r\nUser-agent: Sistrix Crawler\r\nDisallow: /\r\n\r\nUser-agent: HTTrack\r\nDisallow: /\r\n\r\nUser-agent: RavenCrawler\r\nDisallow: /\r\n\r\nUser-agent: ZumBot*\r\nDisallow: /\r\n\r\nUser-agent: SputnikBot\r\nDisallow: /\r\n\r\nUser-agent: Sputnik\r\nDisallow: /\r\n\r\nUser-agent: SputnikBot/2.3\r\nDisallow: /\r\n\r\nUser-agent: spbot\r\nDisallow: /\r\n\r\nUser-agent: spbot/4.0.9\r\nDisallow: /\r\n\r\nUser-agent: ia_archiver\r\nDisallow: /\r\nCrawl-delay: 90\r\n\r\nUser-agent: BLEXBot\r\nDisallow: /\r\n\r\nUser-agent: Spinn3r\r\nDisallow: /\r\n\r\nUser-agent: crawler4j\r\nDisallow: /\r\nCrawl-delay: 90\r\n\r\nUser-agent: Diffbot/0.1\r\nDisallow: /\r\nCrawl-delay: 300\r\n\r\nUser-agent: 360Spider\r\nDisallow: /\r\n\r\nUser-agent: Caliperbot/1.0\r\nCrawl-delay: 5\r\n\r\nUser-agent: Sogou+web+spider/4.0\r\nDisallow: /\r\n\r\nUser-agent: dotbot\r\nDisallow: /\r\n\r\nUser-agent: Deep-Crawl\r\nDisallow: /\r\n\r\nUser-agent: *\r\nDisallow: /assets/*\r\nAllow: /assets/css/\r\nAllow: /assets/js/\r\nAllow: /assets/images/\r\nSitemap: https://www.berkeleygroup.co.uk/media/sitemap/sitemap-index.xml\r\n']

  puts @expectedRobotTextBlock

  if (@expectedRobotTextBlock == @actualRobotTextBlock)
    puts 'Sucess'
  else
    puts 'FAILED'
  end

  puts @actualRobotTextBlock

  @browser.close
end