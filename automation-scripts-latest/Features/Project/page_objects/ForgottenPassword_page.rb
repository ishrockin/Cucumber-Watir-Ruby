class ForgottenPasswordPage
  attr_accessor :forgottenPasswordLink, :emailTextField , :requestPasswordButton, :resettingPasswordConfirmation

  URL = 'https://bau.d.berkeleygroup.co.uk/my-home/sign-in'

  def initialize(browser)
    @browser = browser
    #@forgottenPasswordLink = @browser.a(:href => '/forgotten-password')
    @forgottenPasswordLink = @browser.element(:xpath => '//*[@id="SIGNIN_FIELD9"]/div/div/p/a')
    @emailTextField = @browser.text_field(:id => 'FORGOTTENPASSWORD_EMAIL')
    @requestPasswordButton = @browser.button(:id => 'FORGOTTENPASSWORD_FORMACTION_FINISH')
    @resettingPasswordConfirmation = @browser.h1(:text => 'Resetting your Password')
  end

  def visit
    @browser.goto URL
  end

  def clickForgottenPasswordLink()
    @forgottenPasswordLink.wait_until_present.click
  end

  def enterEmailTextField(text)
    @emailTextField.set text
  end

  def clickRequestPasswordButton
    @requestPasswordButton.click
  end

  def verifyForgottenPasswordHeader()
    @requestPasswordButton.wait_until_present
  end

  def verifyResettingPasswordConfirmation()
    @resettingPasswordConfirmation.wait_until_present
  end
end
