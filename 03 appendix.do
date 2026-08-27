********************************************************************************
* Objective - Appendix for Delegating Democracy Away?
* Date - July 5, 2026
* Author - Yuko Sato
*********************************************************************************

*cd "C:\Users\ysato\Desktop\code_revısed"

use "data/250104_final", clear 

*------------------------------------------------------------*
* Appendix C1: General Martıal Law Support
*------------------------------------------------------------*

** MLS and the approval + economıc evaluatıons
eststo M1: quietly ologit martial_law_support     approval 	i.winner_party  out_dl	DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M2: quietly ologit martial_law_support   sociotropic_retro i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M3: quietly ologit martial_law_support   pocketbook_retro i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M4: quietly ologit martial_law_support   sociotropic_prospect i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M5: quietly ologit martial_law_support   pocketbook_prospect i.winner_party  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

esttab M1 M2 M3 M4 M5 using "tab/tabC1.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Support, Approval, and Economic Evaluations \label{C1}) ///
drop(0.winner_party) ///
noomitted ///
mtitles("Model 1" "Model 2" "Model 3" "Model 4" "Model 5") ///
nonumbers


*------------------------------------------------------------*
* Appendix C2-C3: Alternative IV (1) PID
*------------------------------------------------------------*

** Table C2
eststo M6: quietly reg martial_law_attitude1   approval i.PPP  out_dl	DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M7: quietly reg martial_law_attitude1 sociotropic_retro i.PPP out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M8: quietly reg martial_law_attitude1 pocketbook_retro i.PPP out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M9: quietly reg martial_law_attitude1 sociotropic_prospect i.PPP out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust
eststo M10: quietly reg martial_law_attitude1 pocketbook_prospect i.PPP out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust

esttab M6 M7 M8 M9 M10 using "tab/tabC2.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 1 and PPP Support based on PID \label{C2}) ///
drop(0.PPP) ///
noomitted ///
mtitles("Model 6" "Model 7" "Model 8" "Model 9" "Model 10") ///
nonumbers

** Table C3
eststo M11: quietly reg martial_law_attitude2  approval i.PPP  out_dl	DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M12: quietly reg martial_law_attitude2 sociotropic_retro i.PPP  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M13: quietly reg martial_law_attitude2 pocketbook_retro i.PPP  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M14: quietly reg martial_law_attitude2 sociotropic_prospect i.PPP out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust
eststo M15: quietly reg martial_law_attitude2 pocketbook_prospect i.PPP out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust

esttab M11 M12 M13 M14 M15 using "tab/tabC3.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 2 and PPP Support based on PID \label{C3}) ///
drop(0.PPP) ///
noomitted ///
mtitles("Model 11" "Model 12" "Model 13" "Model 14" "Model 15") ///
nonumbers


*------------------------------------------------------------*
* Appendix C4-C5: Alternative IV (2) Full Scale Party ID
*------------------------------------------------------------*

** Table C4
eststo M16: quietly reg martial_law_attitude1   approval i.DM9  out_dl	DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M17: quietly reg martial_law_attitude1 sociotropic_retro i.DM9 out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M18: quietly reg martial_law_attitude1 pocketbook_retro i.DM9 out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M19: quietly reg martial_law_attitude1 sociotropic_prospect i.DM9 out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust
eststo M20: quietly reg martial_law_attitude1 pocketbook_prospect i.DM9 out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust

esttab M16 M17 M18 M19 M20 using "tab/tabC4.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 1 and Party ID (Full Scale) \label{C4}) ///
noomitted ///
mtitles("Model 16" "Model 17" "Model 18" "Model 19" "Model 20") ///
nonumbers

** Table C5
eststo M21: quietly reg martial_law_attitude2  approval i.DM9  out_dl	DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M22: quietly reg martial_law_attitude2 sociotropic_retro i.DM9  out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M23: quietly reg martial_law_attitude2 pocketbook_retro i.DM9 out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M24: quietly reg martial_law_attitude2 sociotropic_prospect i.DM9 out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust
eststo M25: quietly reg martial_law_attitude2 pocketbook_prospect i.DM9 out_dl DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust

