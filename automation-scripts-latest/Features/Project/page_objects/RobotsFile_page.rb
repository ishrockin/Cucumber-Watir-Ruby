class RobotsFilePage
  attr_accessor :RobotTxtBlock

  URL = 'https://www.berkeleygroup.co.uk/robots.txt'

  def initialize(browser)
    @browser = browser
    @RobotTxtBlock = @browser.element(:xpath => "xhtml:html/xhtml:body/xhtml:pre")
  end

  def visit
    @browser.goto URL
  end

  def verifyRobotTxtBlock()
    @RobotTxtBlock.wait_until_present
    #@browser.text.include? "yahoo"
  end
end
