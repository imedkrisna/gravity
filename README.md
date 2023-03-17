# Gravity Model Made Easy
 
This repository serves as a beginner-friendly training session to conduct a gravity regression with [Stata](https://www.stata.com/). Stata is a software mainly used in my field, and still many people conduct their economics with Stata. It's a great and robust software, fast, and plenty of packages/supports for economists.

In this repo, I demonstrate how to conduct a gravity model of trade easily and quickly. This is a beginner-friendly tutorial so please do not expect the tutorial in this repo to be life-changing or publish-worthy. If you already know how to run a simple gravity yourself then you prolly doesn't need this repo. You might in fact teach me back and we can collab on a paper!

This is by no means the most amazing Stata do-file ever, but it'll get the job done. If you perhaps knows how to improve my codes, please let me know!! Thanks in advance!!

Anyway, let's go dive straight into the tute!

## How to use

It's easier to clone this repo or download all the content. Put all of them in the same folder and the code will be easily run as long as you set the folder as working directory.

In this tutorial, I use Stata 17 with 08 Mar 2023 update. You also should make sure you already have estout, esttab, ppml, reghdfe and ppmlhdfe installed on your Stata. You can install these packages with `ssc install <package>` as long as you have an internet connection.

This tutorial uses data from [CEPII](http://www.cepii.fr/CEPII/en/bdd_modele/bdd_modele.asp). That is, I use [Gravity](http://www.cepii.fr/CEPII/en/bdd_modele/bdd_modele_item.asp?id=8) which I downloaded the Stata version. The two datasets are quite large so I slice them to only some countries and some years.

If you want to prepare your own gravity data, be sure to check out the file "gravitycreate.do" and tweak whatever part necessary for your own use. I encourage you to play around with that!

The main do-file for this tutorial is gravity.do. That is the file you want to play with. gravity.dta is the Stata database file created by gravitycreate.do, which contains a trimmed version of gravity data from CEPII. gravity.xls and gravity.txt are the regression table created by gravity.do.

## Gravity model

### What is gravity model?
Gravity model is an estimation method used mainly in international trade, a branch of economics. Tinbergen (1962) is usually the paper cited as the first conceptor and user of gravity model, and others develop from that model. The most popular paper (arguably) for early gravity model of trade is Anderson and van Wincoop (2003) which already cited more than 10k (including from me 😂).

Taken from to Yotov (2022), The gravity model of trade takes its inspiration from the Newtonian Gravity Theory which says that (roughly speaking) the force of gravity between two objects $i,j$ is positively impacted by their masses & their distance. In other words:

$$F_{ij}=G\frac{M_iM_j}{D_{ij}^2}$$

In trade, the same principle is applied. The gravitational force in the case of trade is basically the trade value or trade quantity between two countries $i,j$, which can be explained by the output value of the exporting country, the purchasing power of the importing country, and their distance. 

$$X_{ij}=\tilde{G}\frac{Y_iE_j}{T_{ij}^\theta}$$

These days, we use GDP as a measure of the mass (both production and demand). Distance, meanwhile, get generalized as "trade frictions" instead of just distance. Well, in the end, distance is a measure of trade cost. That is, the farther countries are, the more expensive it is to trade with them, generally speaking. The common variable to measure trade frictions are contiguity, tariff, non-tariffs, logistics performance index, among others.

Gravity model still very useful because it is very intuitive, great predictive power, very flexible and easily expanded to other uses. These days, we use gravity model to isolate the impact of gravity variables from trade so we can estimate our main variable of interests, which usually are policies or events related to industrial output, employment, and many things along those lines. For example, in my paper, I link firms total factor productivity and NTM using the gravity model (Gupta, 2022).

### Estimating gravity model
Generally, there're two ways to estimate the gravity model. The first is to use OLS or regression. We first linearized the equation by using log transformation so we get:

$$\ln X_{ij}=\ln \tilde{G} + \ln Y_i + \ln E_j - \theta \ln T_{ij}$$

which then we can estimate using an OLS. Obviously the parameter for each variable is the power of its variable in the original equation.

The second, better approach is to use Pseudo-Poisson Maximum Likelihood estimation (PPML) first introduced by Silva and Tenreyro (2006). This paper change the game in the gravity equation because PPML is proven to show consistency under heteroskedasticity and zero trade flow.

The PPML estimates:

$$X_{ij}=e^{\tilde{G}\frac{Y_iE_j}{T_{ij}^\theta}}$$

Without having to linearized our dependent variable (i.e., no log zero problem).

Here, we will learn how to run gravity with these two techniques. I estimate the original gravity but with an additional time index. I also explains why in policy setting we might want to have a exporter-time and importer-time fixed effects, as recommended by Yotov (2022). I also use the traditional setting with reg and ppml as well as reghdfe and ppmlhdfe.

## Learning more
Obviously, gravity model has various use that's much more complicated than this tutorial serves you. For the latest development (at least during the writing of this tutorial) of gravity model for your research, I really recommend checking out [Yotov (2022)](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4037001). The paper offers excellent summary of gravity model since the last 60 years, its various applications, and its advancement. I can't recommend enough for any trade economist to have a peek at this excellent paper.

Gravity model (PPML) also available in python, developed by [USITC](https://www.usitc.gov/data/gravity/index.htm). You can check out [my blog post](https://www.krisna.or.id/en/post/ppml/) on how to run PPML from python using [GME](https://www.usitc.gov/data/gravity/gme.htm) package.

## References

- Anderson, James E. and Eric van Wincoop. (2003). “Gravity with Gravitas: A Solution to the Border Puzzle,” _American Economic Review_, 93 (1), 170–192.
- Gupta, K. (2022). The Heterogenous Impact of Tariff and NTM on Total Factor Productivity of Indonesian Firms. Bulletin of Indonesian Economic Studies, 1-29. https://doi.org/10.1080/00074918.2021.2016613 
- Silva, S., & Tenreyro, S. (2006). The Log of Gravity. The Review of Economics and Statistics, 88(4), 19. 
- Tinbergen, Jan. (1962). Shaping the World Economy: Suggestions for an International Economic Policy, New York: The Twentieth Century Fund.
- Yotov, Y. (2022). Gravity at Sixty: The Workhorse Model of Trade. CESifo Working Papers, 9584. https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4037001 

