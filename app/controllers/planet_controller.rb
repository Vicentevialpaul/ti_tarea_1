class PlanetController < ApplicationController
  def index
  	self.params = params.permit!
  	@informacion = params[:content]
  	@hola = params[:hola]
  	url_c = HTTParty.get('https://swapi.co/api/films/')
  	url_c = JSON.parse(url_c.body)
  	@films = []
  	@lista = @informacion["films"]
	url_c["results"].each do |c| 
		if @lista.include? c["url"]
			@films.push(c)
	    end
    end

	@residente = @informacion["residents"]
    @residentes = []   
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
    if @residente != nil

	    url_c.each do |c| 
	    	if @residente.include? c["url"]
	    		@residentes.push(c)
	        end	
	    end
	else
		@residentes = []
	end





  end

end
