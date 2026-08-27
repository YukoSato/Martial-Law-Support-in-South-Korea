********************************************************************************
* Objectıve - Maın analysıs for Delegatıng Democracy Away?
* Date - July 5, 2026
* Author - Yuko Sato
*********************************************************************************
*cd "C:\Users\ysato\Desktop\code_revısed"

use "data/250104_final", clear 


*------------------------------------------------------------*
* Tables (Appendix B. Full Model Specifications)
*------------------------------------------------------------*

** Table B1 
eststo M1: quietly reg martial_law_attitude1   approval i.winner_party  out_dl	DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M2: quietly reg martial_law_attitude2   approval i.winner_party  out_dl	DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
esttab M1 M2 using "tab/tabB1.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitudes and Presidential Approval Rate \label{B1}) ///
drop(0.winner_party) ///
noomitted ///
mtitles("Model 1" "Model 2") ///
nonumbers

** Table B2
eststo M3: quietly reg martial_law_attitude1 sociotropic_retro i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M4: quietly reg martial_law_attitude1 pocketbook_retro i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M5: quietly reg martial_law_attitude1 sociotropic_prospect i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust
eststo M6: quietly reg martial_law_attitude1 pocketbook_prospect i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust

esttab M3 M4 M5 M6 using "tab/tabB2.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 1 and Economic Evaluations \label{B2}) ///
drop(0.winner_party) ///
noomitted ///
mtitles("Model 3" "Model 4" "Model 5" "Model 6") ///
nonumbers


** Table B3
eststo M7: quietly reg martial_law_attitude2 sociotropic_retro i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M8: quietly reg martial_law_attitude2 pocketbook_retro i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M9: quietly reg martial_law_attitude2 sociotropic_prospect i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust
eststo M10: quietly reg martial_law_attitude2 pocketbook_prospect i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust

esttab M7 M8 M9 M10 using "tab/tabB3.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 2 and Economic Evaluations \label{B3}) ///
drop(0.winner_party) ///
noomitted ///
mtitles("Model 7" "Model 8" "Model 9" "Model 10") ///
nonumbers 

*** Interactıon between winner_party and Out-party Dislike
** Table B4
eststo M11: quietly reg martial_law_attitude1 approval i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M12: quietly reg martial_law_attitude1 sociotropic_retro i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M13: quietly reg martial_law_attitude1 pocketbook_retro i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M14: quietly reg martial_law_attitude1 sociotropic_prospect i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust
eststo M15: quietly reg martial_law_attitude1 pocketbook_prospect i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust

esttab M11 M12 M13 M14 M15 using "tab/tabB4.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 1 and the Interaction between PPP Support and Out-party Dislike (Party) \label{B4})  ///
drop(0.winner_party) ///
noomitted ///
mtitles("Model 11" "Model 12" "Model 13" "Model 14" "Model 15") ///
nonumbers


** Table B5
eststo M16: quietly reg martial_law_attitude2 approval i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M17: quietly reg martial_law_attitude2 sociotropic_retro i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M18: quietly reg martial_law_attitude2 pocketbook_retro i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M19: quietly reg martial_law_attitude2 sociotropic_prospect i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M20: quietly reg martial_law_attitude2 pocketbook_prospect i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

esttab M16 M17 M18 M19 M20 using "tab/tabB5.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 2 and the Interaction between PPP Support and Out-party Dislike (Party) \label{B5})  ///
drop(0.winner_party) ///
noomitted ///
mtitles("Model 16" "Model 17" "Model 18" "Model 19" "Model 20") ///
nonumbers


*** 3 term unteractıon models
** Table B6
eststo M21: quietly reg martial_law_attitude1 c.approval##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M22: quietly reg martial_law_attitude1 c.sociotropic_retro##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M23: quietly reg martial_law_attitude1 c.pocketbook_retro##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M24: quietly reg martial_law_attitude1 c.sociotropic_prospect##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M25: quietly reg martial_law_attitude1 c.pocketbook_prospect##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

esttab M21 M22 M23 M24 M25 using "tab/tabB6.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 1 and the Interaction between Economıc Evaluations, PPP Support, and Out-party Dislike (Ldeader) \label{B6})  ///
keep( ///
         /* Main Effects */ ///
         1.winner_party out_dl approval sociotropic_retro pocketbook_retro sociotropic_prospect pocketbook_prospect ///
         /* Two-way Interactions */ ///
         1.winner_party#c.out_dl ///
         1.winner_party#c.approval 1.winner_party#c.sociotropic_retro 1.winner_party#c.pocketbook_retro 1.winner_party#c.sociotropic_prospect 1.winner_party#c.pocketbook_prospect ///
         c.approval#c.out_dl c.sociotropic_retro#c.out_dl c.pocketbook_retro#c.out_dl c.sociotropic_prospect#c.out_dl c.pocketbook_prospect#c.out_dl ///
         /* Triple Interactions */ ///
         1.winner_party#c.approval#c.out_dl ///
         1.winner_party#c.sociotropic_retro#c.out_dl ///
         1.winner_party#c.pocketbook_retro#c.out_dl ///
         1.winner_party#c.sociotropic_prospect#c.out_dl ///
         1.winner_party#c.pocketbook_prospect#c.out_dl ///
    ) ///
