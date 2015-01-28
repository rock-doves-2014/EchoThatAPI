class Echo < ActiveRecord::Base
  validates_uniqueness_of :short_url
  after_create :make_short_url

  belongs_to :user

  def self.to_args(json_params)
    args = self.sanitize_json(json_params)
  end

  def make_short_url
    salt = (0..5).map{|n| rand(36).to_s(36) }.join
    id_part = self.id.to_s(36).upcase
    self.update_attribute(:short_url, salt + id_part)
  end

  private

  def self.sanitize_json(json_obj)
    received = JSON.parse json_obj.first[0]
    hash = {}
    hash[:is_draft] = received.fetch("is_draft", true)
    hash[:body] = received.fetch("body", "")

    hash[:long_url] = received.sanitize_url( received.fetch("url") )

    return hash
  end

  def self.sanitize_url(url)
    if /\?/.match(url) && !(/\/\?/.match(url))
      return url.gsub("?","/?")
    else
      return url
    end
  end

  def self.echo_params(json_hashified)
    permitted = Echo.new.attributes.keys
    return json_hashified.select{|k,v| permitted.include?(k.to_s)}
  end

end