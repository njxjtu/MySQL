use db01;
drop table if exists `receipts`;
create table receipts(
receipt_id   int               comment 'unique id',
receipt_type varchar(20)       comment 'receipt category', 
receipt_date date              comment 'receipt date',
receipt_net decimal(8,2)       comment 'net amount',
receipt_tax decimal(8,2)       comment 'tax amount',
receipt_total decimal(8,2)     comment 'total amount',
receipt_pay_type varchar(10)   comment 'pay type: cash, credit, debit',
receipt_customer varchar(10)   comment 'customer name',
receipt_shop_type varchar(10)  comment 'shop type: online, store',
receipt_store_name varchar(20) comment 'seller',
receipt_location varchar(100)  comment 'store location',
receipt_receipt varchar(1)     comment 'receipt kept: Y or N',
receipt_desc varchar(100)      comment 'comment',
constraint receipts_pk primary key(receipt_id))
comment = 'Receipt records';
