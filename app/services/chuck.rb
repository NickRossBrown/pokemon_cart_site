require 'HTTParty'
require 'nokogiri'
require 'pry'

require 'rest-client'

class Chuck

  attr_accessor :parse_page

  def initialize (chuck_norris)
    @chuck_norris = chuck_norris
  end

  def scrape_website
    binding.pry
    response = RestClient.get('https://api.pokemontcg.io/v1/cards?nationalPokedexNumber=4')
    parse_response = JSON.parse(response)
    doc = HTTParty.get("https://quotesnhumor.com/top-30-chuck-norris-jokes/")
    parse_doc = JSON.parse(doc)
    parse_doc.css(‘.content’)
    parse_page = nokogiri::HTML(doc)
    binding.pry
    page = Nokogiri::HTML(open("https://quotesnhumor.com/top-30-chuck-norris-jokes/"))
  end


doc = HTTParty.get("https://quotesnhumor.com/top-30-chuck-norris-jokes/")
page = Nokogiri::HTML(doc)
stuff = page.css('div.wp-caption').css("img").each{|pic| pic_array.push(pic["src"])}



end

@chuck = Chuck.new("yes")
@chuck.scrape_website
