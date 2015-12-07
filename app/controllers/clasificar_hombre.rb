require 'wannabe_bool'
module ClasificarHombre	
	def clasificarHombre(tp)
		ad='Genero::Hombre'

		if tp[:grado_tumor].to_s == 'bueno'.to_s
			ad=ad+' -> '+'GradoTumor::Leve'
			if tp[:higado].to_b
				ad=ad+' -> '+'Higado::True'
				if tp[:abdominal].to_b
					ad=ad+' -> '+'Abdominal::True'
					if tp[:peritoneum].to_b
						ad=ad+' -> '+'Peritnoeum::True'
						if tp[:pulmon].to_b
							t='estomago'
							ad=ad+' -> '+'Pulmon::True'
							p=0.3/0
						elsif !tp[:pulmon].to_b
							ad=ad+' -> '+'Pulmon::False'
							if tp[:piel].to_b
								t='riñon'
								ad=ad+' -> '+'Piel::True'
								p=0.3/0
							elsif !tp[:piel].to_b
								ad=ad+' -> '+'Piel::False'
								if tp[:edad].to_s == '<30'.to_s	
									t='pulmon'
									ad=ad+' -> '+'Edad::<30'
									p=0/0
								elsif tp[:edad].to_s == '30-59'.to_s
									t='colon'
									ad=ad+' -> '+'Edad::30-59'	
									p=1.9/0.6
								elsif tp[:edad].to_s == '>=60'.to_s
									t='pancreas'
									ad=ad+' -> '+'Edad::>=60'
									p=1.3/0.3
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
							t='prostata'
							ad=ad+' -> '+'Pulmon::True'
							p=1.6/0.6
						elsif !tp[:pulmon].to_b
							t='estomago'
							ad=ad+' -> '+'Pulmon::False'
							p=0.9/0.6
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
					if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
						t='pulmon'
						ad=ad+' -> '+'TipoHistologico::Epidermoide'
						p=1.36/0.06
					elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
						ad=ad+' -> '+'TipoHistologico::Adenoide'
						if tp[:pulmon].to_b
							t='pulmon'
							ad=ad+' -> '+'Pulmon::True'	
							p=0.3/0
						elsif !tp[:pulmon].to_b
							ad=ad+' -> '+'Pulmon::False'
							if tp[:edad].to_s == '<30'.to_s	
								t='colon'
								ad=ad+' -> '+'Edad::<30'
								p=0.24/0
							elsif tp[:edad].to_s == '30-59'.to_s
								ad=ad+' -> '+'Edad::30-59'
								if tp[:peritoneum].to_b									
									t='pancreas'
									ad=ad+' -> '+'Peritnoeum::True'
									p=1/0
								elsif !tp[:peritoneum].to_b
									t='estomago'
									ad=ad+' -> '+'Peritnoeum::False'
									p=1.6/0.6
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'	
								end									
							elsif tp[:edad].to_s == '>=60'.to_s
								ad=ad+' -> '+'Edad::>=60'
								if tp[:peritoneum].to_b									
									t='estomago'
									ad=ad+' -> '+'Peritnoeum::True'
									p=0.3/0
								elsif !tp[:peritoneum].to_b
									t='recto'
									ad=ad+' -> '+'Peritnoeum::False'
									p=2/0
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
					elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
						t='pulmon'
						ad=ad+' -> '+'TipoHistologico::Anaplasico'
						p=0/0
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
				if tp[:cuello].to_b
					ad=ad+' -> '+'Cuello::True'
					if tp[:hueso].to_b
						ad=ad+' -> '+'Hueso::True'
						if tp[:pleura].to_b
							t='glandulas salivales'
							ad=ad+' -> '+'Pleura::True'
							p=0.3/0
						elsif !tp[:pleura].to_b
							ad=ad+' -> '+'Pleura::False'
							if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
								ad=ad+' -> '+'TipoHistologico::Epidermoide'
								if tp[:piel].to_b
									t='pulmon'
									ad=ad+' -> '+'Piel::True'
									p=1/0
								elsif !tp[:piel].to_b
									t='glandulas salivales'
									ad=ad+' -> '+'Piel::False'
									p=1/0
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'	
								end
							elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
								t='prostata'
								ad=ad+' -> '+'TipoHistologico::Adenoide'
								p=1.3/0.3
							elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
								t='pulmon'
								ad=ad+' -> '+'TipoHistologico::Anaplasico'
								p=0/0
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
							t='pulmon'
							ad=ad+' -> '+'Edad::<30'
							p=0/0
						elsif tp[:edad].to_s == '30-59'.to_s
							ad=ad+' -> '+'Edad::30-59'
							if tp[:pulmon].to_b
								t='cabeza y cuello'
								ad=ad+' -> '+'Pulmon::True'
								p=0.3/0		
							elsif !tp[:pulmon].to_b
								ad=ad+' -> '+'Pulmon::False'
								if tp[:pleura].to_b
									t='cabeza y cuello'
									ad=ad+' -> '+'Pleura::True'
									p=0.3/0
								elsif !tp[:pleura].to_b
									t='cabeza y cuello'
									ad=ad+' -> '+'Pleura::False'
									p=6.3/2
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'
							end
						elsif tp[:edad].to_s == '>=60'.to_s
							t='cabeza y cuello'
							ad=ad+' -> '+'Edad::>=60'
							p=1.3/0
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'
						end
					else
						t='No se pudo clasificar'
						ad='No se puede crear el arbol de decision!'
					end
				elsif !tp[:cuello].to_b
					ad=ad+' -> '+'Cuello::False'
					if tp[:peritoneum].to_b
						ad=ad+' -> '+'Peritnoeum::True'
						if tp[:hueso].to_b
							t='riñon'
							ad=ad+' -> '+'Hueso::True'
							p=0.3/0
						elsif !tp[:hueso].to_b
							ad=ad+' -> '+'Hueso::False'
							if tp[:abdominal].to_b
								t='estomago'
								ad=ad+' -> '+'Abdominal::True'
								p=1.6/0.6
							elsif !tp[:abdominal].to_b
								ad=ad+' -> '+'Abdominal::False'
								if tp[:supraclavicular].to_b
									t='estomago'
									ad=ad+' -> '+'Supraclavicular::True'
									p=1/0
								elsif !tp[:supraclavicular].to_b
									t='colon'
									ad=ad+' -> '+'Supraclavicular::False'
									p=1.6/0.6
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
						if tp[:edad].to_s == '<30'.to_s
							t='riñon'
							ad=ad+' -> '+'Edad::<30'
							p=0.9/0.3
						elsif tp[:edad].to_s == '30-59'.to_s
							ad=ad+' -> '+'Edad::30-59'
							if tp[:abdominal].to_b
								ad=ad+' -> '+'Abdominal::True'
								if tp[:hueso].to_b
									t='esofago'
									ad=ad+' -> '+'Hueso::True'
									p=0.3/0
								elsif !tp[:hueso].to_b
									ad=ad+' -> '+'Hueso::False'
									if tp[:mediastino].to_b
										t='estomago'
										ad=ad+' -> '+'Mediastino::True'
										p=1.6/0.6
									elsif !tp[:mediastino].to_b
										t='estomago'
										ad=ad+' -> '+'Mediastino::False'
										p=0.6/0
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
								if tp[:supraclavicular].to_b
									t='pulmon'
									ad=ad+' -> '+'Supraclavicular::True'
									p=0.9/0.3
								elsif !tp[:supraclavicular].to_b
									ad=ad+' -> '+'Supraclavicular::False'
									if tp[:mediastino].to_b
										ad=ad+' -> '+'Mediastino::True'
										if tp[:hueso].to_b
											t='riñon'
											ad=ad+' -> '+'Hueso::True'
											p=1.5/0.6
										elsif !tp[:hueso].to_b
											t='estomago'
											ad=ad+' -> '+'Hueso::False'
											p=1.48/0.48
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'
										end
									elsif !tp[:mediastino].to_b
										ad=ad+' -> '+'Mediastino::False'
										if tp[:pulmon].to_b
											t='riñon'
											ad=ad+' -> '+'Pulmon::True'
											p=1.5/0.6
										elsif !tp[:pulmon].to_b
											ad=ad+' -> '+'Pulmon::False'
											if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
												t='pulmon'
												ad=ad+' -> '+'TipoHistologico::Epidermoide'
												p=1.12/0.06
											elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
												ad=ad+' -> '+'TipoHistologico::Adenoide'
												if tp[:axilar].to_b
													t='pulmon'
													ad=ad+' -> '+'Axilar::True'
													p=0.3/0
												elsif !tp[:axilar].to_b
													ad=ad+' -> '+'Axilar::False'
													if tp[:piel].to_b
														t='pulmon'
														ad=ad+' -> '+'Piel::True'
														p=0.24/0
													elsif !tp[:piel].to_b
														ad=ad+' -> '+'Piel::False'
														if tp[:pleura].to_b
															t='pulmon'
															ad=ad+' -> '+'Pleura::True'
															p=0.3/0
														elsif !tp[:pleura].to_b
															t='pulmon'
															ad=ad+' -> '+'Pleura::False'
															p=0.3/0
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
											elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
												t='pulmon'
												ad=ad+' -> '+'TipoHistologico::Anaplasico'
												p=0/0
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
								t='prostata'
								ad=ad+' -> '+'Abdominal::True'
								p=1.6/0.6
							elsif !tp[:abdominal].to_b
								ad=ad+' -> '+'Abdominal::False'
								if tp[:hueso].to_b
									t='prostata'
									ad=ad+' -> '+'Hueso::True'
									p=1.3/0.3
								elsif !tp[:hueso].to_b
									t='riñon'
									ad=ad+' -> '+'Hueso::False'
									p=1.6/0.3
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
		elsif tp[:grado_tumor].to_s == 'intermedio'.to_s
			ad=ad+' -> '+'GradoTumor::Intermedio'
			if tp[:cuello].to_b
				ad=ad+' -> '+'Cuello::True'
				if tp[:axilar].to_b
					t='tiroides'
					ad=ad+' -> '+'Axilar::True'
					p=1/0
				elsif !tp[:axilar].to_b
					ad=ad+' -> '+'Axilar::False'
					if tp[:supraclavicular].to_b
						ad=ad+' -> '+'Supraclavicular::True'
						if tp[:hueso].to_b
							t='pulmon'
							ad=ad+' -> '+'Hueso::True'
							p=1.15/0.15
						elsif !tp[:hueso].to_b
							ad=ad+' -> '+'Hueso::False'
							if tp[:pulmon].to_b
								t='pulmon'
								ad=ad+' -> '+'Pulmon::True'
								p=1/0
							elsif !tp[:pulmon].to_b
								t='prostata'
								ad=ad+' -> '+'Pulmon::False'
								p=1/0
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'
							end
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'
						end
					elsif !tp[:supraclavicular].to_b
						ad=ad+' -> '+'Supraclavicular::False'
						if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
							t='cabeza y cuello'
							ad=ad+' -> '+'TipoHistologico::Epidermoide'
							p=5.59/0
						elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
							t='tiroides'
							ad=ad+' -> '+'TipoHistologico::Adenoide'
							p=0.15/0
						elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
							t='pulmon'
							ad=ad+' -> '+'TipoHistologico::Anaplasico'
							p=0/0
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
			elsif !tp[:cuello].to_b
				ad=ad+' -> '+'Cuello::False'
				if tp[:pleura].to_b
					ad=ad+' -> '+'Pleura::True'
					if tp[:edad].to_s == '<30'.to_s
						t='estomago'
						ad=ad+' -> '+'Edad::<30'
						p=0.15/0
					elsif tp[:edad].to_s == '30-59'.to_s
						ad=ad+' -> '+'Edad::30-59'
						if tp[:mediastino].to_b
							t='pulmon'
							ad=ad+' -> '+'Mediastino::True'
							p=0.59/0.44
						elsif !tp[:mediastino].to_b
							t='testiculos'
							ad=ad+' -> '+'Mediastino::False'
							p=1.59/0.59
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'
						end
					elsif tp[:edad].to_s == '>=60'.to_s
						ad=ad+' -> '+'Edad::>=60'
						if tp[:pulmon].to_b
							t='riñon'
							ad=ad + ' -> '+'Pulmon::True'
							p=0.15/0
						elsif !tp[:pulmon].to_b
							ad=ad + ' -> '+'Pulmon::False'
							if tp[:abdominal].to_b
								t='colon'
								ad=ad + ' -> '+'Abdominal::True'
								p=1.3/0.3
							elsif !tp[:abdominal].to_b
								t='higado'
								ad=ad + ' -> '+'Abdominal::False'
								p=1/0
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
					ad=ad + ' -> '+'Pleura::False'
					if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
						t='pulmon'
						ad=ad + ' -> '+'TipoHistologico::Epidermoide'
						p=1.76/0.44
					elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
						ad=ad + ' -> '+'TipoHistologico::Adenoide'
						if tp[:edad].to_s == '<30'.to_s
							t='riñon'
							ad=ad + ' -> '+'Edad::<30'
							p=0.56/0.12
						elsif tp[:edad].to_s == '30-59'.to_s
							ad=ad + ' -> '+'Edad::30-59'
							if tp[:peritoneum].to_b
								t='estomago'
								ad=ad + ' -> '+'Peritnoeum::True'
								p=0.42/0.27
							elsif !tp[:peritoneum].to_b
								ad=ad + ' -> '+'Peritnoeum::False'
								if tp[:pulmon].to_b
									t='pulmon'
									ad=ad + ' -> '+'Pulmon::True'
									p=1.01/0.71
								elsif !tp[:pulmon].to_b
									ad=ad + ' -> '+'Pulmon::False'
									if tp[:axilar].to_b
										t='pulmon'
										ad=ad + ' -> '+'Axilar::True'
										p=0.15/0
									elsif !tp[:axilar].to_b										
										ad=ad + ' -> '+'Axilar::False'
										if tp[:cerebro].to_b
											t='estomago'
											ad=ad + ' -> '+'Cerebro::True'
											p=0.15/0
										elsif !tp[:cerebro].to_b
											ad=ad + ' -> '+'Cerebro::False'
											if tp[:hueso].to_b
												ad=ad + ' -> '+'Hueso::True'
												if tp[:mediastino].to_b
													t='pulmon'
													ad=ad + ' -> '+'Mediastino::True'
													p=0.3/0.15
												elsif !tp[:mediastino].to_b
													ad=ad + ' -> '+'Mediastino::False'
													if tp[:abdominal].to_b
														t='esofago'
														ad=ad + ' -> '+'Abdominal::True'
														p=0.15/0
													elsif !tp[:abdominal].to_b
														ad=ad + ' -> '+'Abdominal::False'
														if tp[:piel].to_b
															t='pulmon'
															ad=ad + ' -> '+'Piel::True'
															p=0.12/0
														elsif !tp[:piel].to_b
															t='prostata'
															ad=ad + ' -> '+'Piel::False'
															p=2.86/0.56
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
												t='estomago'
												ad=ad + ' -> '+'Hueso::False'
												p=0.56/0.3
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
							t='estomago'
							ad=ad + ' -> '+'Edad::>=60'
							p=1.18/0.59
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'
						end
					elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
						t='pulmon'
						ad=ad + ' -> '+'TipoHistologico::Anaplasico'
						p=0/0
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
		elsif tp[:grado_tumor].to_s == 'grave'.to_s
			ad=ad + ' -> '+'GradoTumor::Grave'
			if tp[:hueso].to_b
				ad=ad + ' -> '+'Hueso::True'
				if tp[:pleura].to_b
					ad=ad + ' -> '+'Pleura::True'
					if tp[:mediastino].to_b
						ad=ad + ' -> '+'Mediastino::True'
						if tp[:peritoneum].to_b
							t='pulmon'
							ad=ad + ' -> '+'Peritnoeum::True'
							p=1/0
						elsif !tp[:peritoneum].to_b
							t='pulmon'
							ad=ad + ' -> '+'Peritnoeum::False'
							p=1.55/0.55
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					elsif !tp[:mediastino].to_b
						ad=ad + ' -> '+'Mediastino::False'
						if tp[:edad].to_s == '<30'.to_s
							t='pancreas'
							ad=ad + ' -> '+'Edad::<30'
							p=1/0
						elsif tp[:edad].to_s == '30-59'.to_s
							t='glandulas salivales'
							ad=ad + ' -> '+'Edad::30-59'
							p=0.55/0
						elsif tp[:edad].to_s == '>=60'.to_s
							t='pulmon'
							ad=ad + ' -> '+'Edad::>=60'
							p=1/0
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					else
						t='No se pudo clasificar'
						ad='No se puede crear el arbol de decision!'				
					end
				elsif !tp[:pleura].to_b
					ad=ad + ' -> '+'Pleura::False'
					if tp[:pulmon].to_b
						ad=ad + ' -> '+'Pulmon::True'
						if tp[:edad].to_s == '<30'.to_s
							t='estomago'
							ad=ad + ' -> '+'Edad::<30'
							p=1/0
						elsif tp[:edad].to_s == '30-59'.to_s
							ad=ad + ' -> '+'Edad::30-59'
							if tp[:cerebro].to_b
								t='estomago'
								ad=ad + ' -> '+'Cerebro::True'
								p=1.1/0.55
							elsif !tp[:cerebro].to_b
								t='riñon'
								ad=ad + ' -> '+'Cerebro::False'
								p=1.66/0.55
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						elsif tp[:edad].to_s == '>=60'.to_s
							t='riñon'
							ad=ad + ' -> '+'Edad::>=60'
							p=1.1/0
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end
					elsif !tp[:pulmon].to_b
						ad=ad + ' -> '+'Pulmon::False'
						if tp[:mediastino].to_b
							ad=ad + ' -> '+'Mediastino::True'
							if tp[:medula_osea].to_b
								t='pulmon'
								ad=ad + ' -> '+'MedulaOsea::True'
								p=2/0
							elsif !tp[:medula_osea].to_b
								ad=ad + ' -> '+'MedulaOsea::False'
								if tp[:cerebro].to_b
									t='pulmon'
									ad=ad + ' -> '+'Cerebro::True'
									p=1/0
								elsif !tp[:cerebro].to_b
									ad=ad + ' -> '+'Cerebro::False'
									if tp[:higado].to_b
										t='pulmon'
										ad=ad + ' -> '+'Higado::True'
										p=2/0
									elsif !tp[:higado].to_b
										t='pulmon'
										ad=ad + ' -> '+'Higado::False'
										p=1.1/0.55
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
							ad=ad + ' -> '+'Mediastino::False'
							if tp[:piel].to_b
								t='pulmon'
								ad=ad + ' -> '+'Piel::True'
								p=2.55/0
							elsif !tp[:piel].to_b
								ad=ad + ' -> '+'Piel::False'
								if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
									t='pulmon'
									ad=ad + ' -> '+'TipoHistologico::Epidermoide'
									p=2.42/0.42
								elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
									ad=ad + ' -> '+'TipoHistologico::Adenoide'
									if tp[:cuello].to_b
										t='tiroides'
										ad=ad + ' -> '+'Cuello::True'
										p=0.55/0
									elsif !tp[:cuello].to_b
										ad=ad + ' -> '+'Cuello::False'
										if tp[:higado].to_b
											t='estomago'
											ad=ad + ' -> '+'Higado::True'
											p=1/0
										elsif !tp[:higado].to_b
											ad=ad + ' -> '+'Higado::False'
											if tp[:edad].to_s == '<30'.to_s
												t='riñon'
												ad=ad + ' -> '+'Edad::<30'
												p=0.55/0
											elsif tp[:edad].to_s == '30-59'.to_s
												ad=ad + ' -> '+'Edad::30-59'
												if tp[:abdominal].to_b
													t='esofago'
													ad=ad + ' -> '+'Abdominal::True'
													p=0.55/0
												elsif !tp[:abdominal].to_b
													t='riñon'
													ad=ad + ' -> '+'Abdominal::False'
													p=3.89/2.39													
												else
													t='No se pudo clasificar'
													ad='No se puede crear el arbol de decision!'				
												end
											elsif tp[:edad].to_s == '>=60'.to_s
												t='pulmon'
												ad=ad + ' -> '+'Edad::>=60'
												p=0/0
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
								elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
									t='pulmon'
									ad=ad + ' -> '+'TipoHistologico::Anaplasico'
									p=0/0
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
			elsif !tp[:hueso].to_b
				ad=ad + ' -> '+'Hueso::False'
				if tp[:edad].to_s == '<30'.to_s
					ad=ad + ' -> '+'Edad::<30'
					if tp[:axilar].to_b
						t='mama'
						ad=ad + ' -> '+'Axilar::True'
						p=1/0
					elsif !tp[:axilar].to_b
						ad=ad + ' -> '+'Axilar::False'
						if tp[:higado].to_b
							ad=ad + ' -> '+'Higado::True'
							if tp[:abdominal].to_b
								t='riñon'
								ad=ad + ' -> '+'Abdominal::True'
								p=0.55/0
							elsif !tp[:abdominal].to_b
								t='pulmon'
								ad=ad + ' -> '+'Abdominal::False'
								p=1.55/0.55
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						elsif !tp[:higado].to_b
							ad=ad + ' -> '+'Higado::False'
							if tp[:pleura].to_b
								t='estomago'
								ad=ad + ' -> '+'Pleura::True'
								p=0.55/0
							elsif !tp[:pleura].to_b
								ad=ad + ' -> '+'Pleura::False'
								if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
									t='pulmon'
									ad=ad + ' -> '+'TipoHistologico::Epidermoide'
									p=0.55/0
								elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
									t='riñon'
									ad=ad + ' -> '+'TipoHistologico::Adenoide'
									p=0.91/0.36
								elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
									t='higado'
									ad=ad + ' -> '+'TipoHistologico::Anaplasico'
									p=1.64/0.64
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
				elsif tp[:edad].to_s == '30-59'.to_s
					ad=ad + ' -> '+'Edad::30-59'
					if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
						ad=ad + ' -> '+'TipoHistologico::Epidermoide'
						if tp[:mediastino].to_b
							ad=ad + ' -> '+'Mediastino::True'
							if tp[:abdominal].to_b
								t='pulmon'
								ad=ad + ' -> '+'Abdominal::True'
								p=1.55/0.26
							elsif !tp[:abdominal].to_b
								ad=ad + ' -> '+'Abdominal::False'
								if tp[:pulmon].to_b
									t='esofago'
									ad=ad + ' -> '+'Pulmon::True'
									p=1/0
								elsif !tp[:pulmon].to_b
									t='pulmon'
									ad=ad + ' -> '+'Pulmon::False'
									p=2.84/0
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end		
						elsif !tp[:mediastino].to_b
							ad=ad + ' -> '+'Mediastino::False'
							if tp[:piel].to_b
								t='pulmon'
								ad=ad + ' -> '+'Piel::True'
								p=0.52/0
							elsif !tp[:piel].to_b
								ad=ad + ' -> '+'Piel::False'
								if tp[:peritoneum].to_b
									t='vejiga'
									ad=ad + ' -> '+'Peritnoeum::True'
									p=0.14/0
								elsif !tp[:peritoneum].to_b
									ad=ad + ' -> '+'Peritnoeum::False'
									if tp[:cuello].to_b
										t='cabeza y cuello'
										ad=ad + ' -> '+'Cuello::True'
										p=1.91/0
									elsif !tp[:cuello].to_b
										t='esofago'
										ad=ad + ' -> '+'Cuello::False'
										p=1.76/0.95
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
					elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
						ad=ad + ' -> '+'TipoHistologico::Adenoide'
						if tp[:mediastino].to_b
							ad=ad + ' -> '+'Mediastino::True'
							if tp[:pleura].to_b
								ad=ad + ' -> '+'Pleura::True'
								if tp[:peritoneum].to_b
									t='pulmon'
									ad=ad + ' -> '+'Peritnoeum::True'
									p=0.55/0
								elsif !tp[:peritoneum].to_b
									ad=ad + ' -> '+'Peritnoeum::False'
									if tp[:pulmon].to_b
										t='pancreas'
										ad=ad + ' -> '+'Pulmon::True'
										p=1.1/0.55
									elsif !tp[:pulmon].to_b
										ad=ad + ' -> '+'Pulmon::False'
										if tp[:cerebro].to_b
											t='pulmon'
											ad=ad + ' -> '+'Cerebro::True'
											p=0.6/0
										elsif !tp[:cerebro].to_b
											t='pancreas'
											ad=ad + ' -> '+'Cerebro::False'
											p=1.6/0.6
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
								ad=ad + ' -> '+'Pleura::False'
								if tp[:higado].to_b
									ad=ad + ' -> '+'Higado::True'
									if tp[:abdominal].to_b
										t='pulmon'
										ad=ad + ' -> '+'Abdominal::True'
										p=1.19/0.6
									elsif !tp[:abdominal].to_b
										t='pulmon'
										ad=ad + ' -> '+'Abdominal::False'
										p=1.15/0
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								elsif !tp[:higado].to_b
									t='pulmon'
									ad=ad + ' -> '+'Higado::False'
									p=4.58/0
								else
									t='No se pudo clasificar'
									ad='No se puede crear el arbol de decision!'				
								end
							else
								t='No se pudo clasificar'
								ad='No se puede crear el arbol de decision!'				
							end
						elsif !tp[:mediastino].to_b
							ad=ad + ' -> '+'Mediastino::False'
							if tp[:piel].to_b
								t='pulmon'
								ad=ad + ' -> '+'Piel::True'
								p=1.19/0
							elsif !tp[:piel].to_b
								ad=ad + ' -> '+'Piel::False'
								if tp[:peritoneum].to_b
									ad=ad + ' -> '+'Peritnoeum::True'
									if tp[:higado].to_b
										ad=ad + ' -> '+'Higado::True'
										if tp[:pleura].to_b
											t='colon'
											ad=ad + ' -> '+'Pleura::True'
											p=1.1/0.55
										elsif !tp[:pleura].to_b
											t='pancreas'
											ad=ad + ' -> '+'Pleura::False'
											p=1.55/0.55
										else
											t='No se pudo clasificar'
											ad='No se puede crear el arbol de decision!'				
										end
									elsif !tp[:higado].to_b
										t='vejiga'
										ad=ad + ' -> '+'Higado::False'
										p=0.33/0
									else
										t='No se pudo clasificar'
										ad='No se puede crear el arbol de decision!'				
									end
								elsif !tp[:peritoneum].to_b
									ad=ad + ' -> '+'Peritnoeum::False'
									if tp[:abdominal].to_b
										t='estomago'
										ad=ad + ' -> '+'Abdominal::True'
										p=1.98/0.55
									elsif !tp[:abdominal].to_b
										ad=ad + ' -> '+'Abdominal::False'
										if tp[:cuello].to_b
											t='cabeza y cuello'
											ad=ad + ' -> '+'Cuello::True'
											p=0.6/0
										elsif !tp[:cuello].to_b
											ad=ad + ' -> '+'Cuello::False'
											if tp[:higado].to_b
												ad=ad + ' -> '+'Higado::True'
												if tp[:supraclavicular].to_b
													t='esofago'
													ad=ad + ' -> '+'Supraclavicular::True'
													p=0.6/0
												elsif !tp[:supraclavicular].to_b
													t='pancreas'
													ad=ad + ' -> '+'Supraclavicular::False'
													p=2.1/0.55
												else
													t='No se pudo clasificar'
													ad='No se puede crear el arbol de decision!'				
												end
											elsif !tp[:higado].to_b
												ad=ad + ' -> '+'Higado::False'
												if tp[:axilar].to_b
													t='pulmon'
													ad=ad + ' -> '+'Axilar::True'
													p=0.55/0
												elsif !tp[:axilar].to_b
													t='pulmon'
													ad=ad + ' -> '+'Axilar::False'
													p=1.7/0.6
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
					elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
						ad=ad + ' -> '+'TipoHistologico::Anaplasico'	
						if tp[:peritoneum].to_b
							t='pulmon'
							ad=ad + ' -> '+'Peritnoeum::True'
							p=1.52/0.23	
						elsif !tp[:peritoneum].to_b
							ad=ad + ' -> '+'Peritnoeum::False'
							if tp[:cuello].to_b
								t='pulmon'
								ad=ad + ' -> '+'Cuello::True'
								p=1.29/0.15
							elsif !tp[:cuello].to_b
								ad=ad + ' -> '+'Cuello::False'
								if tp[:piel].to_b
									t='pulmon'
									ad=ad + ' -> '+'Piel::True'
									p=0.44/0
								elsif !tp[:piel].to_b
									ad=ad + ' -> '+'Piel::False'
									if tp[:cerebro].to_b
										t='pulmon'
										ad=ad + ' -> '+'Cerebro::True'
										p=1.15/0
									elsif !tp[:cerebro].to_b
										t='pulmon'
										ad=ad + ' -> '+'Cerebro::False'
										p=1.1/0.37
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
					ad=ad + ' -> '+'Edad::>=60'
					if tp[:cuello].to_b		
						ad=ad + ' -> '+'Cuello::True'
						if tp[:peritoneum].to_b
							t='vejiga'
							ad=ad + ' -> '+'Peritnoeum::True'
							p=1/0
						elsif !tp[:peritoneum].to_b
							t='cabeza y cuello'
							ad=ad + ' -> '+'Peritnoeum::False'
							p=2.55/0
						else
							t='No se pudo clasificar'
							ad='No se puede crear el arbol de decision!'				
						end					
					elsif !tp[:cuello].to_b		
						ad=ad + ' -> '+'Cuello::False'
						if tp[:pulmon].to_b
							ad=ad + ' -> '+'Pulmon::True'
							if tp[:pleura].to_b
								t='riñon'
								ad=ad + ' -> '+'Pleura::True'
								p=0.55/0
							elsif !tp[:pleura].to_b
								ad=ad + ' -> '+'Pleura::False'
								if tp[:peritoneum].to_b
									t='estomago'
									ad=ad + ' -> '+'Peritnoeum::True'
									p=0.55/0
								elsif !tp[:peritoneum].to_b
									ad=ad + ' -> '+'Peritnoeum::False'
									if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
										t='esofago'
										ad=ad + ' -> '+'TipoHistologico::Epidermoide'
										p=0.55/0
									elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
										t='pancreas'
										ad=ad + ' -> '+'TipoHistologico::Adenoide'
										p=1.55/0.55
									elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
										t='pulmon'
										ad=ad + ' -> '+'TipoHistologico::Anaplasico'
										p=0/0
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
						elsif !tp[:pulmon].to_b
							ad=ad + ' -> '+'Pulmon::False'
							if tp[:cerebro].to_b
								t='pulmon'
								ad=ad + ' -> '+'Pulmon::True'
								p=1/0
							elsif !tp[:cerebro].to_b
								ad=ad + ' -> '+'Pulmon::False'
								if tp[:supraclavicular].to_b
									t='pulmon'
									ad=ad + ' -> '+'Supraclavicular::True'
									p=2/0
								elsif !tp[:supraclavicular].to_b
									ad=ad + ' -> '+'Supraclavicular::False'
									if tp[:mediastino].to_b
										t='pulmon'
										ad=ad + ' -> '+'Mediastino::True'
										p=1.55/0
									elsif !tp[:mediastino].to_b
										ad=ad + ' -> '+'Mediastino::False'	
										if tp[:tipo_histologico].to_s == 'epidermoide'.to_s
											t='pulmon'
											ad=ad + ' -> '+'TipoHistologico::Epidermoide'
											p=0.55/0
										elsif tp[:tipo_histologico].to_s == 'adenoide'.to_s
											ad=ad + ' -> '+'TipoHistologico::Adenoide'
											if tp[:abdominal].to_b
												t='recto'
												ad=ad + ' -> '+'Abdominal::True'
												p=1.66/1.1
											elsif !tp[:abdominal].to_b
												t='estomago'
												ad=ad + ' -> '+'Abdominal::False'
												p=2.1/0
											else
												t='No se pudo clasificar'
												ad='No se puede crear el arbol de decision!'				
											end
										elsif tp[:tipo_histologico].to_s == 'anaplasico'.to_s
											t='pulmon'
											ad=ad + ' -> '+'TipoHistologico::Anaplasico'
											p=0/0
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