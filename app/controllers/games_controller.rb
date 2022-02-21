require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    @api_response = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{params[:word]}").read)
    @word_exists = @api_response["found"]

    # @contains_letters = true
    # params[:word].split("").each do |char|
    #   @contains_letters = params[:letters].include?(char)
    #   break unless @contains_letters
    # end

    @contains_letters = params[:word].split('').all? { params[:letters].include?(_1) }

    @has_won = @word_exists && @contains_letters
  end
end
