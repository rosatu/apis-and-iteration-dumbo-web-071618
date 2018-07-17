require 'rest-client'
require 'json'
require 'pry'



def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters.body)
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  individual_character_info = character_hash["results"].find do |character_info_hash|
    character_info_hash["name"].downcase == character
  end
  # collect those film API urls
  films_array = individual_character_info["films"]
  # make a web request to each URL to get the info
  #  for that film
  #first_film = RestClient.get(films_array[0])
  #films_hash = JSON.parse(first_film.body)
  films_hash = films_array.map {|url| JSON.parse(RestClient.get(url).body)}
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end
  # if don't run through cl, it doesn't downcase name. unless we write downcase, noMethod error
def parse_character_movies(films_hash)
#this films_hash works because we define it in the show_character_movies method and call that method in run.rb
  films_hash.map do |film_info|
    puts film_info["title"]
  end
  # we are putting the return after this end because otherwise it will break the loop
  return nil
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
