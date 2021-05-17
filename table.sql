drop table Bill_payment;
drop table Customer cascade constraints;
drop table Employee cascade constraints;
drop table Stock;
drop table Product;
drop table Supplier;
drop table Company;

create table Customer(
    customer_id varchar(50) not null,
    customer_name varchar(50),
    gender varchar(10),
    address varchar(80),
    contact_no varchar(50),
    primary key(customer_id)
);

create table Company(
    company_id number(10) primary key,
    company_name varchar(50) unique,
    email varchar(50),
    address varchar(80),
    contact_no varchar(50)
);

create table Supplier(
    supplier_id varchar(50) primary key,
    company_id number(10),
    supplier_name varchar(50),
    contact_no varchar(50),
    foreign key(company_id) references Company(company_id) on delete cascade
);

create table Employee(
    employee_id varchar(50) primary key,
    employee_name varchar(50),
    salary number(10),
    hire_date date,
    job_title varchar(50)
);

create table Product(
    product_id varchar(50) primary key,
    supplier_id varchar(50),
    product_name varchar(50),
    weight varchar(10),
    price number(10,2),
    foreign key(supplier_id) references Supplier(supplier_id) on delete cascade
);

create table Bill_payment(
    bill_id varchar(50) primary key,
    customer_id varchar(50),
    product_id varchar(50),
    buy_date date,
    quantity number(10),
    amount number(10,2),
    payment_method varchar(50) default 'cash',
    issued_by_emp varchar(50),
    foreign key(customer_id) references Customer(customer_id) on delete cascade,
    foreign key(product_id) references Product(product_id) on delete cascade,
    foreign key(issued_by_emp) references Employee(employee_id) on delete cascade
);

create table Stock(
    product_id varchar(50) primary key,
    quantity int,
    foreign key(product_id) references Product(product_id) on delete cascade
);

insert into Employee values('M-1','Md. Zunaid Khan',40000,'1-January-2019','Manager');
insert into Employee values('E-101','Md. Yousuf Ali',18000,'1-January-2019','Worker');
insert into Employee values('E-102','Md. Biplob',16000,'1-January-2019','Worker');
insert into Employee values('E-103','Kamrun Nahar',15000,'1-January-2020','Worker');
insert into Employee values('E-104','Bilkis Ara',15000,'1-January-2021','Worker');
insert into Employee values('E-105','Tulip Akter',15000,'1-January-2021','Worker');
insert into Employee values('E-106','Md. Karim Seikh',14000,'1-January-21','Worker');
insert into Employee values('SE-1','Md. Akkas Mia',8000,'1-January-2019','Security Guard');
insert into Employee values('SE-2','Md. Tuhin Hossain',8000,'1-January-2019','Security Guard');
insert into Employee values('SE-3','Md. Kader Mia',8000,'1-January-2020','Security Guard');



insert into Customer values('C-121','Mr. Mohsin','Male','698/1,Sarai Masjid Road,Dania,Dhaka','01981504997');
insert into Customer values('C-122','Mr. Babu','Male','12/A,Sahid Faruk Road,Jatrabari,Dhaka','01878247189');
insert into Customer values('C-123','Mrs. Baby','Female','101/D,East Dolaipar Road,Jatrabari,Dhaka','01905052730');
insert into Customer values('C-124','Mr. Mojammel Haque','Male','56/C,Sanarpar,Matuail,Dhaka','01420320234');
insert into Customer values('C-125','Mrs. Karima Begum','Female','22/3,Jurain Railgate,Dhaka','01793614417');
insert into Customer values('C-126','Mrs. Doli','Female','32/A,Kazlar par,Dhaka','01323454567');
insert into Customer values('C-127','Mr. Saiful Islam','Male','11/1,Jatrabari,Dhaka','01987654321');
insert into Customer values('C-128','Mr. Junaid Khan','Male','121,Konapara,Dhaka','01876543213');
insert into Customer values('C-129','Mr. Kalam','Male','222/A,Shonir Akhra,Dania,Dhaka','01567876543');
insert into Customer values('C-130','Mrs. Rubi','Female','21/C,Rayerbag,Dhaka','01623645678');

insert into Company values(321,'Padma Bread ltd','padmabread@gmail.com','1/23,Rasulpur,Dania,Dhaka','789084');
insert into Company values(234,'Teer','Teer@yahoo.com','2/24,Barishal,Bangladesh,Dhaka','782345');
insert into Company values(222,'Mojumder Mill','Mojumber@hotmail.com','3/82,Kadamtali,Dhaka,Bangladesh','732143');
insert into Company values(210,'Desh Agro Mill','Desh@gmail.com','22/1,Rajshahi,Bangladesh','898321');
insert into Company values(123,'RS Cosmetics ltd','Cosmetic@yahoo.com','33/A,Rajsthan,India','+917645028732');
insert into Company values(111,'Matadoor Ballpen Industries ltd','Complain@matador.com.bd','1/1,West Rosulpur,Kamrangirchar,Dhaka,1211','880255152130');
insert into Company values(104,'Bashundhara paper mill','Bashundhara@gmail.com','22/A,Keraniganj,Dhaka','88023456743');
insert into Company values(105,'Casio elctronic ltd','Casio@hotmail.com','33/C,Chakhbazar,Dhaka','01495059874');
insert into Company values(56,'Abdul Vegetable agency','Abdul123@gmail.com','East Jatrabari Big mosque,Jatrabari,Dhaka','01878345984');
insert into Company values(55,'Milk vita Company','Milkvita@hotmail.com','33/3,Narayanganj bandar road,Narayanganj,Dhaka','01765634560');

