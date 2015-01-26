module EchoFactory

  def self.construct_echo(json_obj)
    args = self.sanitize_json(json_obj)

    echo = Echo.new(args[:echo])
    return echo
  end

  def self.sanitize_json(json_obj)
    if json_obj.class == String
      json_obj = JSON parse json_obj
    end

    json_obj[:long_url] = json_obj[:long_url]
    json_obj[:short_url] = self.shorten_url(json_obj[:long_url])
    #more once we figure out what is sent
    json_obj = self.echo_params(json_obj)
    safe_args = {echo: json_obj}
    return safe_args
  end

  def self.shorten_url(long_url)
    clean_url = sanitize_url(long_url)
    return Bitly.client.shorten(long_url).short_url
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
