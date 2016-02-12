class PokemonApi
  POKEMON_API_URL = "http://pokeapi.co/api/v1"
  REQUEST_DEFAULTS = { :parse? => true }

  def self.uri(path)
    url_string = "#{POKEMON_API_URL}/#{path}/"
    return URI.parse(url_string)
  end

  def self.request(path, given_options = {})
    options = REQUEST_DEFAULTS.merge(given_options)

    uri = self.uri(path)
    response = Net::HTTP.get_response(uri)
    body = response.body

    if options[:parse?]
      body = JSON.parse(body)
    end

    return body
  end
end
