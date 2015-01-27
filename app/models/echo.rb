class Echo < ActiveRecord::Base
  belongs_to :user

  def self.to_args(json_params)
    args = self.sanitize_json(json_params)
  end

  private

  def self.sanitize_json(json_obj)
    received = JSON.parse json_obj.first[0]
    hash = {}
    hash[:is_draft] = received.fetch("is_draft", true)
    hash[:body] = received.fetch("body", "")

    hash[:long_url] = self.sanitize_url( received.fetch("url") )
    hash[:short_url] = self.short_url

    return hash
  end

  def self.short_url
    salt = (0..5).map{|n| rand(36).to_s(36) }.join
    "#{url_redirect_path}/#{salt}"
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