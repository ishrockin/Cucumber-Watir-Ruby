class MyHomePlusLogin
  attr_accessor :emailMHP, :passwordMHP, :signInBtnMHP, :viewMyProperties, :property2Link

  URL = 'https://www.berkeleygroup.co.uk/my-home/sign-in'

  def initialize(browser)
    @browser = browser
    @emailMHP = @browser.element(:id => 'SIGNIN_EMAIL')
    @passwordMHP = @browser.element(:id => 'SIGNIN_PASSWORD')
    @signInBtnMHP = @browser.element(:id => 'SIGNIN_FORMACTION_FINISH')
    @viewMyProperties = @browser.link(:text => "View my properties")
    #@property2Link = @browser.td(:text => '2').parent.a(:class => 'action black expandview')
  end

  def visit
    @browser.goto URL
  end

  def enterEmailMHP(email)
    @emailMHP.send_keys email
  end

  def enterPwdMHP(password)
    @passwordMHP.send_keys password
  end

  def clickSignInBtnMHP()
    @signInBtnMHP.wait_until_present.click
  end

  def clickViewMyProperties()
    @viewMyProperties.wait_until_present.click
  end

  # def clickProperty2Link()
  #   @property2Link.wait_until_present.click
  # end
end
