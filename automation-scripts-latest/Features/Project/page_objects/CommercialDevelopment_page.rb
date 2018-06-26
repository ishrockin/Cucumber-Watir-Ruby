class CommercialOverviewPage
  attr_accessor :viewCommercialOpportunitiesLink , :verifyCommercialDevelopments, :viewCommercialButton, :verifyDevelopmentPage

  URL = 'https://www.berkeleygroup.co.uk/property-developers/st-george/commercial-opportunities'

  def initialize(browser)
    @browser = browser
    @viewCommercialOpportunitiesLink = @browser.element(:xpath => '//*[@id="commercial"]/div/div/section/div/p[2]/a')
    @commercialDevelopments = @browser.h1(:text => 'Commercial Developments')
    @viewCommercialButton = @browser.element(:xpath => '//*[@id="mmContent"]/div/div/div[3]/div/div[2]/div/ul/li[1]/div[1]/div[2]/div[6]/a')
    @developmentPage = @browser.h1(:text => 'London Dock Commercial Opportunities')
  end

  def visit
    @browser.goto URL
  end

  def ClickViewCommercialOpportunitiesLink()
    @viewCommercialOpportunitiesLink.wait_until_present.click
  end

  def ClickViewCommercialButton()
    @viewCommercialButton.click
  end

  def VerifyCommercialDevelopments()
    @commercialDevelopments.wait_until_present
end

  def VerifyDevelopmentPage()
    @developmentPage.wait_until.present
  end
end
