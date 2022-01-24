--MSS
--GRUPO4 ADRIANA PONCE Y RICARDO MUÑOZ
--GRUPO 4 P102
library ieee;
use ieee.std_logic_1164.all;

entity MSS is
	port(
		resetn,clk: in std_logic;--entradas para parte sincronica y energizacion
		start,show: in std_logic;--entradas con las que el usuario puede interactuar
	   child,guy,sr,A_B0,A_B1,A_B2,A_B3,A_B4,A_B5,A_B6,equal,AV1: in std_logic;--entradas internas con particion funcional
		EnDD,LdD,En2,Rcont0: out std_logic:='0';--counter carga y lectura
		wrrite,OFFO:out std_logic:='0';--escritura y chip select de ROM
		R1,waitt: out std_logic:='0';
		Nv1,Nv0: out std_logic:='0';--Niveles de edad
		Rsost0:out std_logic:='0';--reseteadores de registro de direccion de repeticion
		Ewr,EnR,LdR,Rcont1:out std_logic:='0';--habilitadores de registro y counters de escritura de repeticiones
		towrite:out std_logic:='0';--señal habilitadora de los 128 direcciones sobrantes de la RAM para escritura
		Ld2:out std_logic:='0';
		En1,Ld1,En22:out std_logic:='0';--señales de counters para barrido de 8x8 de direcciones de repeticiones
		EnIH,EnIHD,EnIL,EnILD,EnM: out std_logic:='0';--Habilitadora de señales de direccion de repeticiones, indicadores y registro maximo
		Rsost1,Rsost2,Rsost3,Rsost4,Rsost5,Rsost6: out std_logic:='0';--reseteaores de registro doble sostenimiento y registro maximo
		EnHM,LdHM: out std_logic:='0';--señales de counter How Many
		EnC,LdS,showing: out std_logic:='0';--señales de registro y habilitadora de muestreo de resutados
		done : out std_logic:='0' );--aviso de fin de proceso
		end MSS;


