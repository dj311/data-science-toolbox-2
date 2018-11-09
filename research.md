
# Research into classification techniques
  - Penalized Regression: https://web.as.uky.edu/statistics/users/pbreheny/764-F11/notes/8-30.pdf
  - Non linear link function/regression : https://stats.stackexchange.com/questions/120047/nonlinear-vs-generalized-linear-model-how-do-you-refer-to-logistic-poisson-e
  - Beyond Linear Regression : https://www4.stat.ncsu.edu/~reich/st590/Nonlinear.pdf
  - variable selection: http://www.biostat.jhsph.edu/~iruczins/teaching/jf/ch10.pdf
  - Info on Bootstrapping : https://www.statmethods.net/advstats/bootstrapping.html
  - Info on Clustering : https://www.statmethods.net/advstats/cluster.html
  - Info on Binary Logistic Regression : https://www.statisticssolutions.com/binary-logistic-regression/
  - Info on AIC/BIC:https://methodology.psu.edu/AIC-vs-BIC
  - Logit model in R: https://onlinecourses.science.psu.edu/stat504/node/225/

Paper which compares 3 methods of classifying network data in the KDD-99 data set as normal or bad:
  - Katos, V., 2007. Network intrusion detection: Evaluating cluster, discriminant, and logit analysis. Information Sciences, 177(15), pp.3060-3073. https://doi.org/10.1016/j.ins.2007.02.034
  - Abstract:
  > This paper evaluates the statistical methodologies of cluster analysis, discriminant analysis, and Logit analysis used in the examination of intrusion detection data. The research is based on a sample of 1200 random observations for 42 variables of the KDD-99 database, that contains ‘normal’ and ‘bad’ connections. The results indicate that Logit analysis is more effective than cluster or discriminant analysis in intrusion detection. Specifically, according to the Kappa statistic that makes full use of all the information contained in a confusion matrix, Logit analysis (K = 0.629) has been ranked first, with second discriminant analysis (K = 0.583), and third cluster analysis (K = 0.460).



## Research using penalisation into enhance existing models

# Research into performance metrics for classification

Requirements (from assessment PDF):

  - Think about the circumstances by which your chosen performance metric will lead to real-world generalisability, and how generalisability might be compromised for the purpose of standardisation.
  - You should create a test and validation dataset, but you may choose how to do this.
  - Demonstrate this with data and/or simulation;
      - For example, if you believe that you can predict new types of data, you could demonstrate this by leaving out some types of data and observing your performance.

We should also consider (and write about) the **context** of this work:

  - We are looking to classify traffic as `normal` and `not-normal`, where `not-normal` traffic is probably malicious.
  - We don't want false negatives, but still need a balance: we care about **sensitivity**.


## Residual Errors
  Info on PRESS(predicted residual error sum of squares): https://en.wikipedia.org/wiki/PRESS_statistic


## Cross-Validation

Should consider multiple approaches to cross-validation to avoid over-fitting:

  - K-Fold Cross-Validation
  - Leave-one-out Cross-Validation


## Confusion Matrix

  - <https://en.wikipedia.org/wiki/Confusion_matrix>

Provides a simple method of comparing two classification models against one another. It directly compare the false positives vs true positives etc. A normalised version can compare performance against different sized data sets.

Can compare this to [type I and type II errors](https://en.wikipedia.org/wiki/Type_I_and_type_II_errors):

> In statistical hypothesis testing, a type I error is the rejection of a true null hypothesis (also known as a "false positive" finding), while a type II error is failing to reject a false null hypothesis (also known as a "false negative" finding).

These give intuitive measures of how the model has performed.

Using the simple measure of [accuracy](Accuracy_and_precision#In_binary_classification) can cause us to optimise away the prediction of rare classes (see "Rare Class Problem" in <sup><a id="fnr.1" class="footref" href="#fn.1">1</a></sup>).


## ROC Curve

  - <https://en.wikipedia.org/wiki/Receiver_operating_characteristic>
  - <sup><a id="fnr.1.100" class="footref" href="#fn.1">1</a></sup>

A ROC curve is a plot of sensitivity versus specificity, and plots the available trade-off between the two.


## Precision-Recall Curve

Optional addition to compare with ROC curve:

> PR curves are especially useful in evaluating data with highly unbalanced outcomes.


## Lift

Lift is a measure of how effective the model is at identifying (comparatively rare) 1s at different probability cutoffs.


## Chi-Squared Test

TODO: Find out more about this. Is it applicable, if so how?


## Cohen's Kappa Statistic

  - Used in <sup><a id="fnr.2" class="footref" href="#fn.2">2</a></sup> to evaluate metrics

Function of all elements in a [1.2](#orgbad24e6).

From <Cohen's_kappa>:

> Cohen's kappa coefficient (κ) is a [statistic](https://en.wikipedia.org/wiki/Statistic) which measures [inter-rater](https://en.wikipedia.org/wiki/Inter-rater_agreement)
> [agreement](https://en.wikipedia.org/wiki/Inter-rater_agreement) for qualitative (categorical) items. It is generally thought to be a
> more robust measure than simple percent agreement calculation, as κ takes
> into account the possibility of the agreement occurring by chance. There is
> controversy surrounding Cohen’s kappa due to the difficulty in interpreting
> indices of agreement.


# Footnotes

<sup><a id="fn.1" href="#fnr.1">1</a></sup> Practical Statistics for Data Science, 1st ed., by Peter Bruce and Andrew Bruce (O’Reilly Media, 2017).

<sup><a id="fn.2" href="#fnr.2">2</a></sup> Katos, V., 2007. Network intrusion detection: Evaluating cluster, discriminant, and logit analysis. Information Sciences, 177(15), pp.3060-3073. <https://doi.org/10.1016/j.ins.2007.02.034>
