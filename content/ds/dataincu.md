---
title: "Project for the Data Incubator Program"
draft: false
---
       
As data science develops dramatically these years, many financial institutes have used the latest methods and techniques to find patterns in the financial dataset and to guide their investment. Very few individual investor is able to apply these institute strategy because they lack of hardware. For example, in the stock market, the high-frequency trading methods require very high speed connection to the New York Stock Exchange server and very low transaction fee but individual doesn't have these advantages.

Moroever, very few individual investors are data science experts. Recent progress of reinforcement learning allows the machine to learn the stock investing strategy itself by looking at the historical stock data and assigning a reward function. As we learned that AlphaGo is able to learn many inovative strategies that human has never discovered before. It would be interesting to do the similar thing for a stock market. Even though many institutes have implemented this strtegies themselves but most most individual investors do not have the chance or knowledge to develop such a reinforcement learning algorithm themselves. Therefore, the final proposed Data Incubator project would be a simple platform that can let the machine learn the short-term stragety for a given stock. It would be interesting for individual investors to learn what rewarding strageties the machine finds and understand how these strageties work.

We have proposed to use the short-term stock intraday data for this project because the Google Finance intraday stock data for the last 10 days are publicly available. When a user chooses a stock on our web server, the backend software immediately gets the intraday stock price in the last ten days and starts the reinforcement learning. This could be easily extended to learn long-term data when it is needed. A script has been built to download the intraday for each day and saves in a SQLITE database. A simple visualization of the intraday stock data has also been initially finished. Over the course of Data Incubator Fellow program, a reinforcement learning algorithm will be built.

# Test Plot 1

to be posted soon...

# Test Plot 2

to be posted soon...

