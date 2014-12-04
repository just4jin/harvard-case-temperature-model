harvard-case-linear-model
=========================

Compagnie du Froid, S.A. case study from Harvard Business Review https://hbr.org/product/compagnie-du-froid-s-a/an/197085-PDF-ENG?N=4294936176&Ntt=Robert+L.+Simons

The owner of an ice cream company Compagnie du Froid, S.A. must evaluate the performance of three regional businesses. To do the analysis, students must flex the budget by seasonal temperature; calculate revenue, volume, price, and efficiency variances; analyze the effects of transfer prices; and calculate return-on-investment. In addition, the owner considers how to set strategic boundaries and how to compensate his managers.

The code investigates the seasonal temperature's effect on ice cream sales volume growth rate. Specificaly, test if the rule of thumb that a 1°C deviation from the mean summer temperature results in a 3% change in ice-
cream volume growth holds for all three regions French, Spain, and Italy. To do the analysis, a simple linear regression has been built.

Results:

France

Volume Growth = 0.0369496 * Temperature - 1.0152617			
ΔVolume Growth =  3.69496% * ΔTemperature			

Spain

Volume Growth = 0.0267689 * Temperature - 0.7036655			
ΔVolume Growth =  2.67689% * ΔTemperature			

Italy

Volume Growth =0.0486204 * Temperature - 1.3093428			
ΔVolume Growth =  4.86204 % * ΔTemperature		

Combined

Volume Growth = 0.0319289 * Temperature - 0.850896			
ΔVolume Growth =  3.19289% * ΔTemperature			
