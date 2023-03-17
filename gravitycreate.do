set more off
clear all

/* 
This file is used to create gravity.dta.
the main file is **219mb** in size, that's why I don't upload it here in my repo. You can download yourself
here http://www.cepii.fr/CEPII/en/bdd_modele/bdd_modele_item.asp?id=8
to be exact, this one -> http://www.cepii.fr/DATA_DOWNLOAD/gravity/data/Gravity_dta_V202211.zip
*/
cd "C:\github\gravity" // set working directory. CHange this into your working directory

// ****WARNING**** THIS COMMAND WILL START A DOWNLOAD from CEPII to your working directory
copy http://www.cepii.fr/DATA_DOWNLOAD/gravity/data/Gravity_dta_V202211.zip Gravity_dta_V202211.zip

// after finished the download, unzip the file and read
unzipfile Gravity_dta_V202211.zip
use Gravity_V202211

// selecting country pair and year to reduce size immensely
keep if iso3_d == "AUS" | iso3_d == "IDN" | iso3_d == "JPN" | iso3_d == "USA" | iso3_d == "CHN" | iso3_d == "SGP" | iso3_d == "THA" | iso3_d == "GER" | iso3_d == "FRA" | iso3_d == "EGY"

keep if iso3_o == "AUS" | iso3_o == "IDN" | iso3_o == "JPN" | iso3_o == "USA" | iso3_o == "CHN" | iso3_o == "SGP" | iso3_o == "THA" | iso3_o == "GER" | iso3_o == "FRA" | iso3_o == "EGY"

keep if year >= 2015

drop if country_id_o=="IDN.1" | country_id_d=="IDN.1" // There's 2 IDN, and IDN.1 is the redundant one for year>=2015.

// saving the data to be used in the tutorial
save gravity,replace

// proceed with gravity.do