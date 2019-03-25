class StarshipController < ApplicationController
  def index
  	@informacion = params[:content]
  	url_c = HTTParty.get('https://swapi.co/api/films/')
  	url_c = JSON.parse(url_c.body)
  	@films = []
  	@lista = @informacion["films"]
  if @lista != nil
	url_c["results"].each do |c| 
		if @lista.include? c["url"]
			@films.push(c)
	    end
    end
  end
  @character = @informacion["pilots"]
  @pilots = []   
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
    if @character != nil

      url_c.each do |c| 
        if @character.include? c["url"] 
          @pilots.push(c)
          end
       end

    end
  end
end
