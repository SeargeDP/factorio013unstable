--maximum level of radar possible
--be sure to update \SatelliteRadar_x.x.x\locale\en\en.cfg if this is increased above 17
maxlevel=17

--number of satellites increases by 1 for every chunk added to the always visible area
--the equation reduces quite nicely with level=0 to maxlevel
--change the scaling to increase/decrease the number of satellites as desired or change the formula completely
scaling=1
function SatelliteEquation(level)
  return scaling*(4*level^2+8*level)
end

--invert the satellite equation to obtain the level equation
function LevelEquation(satellites)
  return math.floor(.5*(-7+(satellites/scaling+49)^(.5)))
end