noomitted ///
mtitles("Model 21" "Model 22" "Model 23" "Model 24" "Model 25") ///
nonumbers


** Table B7
eststo M21: quietly reg martial_law_attitude2 c.approval##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M22: quietly reg martial_law_attitude2 c.sociotropic_retro##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M23: quietly reg martial_law_attitude2 c.pocketbook_retro##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M24: quietly reg martial_law_attitude2 c.sociotropic_prospect##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M25: quietly reg martial_law_attitude2 c.pocketbook_prospect##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

esttab M21 M22 M23 M24 M25 using "tab/tabB7.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 2 and the Interaction between Economıc Evaluations, PPP Support, and Out-party Dislike (Party) \label{B7}) ///
keep( ///
         /* Main Effects */ ///
         1.winner_party out_dl approval sociotropic_retro pocketbook_retro sociotropic_prospect pocketbook_prospect ///
         /* Two-way Interactions */ ///
         1.winner_party#c.out_dl ///
         1.winner_party#c.approval 1.winner_party#c.sociotropic_retro 1.winner_party#c.pocketbook_retro 1.winner_party#c.sociotropic_prospect 1.winner_party#c.pocketbook_prospect ///
         c.approval#c.out_dl c.sociotropic_retro#c.out_dl c.pocketbook_retro#c.out_dl c.sociotropic_prospect#c.out_dl c.pocketbook_prospect#c.out_dl ///
         /* Triple Interactions */ ///
         1.winner_party#c.approval#c.out_dl ///
         1.winner_party#c.sociotropic_retro#c.out_dl ///
         1.winner_party#c.pocketbook_retro#c.out_dl ///
         1.winner_party#c.sociotropic_prospect#c.out_dl ///
         1.winner_party#c.pocketbook_prospect#c.out_dl ///
    ) ///
noomitted ///
mtitles("Model 21" "Model 22" "Model 23" "Model 24" "Model 25") ///
nonumbers


*------------------------------------------------------------*
* Figures ın Main Text
*------------------------------------------------------------*

* Fıgure 2

*** Coefficient plot (standarize) 
foreach var in approval sociotropic_retro pocketbook_retro sociotropic_prospect pocketbook_prospect {
    egen z_`var' = std(`var')
}

reg martial_law_attitude1  z_approval winner_party  out_dl	DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
estimates store MLA1
reg martial_law_attitude2   z_approval 	winner_party  out_dl	DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
estimates store MLA2

reg    martial_law_attitude1    z_sociotropic_retro	winner_party  out_dl	 DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
estimates store MLA1_sr
reg    martial_law_attitude1    z_pocketbook_retro 	winner_party  out_dl	 DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
estimates store MLA1_pr
reg    martial_law_attitude1    z_sociotropic_prospect winner_party  out_dl	 DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
estimates store MLA1_sp
reg    martial_law_attitude1    z_pocketbook_prospect 	winner_party  out_dl     DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
estimates store MLA1_pp

reg    martial_law_attitude2    z_sociotropic_retro	winner_party  out_dl	 DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
estimates store MLA2_sr
reg    martial_law_attitude2    z_pocketbook_retro 	winner_party  out_dl	 DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
estimates store MLA2_pr
reg    martial_law_attitude2    z_sociotropic_prospect winner_party  out_dl	 DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
estimates store MLA2_sp
reg    martial_law_attitude2    z_pocketbook_prospect 	winner_party  out_dl     DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
estimates store MLA2_pp


label variable z_approval "Approval"
label variable z_sociotropic_retro "Sociotropic Retro."
label variable z_pocketbook_retro "Pocketbook Retro."
label variable z_sociotropic_prospect "Sociotropic Prospect."
label variable z_pocketbook_prospect "Pocketbook Prospect."

set scheme plotplain, permanently
*set scheme plotplain, permanently
coefplot (MLA1, label(MLA1 Model 1) msymbol(circle) color(green)) (MLA1_sr, label(MLA1 Model 2) msymbol(diamond) color(green) legend(off)) (MLA1_pr, label(MLA1 Model 2) msymbol(square) color(green)) (MLA1_sp, label(MLA1 Model 3) msymbol(triangle) color(green)) (MLA1_pp, label(MLA1 Model 4) msymbol(plus) color(green)) /*
*/ (MLA2, label(MLA2 Model 1) msymbol(circle)  color(magenta)) (MLA2_sr, label(MLA2 Model 2) msymbol(diamond) color(magenta)) (MLA2_pr, label(MLA2 Model 2) msymbol(square) color(magenta)) (MLA2_sp, label(MLA2 Model 3) msymbol(triangle) color(magenta)) (MLA2_pp, label(MLA2 Model 4) msymbol(plus) color(magenta)), /*
*/ keep(z_approval winner_party z_sociotropic_retro z_pocketbook_retro z_sociotropic_prospect z_pocketbook_prospect) xline(0) xtitle("Standarized Effect Size") ///
   legend(position(6) ring(1) rows(2)) 

