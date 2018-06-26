class CookiePolicy

  URL = 'https://www.berkeleygroup.co.uk'

  def initialize(browser)
    @browser = browser
    @popup_text = @browser.div(:class => 'cookie-message')
    @cookie_settings = @browser.link(:text => 'change your cookie settings')
    @cookie_policy_page = @browser.element(:xpath => 'html/body/div[1]/div/div/div/div/div/section/div/h1')
    @popup_close = @browser.img(:src => '/assets/images/icon-facebox-close-white.png')
    @verifypopupclose = @browser.div(:class => 'cookie-message')
  end

  def visit
    @browser.goto URL
    @browser.window.maximize
    @popup_text.wait_until_present
    @browser.screenshot.save 'C:\AutomationProject\features\screenshots\CookiePolicy.png'
  end

  def notification_text
    @popup_text.strong.text
  end

  def cookie_settings
    @cookie_settings.click
  end

  def cookiepolicypage
    @cookie_policy_page.text
    end

  def notification_close
    @popup_close.click
  end

  def verify_popupclose
    @verifypopupclose.strong.text
  end
end