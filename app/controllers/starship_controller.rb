class StarshipController < ApplicationController
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
  end
end
