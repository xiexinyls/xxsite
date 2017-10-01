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
$$
\begin{align*}
P(w|\mathbf{X}_{D}=\mathbf{x}_{D},\mathbf{Y}_{D}=\mathbf{y}_{D}) & = \frac{P(\mathbf{X}_{D}=\mathbf{x}_{D},\mathbf{Y}_{D}=\mathbf{y}_{D}|w) \cdot P(w)}{P(\mathbf{x}_{D},\mathbf{y}_{D})}\\
 & =\frac{ P(X_1^1=x_1^1,\cdots,X_d^1=x_d^1,\cdots,X_1^n=x_1^n,\cdots,X_d^n=x_d^n,Y^1=y^1,\cdots,Y^n=y^n|w) \cdot P(w)}{P(X_1^1=x_1^1,\cdots,X_d^1=x_d^1,\cdots,X_1^n=x_1^n,\cdots,X_d^n=x_d^n,Y^1=y^1,\cdots,Y^n=y^n)}
\end{align*}
$$

Similarly, when the data points are independent, we may write the posterior function as
$$
\begin{align*}
P(w|\mathbf{X}_{D}=\mathbf{x}_{D},\mathbf{Y}_{D}=\mathbf{y}_{D}) & = \frac{P(\mathbf{X}_{D}=\mathbf{x}_{D},\mathbf{Y}_{D}=\mathbf{y}_{D}|w) \cdot P(w)}{P(\mathbf{X}_{D}=\mathbf{x}_{D},\mathbf{Y}_{D}=\mathbf{y}_{D})} \\
 & =\frac{\prod_{j}^{n}P(X^j=x^j,Y^j=y^j|w) \cdot P(w)}{P(\mathbf{X}_{D}=\mathbf{x}_{D},\mathbf{Y}_{D}=\mathbf{y}_{D})}\\
 & \propto \prod_{j}^{n}P(X^j=x^j,Y^j=y^j|w) \cdot P(w)
\end{align*}
$$


## Choice of Distribution

After you pick a method, you want to assume some forms of probability distribution for either generative model or discriminant model and then use the estimation method to get the parameters.

### Generative Models

If you have chosen the generative model, your task is to find some distribution form for $p(X|Y)$ and $p(Y)$.

_Categorical $Y$ and categorical $X$_

Suppose categorical $ Y $ could take value $ y_k\in\{y_1,\cdots,y_p\} $, where $p$ is categorical number for $Y$. Categorical $X$ could take $(x_1,\cdots,x_d)$, where categorical numbers of $X$ are all $m$. One easy thought to estimate $P(Y)$ using the data count for each category and normalize it. For example, suppose we have $n$ data points. For binary $Y=0,1$, we may simply assign $P(Y=0)=\textrm{count}(Y=0)/n$ and $P(Y=1)=\textrm{count}(Y=1)/n$. Similarly, we could also estimate $ P(X|Y) $ by counting
$$ P(X=(x_1,x_2,\cdots,x_d)|Y=y_k)\\=\textrm{count}(X=(x_1,x_2,\cdots,x_d),Y=y_k)/\textrm{count}(Y=y_k)$$
. Since $ X $ could be multi-dimensional, we need to estimate a great many parameters by iterating all possible state of $ X $. This is huge set of parameter. Take $ d $ dimensional $ m $ categorical $ X $ as an example. The parameter number for $ P(X|Y) $ is $$ (m^d-1)p $$. Storing these parameters even in memory is a problem for high dimensional $ X $. One simplification is to assume the independence of $ X $ given $ Y $ so we have
$$ P(X=(x_1,x_2,\cdots,x_d)|Y=y_k)=\prod_i^d P(X_i=x_i|Y=y_k) $$
. We have seen that now the parameter number reduces to
$$ (m-1)dp $$. This simplification is called **Naive Bayes**.

_Categorical $Y$ and continuous $X$_

