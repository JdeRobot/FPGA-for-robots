
#Begin clock constraint
define_clock -name {Pc2drone|clk_system} {p:Pc2drone|clk_system} -period 15.249 -clockgroup Autoconstr_clkgroup_0 -rise 0.000 -fall 7.624 -route 0.000 
#End clock constraint

#Begin clock constraint
define_clock -name {Pc2drone_pll|PLLOUTCORE_derived_clock} {n:Pc2drone_pll|PLLOUTCORE_derived_clock} -period 15.249 -clockgroup Autoconstr_clkgroup_0 -rise 0.000 -fall 7.624 -route 0.000 
#End clock constraint
