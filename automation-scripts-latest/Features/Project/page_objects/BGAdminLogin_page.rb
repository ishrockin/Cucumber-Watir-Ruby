class BGAdminLoginPage
    attr_accessor :txtUsername, :txtPassword, :btnLogin, :verifyPageHeader

    URL = 'https://www.berkeleygroup.co.uk/bgadmin/login.cfm'

  def initialize(browser)
    @browser = browser
    @txtUsername = @browser.text_field(:id => 'txtUsername')
    @txtPassword = @browser.text_field(:id => 'txtPassword')
    @btnLogin = @browser.button(:value => 'Login')
    @verifyPageHeader = @browser.div(:class => 'widget_top')
  end

  def visit
    @browser.goto URL
  end

  def enterUsername(username)
    @txtUsername.set username
  end

  def enterPassword(password)
    @txtPassword.set password
  end

  def clickLoginButton
    @btnLogin.click
  end

  def verifyDashboardHeader()
    @verifyPageHeader.wait_until_present
  end
end