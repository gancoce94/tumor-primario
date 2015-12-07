require 'wannabe_bool'
module ClasificarMujer
	def clasificarMujer(tp)
		ad='Genero::Mujer'

		if tp[:axilar].to_b
			ad=ad+' -> '+'Axilar::True'
			if tp[:pulmon].to_b
				t='estomago'
				ad=ad+' -> '+'Pulmon::True'
				p='1/0'
			elsif !tp[:pulmon].to_b
				ad=ad+' -> '+'Pulmon::False'
				if tp[:grado_tumor].to_s == 'bueno'.to_s
					t='pulmon'
					ad=ad+' -> '+'GradoTumor::Leve'
					p='0/0'
				elsif tp[:grado_tumor].to_s == 'intermedio'.to_s
					ad=ad+' -> '+'GradoTumor::Intermedio'
					if tp[:abdominal].to_b
						ad=ad+' -> '+'Abdominal::True'
						if tp[:pleura].to_b
							t='mama'
							ad=ad+' -> '+'Pleura::True'
							p='1.67/0'
						elsif !tp[:pleura].to_b
							t='estomago'
							ad=ad+' -> '+'Pleura::False'
							p='1.33/0'
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					elsif !tp[:abdominal].to_b
						t='mama'
						ad=ad+' -> '+'Abdominal::False'
						p='12.33/0'
					else
						t='No se pudo clasificar'
						ad='No se puede crear el arbol de decision!'				
					end
				elsif tp[:grado_tumor].to_s == 'grave'.to_s
					ad=ad+' -> '+'GradoTumor::Grave'
					if tp[:supraclavicular].to_b
						ad=ad+' -> '+'Supraclavicular::True'
						if tp[:cerebro].to_b
							t='pulmon'
							ad=ad+' -> '+'Cerebro::True'
							p='1/0'
						elsif !tp[:cerebro].to_b
							ad=ad+' -> '+'Cerebro::False'
							if tp[:abdominal].to_b
								t='estomago'
								ad=ad+' -> '+'Abdominal::True'
								p='1/0.33'
							elsif !tp[:abdominal].to_b
								t='mama'
								ad=ad+' -> '+'Abdominal::False'
								p='1/0'
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end	
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					elsif !tp[:supraclavicular].to_b
						t='mama'
						ad=ad+' -> '+'Supraclavicular::False'
						p='4.67/0'
					else
						t='No se pudo clasificar'
						ad='No se puede crear el arbol de decision!'				
					end	
				else
					t='No se pudo clasificar'
					ad='No se puede crear el arbol de decision!'				
				end	
			else
				t='No se pudo clasificar'
				ad='No se puede crear el arbol de decision!'				
			end	
		elsif !tp[:axilar].to_b
			ad=ad+' -> '+'Axilar::False'
			if tp[:hueso].to_b
				ad=ad+' -> '+'Hueso::True'
				if tp[:pleura].to_b
					ad=ad+' -> '+'Pleura::True'
					if tp[:supraclavicular].to_b
						t='tiroides'
						ad=ad+' -> '+'Supraclavicular::True'
						p='1/0'
					elsif !tp[:supraclavicular].to_b
						ad=ad+' -> '+'Supraclavicular::False'
						if tp[:abdominal].to_b
							ad=ad+' -> '+'Abdominal::True'
							if tp[:edad].to_s == '<30'.to_s
								t='pulmon'
								ad=ad+' -> '+'Edad::<30'
								p='0/0'
							elsif tp[:edad].to_s == '30-59'.to_s
								ad=ad+' -> '+'Edad::30-59'
								if tp[:mediastino].to_b
									t='pulmon'
									ad=ad+' -> '+'Mediastino::True'
									p='1/0'
								elsif !tp[:mediastino].to_b
									t='vasicula viliar'
									ad=ad+' -> '+'Mediastino::False'
									p='1/0'
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							elsif tp[:edad].to_s == '30-59'.to_s
								t='pancreas'
								ad=ad+' -> '+'Edad::>=60'
								p='1/0'
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						elsif !tp[:abdominal].to_b
							ad=ad+' -> '+'Abdominal::False'
							if tp[:mediastino].to_b
								t='pulmon'
								ad=ad+' -> '+'Mediastino::True'
								p='2/0'
							elsif !tp[:mediastino].to_b
								ad=ad+' -> '+'Mediastino::False'
								if tp[:edad].to_s == '<30'.to_s
									t='pulmon'
									ad=ad+' -> '+'Edad::<30'
									p='0/0'
								elsif tp[:edad].to_s == '30-59'.to_s
									t='mama'
									ad=ad+' -> '+'Edad::30-59'
									p='1/0'
								elsif tp[:edad].to_s == '>=60'.to_s
									t='pulmon'
									ad=ad+' -> '+'Edad::>=60'
									p='2/0'
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					else
						t='No se pudo clasificar'
						ad='No se puede crear el arbol de decision!'				
					end
				elsif !tp[:pleura].to_b
					ad=ad+' -> '+'Pleura::False'
					if tp[:pulmon].to_b
						ad=ad+' -> '+'Pulmon::True'
						if tp[:supraclavicular].to_b
							t='pulmon'
							ad=ad+' -> '+'Supraclavicular::True'
							p='1/0'
						elsif !tp[:supraclavicular].to_b
							ad=ad+' -> '+'Supraclavicular::False'
							if tp[:edad].to_s == '<30'.to_s								
								t='tiroides'
								ad=ad+' -> '+'Edad::<30'
								p='1/0'
							elsif tp[:edad].to_s == '30-59'.to_s
								ad=ad+' -> '+'Edad::30-59'
								if tp[:abdominal].to_b
									t='vagina'
									ad=ad+' -> '+'Abdominal::True'
									p='1/0'
								elsif !tp[:abdominal].to_b
									ad=ad+' -> '+'Abdominal::False'
									if tp[:mediastino].to_b
										t='tiroides'
										ad=ad+' -> '+'Mediastino::True'
										p='1/0'
									elsif !tp[:mediastino].to_b
										t='tiroides'
										ad=ad+' -> '+'Mediastino::False'
										p='2/1'
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end	
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							elsif tp[:edad].to_s == '>=60'.to_s
								t='tiroides'
								ad=ad+' -> '+'Edad::>=60'
								p='2/0'
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					elsif !tp[:pulmon].to_b
						ad=ad+' -> '+'Pulmon::False'
						if tp[:edad].to_s == '<30'.to_s
							ad=ad+' -> '+'Edad::<30'
							if tp[:mediastino].to_b
								t='pulmon'
								ad=ad+' -> '+'Mediastino::True'
								p='1/0'
							elsif !tp[:mediastino].to_b
								t='estomago'
								ad=ad+' -> '+'Mediastino::False'
								p='2/0'
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						elsif tp[:edad].to_s == '30-59'.to_s
							ad=ad+' -> '+'Edad::30-59'
							if tp[:abdominal].to_b
								t='cuello uterino'
								ad=ad+' -> '+'Abdominal::True'
								p='1/0'
							elsif !tp[:abdominal].to_b
								ad=ad+' -> '+'Abdominal::False'
								if tp[:higado].to_b
									t='pulmon'
									ad=ad+' -> '+'Higado::True'
									p='1/0'
								elsif !tp[:higado].to_b
									ad=ad+' -> '+'Higado::False'
									if tp[:cuello].to_b
										ad=ad+' -> '+'Cuello::True'
										if tp[:piel].to_b
											t='esofago'
											ad=ad+' -> '+'Piel::True'
											p='1/0'
										elsif !tp[:piel].to_b
											t='cabeza y cuello'
											ad=ad+' -> '+'Piel::False'
											p='1/0'
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									elsif !tp[:cuello].to_b
										ad=ad+' -> '+'Cuello::False'
										if tp[:piel].to_b
											t='pulmon'
											ad=ad+' -> '+'Piel::True'
											p='1/0'
										elsif !tp[:piel].to_b
											ad=ad+' -> '+'Piel::False'
											if tp[:madiastino].to_b
												t='pulmon'
												ad=ad+' -> '+'Mediastino::True'
												p='1/0'
											elsif !tp[:madiastino].to_b
												t='pulmon'
												ad=ad+' -> '+'Mediastino::False'
												p='4/3'
											else
												t='No se pudo clasificar'
												ad='No se puede crear el arbol de decision!'				
											end
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						elsif tp[:edad].to_s == '>=60'.to_s
							ad=ad+' -> '+'Edad::>=60'
							if tp[:abdominal].to_b
								t='tiroides'
								ad=ad+' -> '+'Abdominal::True'
								p='2/1'
							elsif !tp[:abdominal].to_b
								t='tiroides'
								ad=ad+' -> '+'Abdominal::False'
								p='1/0'
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					else
						t='No se pudo clasificar'
						ad='No se puede crear el arbol de decision!'				
					end
				else
					t='No se pudo clasificar'
					ad='No se puede crear el arbol de decision!'				
				end
			elsif !tp[:hueso].to_b
				ad=ad+' -> '+'Hueso::False'		
				if tp[:edad].to_s == '<30'.to_s
					t='riñon'
					ad=ad+' -> '+'Edad::<30'
					p='1/0'
				elsif tp[:edad].to_s == '30-59'.to_s
					ad=ad+' -> '+'Edad::30-59'
					if tp[:mediastino].to_b
						ad=ad+' -> '+'Mediastino::True'
						if tp[:higado].to_s
							ad=ad+' -> '+'Higado::True'
							if tp[:abdominal].to_b
								ad=ad+' -> '+'Abdominal::True'
								if tp[:pleura].to_b
									t='pulmon'
									ad=ad+' -> '+'Pleura::True'
									p='1/0'
								elsif !tp[:pleura].to_b
									ad=ad+' -> '+'Pleura::True'
									if tp[:supraclavicular].to_b
										t='ovarios'
										ad=ad+' -> '+'Supraclavicular::True'
										p='1/0'
									elsif !tp[:supraclavicular].to_b
										ad=ad+' -> '+'Supraclavicular::False'
										if tp[:pulmon].to_b
											t='cuello uterino'
											ad=ad+' -> '+'Pulmon::True'
											p='1/0'
										elsif !tp[:pulmon].to_b
											t='cuerpo uterino'
											ad=ad+' -> '+'Pulmon::True'
											p='1/0'
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							elsif !tp[:abdominal].to_b
								t='pulmon'
								ad=ad+' -> '+'Abdominal::False'
								p='3/0'
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						elsif !tp[:higado].to_s
							ad=ad+' -> '+'Higado::False'
							if tp[:pleura].to_b
								t='pulmon'
								ad=ad+' -> '+'Pleura::True'
								p='2/0'
							elsif !tp[:pleura].to_b
								ad=ad+' -> '+'Pleura::False'
								if tp[:abdominal].to_b
									t='colon'
									ad=ad+' -> '+'Abdominal::True'
									p='1/0'
								elsif !tp[:abdominal].to_b
									t='pulmon'
									ad=ad+' -> '+'Abdominal::False'
									p='1.52/0.52'
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					elsif !tp[:mediastino].to_b
						ad=ad+' -> '+'Mediastino::False'
						if tp[:pleura].to_b
							ad=ad+' -> '+'Pleura::True'
							if tp[:peritoneum].to_b
								ad=ad+' -> '+'Peritnoeum::True'
								if tp[:pulmon].to_b
									ad=ad+' -> '+'Pulmon::True'
									if tp[:abdominal].to_b
										t='estomago'
										ad=ad+' -> '+'Abdominal::True'
										p='1/0'
									elsif !tp[:abdominal].to_b
										ad=ad+' -> '+'Abdominal::False'
										if tp[:supraclavicular].to_b
											t='mama'
											ad=ad+' -> '+'Supraclavicular::True'
											p='1/0'
										elsif !tp[:supraclavicular].to_b
											t='pancreas'
											ad=ad+' -> '+'Supraclavicular::False'
											p='1/0'
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								elsif !tp[:pulmon].to_b
									ad=ad+' -> '+'Pulmon::False'
									if tp[:grado_tumor].to_s == 'bueno'.to_s
										ad=ad+' -> '+'GradoTumor::Leve'
										if tp[:supraclavicular].to_b
											t='estomago'
											ad=ad+' -> '+'Supraclavicular::True'
											p='1/0'
										elsif !tp[:supraclavicular].to_b
											t='ovarios'
											ad=ad+' -> '+'Supraclavicular::False'
											p='7.57/2.71'
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									elsif tp[:grado_tumor].to_s == 'intermedio'.to_s
										t='ovarios'
										ad=ad+' -> '+'GradoTumor::Intermedio'
										p='1.71/0.14'
									elsif tp[:grado_tumor].to_s == 'grave'.to_s
										t='pancreas'
										ad=ad+' -> '+'GradoTumor::Grave'
										p='1.71/0.71'
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end	
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							elsif !tp[:peritoneum].to_b
								ad=ad+' -> '+'Peritnoeum::False'
								if tp[:abdominal].to_b
									t='pancreas'
									ad=ad+' -> '+'Abdominal::True'
									p='2/1'
								elsif !tp[:abdominal].to_b
									t='ovarios'
									ad=ad+' -> '+'Abdominal::False'
									p='3/1'
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						elsif !tp[:pleura].to_b
							ad=ad+' -> '+'Pleura::False'
							if tp[:peritoneum].to_b
								ad=ad+' -> '+'Peritnoeum::True'
								if tp[:grado_tumor].to_s == 'bueno'.to_s
									ad=ad+' -> '+'GradoTumor::Leve'
									if tp[:higado].to_b
										ad=ad+' -> '+'Higado::True'
										if tp[:pulmon].to_b
											t='riñon'
											ad=ad+' -> '+'Pulmon::True'
											p='0.64/0'
										elsif !tp[:pulmon].to_b
											ad=ad+' -> '+'Pulmon::False'
											if tp[:abdominal].to_b												
												ad=ad+' -> '+'Abdominal::True'
												if tp[:piel].to_b
													t='ovarios'
													ad=ad+' -> '+'Piel::True'
													p='0.64/0'
												elsif !tp[:piel].to_b
													t='estomago'
													ad=ad+' -> '+'Piel::False'
													p='2/1'
												else
													t='No se pudo clasificar'
													ad='No se puede crear el arbol de decision!'				
												end
											elsif !tp[:abdominal].to_b
												t='ovarios'
												ad=ad+' -> '+'Abdominal::False'
												p='1/0'
											else
												t='No se pudo clasificar'
												ad='No se puede crear el arbol de decision!'				
											end
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									elsif !tp[:higado].to_b
										ad=ad+' -> '+'Higado::False'
										if tp[:abdominal].to_b
											t='ovarios'
											ad=ad+' -> '+'Abdominal::True'
											p='1.91/0'
										elsif !tp[:abdominal].to_b
											ad=ad+' -> '+'Abdominal::False'
											if tp[:piel].to_b
												t='ovarios'
												ad=ad+' -> '+'Piel::True'
												p='1/0'
											elsif !tp[:piel].to_b
												t='ovarios'
												ad=ad+' -> '+'Piel::False'
												p='5.55/0.64'
											else
												t='No se pudo clasificar'
												ad='No se puede crear el arbol de decision!'				
											end
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								elsif tp[:grado_tumor].to_s == 'intermedio'.to_s
									ad=ad+' -> '+'GradoTumor::Intermedio'
									if tp[:abdominal].to_b
										t='colon'
										ad=ad+' -> '+'Abdominal::True'
										p='1.91/0.91'
									elsif !tp[:abdominal].to_b
										t='estomago'
										ad=ad+' -> '+'Abdominal::False'
										p='1.73/0.55'
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								elsif tp[:grado_tumor].to_s == 'grave'.to_s
									ad=ad+' -> '+'GradoTumor::Grave'
									if tp[:higado].to_b
										t='ovarios'
										ad=ad+' -> '+'Higado::True'
										p='1.36/0.18'
									elsif !tp[:higado].to_b
										ad=ad+' -> '+'Higado::False'
										if tp[:abdominal].to_b
											t='estomago'
											ad=ad+' -> '+'Abdominal::True'
											p='1.55/0.55'
										elsif !tp[:abdominal].to_b
											t='ovarios'
											ad=ad+' -> '+'Abdominal::False'
											p='0.73/0.18'
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							elsif !tp[:peritoneum].to_b
								ad=ad+' -> '+'Peritnoeum::False'
								if tp[:pulmon].to_b
									ad=ad+' -> '+'Pulmon::True'
									if tp[:higado].to_b
										t='pancreas'
										ad=ad+' -> '+'Higado::True'
										p='2/1'
									elsif !tp[:higado].to_b
										t='colon'
										ad=ad+' -> '+'Higado::False'
										p='1/0'
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								elsif !tp[:pulmon].to_b
									ad=ad+' -> '+'Pulmon::False'
									if tp[:higado].to_b
										ad=ad+' -> '+'Higado::True'
										if tp[:abdominal].to_b
											t='pancreas'
											ad=ad+' -> '+'Abdominal::True'
											p='2/0'
										elsif !tp[:abdominal].to_b
											t='ovarios'
											ad=ad+' -> '+'Abdominal::False'
											p='1/0'
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									elsif !tp[:higado].to_b
										ad=ad+' -> '+'Higado::False'
										if tp[:abdominal].to_b
											t='cuerpo uterino'
											ad=ad+' -> '+'Abdominal::True'
											p='1/0'
										elsif !tp[:abdominal].to_b
											ad=ad+' -> '+'Higado::False'
											if tp[:cuello].to_b
												ad=ad+' -> '+'Cuello::True'
												if tp[:supraclavicular].to_b
													t='cabeza y cuello'
													ad=ad+' -> '+'Supraclavicular::True'
													p='2/1'
												elsif !tp[:supraclavicular].to_b
													t='cabeza y cuello'
													ad=ad+' -> '+'Supraclavicular::False'
													p='1/0'
												else
													t='No se pudo clasificar'
													ad='No se puede crear el arbol de decision!'				
												end
											elsif !tp[:cuello].to_b
												ad=ad+' -> '+'Cuello::False'
												if tp[:supraclavicular].to_b
													ad=ad+' -> '+'Cuello::True'
													if tp[:grado_tumor].to_s == 'bueno'.to_s
														t='riñon'
														ad=ad+' -> '+'GradoTumor::Leve'
														p='1.5/0.5'
													elsif tp[:grado_tumor].to_s == 'intermedio'.to_s
														t='pulmon'
														ad=ad+' -> '+'GradoTumor::Intermedio'
														p='0/0'
													elsif tp[:grado_tumor].to_s == 'grave'.to_s
														t='pulmon'
														ad=ad+' -> '+'GradoTumor::Grave'
														p='1.5/0.5'
													else
														t='No se pudo clasificar'
														ad='No se puede crear el arbol de decision!'				
													end
												elsif !tp[:supraclavicular].to_b
													t='recto'
													ad=ad+' -> '+'Supraclavicular::False'
													p='1/0'
												else
													t='No se pudo clasificar'
													ad='No se puede crear el arbol de decision!'				
												end
											else
												t='No se pudo clasificar'
												ad='No se puede crear el arbol de decision!'				
											end
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					else
						t='No se pudo clasificar'
						ad='No se puede crear el arbol de decision!'				
					end
				elsif tp[:edad].to_s == '>=60'.to_s
					ad=ad+' -> '+'Edad::>=60'
					if tp[:abdominal].to_b
						ad=ad+' -> '+'Abdominal::True'
						if tp[:peritoneum].to_b
							ad=ad+' -> '+'Peritnoeum::True'
							if tp[:higado].to_b
								ad=ad+' -> '+'Higado::True'
								if tp[:pulmon].to_b
									ad=ad+' -> '+'Pulmon::True'
									if tp[:pleura].to_b
										t='vasicula viliar'
										ad=ad+' -> '+'Pleura::True'
										p='1/0'
									elsif !tp[:pleura].to_b
										t='ovarios'
										ad=ad+' -> '+'Pleura::False'
										p='1/0'
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								elsif !tp[:pulmon].to_b
									t='pancreas'
									ad=ad+' -> '+'Pulmon::False'
									p='1/0'
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							elsif !tp[:higado].to_b
								ad=ad+' -> '+'Higado::False'
								if tp[:medula_osea].to_b
									t='pancreas'
									ad=ad+' -> '+'MedulaOsea::True'
									p='1/0'
								elsif !tp[:medula_osea].to_b
									ad=ad+' -> '+'MedulaOsea::False'
									if tp[:pulmon].to_b
										t='cuerpo uterino'
										ad=ad+' -> '+'Pulmon::True'
										p='1/0'
									elsif !tp[:pulmon].to_b
										ad=ad+' -> '+'Pulmon::False'
										if tp[:cerebro].to_b
											t='higado'
											ad=ad+' -> '+'Cerebro::True'
											p='1/0'
										elsif !tp[:cerebro].to_b
											t='riñon'
											ad=ad+' -> '+'Cerebro::False'
											p='1/0'
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						elsif !tp[:peritoneum].to_b
							ad=ad+' -> '+'Peritnoeum::False'
							if tp[:mediastino].to_b
								ad=ad+' -> '+'Mediastino::True'
								if tp[:higado].to_b
									ad=ad+' -> '+'Higado::True'
									if tp[:pleura].to_b
										t='colon'
										ad=ad+' -> '+'Pleura::True'
										p='1/0'
									elsif !tp[:pleura].to_b
										ad=ad+' -> '+'Pleura::False'
										if tp[:pulmon].to_b
											t='colon'
											ad=ad+' -> '+'Pulmon::True'
											p='2/1'
										elsif !tp[:pulmon].to_b
											t='pulmon'
											ad=ad+' -> '+'Pulmon::False'
											p='2/1'
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								elsif !tp[:higado].to_b
									ad=ad+' -> '+'Higado::False'
									if tp[:pulmon].to_b
										t='riñon'
										ad=ad+' -> '+'Pulmon::True'
										p='1/0'
									elsif !tp[:pulmon].to_b
										t='pulmon'
										ad=ad+' -> '+'Pulmon::False'
										p='2/1'
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							elsif !tp[:mediastino].to_b
								ad=ad+' -> '+'Mediastino::False'
								if tp[:higado].to_b
									ad=ad+' -> '+'Higado::True'
									if tp[:grado_tumor].to_s == 'bueno'.to_s
										t='pulmon'
										ad=ad+' -> '+'GradoTumor::Leve'
										p='0/0'
									elsif tp[:grado_tumor].to_s == 'intermedio'.to_s
										ad=ad+' -> '+'GradoTumor::Intermedio'
										if tp[:pulmon].to_b
											t='vasicula viliar'
											ad=ad+' -> '+'Pulmon::True'
											p='0.2/0'
										elsif !tp[:pulmon].to_b
											ad=ad+' -> '+'Pulmon::False'
											if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
												t='vasicula viliar'
												ad=ad+' -> '+'TipoHistologico::Epidermoide'
												p='0.22/0.02'
											elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
												t='vasicula viliar'
												ad=ad+' -> '+'TipoHistologico::Adenoide'
												p='1.98/0.58'
											elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
												t='pulmon'
												ad=ad+' -> '+'TipoHistologico::Anaplasico'
												p='0/0'
											else
												t='No se pudo clasificar'
												ad='No se puede crear el arbol de decision!'				
											end
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									elsif tp[:grado_tumor].to_s == 'grave'.to_s
										ad=ad+' -> '+'GradoTumor::Grave'
										if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
											t='vasicula viliar'
											ad=ad+' -> '+'TipoHistologico::Epidermoide'
											p='0.98/0.18'
										elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
											ad=ad+' -> '+'TipoHistologico::Adenoide'
											if tp[:pulmon].to_b
												t='vasicula viliar'
												ad=ad+' -> '+'Pulmon::True'
												p='1.8/0'
											elsif !tp[:pulmon].to_b
												t='vasicula viliar'
												ad=ad+' -> '+'Pulmon::True'
												p='6.82/4.22'
											else
												t='No se pudo clasificar'
												ad='No se puede crear el arbol de decision!'				
											end	
										elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
											t='pulmon'
											ad=ad+' -> '+'TipoHistologico::Anaplasico'
											p='0/0'
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								elsif !tp[:higado].to_b
									t='colon'
									ad=ad+' -> '+'Higado::False'
									p='3/2'
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					elsif !tp[:abdominal].to_b
						ad=ad+' -> '+'Abdominal::False'
						if tp[:peritoneum].to_b
							ad=ad+' -> '+'Peritnoeum::True'
							if tp[:higado].to_b
								ad=ad+' -> '+'Higado::True'
								if tp[:supraclavicular].to_b
									t='pulmon'
									ad=ad+' -> '+'Supraclavicular::True'
									p='1/0'
								elsif !tp[:supraclavicular].to_b
									t='pancreas'
									ad=ad+' -> '+'Supraclavicular::False'
									p='2/1'
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							elsif !tp[:higado].to_b
								ad=ad+' -> '+'Higado::False'
								if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
									t='pulmon'
									ad=ad+' -> '+'TipoHistologico::Epidermoide'
									p='1/0'
								elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
									ad=ad+' -> '+'TipoHistologico::Adenoide'
									if tp[:grado_tumor].to_s == 'bueno'.to_s
										t='pancreas'
										ad=ad+' -> '+'GradoTumor::Leve'
										p='2/1'
									elsif tp[:grado_tumor].to_s == 'intermedio'.to_s
										t='pancreas'
										ad=ad+' -> '+'GradoTumor::Intermedio'
										p='1/0'
									elsif tp[:grado_tumor].to_s == 'grave'.to_s
										t='ovarios'
										ad=ad+' -> '+'GradoTumor::Grave'
										p='1/0'
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
									t='pulmon'
									ad=ad+' -> '+'TipoHistologico::Anaplasico'
									p='0/0'
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						elsif !tp[:peritoneum].to_b
							ad=ad+' -> '+'Peritnoeum::False'
							if tp[:higado].to_b
								ad=ad+' -> '+'Higado::True'
								if tp[:supraclavicular].to_b
									t='pulmon'
									ad=ad+' -> '+'Supraclavicular::True'
									p='2/0'
								elsif !tp[:supraclavicular].to_b
									ad=ad+' -> '+'Supraclavicular::False'
									if tp[:grado_tumor].to_s == 'bueno'.to_s
										t='estomago'
										ad=ad+' -> '+'GradoTumor::Leve'
										p='3/2'
									elsif tp[:grado_tumor].to_s == 'intermedio'.to_s
										t='pulmon'
										ad=ad+' -> '+'GradoTumor::Intermedio'
										p='0/0'
									elsif tp[:grado_tumor].to_s == 'grave'.to_s
										t='vasicula viliar'
										ad=ad+' -> '+'GradoTumor::Grave'
										p='3/1.5'
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							elsif !tp[:higado].to_b
								ad=ad+' -> '+'Higado::False'
								if tp[:pulmon].to_b
									t='duodeno e intestino delgado'
									ad=ad+' -> '+'Pulmon::True'
									p='4/3'
								elsif !tp[:pulmon].to_b
									ad=ad+' -> '+'Pulmon::False'
									if tp[:grado_tumor].to_s == 'bueno'.to_s
										t='estomago'
										ad=ad+' -> '+'GradoTumor::Leve'
										p='1/0'
									elsif tp[:grado_tumor].to_s == 'intermedio'.to_s
										t='pulmon'
										ad=ad+' -> '+'GradoTumor::Intermedio'
										p='0/0'
									elsif tp[:grado_tumor].to_s == 'grave'.to_s
										ad=ad+' -> '+'GradoTumor::Grave'
										if tp[:pleura].to_b
											t='tiroides'
											ad=ad+' -> '+'Pleura::True'
											p='1/0'
										elsif !tp[:pleura].to_b
											t='pulmon'
											ad=ad+' -> '+'Pleura::False'
											p='1/0'
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					else
						t='No se pudo clasificar'
						ad='No se puede crear el arbol de decision!'				
					end
				else
					t='No se pudo clasificar'
					ad='No se puede crear el arbol de decision!'				
				end
			else
				t='No se pudo clasificar'
				ad='No se puede crear el arbol de decision!'				
			end
		else
			t='No se pudo clasificar'
			ad='No se puede crear el arbol de decision!'				
		end

		return t, ad, p
	end
end