---
title: "Statistical Learning Theory"
draft: false
---
$
\def\Cov{\mathrm{Cov} }
\def\Var {\mathrm{Var} }
\def\diff{\mathrm{d} }
\def\Diff{\mathrm{D} }
\def\ln{\mathrm{ln} }
\def\pt{\partial }
\def\E{\mathrm{E}}
$
(material organized by Xin Xie)

Some math notation are explained first. The operator $P(S)$ means the probability of some set $S$ of sample space. Random variables are some real-value function of sample space. It would be much easier to specify the set we want for the probability  by using some condition of random variables. For example, $P(X=x)$ means the probabililty for the set when random variable $ X $ is taking the value $ x $.

For convenience, we may use some assumed functional form to describe the probability when random variable $ X $ is taking certain value $ x $. For discrete random variable $ X $, we use the probability mass function $ p(x) $ to represent the probability when $ X=x $,
$$ P(X=x)=p(x) $$
. For continuous random variable, probability is only defined over an interval by its probability density funciton $ f(x) $
$$ P(X \in [a,b] ) = \int_a^b f(x) \diff x$$
. Although the above probability notation is clear, it is convenient to just write $ P(X) $ to mean the probability distribution of random variables $ X $ without specifying its value $ x $ yet. In this case, $ P(X) $ is just a function of random variable $ X $.

For statistical learning, we use $X$ and $Y$ to represent $ d $-dimensional input random variable $(X_1,X_2,\cdots,X_d)$ and target random variable $(Y)$ (usually one dimension). We use superscript to represent different data dimension and subscript to represent different data point. When we have a lot of observations, there will be many $X$ and $Y$. We use bold math symbol $\mathbf{X}_D$ and $\mathbf{Y}_D$ means $n$ number of data $(X^1,X^2,\cdots,X^n)$ and target points $(Y^1,Y^2,\cdots,Y^n)$. $j$th data point and $i$th variable is $X_i^j$. Model parameters $w$ is a vector (a model could have many parameters).

For a lot of times to make prediction, we want to find the conditional probability distribution of target $Y$ given input $X=x$
$$ P(Y|X=x) $$
. After we get this probability, we want to take a look at the conditional distribution of $Y$ and choose an appropriate $Y$ as our output.

## Choice of Models

How to obtain that probability $P(Y|X)$? There are two choices to do it.

One way is to use the whole joint distribution information
$$P(Y|X)=\frac{P(X,Y)}{P(X)}=\frac{P(X|Y)P(Y)}{P(X)}$$
when we know both $p(X|Y)$ and $p(Y)$. In this situation, the joint distribuion is also known because $p(X,Y)=p(X|Y)p(Y)$. Model using this thinking is called **generative model** because the whole joint distribution is given so that we can actually generate data samples from the joint distribution. Naive Bayes is a kind of generative model.
* Another way is to directly assume a particular functional form for this conditional probability
$$P(Y|X)$$
. Since we don't need to know the joint distribution, we call it **distriminant model**. Linear regression and logistic regression are such models.

It is no wrong to prefer one way than the other. The choice depends many aspects such data number, data distribution, assumption and so on.

## Estimation Method
Whatever model you choose, one problem is that we do not know the model parameter for either $ P(X|Y) $, $ P(Y) $ or $ P(Y|X) $. We need some methods to estimate the model parameters $ \mathbf{w} $ in a way that gives us the least cost or matches the data as much as possible using the data we have. There are also two usual ways to estimate the parameters from data.

**Frequnist interpretation** thinks maximizing the data likelihood function
$$ P(\mathbf{X}_D,\mathbf{Y}_D|w) $$
will give us the optimal parameter vector $w$. Note that, suppose $ \mathbf{x}_D $ and $ \mathbf{y}_D $ are the observaed data so we want to maximize
$$
P(\mathbf{X}_D=\mathbf{x}_D,\mathbf{Y}_D=\mathbf{y}_D|w) = P(X_1^1=x_1^1,\cdots,X_d^1=x_d^1,\cdots,X_1^n=x_1^n,\cdots,X_d^n=x_d^n,Y^1=y^1,\cdots,Y^n=y^n|w)
$$

Especially, when the data points are independent, we may write the data likelihood function as
$$ P(\mathbf{X}_D=\mathbf{x}_D,\mathbf{Y}_D=\mathbf{y}_D|w)=\prod_j^n P(X^j=x^j,Y^j=y^j|w) $$
. If we can represent $ P(X^j,Y^j|w) $ with certain known probability distribution form, we can solve the optimal parameter $w$ that maximizes the likelihood probability.

**Bayesian interpretation** thinks the model parameters should have a distribution rather than a fixed value set. And the parameter distribution should change according to the introduction of new data. Therefore, they assume a known prior distribution of parameter $P(w)$. The final parameter distribution is given using Bayesian rule
$$ P(w|\mathbf{X}_D,\mathbf{Y}_D) = \frac{P(\mathbf{X}_D,\mathbf{Y}_D|w) \cdot P(w)}{P(\mathbf{X}_D,\mathbf{Y}_D)} $$
where the denominator is given by
$$ P(\mathbf{X}_D,\mathbf{Y}_D) = \int P(\mathbf{X}_D,\mathbf{Y}_D|w) \textrm{d}w $$
, which totally depends on data and has not much to do with the parameter estimation. However, the nominator has the paramter term $w$ so it is important to us. Again if we assume certain form of $ P(X_j,Y_j|w) $ and parameter distribution $ P(w) $, we want to maximize the following form
