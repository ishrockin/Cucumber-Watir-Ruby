class GuidesPage
  attr_accessor :accessMyBuyingGuidesLink, :verifyMyBuyingGuidesLink

  def initialize(browser)
    @browser = browser
    #@accessMyBuyingGuidesLink = @browser.link(:text => 'Access My Buying Guide')
    @verifyMyBuyingGuidesLink = @browser.link(:text => 'Buying Process')
  end

  #def clickAccessMyBuyingGuidesLink()
    #@accessMyBuyingGuidesLink.wait_until_present.click
  #end

  def verifyMyBuyingGuidesLink()
    @verifyMyBuyingGuidesLink.wait_until_present
  end
end
