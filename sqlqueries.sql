-------total product------------
SELECT count(`product_id`) as ProductCount,YEAR(`date`),MONTH(`date`)
FROM `Sales` 
GROUP BY YEAR(`date`), MONTH(`date`)


------total product sales by year and id ---------
SELECT
    COUNT(`product_id`),
    `product_name`,
    YEAR(`date`)
FROM
    `Sales`,
    `Product`
WHERE
    `product_id` IN(
SELECT
    id
FROM
    `Product`
) AND YEAR(`date`) = 2018 AND `Product`.`id` = `Sales`.`product_id`
GROUP BY
    `product_name`,
    YEAR(`date`)

---find all products by year
SELECT
    COUNT(`product_id`),
    `product_name`,
    YEAR(`date`)
FROM
    `Sales`,
    `Product`
WHERE
    `product_id` IN(
SELECT
    id
FROM
    `Product`
) AND YEAR(`date`) in (SELECT YEAR(`date`) FROM `Sales`) AND `Product`.`id` = `Sales`.`product_id`
GROUP BY
    `product_name`,
    YEAR(`date`)

---find all products by year/month----
SELECT
    COUNT(`product_id`),
    `product_name`,
    YEAR(`date`),
    MONTH(`date`)
FROM
    `Sales`,
    `Product`
WHERE
    `product_id` IN(
SELECT
    id
FROM
    `Product`
) AND YEAR(`date`) IN(
SELECT
    YEAR(`date`)
FROM
    `Sales`
) AND `Product`.`id` = `Sales`.`product_id`
GROUP BY
    `product_name`,
    YEAR(`date`),
    MONTH(`date`)
----total number of products sold--------------
SELECT
    COUNT(`person_id`),
    `f_name`,
    `l_name`
FROM
    `Sales`,
    `Person`
WHERE
    `Person`.`id` = `Sales`.`person_id`
GROUP BY
    `person_id`
----find all products sold by people by year/month------
SELECT
    COUNT(`person_id`),
    `f_name`,
    `l_name`,
    YEAR(`Sales`.`date`),
    MONTH(`Sales`.`date`)
FROM
    `Sales`,
    `Person`
WHERE
    `Person`.`id` = `Sales`.`person_id`
GROUP BY
    `person_id`,
    YEAR(`Sales`.`date`),
    MONTH(`Sales`.`date`)

---find all products sold by person by year/month------
SELECT
	COUNT(`Sales`.`person_id`) as `sales_count`,
    `f_name`,
    `l_name`,
    YEAR(`Sales`.`date`),
    MONTH(`Sales`.`date`)
FROM
    `Sales`,
    `Person`
WHERE
    `Person`.`id` = `Sales`.`person_id` AND `Person`.`f_name` = 'Cleo' AND `Person`.`l_name` = 'Elliott'
GROUP BY
    `person_id`,
    YEAR(`Sales`.`date`),
    MONTH(`Sales`.`date`)

------------check totals per inviduals----------------
SELECT
    `Sales`.`id`,
    `f_name`,
    `l_name`,
    `date`
FROM
    `Sales`,
    `Person`
WHERE
    `Person`.`id` = `Sales`.`person_id` AND `Person`.`f_name` = 'Samson'
ORDER BY
    `Sales`.`date` ASC