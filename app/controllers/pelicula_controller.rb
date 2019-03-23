require "rubygems"
require "httparty"

class PeliculaController < ApplicationController
  include HTTParty
  def index

    
  	self.params = params.permit!
	@urls =  params[:informacion]
	@title = @urls["title"]
	@episode = @urls["episode_id"]
	@description = @urls["opening_crawl"]
	@director = @urls["director"]
	@producer = @urls["producer"]
	@año = @urls["release_date"]
	@character = @urls["characters"]


    @characters = []   
        diccionario = []
        url = 'https://swapi.co/api/people/?page=1'
        while url != nil do
            personas = HTTParty.get(url)
            personas = JSON.parse(personas.body)
            contenido = personas["results"]
            diccionario.concat(contenido)
            url = personas["next"]
        end
        url_c = diccionario
    url_c.each do |c| 
    	if @character.include? c["url"] 
    		@characters.push(c)
        end	
    end
    @planet = @urls["planets"]
    @planets = []  
        diccionario = []
        url = 'https://swapi.co/api/planets/?page=1'
        while url != nil do
            personas = HTTParty.get(url)
            personas = JSON.parse(personas.body)
            contenido = personas["results"]
            diccionario.concat(contenido)
            url = personas["next"]
        end
        url_c = diccionario
    url_c.each do |c| 
    	if @planet.include? c["url"]
    		@planets.push(c)
        end	
    end
	
	@starship = @urls["starships"]
    @starships = []   
        diccionario = []
        url = 'https://swapi.co/api/starships/?page=1'
        while url != nil do
            personas = HTTParty.get(url)
            personas = JSON.parse(personas.body)
            contenido = personas["results"]
            diccionario.concat(contenido)
            url = personas["next"]
        end
        url_c = diccionario
    url_c.each do |c| 
    	if @starship.include? c["url"]
    		@starships.push(c)
        end	
    end
    @url_c = url_c



  end
end
