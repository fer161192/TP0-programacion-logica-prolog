

%Hay 4 científicos: Newton, Tesla, Curie y Darwin. Cada uno hizo un descubrimiento diferente y nació en 
%un año distinto. El objetivo es determinar qué descubrimiento hizo cada uno y en qué año nació, 
%a partir de las siguientes pistas:
%Los descubrimientos son: Gravitación, Electricidad, Radiactividad y Evolución.
%Los años de nacimiento son: 1643, 1809, 1856 y 1867.
%La persona que descubrió la Radiactividad nació después que Tesla.
%Curie nació en 1867 o 1856.
%El que descubrió la Gravitación nació 166 años antes que quien estudió la Evolución.
%Newton nació antes que la persona que descubrió la Electricidad.
%Darwin descubrió la evolución.
%El año de Curie es mayor al de la persona que invento la electricidad.

nacio_curie(Nacio) :- Nacio == 1867.
nacio_curie(Nacio) :- Nacio == 1856. 

cientificos(Newton, Tesla, Curie, Darwin) :-  
    Newton = cientifico(newton, DescubrioNewton, NacioNewton),
    Darwin = cientifico(darwin, DescubrioDarwin, NacioDarwin),
    Tesla = cientifico(tesla, DescubrioTesla, NacioTesla),
    Curie = cientifico(curie, DescubrioCurie, NacioCurie),
    CGravitacion = cientifico(CientificoGravitacion, gravitacion, NacioGravitacion),
    CEvolucion = cientifico(CientificoEvolucion, evolucion, NacioEvolucion),
    CElectricidad = cientifico(CientificoElectricidad, electricidad, NacioElectricidad),
    CRadiactividad = cientifico(CientificoRadiactividad, radiactividad, NacioRadiactividad),
    permutation([NacioNewton, NacioDarwin, NacioTesla, NacioCurie],
    [1643, 1809, 1856, 1867]
     ),
    permutation([DescubrioNewton, DescubrioDarwin, DescubrioTesla, DescubrioCurie],
     [gravitacion, evolucion, electricidad, radiactividad]
    ),
    permutation([Newton, Darwin, Tesla, Curie],
      [CGravitacion, CEvolucion, CElectricidad, CRadiactividad]
    ),
    NacioRadiactividad > NacioTesla,
    nacio_curie(NacioCurie),
    NacioGravitacion is NacioEvolucion - 166,
    NacioNewton < NacioElectricidad,
    DescubrioDarwin = evolucion,
    NacioCurie > NacioElectricidad
  .