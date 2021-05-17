--FIND MAXIMUM AND MINIMUM CUSTOMER ID

set serveroutput on
declare
    max_customer_id Customer.customer_id%type;
    min_customer_id Customer.customer_id%type;
begin
    select max(customer_id) into max_customer_id from Customer;
    select min(customer_id) into min_customer_id from Customer;

    --PRINT OUTPUT
    dbms_output.put_line('The maximum customer id is:'|| max_customer_id);
    dbms_output.put_line('The minimum customer id is:'|| min_customer_id);
end;
/


--FIND THE NAME OF THE EMPLOYEE WHO GETS MAXIMUM SALARY.

set serveroutput on
declare
    s Employee.salary%type;
    nam Employee.emp_name%type;
begin
    select max(salary) into s from Employee;
    select emp_name into nam from Employee where salary=s;
    dbms_output.put_line('Employee name '||nam||' who get maximum salary= '||s);
end;
/
    

/*
DISPLAY THE COMPANY NAME WHERE A SUPPLIER WORK.

*/
set serveroutput on
declare
    comp_name Company.company_name%type;
    supp_name Supplier.supplier_name%type :='Md. Mujib';
begin
    select company_name into comp_name from Supplier,Company where Supplier.company_id=Company.company_id and supp_name=Supplier.supplier_name;
    dbms_output.put_line(supp_name || ' Works in '||comp_name ||' Company');
end;
/

/* IF ELSIF ELSE

NOW, LETS CHECK YOUR SEARCH PRODUCTS HAS ANY DISCOUNT OR NOT.

CONDITIONS:

1. PRICE >= 2000 THEN 20% OFFER
2. PRICE >=1000 BUT LESS THEN FIRST CONDITION ,THEN 15% OFFER
3. PRICE >=500 BUT LESS THEN SECOND CONDITION ,THEN 10% OFFER
4. PRICE >=100 BUT LESS THEN THIRD CONDITION ,THEN 5% OFFER
5. PRICE <100 BUT LESS THEN FOURTH CONDITION ,THEN NO OFFER

*/

set serveroutput on
declare
    actual_price Product.price%type;
    discount_price Product.price%type;
    product_search varchar2(50);

begin
     product_search := '&product_search';
    select price into actual_price from Product where product_name like product_search;
    if actual_price >= 2000 THEN
        discount_price := actual_price- (actual_price*0.20);
        dbms_output.put_line('Your Search product is ='|| product_search);
        dbms_output.put_line('ITs actual price is = '|| actual_price || ' Your discount price= '|| discount_price);

    elsif actual_price >= 1000 and actual_price < 2000 THEN
        discount_price := actual_price- (actual_price*0.15);
        dbms_output.put_line('Your Search product is ='|| product_search);
        dbms_output.put_line('ITs actual price is = '|| actual_price || ' Your discount price= '|| discount_price);

    elsif actual_price >= 500 and actual_price < 1000 THEN
        discount_price := actual_price- (actual_price*0.10);
        dbms_output.put_line('Your Search product is ='|| product_search);
        dbms_output.put_line('ITs actual price is = '|| actual_price || ' Your discount price= '|| discount_price);

    elsif actual_price >= 100 and actual_price < 500 THEN
        discount_price := actual_price- (actual_price*0.05);
        dbms_output.put_line('Your Search product is ='|| product_search);
        dbms_output.put_line('ITs actual price is = '|| actual_price || ' Your discount price= '|| discount_price);

    else
        dbms_output.put_line('SORRY,NO OFFERS AVAILABLE RIGHT NOW FOR YOUR PRODUCT.');
    end if;
    EXCEPTION
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE ('THIS PRODUCT NOT FOUND');
end;
/


/* LOOP WITH CURSOR
****************************************
SHOW SUPPLIER NAME WITH HIS COMPANY NAME
****************************************

*/
set serveroutput on
declare
    CURSOR name_cur is 
    select c.company_name,s.supplier_name from Company c,Supplier s where c.company_id=s.company_id;

    show name_cur%rowtype;
begin
    open name_cur;
    dbms_output.put_line('*************   ************');
    dbms_output.put_line('SUPPLIER NAME   COMPANY NAME');
    dbms_output.put_line('*************   ************');
    LOOP
        fetch name_cur into show;
        exit when name_cur%rowcount>6;
        dbms_output.put_line(show.supplier_name||'      '||show.company_name);
    end loop;
    close name_cur;
end;
/

--WHILE LOOP

--FIND PRODUCT NAME WITH ITS QUANTITY WHICH IS AVAILABLE IN STOCK.

SET SERVEROUTPUT ON
DECLARE
    CURSOR hold is
    select p.product_name,s.quantity from Product p join Stock s on p.product_id=s.product_id;
    show hold%rowtype;
BEGIN
    OPEN hold;
    
    dbms_output.put_line('*************        ************');
    dbms_output.put_line('PRODUCT NAME         QUANTITY');
    dbms_output.put_line('*************        ************');
    while hold%rowcount<10
    LOOP
        FETCH hold INTO show;
        DBMS_OUTPUT.PUT_LINE(show.product_name||'           '||show.quantity); 
    END LOOP;
    close hold;
END;
/

-- FOR LOOP FOR PRINTING EMPLOYEE NAME AND SALARY.



set serveroutput on
declare
    counter    NUMBER(2);
    cursor hold is
    select * from Employee;
    data hold%rowtype;
begin
    open hold;
    dbms_output.put_line('*************         ************           *********          **********');
    dbms_output.put_line('EMPLOYEE NAME         EMPLOYEE ID             SALARY              JOBTITLE');
    dbms_output.put_line('*************         ************           *********          **********');
    for counter in 1..6
    loop
        fetch hold into data;
        dbms_output.put_line(data.emp_name||'               '||data.emp_id||'               '||data.salary||'               '||data.job_title);

    end loop;
    close hold;


end;
/



set serveroutput on
declare
doctor number(2):=1;


begin
while doctor < 3
loop 
dbms_output.put_line('**********');
doctor:=doctor+1;
end loop;

end;
/

