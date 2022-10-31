###Query 1
use bank;
SELECT * FROM bank.client
	where district_id = 1
    limit 5;
    
###Query 2
select client_id from bank.client
	where district_id = 72
    order by client_id desc
    limit 1;

###Query 3
select amount from bank.loan
	order by amount
    limit 3;
    
###Query 4
select distinct status from bank.loan
	order by status;
    
###Query 5
select loan_id from bank.loan
	order by payments desc
    limit 1;
 
###Query 6
select account_id, amount from bank.loan
	order by account_id
    limit 5;
    
###Query 7
select account_id from bank.loan
	where duration = 60
    order by amount
    limit 5;
    
###Query 8
select distinct k_symbol from bank.order;
    
###Query 9
select order_id from bank.order
	where account_id = 34;

###Query 10
select distinct account_id from bank.order
	where order_id > 29540 and order_id <= 29560;
    
###Query 11
select amount from bank.order
	where account_to = 30067122;
    
###Query 12
select trans_id, date, type, amount from bank.trans
	where account_id = 793
    order by date desc
    limit 10;

###Query 13
select district_id, count(client_id) from bank.client
	where district_id < 10
    group by district_id;
	
###Query 14
select type, count(card_id) from bank.card
    group by type;

###Query 15
select account_id, sum(amount) from bank.loan
	group by account_id
    order by sum(amount) desc
    limit 10;

###Query 16
select  date, count(loan_id)from bank.loan
	where date < 930907
    group by date
    order by date desc;

###Query 17
select  date, count(loan_id), duration from bank.loan
	where date >= 971200 and date < 980000
	group by date, duration
    order by date, duration;
    
select date from bank.loan
order by date desc
    
###Query 18
select account_id, sum(amount), type from bank.trans
	where account_id = 396
    group by type;
    
###Query 19

select account_id, sum(amount), CASE type WHEN 'PRIJEM' then 'INCOMING' WHEN  'VYDAJ' then 'OUTCOMING' ELSE type END as type from bank.trans
where account_id = 396
group by type;
	
    
###Query 20
select
 case when columnname = 'account_id' and account_id = 396 then value end account_id,
  sum(case when columnname = 'INCOMING' and type = 'PRIJEM' then value end) type,
  sum(case when columnname = 'OUTCOMING' and type = 'VYDAJ' then value end) type
  
  from bank.trans;