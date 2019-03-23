require "rubygems"
require "httparty"
class WelcomeController < ApplicationController
  include HTTParty
  def index
	response1 = HTTParty.get('https://swapi.co/api/films/')
	@response = JSON.parse(response1.body)

  end

    def search
	 	response1 = HTTParty.get('https://swapi.co/api/films/')
		response = JSON.parse(response1.body)
		@films = response["results"]
    	@parametros = params[:searchbox]
    	diccionario = []
    	url = 'https://swapi.co/api/people/?page=1'
    	while url != nil do
    		personas = HTTParty.get(url)
    		personas = JSON.parse(personas.body)
    		contenido = personas["results"]
    		diccionario.concat(contenido)
    		url = personas["next"]
    	end
    	@personas = diccionario
    	diccionario = []
    	url = 'https://swapi.co/api/planets/?page=1'
    	while url != nil do
    		personas = HTTParty.get(url)
    		personas = JSON.parse(personas.body)
    		contenido = personas["results"]
    		diccionario.concat(contenido)
    		url = personas["next"]
    	end
    	@planets = diccionario
    	diccionario = []
    	url = 'https://swapi.co/api/starships/?page=1'
    	while url != nil do
    		personas = HTTParty.get(url)
    		personas = JSON.parse(personas.body)
    		contenido = personas["results"]
    		diccionario.concat(contenido)
    		url = personas["next"]
    	end
    	@starships = diccionario
    	


    end
end