Suppose categorical $Y$ could take value $y_k\in\{y_1,\cdots,y_p\}$, where $p$ is categorical number for $Y$. $X$ could take continuous value of $(x_1,\cdots,x_d)$. Similar to the above method, we could estimate $ P(Y) $ again by counting. However, we can not make the estimation of $ P(X|Y=y_k) $ by counting again because $ X $ is continuous. The data points are discrete so it won't cover the continuous space. Therefore, we need to assume some probability function form for for $ P(X|Y=y_k) $ and use the distribution estimation method below to estimate parameters from data for different $Y$. Of course, **Naive Bayes** could be used here too. Gaussian distribution form is often used for the probability $ P(X_i|Y=y_k) $ so we have
$$ P(X_i|Y=y_k)=N(\mu_{ik},\sigma_{ik}^2) $$


### Distriminant Models

If you have chosen the distriminant model, your task is to find some distribution form for $ P(Y|X) $. A typical model is **Generalized Linear Model** (GLM). It tries to relate some link function $g(\mu)$, where $\mu$ is the expecatation of $P(Y|X=x)$, to a linear form $(w_0+w^T x)$. Another way of saying that is it tris to represent the mean of $ P(Y|X=x) $, which is $\mu$, to be $\mu=g^{-1}(w_0+w^T x)$.

_Categorical $ Y $ and categorical $ X $_

Decision tree is a typical for this data type. 

_Categorical $ Y $ and continuous $ X $_

A typical learning algorithm for binary target $ Y $ is **Logistic Regression**. It belongs to one type of generalized linear model. Binary $ Y $ can be represented by Bernouli distribution $ P(Y=1)=\mu $ and $ P(Y=0)=1-\mu $. Its expectation $ \mu $ is the probability when $ Y=1 $. Its link function is $ g(\mu)=\ln [\mu/(1-\mu)] $. So we have expectation $ \mu $ represented by its inverse function
$$ \mu=g^{-1}(w_0+w^T X)=\frac{1}{1+e^{-(w_0+w^T x)} } $$
Accordingly, the form of $P(Y|X=x)$ should be
$$ P(Y=1|X=x)=\frac{1}{1+e^{-(w_0+w^T x)} } $$
$$ P(Y=0|X=x)=\frac{1}{1+e^{(w_0+w^T x)} } $$
, where $w=(w_1,w_2,\cdots,w_d)$. To get the optimal parameters, we want to maximize the likelihood function as we mention
$$ P(\mathbf{X}_D=\mathbf{x}_D,\mathbf{Y}_D=\mathbf{y}_D|\mathbf{w})=\prod_i^n P(X^i=x^i,Y^i=y^i|w) $$
. However, this is the joint distribution for both $ X $ and $ Y $ but the form we assume is the conditional probability of $ Y $ given $ X=x $. This won't be a problem because we can write
$$ \prod_i^n P(X^i=x^i,Y^i=y^i|w)=\prod_i^n P(Y^i=y^i|X^i=x^i,w)P(X^i=x^i)\propto \prod_i^n P(Y^i=y^i|X^i=x^i,w) $$
. We dont' have to worry $P(X^i=x^i)$ because it is not related to our parameters $w$. For the convenience to maximize the right hand side, we can apply natural log to it and write it in a succinct way
$$
\begin{align*}
l(w)& = \sum_j^n \ln p(Y^j=y^j|X^j=x^j,w)\\
= & \sum_j^n [y^j \cdot \ln P(Y^j=1|X^j=x^j,w) + (1-y^j) \cdot \ln P(Y^j=0|X^j=x^j,w) ]\\
= & \sum_j^n [y^j [ (w_0+w^T x^j)-\ln (1+\exp (w_0+w^T x^j) ) ] + (1-y^j) [-\ln (1+\exp (w_0+w^T x^j) )] ]\\
= & \sum_j^n [y^j (w_0+w^T x^j)-\ln (1+\exp (w_0+w^T x^j) ) \,\,]\\
\end{align*}
$$