esttab M21 M22 M23 M24 M25 using "tab/tabC5.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 2 and Party ID (Full Scale) \label{C5}) ///
noomitted ///
mtitles("Model 21" "Model 22" "Model 23" "Model 24" "Model 25") ///
nonumbers


*------------------------------------------------------------*
* Appendix C6-C9: Interactıon between winner_party and Out-party Dislike (Leader)
*------------------------------------------------------------*

** Table C6
eststo M26: quietly reg martial_law_attitude1 approval i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M27: quietly reg martial_law_attitude1 sociotropic_retro i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M28: quietly reg martial_law_attitude1 pocketbook_retro i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M29: quietly reg martial_law_attitude1 sociotropic_prospect i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust
eststo M30: quietly reg martial_law_attitude1 pocketbook_prospect i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3 , robust

esttab M26 M27 M28 M29 M30 using "tab/tabC6.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 1 and the Interaction between PPP Support and Out-party Dislike (Leader) \label{C6})  ///
drop(0.winner_party) ///
noomitted ///
mtitles("Model 26" "Model 27" "Model 28" "Model 29" "Model 30") ///
nonumbers


** Table C7
eststo M31: quietly reg martial_law_attitude2 approval i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M32: quietly reg martial_law_attitude2 sociotropic_retro i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M33: quietly reg martial_law_attitude2 pocketbook_retro i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M34: quietly reg martial_law_attitude2 sociotropic_prospect i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M35: quietly reg martial_law_attitude2 pocketbook_prospect i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

esttab M31 M32 M33 M34 M35 using "tab/tabC7.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 2 and the Interaction between PPP Support and Out-party Dislike (Leader) \label{C7})  ///
drop(0.winner_party) ///
noomitted ///
mtitles("Model 31" "Model 32" "Model 33" "Model 34" "Model 35") ///
nonumbers


*** 3 term interaction models
** Table C8
eststo M36: quietly reg martial_law_attitude1 c.approval##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M37: quietly reg martial_law_attitude1 c.sociotropic_retro##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M38: quietly reg martial_law_attitude1 c.pocketbook_retro##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M39: quietly reg martial_law_attitude1 c.sociotropic_prospect##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M40: quietly reg martial_law_attitude1 c.pocketbook_prospect##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

esttab M36 M37 M38 M39 M40 using "tab/tabC8.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 1 and the Interaction between Economıc Evaluations, PPP Support, and Out-party Dislike (Leader) \label{C8})  ///
keep( ///
         /* Main Effects */ ///
         1.winner_party out_dl_Leader approval sociotropic_retro pocketbook_retro sociotropic_prospect pocketbook_prospect ///
         /* Two-way Interactions */ ///
         1.winner_party#c.out_dl_Leader ///
         1.winner_party#c.approval 1.winner_party#c.sociotropic_retro 1.winner_party#c.pocketbook_retro 1.winner_party#c.sociotropic_prospect 1.winner_party#c.pocketbook_prospect ///
         c.approval#c.out_dl_Leader c.sociotropic_retro#c.out_dl_Leader c.pocketbook_retro#c.out_dl_Leader c.sociotropic_prospect#c.out_dl_Leader c.pocketbook_prospect#c.out_dl_Leader ///
         /* Triple Interactions */ ///
         1.winner_party#c.approval#c.out_dl_Leader ///
         1.winner_party#c.sociotropic_retro#c.out_dl_Leader ///
         1.winner_party#c.pocketbook_retro#c.out_dl_Leader ///
         1.winner_party#c.sociotropic_prospect#c.out_dl_Leader ///
         1.winner_party#c.pocketbook_prospect#c.out_dl_Leader ///
    ) ///
noomitted ///
mtitles("Model 36" "Model 37" "Model 38" "Model 39" "Model 40") ///
nonumbers


