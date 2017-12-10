class UrlParser

  def initialize(new_url)
    @new_url = new_url
  end

  def scheme
    return @new_url.split(":")[0]
  end

  def domain
    return @new_url.split("/")[2].split(":")[0]
  end

  def port
    return @new_url.split("/")[2].split(":")[1]
  end

  def path
    return @new_url.split("/")[3].split("?")[0]
  end

  def query_string
    @url_array = [@new_url.split("?")[1].split("=")[0], @new_url.split("?")[1].split("=")[1].split("&")[0], @new_url.split("?")[1].split("=")[1].split("&")[1], @new_url.split("?")[1].split("=")[2].split("#")[0]]

    Hash[*@url_array]
  end

  def fragment_id
    return @new_url.split("#")[1]
  end

end

# rspec ./spec/url_parser_spec.rb:11 # UrlParser with all parts when instantiated should be a member of the UrlParser class
# rspec ./spec/url_parser_spec.rb:15 # UrlParser with all parts should have a scheme attribute
# rspec ./spec/url_parser_spec.rb:19 # UrlParser with all parts should have a domain attribute
# rspec ./spec/url_parser_spec.rb:23 # UrlParser with all parts should have a port attribute with the given port number
# rspec ./spec/url_parser_spec.rb:27 # UrlParser with all parts should have a path attribute
# rspec ./spec/url_parser_spec.rb:31 # UrlParser with all parts should have a query string attribute that should return a hash of query params
# rspec ./spec/url_parser_spec.rb:36 # UrlParser with all parts should have a fragment id attribute
# rspec ./spec/url_parser_spec.rb:46 # UrlParser with no path should return a nil path
# rspec ./spec/url_parser_spec.rb:50 # UrlParser with no path should be able to have a query string at the root path
# rspec ./spec/url_parser_spec.rb:54 # UrlParser with no path should be able to have a fragment id at the root path
# rspec ./spec/url_parser_spec.rb:60 # UrlParser with a special case with no port number and a http scheme should default to port 80
# rspec ./spec/url_parser_spec.rb:64 # UrlParser with a special case with no port number and a https scheme should default to port 443
# rspec ./spec/url_parser_spec.rb:68 # UrlParser with a special case a query sting with duplicate params should only return one key value pair