insert into Supplier values('S-101',321,'Md. Mujib','01987670987');
insert into Supplier values('S-102',234,'Md. Akhlas','01723098456');
insert into Supplier values('S-103',222,'Md. Kader','01654389065');
insert into Supplier values('S-104',210,'Md. Obaidul','01423098547');
insert into Supplier values('S-105',123,'Md. Hasan','01530812397');
insert into Supplier values('S-106',111,'Md. Kobi','01812094651');
insert into Supplier values('S-107',104,'Md. Dulal','01301298345');
insert into Supplier values('S-108',105,'Md. Alal','01420934764');
insert into Supplier values('S-109',56,'Md. Bulbul','01920945728');
insert into Supplier values('S-110',55,'Md. Amir','01810465298');

insert into Product values('P-101','S-101','Padma Bread mini','150 gm',20.00);
insert into Product values('P-102','S-101','Padma Bread midium','500 gm',40.00);
insert into Product values('P-103','S-101','Padma Bread big','700 gm',60.00);
insert into Product values('P-104','S-102','Teer Oil','4500 ml',500.00);
insert into Product values('P-105','S-102','Teer Flour','500 gm',50.00);
insert into Product values('P-106','S-102','Teer Soybean Oil','500 gm',130.00);
insert into Product values('P-107','S-103','Mojumder Rice mini','25 kg',1680.00);
insert into Product values('P-108','S-103','Mojumder Rice','50 kg',3180.00);
insert into Product values('P-109','S-104','Desh Agro Rice mini','25 kg',1700.00);
insert into Product values('P-110','S-104','Desh Agro Rice','50 kg',3450.00);
insert into Product values('P-111','S-105','Fair and lovely','350 gm',200.00);
insert into Product values('P-112','S-105','Parasuit oil','400 ml',300.00);
insert into Product values('P-113','S-105','Olive oil','500 ml',400.00);
insert into Product values('P-114','S-105','Girls cosmetic set','5 kg',5000.00);
insert into Product values('P-115','S-106','Matadoor pen','1 piece',5.00);
insert into Product values('P-116','S-107','Bashundhara paper','1 piece',20.00);
insert into Product values('P-117','S-108','Casio Calculator','1 piece',300.00);
insert into Product values('P-118','S-109','Vegetable','50 kg',12000.00);
insert into Product values('P-119','S-110','Milk vita mini','500 ml',35.00);
insert into Product values('P-120','S-110','Milk vita','1 litre',70.00);
insert into Product values('P-121','S-110','Firm fresh','1 litre',65.00);

insert into Stock values('P-101',100);
insert into Stock values('P-102',100);
insert into Stock values('P-103',100);
insert into Stock values('P-104',100);
insert into Stock values('P-105',100);
insert into Stock values('P-106',100);
insert into Stock values('P-107',200);
insert into Stock values('P-108',200);
insert into Stock values('P-109',200);
insert into Stock values('P-110',200);
insert into Stock values('P-111',100);
insert into Stock values('P-112',100);
insert into Stock values('P-113',100);
insert into Stock values('P-114',100);
insert into Stock values('P-115',100);
insert into Stock values('P-116',100);
insert into Stock values('P-117',100);
insert into Stock values('P-118',10);
insert into Stock values('P-119',100);
insert into Stock values('P-120',100);


insert into Bill_payment(bill_id,customer_id,product_id,buy_date,quantity,amount,issued_by_emp) values('B-1','C-121','P-101','12-January-2021',1,20,'M-1');
insert into Bill_payment values('B-2','C-122','P-104','12-January-2021',1,500.00,'Bkash','M-1');
insert into Bill_payment values('B-3','C-123','P-108','13-January-2021',1,3180.00,'DBBL','M-1');
insert into Bill_payment values('B-4','C-121','P-112','13-January-2021',1,300.00,'Rocket','E-101');
insert into Bill_payment values('B-5','C-122','P-108','14-January-2021',1,300.00,'Cash','M-1');
insert into Bill_payment values('B-6','C-121','P-119','14-January-2021',1,35.00,'Cash','M-1');
insert into Bill_payment values('B-7','C-126','P-114','15-January-2021',1,5000.00,'Bkash','M-1');
insert into Bill_payment values('B-8','C-122','P-104','15-January-2021',1,500.00,'Bkash','M-1');
insert into Bill_payment values('B-9','C-126','P-115','16-January-2021',12,60.00,'Cash','E-103');
insert into Bill_payment values('B-10','C-122','P-116','16-January-2021',6,120.00,'Bkash','M-1');

