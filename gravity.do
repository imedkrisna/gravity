clear all
set more off

// to run this file, you may need to do an ssc install for reghdfe, ppml, ppmlhdfe and estout and esttab

cd "C:\github\gravity" // set working directory. CHange this into your working directory
use gravity // this is a prepared data. to prepare this yourself, check gravitycreate.do

// keep only variable we want to use. Always check label!
keep year iso3_o iso3_d tradeflow_baci gdp_o gdp_d pop_o pop_d dist distw_harmonic col45 comlang_ethno contig fta_wto

// generate log version
gen lt=log(tradeflow_baci)
gen lgdp_o=log(gdp_o)
gen lgdp_d=log(gdp_d)
gen lpop_o=log(pop_o)
gen lpop_d=log(pop_d)
gen ldist=log(dist)
gen ldistw=log(distw_harmonic)
rename tradeflow_baci t

// create exporter-importer group so we can use xtset
egen id=group(iso3_d iso3_o)
xtset id year

// set local macro for gravity variables
local grav1 lgdp_o lgdp_d ldist lpop_o lpop_d
local grav2 lgdp_o lgdp_d ldist lpop_o lpop_d col45 comlang_ethno contig fta_wto

// Gravity with OLS
xtreg lt `grav1'
estimates store xt1
xtreg lt `grav2'
estimates store xt2

// Gravity with PPML
ppml t `grav1'
estimates store pp1
ppml t `grav2'
estimates store pp2

// For policies, make exporter-year and importer-year fixed effects
egen xt=group(iso3_o year)
egen mt=group(iso3_d year)

// OLS for policy if you need the fixed effects
xtreg lt `grav2' xt mt
estimates store xt3

// Better if we absorb the fixed effects (but you wont get the fe itself)
reghdfe lt `grav2', absorb(xt mt) cluster(id)
estimates store xt4
ppmlhdfe t `grav2', absorb(xt mt)
estimates store pp3
outreg2 [xt1 xt2 pp1 pp2 xt3 xt4 pp3] using gravity.xls,replace se bdec(3) tdec(3)  excel

// go ahead and check gravity.xls