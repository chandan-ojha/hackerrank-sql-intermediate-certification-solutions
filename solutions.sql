/***** Q1.Products without sales Solutions *****/
SELECT
sku,
product_name
FROM Product p
LEFT JOIN INVOICE_ITEM ii ON ii.product_id = p.id
WHERE invoice_id is NULL
ORDER BY sku

/***** Q2.Product sales per city *****/

select ci.city_name, pr.product_name, ROUND(sum(ii.line_total_price), 2) as tot
from city ci, customer cu, invoice i, invoice_item ii, product pr
where ci.id = cu.city_id and cu.id = i.customer_id and i.id = ii.invoice_id and ii.product_id = pr.id
group by ci.city_name, pr.product_name
order by tot desc, ci.city_name, pr.product_name