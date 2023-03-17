# Gravity Model Made Easy
 
This repository serves as a beginner-friendly training session to conduct a gravity regression with [Stata](https://www.stata.com/). Stata is a software mainly used in my field, and still many people conduct their economics with Stata. It's a great and robust software, fast, and plenty of packages/supports for economists.

In this repo, I demonstrate how to conduct a gravity model of trade easily and quickly. This is a beginner-friendly tutorial so please do not expect the tutorial in this repo to be life-changing or publish-worthy. If you already know how to run a simple gravity yourself then you prolly doesn't need this repo. You might in fact teach me back and we can collab on a paper!

There is plenty of ways conducting a gravity model in Stata and there's no 1 way of doing things (as in Stata or other languages in general). In this tute, I borrow many concept from [Yotov (2022)](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4037001). His paper offers excellent summary of gravity model since the last 60 years, its various applications, and its advancement. I can't recommend enough for any trade economist to have a peek at this excellent paper.

The do-file, however, is my own. Its not the most amazing Stata do-file ever but it'll get the job done. If you perhaps knows how to improve my codes, please let me know!! Thanks in advance!!

Anyway, let's go dive straight into the tute!

## How to use

It's easier to clone this repo or download all the content. Put all of them in the same folder and the code will be easily run as long as you set the folder as working directory.

This tutorial uses data from [CEPII](http://www.cepii.fr/CEPII/en/bdd_modele/bdd_modele.asp). That is, I use [BACI](http://www.cepii.fr/CEPII/en/bdd_modele/bdd_modele_item.asp?id=37) database [this one to be exact](http://www.cepii.fr/DATA_DOWNLOAD/baci/data/BACI_HS17_V202301.zip) and [Gravity](http://www.cepii.fr/CEPII/en/bdd_modele/bdd_modele_item.asp?id=8) which I downloaded the Stata version. The two datasets are quite large so I slice them to only some goods and countries.


## References

- Yotov, Y. (2022). Gravity at Sixty: The Workhorse Model of Trade. CESifo Working Papers, 9584. https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4037001 

