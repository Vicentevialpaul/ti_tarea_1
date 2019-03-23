class CharacterController < ApplicationController
  def index
  	@informacion = params[:content]
  	url_c = HTTParty.get('https://swapi.co/api/films/')
  	url_c = JSON.parse(url_c.body)
  	@films = []
  	@lista = @informacion["films"]
	url_c["results"].each do |c| 
		if @lista.include? c["url"]
			@films.push(c)
	    end
    end

	@starship = @informacion["starships"]
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



  end

end

