require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    @word_exists = URI.open("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
    @word_exists = JSON.parse(@word_exists.read)
    @word_exists = @word_exists["found"]
  end
end
