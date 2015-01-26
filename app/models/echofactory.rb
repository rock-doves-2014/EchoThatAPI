require 'bitly'
module EchoFactory
  def create_echo(json_obj)
    json_obj.shortUrl = shorten_url(json_obj.url)
    #more
  end

  def shorten_url(long_url)
    clean_url = sanitize_url(long_url)
    Bitly.use_api_version_3
    #use bitly
  end

  def sanitize_url(url)
    if /\?/.match(url) && !(/\/\?/.match(url))
      return url.gsub("?","/?")
    else
      return url
    end
  end
end
