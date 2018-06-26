class TenantAccountPage
  attr_accessor :createATenantAccountLink, :createAccountButton, :titleFieldList , :firstNameTextField, :lastNameTextField, :emailTextField, :confirmEmailTextField, :createAccountButton, :verifyThankYouMessage

  def initialize(browser)
    @browser = browser
    @createATenantAccountLink = @browser.element(:xpath => '//*[@id="mmContent"]/div/div/div/section[8]/div/div/div/div/div[1]/p[2]/a')
    @titleFieldList = @browser.element(:id => 'MYHOMEPLUSCREATEACCOUNT_TITLE')
    @firstNameTextField = @browser.text_field(:id => 'MYHOMEPLUSCREATEACCOUNT_FIRSTNAME')
    @lastNameTextField = @browser.text_field(:id => 'MYHOMEPLUSCREATEACCOUNT_LASTNAME')
    @emailTextField = @browser.text_field(:id => 'MYHOMEPLUSCREATEACCOUNT_EMAIL')
    @confirmEmailTextField = @browser.text_field(:id => 'MYHOMEPLUSCREATEACCOUNT_EMAILCONFIRM')
    @createAccountButton = @browser.button(:id => 'MYHOMEPLUSCREATEACCOUNT_FORMACTION_FINISH')
    @verifyThankYouMessage = @browser.element(:text => 'Your tenant will receive an email to direct them to login to MyHome Plus.')
      end

  def visit
    @browser.goto URL
  end

  def clickCreateATenantAccountLink()
    @createATenantAccountLink.click
  end

  def enterTextInTextField(titletext, firstnametext, lastnametext, emailtext)
    @titleFieldList.send_keys titletext
    @firstNameTextField.set firstnametext
    @lastNameTextField.set lastnametext
    @emailTextField.set emailtext
    @confirmEmailTextField.set emailtext
    @createAccountButton.click
  end

  def verifyMessage()
    @verifyThankYouMessage.wait_until_present
  end
end