graph export "fig/coef_MLA.pdf",as(pdf) replace	


* Figure 3a. need to manually change legend
reg martial_law_attitude1 approval i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
margins winner_party, at(out_dl=(0(10)100))

marginsplot, xdimension(out_dl) ///
    title("Predicted Martial Law Attitude (National Security and Maintaining Order)") ///
		ylabel(1(1)6) ///
	yscale(range(1 6)) ///
    legend(position(6) ring(1) cols(3)) ///
    plot1opts(recast(line) lwidth(.8) lcolor(red)) ///
    plot2opts(recast(line) lwidth(.8) lcolor(blue)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
	level(95) ///
    xtitle("Out-Party Dislike (Party)") ///
    ytitle("Predicted Value") ///
	addplot((histogram out_dl, percent yscale(r(1 6) axis(1)) ylab(1(1)6) color(gs12%50) yaxis(2) yscale(alt axis(2))), below legend(order(3 "Same" 4 "label" 5 "scatter"))) ///
    name(ME, replace)
	
graph export "fig/ME1.pdf",as(pdf) replace	

* Figure 3b. need to manually change legend
reg martial_law_attitude2 approval i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
margins winner_party, at(out_dl=(0(10)100))

marginsplot, xdimension(out_dl) ///
    title("Predicted Martial Law Attitude (Opposition Uncooperative)") ///	
	ylabel(1(1)6) ///
	yscale(range(1 6)) ///
    legend(position(6) ring(1) cols(3)) ///
    plot1opts(recast(line) lwidth(.8) lcolor(red)) ///
    plot2opts(recast(line) lwidth(.8) lcolor(blue)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
	level(95) ///
    xtitle("Out-Party Dislike (Party)") ///
    ytitle("Predicted Value") ///
	addplot((histogram out_dl, percent yscale(r(1 6) axis(1)) ylab(1(1)6)  color(gs12%50) yaxis(2) yscale(alt axis(2))), below legend(order(3 "Same" 4 "label" 5 "scatter"))) ///
	name(ME, replace)
	
graph export "fig/ME2.pdf",as(pdf) replace


*** Figure 4 & 5 - 3 interaction models

* Figure 4: Martial Law Attitude 1

* Run the model 1
reg martial_law_attitude1 i.sociotropic_retro##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
* Margins for predicted values
margins sociotropic_retro#winner_party, at(out_dl=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(sociotropic_retro) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Sociotropic-Restrospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Party)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME1_sr.pdf",as(pdf) replace

* Run the model 2
reg martial_law_attitude1 i.pocketbook_retro##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
* Margins for predicted values
margins pocketbook_retro#winner_party, at(out_dl=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(pocketbook_retro) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Pocketbook-Restrospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Party)") ///
    ytitle("Predicted Martial Law Attitude") ///
        legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME1_pr.pdf",as(pdf) replace

* Run the model 3
reg martial_law_attitude1 i.sociotropic_prospect##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

* Margins for predicted values
margins sociotropic_prospect#winner_party, at(out_dl=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(sociotropic_prospect) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Sociotropic-Prospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Party)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME1_sp.pdf",as(pdf) replace

* Run the model 2
reg martial_law_attitude1 i.pocketbook_prospect##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
* Margins for predicted values
margins pocketbook_prospect#winner_party, at(out_dl=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(pocketbook_prospect) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Pocketbook-Prospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Party)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME1_pp.pdf",as(pdf) replace



* Figure 5: Martial Law Attitude 2

* Run the model 1
reg martial_law_attitude2 i.sociotropic_retro##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
* Margins for predicted values
margins sociotropic_retro#winner_party, at(out_dl=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(sociotropic_retro) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Sociotropic-Restrospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Party)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME2_sr.pdf",as(pdf) replace

* Run the model 2
reg martial_law_attitude2 i.pocketbook_retro##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
* Margins for predicted values
margins pocketbook_retro#winner_party, at(out_dl=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(pocketbook_retro) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Pocketbook-Restrospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Party)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME2_pr.pdf",as(pdf) replace

* Run the model 3
reg martial_law_attitude2 i.sociotropic_prospect##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

* Margins for predicted values
margins sociotropic_prospect#winner_party, at(out_dl=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(sociotropic_prospect) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Sociotropic-Prospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Party)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME2_sp.pdf",as(pdf) replace

* Run the model 2
reg martial_law_attitude2 i.pocketbook_prospect##i.winner_party##c.out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

* Margins for predicted values
margins pocketbook_prospect#winner_party, at(out_dl=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(pocketbook_prospect) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Pocketbook-Prospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Party)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME2_pp.pdf",as(pdf) replace