This is a convex function with easy global maximum so we may set a learning speed parameter $\eta$ and use gradient descent to solve it. By convention of gradient decsent, we alway want to get the minimum of a defined cost function $J$. We can simply make $J(w)=-l(w)/(2n)$ so that minimizing $J(w)$ is the same as maximizing the likelihood function $l(w)$
$$\frac{\partial J(w)}{\partial w_0}=\frac{1}{2n}\sum_j^n [\frac{\exp (w_0+w^T x^j)}{(1+\exp (w_0+w^T x^j) )} - y^j ]=\frac{1}{2n} \sum_j^n [p(Y=1|X=x^j) - y^j]$$
$$\frac{\partial J(w)}{\partial w_i}=\frac{1}{2n}\sum_j^n [\frac{\exp (w_0+w^T x^j)}{(1+\exp (w_0+w^T x^j) )} x_i^j - y^j x_i^j]=\frac{1}{2n} \sum_j^n [P(Y=1|X=x^j) - y^j ]x_i^j$$
so
$$w^{t+1}=w^t-\eta \cdot J(w)_w $$

_Continuous $Y$ and continuous $X$_

A typical model for continuous target $Y$ is **Linear Regression**. It belongs to one type of Generalized Linear Model. It assumes Gaussian distribution for $P(Y|X=x)$, whose mean is $\mu$. We choose the link function to be $g(\mu)=\mu$. So we have $ \mu=g^{-1}(w_0+w^T x)=w_0+w^T x $. So now we can easily have the distribution form for $ P(Y|X=x) $
$$ P(Y|X=x)=\frac{1}{\sqrt{\pi 2 \sigma^2}}\large e^{-\frac{[Y-(w_0+w^T x)]^2}{2\sigma^2} } $$
. Here we also introduces another parameter $ \sigma $, which could possibly depends on $ X $ too. But for simplicity, let's just assume it has nothing to do with the linear coefficient $ w $ so that we won't have to worry about it in the estimation step. The next step is to do the estimation step writing likelihood function
$$ \prod_i^n P(X^i,Y^i|w)=\propto \prod_i^n P(Y^i|X^i,w) $$
. Again for the convenience to maximize the right hand side, we can apply natural log to it and write it in a succinct way
$$
\begin{align*}
l(w)& = \sum_j^n \ln P(Y^j=y^j|X^j=x^j,w)\\
&= \sum_j^n \ln \frac{1}{\sqrt{\pi 2 \sigma^2}}\large e^{-\frac{[y^j-(w_0+w^T x^j)]^2}{2\sigma^2} }\\
&\propto - \sum_j^n [y^j-(w_0+w^T x^j)]^2
\end{align*}
$$

Again by the convention of gradient descent, let the cost function be $J(w)=-l(w)/(2n)$. Get its derivative of all parameters $w$
$$ \frac{\partial J(w)}{\partial w_0}=\frac{1}{n}\sum_j^n[(w_0+w^T x^j) - y^j] $$
$$ \frac{\partial J(w)}{\partial w_i}=\frac{1}{n}\sum_j^n [(w_0+w^T x^j) - y^j]x^j $$
Of course we may use gradient descent to get the results
$$ w^{t+1}=w^t-\eta \cdot J(w)_w $$
, where $ J(w)_w $ is the gradient of $ J(w) $ with respect to $ w $. But multi-variate linear regression actually has a closed form solution
$$ w=(X^TX)X^Ty $$
where we have
$$
X=\left[\begin{array}{c}
x^{1}\\
\vdots\\
x^{n}
\end{array}\right]=\left[\begin{array}{ccc}
x_{1} & \cdots & x_{d}\end{array}\right]
$$

# Reference
Christopher M. Bishop, *Pattern Recognition and Machine Learning*.

Tom M. Mitchell, *Machine Learning*.