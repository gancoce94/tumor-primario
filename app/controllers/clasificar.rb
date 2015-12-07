require 'wannabe_bool'
module Clasificar
	include ClasificarHombre
	include ClasificarMujer
	def tipo(tp)
		if tp[:genero].to_s == 'hombre'.to_s
			t, ad, p=clasificarHombre(tp)
		elsif tp[:genero].to_s == 'mujer'.to_s			
			t, ad, p=clasificarMujer(tp)
		else
			t='No se pudo clasificar'
			ad='No se puede crear el arbol de decision!'
		end

		return t, ad, p
	end
end