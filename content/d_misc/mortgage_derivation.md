## Mortgage Formula Derivation

### Geometry Series

$$ S_n = 1 + a + a^2 + \cdots + a^{n-1} + a^n$$

$$ S_n a = a + a^2 + a^3 + \cdots + a^n+ a^{n+1} $$

$$ S_n (a-1) = a^{n+1}-1 $$

$$ S_n = \frac{1-a^{n+1}}{(1-a)} $$

### Derivation

$n$ number of months
$m$ monthly payment
$a$ annualized interest rate
$r=a/12$ monthly interest rate (anuualized interest rate divided by 12 months)
$p$ principal

**First Month $n=1$**

starting debt = principal $p$

current interest = starting debt * monthly interest rate $$pr$$
actual principal payment = ( monthly payment - current interest ) $$ m-pr $$
debt left = ( starting debt - actual principal payment ) $$ p-(m-pr)=(1+r)p-m $$

**Second Month $n=2$**

starting debt = last debt $(1+r)p-m$

current interest = starting debt * monthly interest rate $$ ( (1+r)p-m ) r= (1+r)rp-mr $$
actual principal payment = ( monthly payment - current interest ) $$ m-[(1+r)rp-mr] $$
debt left = ( starting debt - actual principal payment )
$$
\begin{aligned}
&(1+r)p-m-[m-((1+r)rp-mr)]\\
=&(1+r)p-2m+((1+r)rp-mr)\\
=&(1+r)p+(1+r)rp-2m-mr\\
=&(r+1)^2p-(1+r)m-m
\end{aligned}
$$

**Third Month $n=3$**

starting debt = last debt $(r+1)^2p-(1+r)m-m$

current interest = starting debt * monthly interest rate
$$
\begin{aligned}
&[ (r+1)^2p-(1+r)m-m ] r\\
=& r(r+1)^2p-(1+r)rm-rm
\end{aligned}
$$
actual principal payment = ( monthly payment - current interest ) $$ m-[r(r+1)^2p-(1+r)rm-rm] $$
debt left = ( starting debt - actual principal payment )
$$
\begin{aligned}
&(r+1)^2p-(1+r)m-rm - \left[ m-[r(r+1)^2p-(1+r)rm-rm] \right]\\
=&(r+1)^3p -(1+r)^2m -(1+r)m - m
\end{aligned}
$$

Now the formula for debt left at the $n$th term seems to be
$$(r+1)^np -m[ (1+r)^{n-1}+\cdots+(1+r)^2 +(1+r) + 1] $$. We use the fomula for the sum of geometric series $$ S_n = \frac{1-a^{n+1}}{(1-a)} $$. So the final formula becomes $$ (r+1)^{n}p + m\frac{ 1-(r+1)^{n} }{ r } $$.

We can use **math induction** to prove it.

**the case of $n$th term**

debt left $ (r+1)^{n}p + m\frac{ 1-(r+1)^{n} }{ r } $.

**the case of $(n+1)$th term**

starting debt = last debt $$ (r+1)^{n}p + m\frac{ 1-(r+1)^{n} }{ r } $$
current interest = starting debt * monthly interest rate $$ r(r+1)^{n}p + rm\frac{ 1-(r+1)^{n} }{ r } $$
actual principal payment = ( monthly payment - current interest ) $$ m - [ r(r+1)^{n}p + rm\frac{ 1-(r+1)^{n} }{ r } ] $$

debt left = ( starting debt - actual principal payment )
$$
\begin{aligned}
&(r+1)^{n}p + m\frac{ 1-(r+1)^{n} }{ r } -  \left [ m - [ r(r+1)^{n}p + rm\frac{ 1-(r+1)^{n} }{ r } ] \right ]  \\
=& (r+1)^{n+1}p + m\frac{ 1-(r+1)^{n} }{ r } - m + rm\frac{ 1-(r+1)^{n} }{ r } ]\\
=& (r+1)^{n+1}p + m [ \frac{ 1-(r+1)^{n} }{ r } - \frac{r}{r} + \frac{ r-r(r+1)^{n} }{ r } ] \\
=& (r+1)^{n+1}p + m [ \frac{ 1-(r+1)(r+1)^{n} }{ r } ] \\
=& (r+1)^{n+1}p + m [ \frac{ 1-(r+1)^{n+1} }{ r } ]
\end{aligned}
$$

Cosistent with the formula for $n$th term. So it proves.

To calculate the monthly payment, we let the final debt of the $n$th term be zero.
$$ (r+1)^np + m\frac{ 1-(r+1)^n }{ r } = 0 $$
So we have the formula for monthly payment $$ m = \frac{ (r+1)^np }{ \frac{ (r+1)^n - 1 }{ r }  } = p r \frac{ (r+1)^n }{ (r+1)^n - 1  } =  \frac{ p r }{ 1 - (r+1)^{-n} }$$

### What is the Total Interest?

Total Interest = number of months * number of terms - principal
$$
\begin{aligned}
m*n - p &= \frac{ p r }{ 1 - (r+1)^{-n} }*n - p \\
&= [ \frac{ n r }{ 1 - (r+1)^{-n} } - 1 ]p
\end{aligned}
$$

### An Example

Suppose we are getting the mortgage loan 350K with interest rate 3%. Then $p=350000$ and fixed anualized interest rate $a=0.03$ for 30 years. Plug them in the formula. The monthly interest rate $r=a/12=0.03/12=0.0025$. Number of terms $ n = 30\times 12=360 $.

Monthly payment $$ \frac{ p r }{ 1 - (r+1)^{-n} } = \frac{ 350000\times 0.03 }{ 1 - (0.0025+1)^{-360} } = 1475 $$

Total interest $$ m*n-p = 1475*360-350000 = 181221 $$

So with annualized interest rate 3%, you have to pay more than half of the principal as interest. The fraction of total interest over principal is $$ \frac{ n r }{ 1 - (r+1)^{-n} } - 1 $$. The following table shows the change of total interest fraction on various interest rates ($n=30\times 12=360$).

| Interest Rate | Total Interest |
|----------|:-------------:|
| 0.01 | 0.158 |
| 0.014 | 0.225 |
| 0.018 | 0.295 |
| 0.022 | 0.367 |
| 0.026 | 0.441 |
| 0.03 | 0.518 |
| 0.034 | 0.597 |
| 0.038 | 0.677 |
| 0.042 | 0.76 |
| 0.046 | 0.846 |
| 0.05 | 0.933 |

With 5% annualized interest rate, the total interest is almost the same as the principal.
