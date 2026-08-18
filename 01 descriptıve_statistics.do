********************************************************************************
* Objectıve - Descrıptıve Statıstıcs for Delegatıng Democracy Away?
* Date - July 5, 2026
* Author - Yuko Sato
*********************************************************************************
cd "C:\Users\ysato\Desktop\code_revısed"

use "data/250104_final", clear 

*------------------------------------------------------------*
* Table for summary statistic: Tables A1 
*------------------------------------------------------------*
eststo clear
eststo M1: quietly estpost summarize martial_law_attitude1 martial_law_attitude2 approval sociotropic_prospect pocketbook_retro sociotropic_prospect pocketbook_prospect winner_party out_dl DM1 DM2 DM4 DM6 DM8
esttab M1 using tab/descriptive1.tex, cells("mean sd min max") nodepvar label replace

*------------------------------------------------------------*
* Histogram PPP vs. Non-PPP by DV: Figure A1 
*------------------------------------------------------------*
set scheme plotplain, permanently
label variable martial_law_attitude1 "Martial Law Attitude 1 (National Security)"

twoway (histogram martial_law_attitude1 if  winner_party==1, freq start(1) width(1) color(blue%30)) ///        
       (histogram martial_law_attitude1 if  winner_party==0, freq start(1) width(1) color(red%30)), ///  
	   xscale(range(1 10)) ///
	   yscale(range(0 800)) ylabel(0(200)800) ///
       legend(order(1 "PPP" 2 "Non-PPP") region(lstyle(none)) position(6)) ///
	   name(g2, replace) ///

label variable martial_law_attitude2 "Martial Law Attitude 2 (Opposition Uncooperative Action)"

twoway (histogram martial_law_attitude2 if  winner_party==1, freq start(1) width(1) color(blue%30)) ///        
       (histogram martial_law_attitude2 if  winner_party==0, freq start(1) width(1) color(red%30)), ///  
	   xscale(range(1 10)) ///
	   yscale(range(0 800)) ylabel(0(200)800) ///
       legend(order(1 "PPP" 2 "Non-PPP") region(lstyle(none)) position(6)) ///
	   name(g3, replace)
	   
*** Combine them in a 1×3 grid
graph combine g2 g3, col(2) imargin(zero) 

graph export "fig/combined_hist.pdf", replace 

*------------------------------------------------------------*
* Trend of Partisan support 2022-2025: Figure A2
*------------------------------------------------------------*

* 1. PREPARING PPP AND OPPOSITION VARIABLES
* --- Time 1: 2022 Presidential Election ---
recode Q20 (5/6=.)
gen ppp_1 = (Q20 == 2) if !missing(Q20)
gen opp_1 = (Q20 == 1) if !missing(Q20)

* --- Time 2: 2024 General Election ---
recode Q21 (8/9=.)
gen ppp_2 = (Q21 == 2) if !missing(Q21)
gen opp_2 = (Q21 == 1) if !missing(Q21)

* --- Time 3: 2025 Current ---
* --- Time 3: 2025 Current ---
* (Assuming your existing "PPP" variable is coded 1/0 for PPP support)
gen ppp_3 = (DM9 == 2) if !missing(DM9)
* (Please replace "ORIGINAL_2025_VAR" with your actual 2025 survey variable 
* where the opposition party is coded as 1)
gen opp_3 = (DM9 == 1) if !missing(DM9)


* 2. RESHAPING AND CALCULATING MEANS/CIs
preserve 

capture drop id
gen id = _n
reshape long ppp_ opp_, i(id) j(time)

* Calculate means, standard deviations, and N for BOTH parties
collapse (mean) ppp_mean=ppp_ opp_mean=opp_ ///
         (sd) ppp_sd=ppp_ opp_sd=opp_ ///
         (count) ppp_n=ppp_ opp_n=opp_, by(time)

* CIs for PPP
gen ppp_se = ppp_sd / sqrt(ppp_n)
gen ppp_ci_lower = ppp_mean - invttail(ppp_n-1, 0.025) * ppp_se
gen ppp_ci_upper = ppp_mean + invttail(ppp_n-1, 0.025) * ppp_se

* CIs for Opposition
gen opp_se = opp_sd / sqrt(opp_n)
gen opp_ci_lower = opp_mean - invttail(opp_n-1, 0.025) * opp_se
gen opp_ci_upper = opp_mean + invttail(opp_n-1, 0.025) * opp_se


* 3. CREATING THE PLOT
* Create a slight X-axis shift so the error bars do not overlap 
* (PPP shifted slightly left, Opposition slightly right)
gen time_ppp = time - 0.03
gen time_opp = time + 0.03

twoway (rcap ppp_ci_lower ppp_ci_upper time_ppp, lcolor(navy%70)) ///
       (connected ppp_mean time_ppp, mcolor(navy) lcolor(navy) msymbol(O) msize(medlarge)) ///
       (rcap opp_ci_lower opp_ci_upper time_opp, lcolor(maroon%70)) ///
       (connected opp_mean time_opp, mcolor(maroon) lcolor(maroon) msymbol(D) msize(medlarge)), ///
       xlabel(1 "2022" 2 "2024" 3 "2025") ///
       ytitle("Proportion of Support") ///
       xtitle("Election / Year") ///
       title("Trend of Support: PPP vs. DPK") ///
       legend(order(2 "PPP Support" 4 "DPK Support" 1 "PPP 95% CI" 3 "DPK 95% CI") pos(6) row(2)) 
graph export "fig/trend_partısan.pdf",as(pdf) replace
restore
	








