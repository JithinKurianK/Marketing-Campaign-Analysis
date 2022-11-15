--creating customer information table from marketing campaign
CREATE TABLE cust_info
(
	id INT PRIMARY KEY,
	year_birth INT,
	education VARCHAR (255),
	marital_status VARCHAR (255),
	income INT,
	kidhome INT,
	kidhome1 TEXT,
	teenhome INT,
	teenhome1 TEXT
)

INSERT INTO cust_info
(
select id, year_birth,education,marital_status,income,kidhome
, case when kidhome = 1 then 'YES'
		ELSE 'NO'
  END as kidhome1
,teenhome 
, case when teenhome = 1 then 'YES' 
	    ELSE 'NO' 
  END AS teenhome1
 from marketing_campaign
) 

--creating table of customer purchase from marketing campaign

CREATE TABLE cust_purchase
(
id INT PRIMARY KEY,
MeatProducts INT,
FishProducts INT,
SweetProducts INT,
Wine INT,
Fruits INT,
GoldProducts INT,
Total_purchase INT
)

INSERT INTO cust_purchase
(
select id, mntmeatproducts,mntfishproducts,mntsweetproducts,mntwines,mntfruits,mntgoldprods,(mntwines+mntfruits+mntmeatproducts+mntsweetproducts+mntgoldprods+mntfishproducts) as total_purchase
from marketing_campaign
)

select * 
from cust_purchase

--creating table of customers type of purchase

CREATE TABLE cust_type_of_purchase
(
id INT PRIMARY KEY,
deals_purchase INT,
web_purchase INT,
catalogue_purchase INT,
store_purchase INT
) 

INSERT INTO cust_type_of_purchase
( 
select id, numdealspurchases, numwebpurchases, numcatalogpurchases, numstorepurchases
from marketing_campaign
)

--creating table of campaign

CREATE TABLE cust_campaign
(
id INT PRIMARY KEY,
days_from_last_purchase INT,
webvisits_month INT,
camp1 INT,
camp2 INT,
camp3 INT,
camp4 INT,
camp5 INT,
camp6 INT
)

INSERT INTO cust_campaign
(
select id, recency,numwebvisitsmonth,acceptedcmp1,acceptedcmp2,acceptedcmp3,acceptedcmp4,acceptedcmp5, response
from marketing_campaign
)
