class Rest
  def self.get(url: url, options: options, headers: headers)
    HTTParty.get(url, query: options, basic_auth: headers)
  end
end