** Table C9
eststo M41: quietly reg martial_law_attitude2 c.approval##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M42: quietly reg martial_law_attitude2 c.sociotropic_retro##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M43: quietly reg martial_law_attitude2 c.pocketbook_retro##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M44: quietly reg martial_law_attitude2 c.sociotropic_prospect##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
eststo M45: quietly reg martial_law_attitude2 c.pocketbook_prospect##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

esttab M41 M42 M43 M44 M45 using "tab/tabC9.tex", replace b(3) se(3) r2  star(* 0.10 ** 0.05 *** 0.01) obslast label ///
title(Martial Law Attitude 2 and the Interaction between Economıc Evaluations, PPP Support, and Out-party Dislike (Leader) \label{C9}) ///
keep( ///
         /* Main Effects */ ///
         1.winner_party out_dl_Leader approval sociotropic_retro pocketbook_retro sociotropic_prospect pocketbook_prospect ///
         /* Two-way Interactions */ ///
         1.winner_party#c.out_dl_Leader ///
         1.winner_party#c.approval 1.winner_party#c.sociotropic_retro 1.winner_party#c.pocketbook_retro 1.winner_party#c.sociotropic_prospect 1.winner_party#c.pocketbook_prospect ///
         c.approval#c.out_dl_Leader c.sociotropic_retro#c.out_dl_Leader c.pocketbook_retro#c.out_dl_Leader c.sociotropic_prospect#c.out_dl_Leader c.pocketbook_prospect#c.out_dl_Leader ///
         /* Triple Interactions */ ///
         1.winner_party#c.approval#c.out_dl_Leader ///
         1.winner_party#c.sociotropic_retro#c.out_dl_Leader ///
         1.winner_party#c.pocketbook_retro#c.out_dl_Leader ///
         1.winner_party#c.sociotropic_prospect#c.out_dl_Leader ///
         1.winner_party#c.pocketbook_prospect#c.out_dl_Leader ///
    ) ///
noomitted ///
mtitles("Model 41" "Model 42" "Model 43" "Model 44" "Model 45") ///
nonumbers


*------------------------------------------------------------*
* Figures in Appendix
*------------------------------------------------------------*

* Figure C1a * need to manually change legend
reg martial_law_attitude1 approval i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
margins winner_party, at(out_dl_Leader=(0(10)100))

