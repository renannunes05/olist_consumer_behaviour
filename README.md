# Olist - Consumer Behaviour analysis

Olist is the largest department store in Brazilian marketplaces. The dataset is available on [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and has information on 100k orders from 2016 to 2018. It allows a detailed view of an order, from price to payment, customer location and reviews. 

The idea for this project was to analyse consumer behaviour patterns and trends to support the marketing team in setting the next campaign.

## Data Schema

<img src="https://i.imgur.com/HRhd2Y0.png" width=75% height=75%>

I used [SQL](https://github.com/renannunes05/olist_consumer_behaviour/blob/main/olist.sql) in BigQuery to perform the analysis, the findings were summarized on a [Tableau Dashboard](https://public.tableau.com/app/profile/renan.nunes/viz/OLIST_17213253050220/Dashboard1#1) and here below are some of the conclusions:

## Key takeaways:

- Even though **77% of transactions** were rated **3 or plus out of 5**, only **3.5% of customers returned** for at least a second time. To understand this issue, it is keen to **investigate customer experience in depth**.
- The **top 10 performing product categories** correspond to **68% of total sales** and should be the focus when addressing **how to increase sales**.
- The **average value of PCs orders** is almost **ten times higher** than the average order value. **Computers and accessories** appear in the **top 10 performing product categories**. Therefore, this group is very strategic when **leveraging revenue**.
- **42% of customers live in São Paulo**, which is also where **59% of sellers** are located. It suggests that **lower freight prices** or/and **faster deliveries** positively impact consumers' purchase decisions.
- **Customers shop more during the week** with higher frequencies from 10 AM to 4 PM. This is important when **considering the best time to promote marketing actions** that encourage more purchases.
- Regarding payment methods, **78% of purchases used credit cards** and **66% of them were made in two or more instalment**s. An effective strategy could be **directing marketing efforts towards consumers who follow credit card pages on social media**, for instance.