architecture solve of MSS is
type estado is (Ta,Tb,Tc,Tcc,Tcd,Td,Tde,Te,Tef,Tf,Tfg,Tg,Tgh,Th,Thi,Ti,Tidid, Tid ,Tj,Tjk,Tk,Tkl,Tl,Tlk,Tkm, Tm,Tmn,Tn,Tnm,Tno,Tp,Too,Top,Tpq,Tq,Tjr,Tr,Ts,Tt,Tx,Ty);
	type espera is (c,h);
	signal y: estado;
	signal aux1,aux2:std_logic_vector(1 downto 0);
   signal aux3:std_logic_vector(2 downto 0);
	signal esp:espera;
	begin
	process(resetn,clk,y)
	--Sequential programming
		begin
			if resetn = '0' then y<= Ta;
			elsif (clk'event and clk = '1') then
				case y is
				
				--ANTIREBOTE
					when Ta => 
					       En1<='1'; Ld1<='1'; 
							 En22<='1'; Ld2<='1'; 
							 Rsost2<='1';Rsost5<='1';Rsost6<='1';
							  if start='1' then y <= Tb;
							  else y <= Ta; end if;	
							  
		         when Tb => 
					        En1<='0'; Ld1<='0'; 
							  En22<='0'; Ld2<='0';
							Rsost2<='0';Rsost5<='0';Rsost6<='0';  
							  if start='0' then y <= Tc;
							  else y <= Tb; end if;		
				--CARGA DE ROM A RAM			  
					
					when Tc => 
							  
				           if (A_B0='0') then 
							    En2<='1';
								 
								 OFFO<='1';
							   wrrite<='1';
								 
							   y <= Tcc;
							
							  elsif (A_B0='1') then  Rcont0<='1'; En2<='0';y <= Tcd;end if;
					
					when Tcc => OFFO<='1';  wrrite<='1'; y <= Tc;	 
				   when Tcd => En2<='0'; y <= Td;	  	
				   
				--LECTURA DE RAM
						 
				 when Td => 
				           En2<='0';
				           OFFO<='0';
							  wrrite<='0';
							  Rcont0<='0';
							  Ewr<='1';--REGISTRO DE NUEVA DIRECCION
					        EnDD<='1';--CELDA EXTRA EN COUNTER AD0
							  if (A_B0='1') then y <= Tj; 
				           elsif (A_B0='0') then 
								     if child='0' then Nv1<='0';Nv0<='0';
									  elsif  guy='0' then Nv1<='0';Nv0<='1';
									  elsif  sr='0' then Nv1<='1';Nv0<='0'; else 
									  Nv1<='1';Nv0<='1';  end if;
									  
							  	
							  y <= Tde;end if;
					
             when Tde =>  y <= Te;
					
				--RESETEADO DE AD0
				when Te => 
							  Ewr<='0';
					        EnDD<='0';
							  
							  Rcont0<='1'; 
							  towrite<='1';

							  y <= Tef;
							  
			  when Tef =>  y <= Tf;		  
					
				--ESCRTTURA Y CARGA DE REPETICION
				
				when Tf => 
							  Rcont0<='0'; 
							  Nv1<='0';Nv0<='0';
							  towrite<='1';
							  EnR<='1';
							  LdR<='1';
							  
							  y <= Tfg;
							  
			  when Tfg =>  y <= Tg;			  
				
           --INCREMENTO DE REPETICION Y SOBREESCRITURA				
				when Tg => 
							  LdR<='0';
							  
							  EnR<='1';
							  towrite<='1';
							  wrrite<='1';
							  
							  y <= Tgh;
							  
					when Tgh =>  y <= Th;			  
							  
				
				--BORRAD Y ENCERADO DE NUEVA DIRECCION PARA VOLVER A LECTURA
				when Th => EnR<='0';
							  towrite<='0';
							  wrrite<='0';
							  
							  Rcont1<='1';
							  Rsost0<='1';
							  Ld2<='1';
							  En2<='1';
							  
							  y <= Thi;
			
			  when Thi =>  y <= Ti;		  			  
							  
				
					--REVISION DE RECORRIDO DE MUESTRAS
			
				when Ti => Rcont1<='0';
							  Rsost0<='0';
							  Ld2<='0';
							  
							  En2<='0';
							  
							  y <= Tid;
							  
            when Tid =>  En2<='0';y <= Tidid;	
				
				when Tidid =>  En2<='0';if (A_B0='1') then y <= Tj;else y <= Td; end if;
							  
					--PROCESO DE ENCUENTRO DEL MAXIMO
				
			
				when Tj => En1<='0';
				          EnIH<='0';EnIHD<='0';
							 EnIL<='0';EnILD<='0';
				
							  Rcont0<='1';Rcont1<='1';towrite<='1';En22<='1';Ld2<='1';
							  
							  if (A_B1='0') then  y <= Tjk;
							  elsif (A_B1='1') then  
							  
					
							  EnC<='1';
							  
							  y <= Tjr;end if;
							  
			 when Tjk => En22<='0';Ld2<='0'; Rcont0<='0';Rcont1<='0'; y <= Tk;		  
							  
						--PREPARA BITS HIGH DE INDICADORES DIRECCION E INFORMACION		  
				when Tk =>  
				         En22<='0';Ld2<='0'; Rcont0<='0';Rcont1<='0';
							EnIH<='1';EnIHD<='1';towrite<='1';  EnM<='0';
							
				         if (A_B2='1') then  
							En22<='1';
							Ld2<='1'; 
							y <= Tkm;
							else
							  y <= Tkl; end if;
							  
				when Tkl => En22<='0';EnIH<='0'; y <= Tl;				  
							  
						--REGISTRO DE MAXIMO	  
				when Tl =>  
							EnILD<='1';towrite<='1'; 
							
							  if (A_B3='1') then EnM<='1';end if;	
                       En22<='1';
	               	  y <= Tlk;
			
			when Tlk => EnM<='1';En22<='0'; y <= Tk;
			
				when Tkm => En22<='0';	Ld2<='0'; y <= Tm;		
					
					when Tm =>  
							 EnHM<='0';
						   En22<='1';
							EnIH<='1';
						   EnIHD<='1';
							  if (A_B2='0') then y <= Tmn;
							 else 
                       En1<='1';
	               	  y <= Tj;end if;
					
				when Tmn => EnIH<='1';	EnIHD<='1';  En22<='0';
				      
						y <= Tn;	
			
		  --REVISION DE COINCIDENCIAS DEL MAXIMO
		  when Tn =>
		             	En1<='0';
							EnILD<='1';
								     if A_B6='0' then En22<='1';y <= Tnm;	
									  elsif  equal='0' then En22<='1';y<= Tnm;	
									  else  
									  EnIL<='1'; y<= Tno;	 end if;
	
	    when Tno => EnILD<='1';	y <= Too;	
		 when Tnm => EnILD<='1'; 	y <= Tq;  --En22<='1';          

		
		--RETIRO DE DIRECCION DE REPETICIONES
		
		when Too => Rsost3<='1';
						Rsost4<='1'; 
						y <= Top;	
			
        when Top => Rsost3<='1';
						Rsost4<='1';
						y <= Tp;	
	
			
		--PREPARACION PARA DIRECCION HOWMANY+128+64 Y ESCRITURA
		when Tp => Rsost3<='1';
						Rsost4<='1';
						wrrite<='1';
						R1<='1';
						y <= Tpq;
						
			when Tpq => wrrite<='0';	Rsost3<='0';
						Rsost4<='0';y <= Tq;	
			
			--RETORNO
			
			when Tq => R1<='0';
			         EnHM<='1';
						En22<='1'; 
						y <= Tm;	
		
		
		when Tjr => EnIH<='0';EnIHD<='0';
							 EnIL<='0';EnILD<='0';
							 En1<='1';Ld1<='1';
							  En2<='1';Ld2<='1';
							  Rsost1<='1';Rsost2<='1';
							  Rsost5<='1'; EnC<='1';
							  Rsost3<='1';Rsost4<='1';

		y <= Tr;
		
		
		--ESTADO DE FIN DE PROCESO
		when Tr =>  EnIH<='0';EnIHD<='0';
							 EnIL<='0';EnILD<='0';
							  En1<='0';Ld1<='0';
							  En2<='0';Ld2<='0';
							  Rsost1<='0';Rsost2<='0';
							  Rsost5<='0'; EnC<='1';
							  Rsost3<='0';Rsost4<='0';
							 
		             done<='1';LdHM<='1';EnHM<='1';
						if show='1' then   y <= Ts ;else y <= Tr;end if;
		
		--MUESTREO DE RESULTADOS
		when Ts =>  EnIH<='0';EnIHD<='0';
							 EnIL<='0';EnILD<='0';
							  En1<='0';Ld1<='0';
							  En2<='0';Ld2<='0';
							  Rsost1<='0';Rsost2<='0';
							  Rsost5<='0'; EnC<='0';
		
		           done<='1';LdHM<='0';LdS<='1';EnHM<='1';
						   y <= Tt;
				
		when Tt =>  LdS<='0';showing<='1';EnHM<='1';
		             --if A_B5='1' then  EnHM<='0';end if;
						 y <= Ts; 
		
	
   	when Tx => 
				          Ewr<='0'; EnDD<='0'; Rcont0<='0';
				          y <= Tj;	 
							
						when others	=> Ewr<='0';
			end case;				  
			end if;
	end process; 
end solve;