marginsplot, xdimension(out_dl_Leader) ///
    title("Predicted Martial Law Attitude (National Security and Maintaining Order)") ///
		ylabel(1(1)6) ///
	yscale(range(1 6)) ///
    legend(position(6) ring(1) cols(3)) ///
    plot1opts(recast(line) lwidth(.8) lcolor(red)) ///
    plot2opts(recast(line) lwidth(.8) lcolor(blue)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
	level(95) ///
    xtitle("Out-Party Dislike (Leader)") ///
    ytitle("Predicted Value") ///
	addplot((histogram out_dl_Leader, percent yscale(r(1 6) axis(1)) ylab(1(1)6) color(gs12%50) yaxis(2) yscale(alt axis(2))), below legend(order(3 "Same" 4 "label" 5 "scatter"))) ///
    name(ME, replace)
	
graph export "fig/ME1_appC1.pdf",as(pdf) replace	

* Figure C1b *need to manually change legend
reg martial_law_attitude2 approval i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
margins winner_party, at(out_dl_Leader=(0(10)100))

marginsplot, xdimension(out_dl_Leader) ///
    title("Predicted Martial Law Attitude (Opposition Uncooperative)") ///	
	ylabel(1(1)6) ///
	yscale(range(1 6)) ///
    legend(position(6) ring(1) cols(3)) ///
    plot1opts(recast(line) lwidth(.8) lcolor(red)) ///
    plot2opts(recast(line) lwidth(.8) lcolor(blue)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
	level(95) ///
    xtitle("Out-Party Dislike (Leader)") ///
    ytitle("Predicted Value") ///
	addplot((histogram out_dl_Leader, percent yscale(r(1 6) axis(1)) ylab(1(1)6)  color(gs12%50) yaxis(2) yscale(alt axis(2))), below legend(order(3 "Same" 4 "label" 5 "scatter"))) ///
	name(ME, replace)
	
graph export "fig/ME2_appC2.pdf",as(pdf) replace	


*** Figure C2 & C3 - 3 interaction models

* Figure C2: Martial Law Attitude 1

* Run the model 1
reg martial_law_attitude1 i.sociotropic_retro##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
* Margins for predicted values
margins sociotropic_retro#winner_party, at(out_dl=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl_Leader) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(sociotropic_retro) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Sociotropic-Restrospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Leader)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME1_sr_app.pdf",as(pdf) replace

* Run the model 2
reg martial_law_attitude1 i.pocketbook_retro##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
* Margins for predicted values
margins pocketbook_retro#winner_party, at(out_dl_Leader=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl_Leader) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(pocketbook_retro) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Pocketbook-Restrospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Leader)") ///
    ytitle("Predicted Martial Law Attitude") ///
        legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME1_pr_app.pdf",as(pdf) replace

* Run the model 3
reg martial_law_attitude1 i.sociotropic_prospect##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

* Margins for predicted values
margins sociotropic_prospect#winner_party, at(out_dl_Leader=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl_Leader) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(sociotropic_prospect) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Sociotropic-Prospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Leader)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME1_sp_app.pdf",as(pdf) replace

* Run the model 2
reg martial_law_attitude1 i.pocketbook_prospect##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
* Margins for predicted values
margins pocketbook_prospect#winner_party, at(out_dl_Leader=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl_Leader) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(pocketbook_prospect) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Pocketbook-Prospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Leader)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME1_pp_app.pdf",as(pdf) replace

* Figure C3: Martial Law Attitude 2

* Run the model 1
reg martial_law_attitude2 i.sociotropic_retro##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
* Margins for predicted values
margins sociotropic_retro#winner_party, at(out_dl_Leader=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl_Leader) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(sociotropic_retro) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Sociotropic-Restrospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Leader)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME2_sr_app.pdf",as(pdf) replace

* Run the model 2
reg martial_law_attitude2 i.pocketbook_retro##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust
* Margins for predicted values
margins pocketbook_retro#winner_party, at(out_dl_Leader=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl_Leader) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(pocketbook_retro) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Pocketbook-Restrospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Leader)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME2_pr_app.pdf",as(pdf) replace

* Run the model 3
reg martial_law_attitude2 i.sociotropic_prospect##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

* Margins for predicted values
margins sociotropic_prospect#winner_party, at(out_dl_Leader=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl_Leader) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(sociotropic_prospect) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Sociotropic-Prospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Leader)") ///
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME2_sp_app.pdf",as(pdf) replace

* Run the model 2
reg martial_law_attitude2 i.pocketbook_prospect##i.winner_party##c.out_dl_Leader DM1 DM2 DM4 DM6  i.DM8 i.DM3, robust

* Margins for predicted values
margins pocketbook_prospect#winner_party, at(out_dl_Leader=(0(10)100)) level(95)

* Plot predicted values with confidence intervals
marginsplot, xdimension(out_dl_Leader) ///
    plot1opts(recast(line) lcolor(red)) ///
    ci1opts(recast(rarea) color(red%20)) ///
    plot2opts(recast(line) lcolor(blue)) ///
    ci2opts(recast(rarea) color(blue%20)) ///
    by(pocketbook_prospect) ///
    ylabel(-2(2)12) ///
	byopts(title("Effect of Pocketbook-Prospective Evaluation") ///
    rows(1)) xtitle("Out-Party Dislike (Leader)") ////
    ytitle("Predicted Martial Law Attitude") ///
    legend(position(6) cols(2) order(1 2) ///
           label(1 "Non-PPP Supporters") ///
           label(2 "PPP Supporters"))

graph export "fig/ME2_pp_app.pdf",as(pdf) replace



*------------------------------------------------------------*
* Appendix B Table B8 & B9: Conditional Marginal Effects (H3)
*------------------------------------------------------------*

*------------------------------------------------------------*
* Table B8 (MLA1)
*------------------------------------------------------------*

eststo clear

*------------------------*
* Sociotropic Retro
*------------------------*
reg martial_law_attitude1 ///
    i.sociotropic_retro##i.winner_party##c.out_dl ///
    DM1 DM2 DM4 DM6 i.DM8 i.DM3, robust

margins sociotropic_retro#winner_party, dydx(out_dl) post
eststo SR

*------------------------*
* Sociotropic Prospect
*------------------------*
reg martial_law_attitude1 ///
    i.sociotropic_prospect##i.winner_party##c.out_dl ///
    DM1 DM2 DM4 DM6 i.DM8 i.DM3, robust

margins sociotropic_prospect#winner_party, dydx(out_dl) post
eststo SP

*------------------------*
* Pocketbook Retro
*------------------------*
reg martial_law_attitude1 ///
    i.pocketbook_retro##i.winner_party##c.out_dl ///
    DM1 DM2 DM4 DM6 i.DM8 i.DM3, robust

margins pocketbook_retro#winner_party, dydx(out_dl) post
eststo PR

*------------------------*
* Pocketbook Prospect
*------------------------*
reg martial_law_attitude1 ///
    i.pocketbook_prospect##i.winner_party##c.out_dl ///
    DM1 DM2 DM4 DM6 i.DM8 i.DM3, robust

margins pocketbook_prospect#winner_party, dydx(out_dl) post
eststo PP

*------------------------------------------------------------*
* Export to LaTeX
*------------------------------------------------------------*

esttab SR SP PR PP using "tab/ME_MLA1.tex", ///
    replace ///
    label ///
    booktabs ///
    title("Conditional Marginal Effects of Out-Party Dislike") ///
    mtitles("Socio. Retro" "Socio. Prospect" "Pocket. Retro" "Pocket. Prospect") ///
    cells("b(fmt(3) star) se(par fmt(3)) p(fmt(3))") ///
    compress



*------------------------------------------------------------*
* Table B9 (MLA2)
*------------------------------------------------------------*

eststo clear

*------------------------*
* Sociotropic Retro
*------------------------*
reg martial_law_attitude2 ///
    i.sociotropic_retro##i.winner_party##c.out_dl ///
    DM1 DM2 DM4 DM6 i.DM8 i.DM3, robust

margins sociotropic_retro#winner_party, dydx(out_dl) post
eststo SR

*------------------------*
* Sociotropic Prospect
*------------------------*
reg martial_law_attitude2 ///
    i.sociotropic_prospect##i.winner_party##c.out_dl ///
    DM1 DM2 DM4 DM6 i.DM8 i.DM3, robust

margins sociotropic_prospect#winner_party, dydx(out_dl) post
eststo SP

*------------------------*
* Pocketbook Retro
*------------------------*
reg martial_law_attitude2 ///
    i.pocketbook_retro##i.winner_party##c.out_dl ///
    DM1 DM2 DM4 DM6 i.DM8 i.DM3, robust

margins pocketbook_retro#winner_party, dydx(out_dl) post
eststo PR

*------------------------*
* Pocketbook Prospect
*------------------------*
reg martial_law_attitude2 ///
    i.pocketbook_prospect##i.winner_party##c.out_dl ///
    DM1 DM2 DM4 DM6 i.DM8 i.DM3, robust

margins pocketbook_prospect#winner_party, dydx(out_dl) post
eststo PP

*------------------------------------------------------------*
* Export to LaTeX
*------------------------------------------------------------*

esttab SR SP PR PP using "tab/ME_MLA2.tex", ///
    replace ///
    label ///
    booktabs ///
    title("Conditional Marginal Effects of Out-Party Dislike") ///
    mtitles("Socio. Retro" "Socio. Prospect" "Pocket. Retro" "Pocket. Prospect") ///
    cells("b(fmt(3) star) se(par fmt(3)) p(fmt(3))") ///
    compress
	
	
