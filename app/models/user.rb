class User < ActiveRecord::Base
  has_many :echos
  before_save :account_defaults

  def drafts
    echos.select{|e| e.is_draft}
  end

  def twitter_history
    echos.select{|e| e.sent_to_venue.downcase == "twitter"}
  end

  def self.to_args(json_params)
    args = self.sanitize_json(json_params)
    return args
  end

  def accounts
    accounts = []
    accounts << "twitter" if twitter_on
    accounts << "facebook" if facebook_on
    return accounts.compact
  end

  private

  def self.sanitize_json(json_params)
    hash = JSON.parse(json_params.first[0])
    safe_args = {}

    safe_args[:twitter_on] = hash.fetch("twitter_on", true)
    safe_args[:facebook_on] = hash.fetch("facebook_on", true)
    safe_args[:facebook_char_floor] = hash.fetch("facebook_char_floor", true)
    safe_args[:always_link] = hash.fetch("always_link", true)
    safe_args[:google_credentials] = hash.fetch("google_credentials")

    user_args = self.user_params_only(safe_args)
    return user_args
  end

  def self.user_params_only(json_hashified)
    permitted = User.new.attributes.keys
    return json_hashified.select{|k,v| permitted.include?(k.to_s)}
  end

  def self.generate_token
    ary = (0..9).to_a + ('a'..'z').to_a
    ary.shuffle.slice(0, 25).join
  end

  def account_defaults
    self.twitter_on = true unless self.twitter_on == false
    self.facebook_on = true unless self.facebook_on == false
  end
end
