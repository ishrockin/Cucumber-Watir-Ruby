class RegistrationPage
  attr_accessor :enquireLink, :titleFieldList , :firstNameTextField, :lastNameTextField, :emailTextField, :confirmEmailTextField, :createAccountButton, :verifyThankYouMessage

  URL = 'https://www.berkeleygroup.co.uk/new-homes/worcestershire/worcester/the-waterside-at-royal-worcester?userSearchID=af818ebb-a37f-4a88-9e53-b6cf96d53da2'

  def initialize(browser)
    @browser = browser
    @enquireLink = @browser.link(:text =>"Enquire")
    @cookiePolicy = @browser.element(:xpath => '//*[@id="mmContent"]/div[2]/p/span/img')
    @titleFieldList = @browser.element(:id => 'ENQUIRIESANDVIEWINGSSLIDEOUTFORM_TITLE')
    @firstNameTextField = @browser.text_field(:id => 'ENQUIRIESANDVIEWINGSSLIDEOUTFORM_FIRSTNAME')
    @lastNameTextField = @browser.text_field(:id => 'ENQUIRIESANDVIEWINGSSLIDEOUTFORM_LASTNAME')
    @emailTextField = @browser.text_field(:id => 'ENQUIRIESANDVIEWINGSSLIDEOUTFORM_EMAIL')
    @confirmEmailTextField = @browser.text_field(:id => 'ENQUIRIESANDVIEWINGSSLIDEOUTFORM_EMAILCONFIRM')
    @createAccountButton = @browser.button(:id => 'ENQUIRIESANDVIEWINGSSLIDEOUTFORM_FORMACTION_FINISH')
    @verifyThankYouMessage = @browser.element(:xpath => '//*[@id="ENQUIRIESANDVIEWINGSSLIDEOUTFORM_SUBMIT_RESPONSE"]/div')
  end

  def visit
    @browser.goto URL
  end

  def clickEnquireLink()
    @cookiePolicy.click
    @enquireLink.click
  end

  def enterTextInTextField(titletext, firstnametext, lastnametext, emailtext)
    @titleFieldList.send_keys titletext
    @firstNameTextField.set firstnametext
    @lastNameTextField.set lastnametext
    @emailTextField.set emailtext
    @confirmEmailTextField.set emailtext
  end

   def clickCreateAccountButton
    @createAccountButton.click
  end

  def verifyMessage()
    @thankYouMessage.wait_until_present
  end
end
