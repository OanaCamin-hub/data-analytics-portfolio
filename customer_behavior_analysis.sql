CREATE TABLE orders (
2
    order_id INT,
3
    day VARCHAR(20),
4
    sales INT,
5
    items INT,
6
    category VARCHAR(20)
7
); 
8
SELECT * FROM orders;
9
INSERT INTO orders VALUES
10
(1,'Monday',45,2,'Bowl'),
11
(2,'Monday',60,3,'Bowl'),
12
(3,'Monday',25,1,'Pita'),
13
(4,'Tuesday',55,2,'Bowl'),
14
(5,'Tuesday',30,1,'Pita'),
15
(6,'Tuesday',70,3,'Bowl'),
16
(7,'Wednesday',40,2,'Salad'),
17
(8,'Wednesday',65,3,'Bowl'),
18
(9,'Wednesday',28,1,'Pita'),
19
(10,'Thursday',75,3,'Bowl'),
20
(11,'Thursday',35,2,'Salad'),
21
(12,'Thursday',50,2,'Bowl'),
22
(13,'Friday',85,4,'Bowl'),
23
(14,'Friday',45,2,'Salad'),
24
(15,'Friday',30,1,'Pita'),
25
(16,'Saturday',95,4,'Bowl'),
26
(17,'Saturday',55,2,'Salad'),
27
(18,'Saturday',35,1,'Pita'),
28
(19,'Sunday',80,3,'Bowl'),
29
(20,'Sunday',50,2,'Salad'),
30
(21,'Sunday',40,2,'Bowl');
Text to DDL

Query SQL
1
SELECT day, ROUND(AVG(sales),2) AS avg_sales
2
FROM orders
3
GROUP BY day
4
ORDER BY avg_sales DESC;
5
SELECT category, 
6
       COUNT(*) AS total_orders,
7
       ROUND(AVG(sales),2) AS avg_order_value,
8
       SUM(sales) AS total_revenue
9
FROM orders
10
GROUP BY category
11
ORDER BY total_revenue DESC;
12
SELECT 
13
CASE 
14
    WHEN day IN ('Saturday','Sunday') THEN 'Weekend'
15
    ELSE 'Weekday'
16
END AS period,
17
ROUND(AVG(sales),2) AS avg_sales
18
FROM orders
19
GROUP BY period;
20
SELECT category,
21
       SUM(sales) AS revenue,
22
       ROUND(SUM(sales) * 100.0 / (SELECT SUM(sales) FROM orders),2) AS revenue_percentage
23
FROM orders
24
GROUP BY category
25
ORDER BY revenue_percentage DESC;

