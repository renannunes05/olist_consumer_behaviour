#TOTAL COUNT OF CUSOMERS BY STATE

SELECT COUNT(DISTINCT customer_unique_id ) AS total_customers,
       customer_state
FROM `olist.customers`
GROUP BY customer_state
ORDER BY total_customers DESC;


#TOTAL COUNT OF SELLERS BY STATE

SELECT COUNT(DISTINCT seller_id) AS total_sellers,
       seller_state
FROM `olist.sellers`
GROUP BY seller_state
ORDER BY total_sellers DESC;


#AVERAGE PRODUCT PRICE BY CATEGORY

SELECT ROUND(AVG(price), 2) AS avg_price_category, product_category_name,
      (SELECT ROUND(AVG(price), 2) FROM `olist.order_items`) AS avg_price
FROM `olist.order_items` AS o
INNER JOIN `olist.products` AS p
ON o.product_id = p.product_id
GROUP BY product_category_name
ORDER BY avg_price_category DESC
LIMIT 10;


#TOTAL COUNT OF PRODUCTS SOLD BY CATEGORY

SELECT COUNT(p.product_id) AS total_products, product_category_name,
FROM `olist.order_items` AS o
INNER JOIN `olist.products` AS p
ON o.product_id = p.product_id
GROUP BY product_category_name
ORDER BY total_products DESC
LIMIT 10;


#TOTAL REVENUE AND AVERAGE PRICE BY CATEGORY

SELECT ROUND(SUM(price),2) AS total_revenue,
       ROUND(AVG(price), 2) AS avg_price_category,
       product_category_name,
FROM `olist.order_items` AS o
INNER JOIN `olist.products` AS p
ON o.product_id = p.product_id
GROUP BY product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


#TRACKING DAY OF WEEK AND TIME OF PURCHASES

SELECT FORMAT_TIMESTAMP('%A', order_purchase_timestamp) AS weekday_name,
       EXTRACT(HOUR FROM order_purchase_timestamp) AS hour,
       COUNT(order_id) AS total_orders
FROM `olist.orders`
GROUP BY weekday_name, hour
ORDER BY weekday_name, hour;


#TOTAL OF RETURNING CUSTOMERS

SELECT COUNT(*) AS returning_customers
FROM(SELECT COUNT(order_id) AS total_purchases_per_customer, customer_unique_id
    FROM  `olist.customers` AS c
    INNER JOIN `olist.orders` AS o
    ON c.customer_id = o.customer_id
    GROUP BY customer_unique_id
    HAVING total_purchases_per_customer > 1
);


#TOTAL CUSTOMERS

SELECT COUNT(DISTINCT customer_unique_id)
    FROM `olist.customers`


#PAYMENT METHODS USED

SELECT COUNT (order_id) AS orders,
       payment_type
FROM `olist.order_payments`
GROUP BY payment_type;


#PAYMENTS MADE IN INSTALLMENTS AND COUNT OF PAYMENTS

SELECT (SELECT COUNT(payment_installments)
       FROM `olist.order_payments`
       WHERE payment_type LIKE 'credit_card' AND payment_installments > 1) AS paid_in_installments,
       COUNT(payment_type) AS total_pays
FROM `olist.order_payments`
WHERE payment_type LIKE 'credit_card';


#POSITIVE REVIEWS

SELECT COUNT(DISTINCT order_id) AS total_reviews,
    (SELECT COUNT(DISTINCT order_id)
    FROM `olist.reviews`
    WHERE review_score > 3) AS positive_reviews
FROM `olist.reviews`;
