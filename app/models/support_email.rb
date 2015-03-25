class SupportEmail < ActiveRecord::Base
  before_validation :add_recipient
  validates_presence_of :sender, :recipient, :body
  before_save :setup_mail
  validate :email_format

  MAIL_OPTIONS = {
    :address       => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'http://thatecho.co/',
    :user_name            => ENV["ECHO_GMAIL"],
    :password             => ENV["ECHO_PASSWORD"],
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }

  def build_email
    args = {
      :to      =>  self.recipient,
      :subject =>  self.subject,
      :from    =>  self.sender,
      :body    =>  "#{self.sender} reports:\n #{self.body}"
    }
    Mail.new(args)
  end

  private

  def add_recipient
    self.recipient = ENV["ECHO_GMAIL"]
  end

  def setup_mail
    Mail.defaults do
      delivery_method(:smtp, MAIL_OPTIONS)
    end
  end

  def email_format
    unless /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.match(sender)
      errors.add(:sender, "must be a valid email address")
    end
  end

end
