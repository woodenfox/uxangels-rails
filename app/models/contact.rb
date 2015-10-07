require 'cgi' #Required to pull in URL Paremeters

class Contact < MailForm::Base
  #params = CGI.parse(URI.parse("http://www.cat.com/?cat=CatGo&dog=2").query)
    
  # attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  
  
  def headers
    {
      :subject => "Contact from UX Angels",
      :to => "woodenfox@gmail.com",
      :from => %(<#{email}>)
      # :from => %("#{name}" <#{email}>)
    }
  end
end