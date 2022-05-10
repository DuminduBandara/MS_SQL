--Customer table
CREATE TABLE Customer(
CID varchar(10)not null,
FirstName varchar(20),
LastName varchar(20),
NIC char(12),
C_Address varchar(50),
DOB date,
constraint Customer_PK primary key (CID)
);

ALTER TABLE Customer
ADD CONSTRAINT CustomerID_Chk Check (CID like 'CU%');


--Login table
CREATE TABLE CLogin(
Username varchar(15),
Login_Password varchar(20),
CID varchar(10)not null,
constraint CLogin_PK primary key (Username),
constraint CLogin_FK foreign key (CID) references Customer(CID)
);
--Branch table
CREATE TABLE Branch(
BranchCode varchar(15),
BranchName varchar(20),
City varchar(15),
constraint Branch_PK primary key (BranchCode)
);

ALTER TABLE Branch
ADD CONSTRAINT Branch_Chk Check (BranchCode like ('B%'));

ALTER TABLE Branch
ADD CONSTRAINT BranchName_Chk Check (BranchName in ('Supper grade' , 'Normal' , 'Head office'));


--Account table
CREATE TABLE Account(
AccountNo varchar(15) not null,
AccountType varchar(15),
Balance float(50),
CID varchar(10),
BranchCode varchar(15),
constraint Account_PK primary key (AccountNo),
constraint Account_FK1 foreign key (CID) references Customer(CID),
constraint Account_FK2 foreign key (BranchCode) references Branch(BranchCode)
);

ALTER TABLE Account
ADD CONSTRAINT Account_Chk Check (AccountType in ('Savings', 'Current', 'Fixed'));


--Employee table
CREATE TABLE Employee(
EmpID varchar(10),
EmpName varchar(50),
EmpAddress varchar(50)not null,
Salary float(20),
BranchCode varchar(15),
constraint Employee_PK primary key (EmpID),
constraint Employee_FK foreign key (BranchCode) references Branch(BranchCode)
);

ALTER TABLE Employee
ADD CONSTRAINT EmpID_Chk Check (EmpID like ('EM%'));



--Transaction table
CREATE TABLE CTransaction(
TID varchar(15) not null,
Amount varchar(20) not null,
AccountNo varchar(15) not null,
constraint CTransaction_PK primary key (TID),
constraint CTransaction_FK foreign key (AccountNo) references Account(AccountNo)
);

--Loan table
CREATE TABLE Loan(
LoanNo char(15) not null,
LoanType varchar(50),
LAmount float(50),
constraint Loan_PK primary key (LoanNo)
);

ALTER TABLE Loan
ADD CONSTRAINT LoanNo_Chk Check (LoanNo like ('L%'));

ALTER TABLE Loan
ADD CONSTRAINT LoanType_Chk Check (LoanType in ('Personal loan', 'Auto loan', 'Student loan', 'Home equity loan', 'Debt consolidation loan'));


--Loan Payment table
CREATE TABLE Payment(
PaymentID varchar(15) not null,
LoanNo char(15) not null,
Amount float(30) not null,
constraint Payment_PK primary key (PaymentID),
constraint Payment_FK foreign key (LoanNo) references Loan(LoanNo)
);

ALTER TABLE Payment
ADD CONSTRAINT PaymentID_Chk Check (PaymentID like ('LP%'));

--Customer Phone number table
CREATE TABLE CustomerPhone(
CID char(10) not null,
PhoneNo char(13) not null,
constraint CoustomerP_PK primary key (CID, PhoneNo)
);

--Worked Hours 
CREATE TABLE WHours(
EMPID varchar(10) not null,
branchCode varchar(20) not null,
EmpHours int,
constraint WH_PK primary key (EMPID, branchCode)
); 

--Instert Data to Customer table 
insert into Customer values ('CU5836498', 'Kavindu', 'Kavisha', '200003099851', ' No:100, Braybrooke Place, Colombo 02', '2000/03/09') ;
insert into Customer values ('CU5825742', 'Nipun', 'Sandipa', '200073494114', 'No 147 1/1, Piliyandala Rd, Maharagama', '2000/09/29') ;
insert into Customer values ('CU5874954', 'Kulatunga', 'Amarawira', '700942566v', 'No 30/3, Zahira College Road, Matale', '1985/11/30') ;
insert into Customer values ('CU4736218', 'S.R.N.Y.L.', 'Samarawira', '708672581v', 'No 420 - 1 B, Rammuthugala Kadawatha', '1965/02/14') ;
insert into Customer values ('CU1287495', 'Reshini', 'Sheyadi', '199952795417', ' No:459, Jambugasmulla road, Nugegoda', '1999/04/24') ;
insert into Customer values ('CU2687416', 'Tharushi', 'Nawodya', '197056981468', ' No:145, Gothatuwa road, Gothatuwa', '1970/03/02') ;
insert into Customer values ('CU9671369', 'Chamith', 'Jayshan', '586921875v', ' No:1, Kumaraswami Mv, Jaffna', '1958/12/29') ;
insert into Customer values ('CU4578963', 'Sachith', 'Hewage', '198441751547', ' No:472/4, Mihidu Mv Bogahawatha road, Anuradapura', '1984/11/19');

--Instert Data to Login table
insert into CLogin VALUES ('userPASS11', 'bdg&@hd2', 'CU5836498');
insert into CLogin VALUES ('userPASS12', 'nfuem#Edfg', 'CU5825742');
insert into CLogin VALUES ('userPASS13', 'nchey&558#', 'CU5874954');
insert into CLogin VALUES ('userPASS14', 'neudn#?e15', 'CU4736218');
insert into CLogin VALUES ('userPASS15', 'wkblfild#*54', 'CU1287495');
insert into CLogin VALUES ('userPASS16', 'kblorUfn0384$', 'CU2687416');
insert into CLogin VALUES ('userPASS17', 'djngmiW42$f', 'CU9671369');
insert into CLogin VALUES ('userPASS18', 'Jkidh$#gc488', 'CU4578963');

--Instert Data to Branch table
insert into Branch VALUES ('B001', 'Head Office', 'Colombo');
insert into Branch VALUES ('B002', 'Supper grade', 'Borella');
insert into Branch VALUES ('B003', 'Supper grade', 'Kandy');
insert into Branch VALUES ('B004', 'Supper grade', 'Jaffna');
insert into Branch VALUES ('B005', 'Supper grade', 'Avissawella');
insert into Branch VALUES ('B006', 'Normal', 'Ampitiya');
insert into Branch VALUES ('B007', 'Normal', 'Mathara');

--Instert Data to Account table
insert into Account VALUES ('4789625987', 'Savings', 4000000.21, 'CU5836498', 'B006');
insert into Account VALUES ('8459746214', 'Savings', 8456.00, 'CU5825742', 'B003');
insert into Account VALUES ('8795641236', 'Current', 8745663.11, 'CU5874954', 'B002');
insert into Account VALUES ('4795213674', 'Savings', 777541.22, 'CU4736218', 'B005');
insert into Account VALUES ('2496325784', 'Fixed', 102589345.00, 'CU1287495', 'B007');
insert into Account VALUES ('9539718564', 'Savings', 78965.11, 'CU2687416', 'B003');
insert into Account VALUES ('7613584964', 'Current', 1523.00, 'CU9671369', 'B003');
insert into Account VALUES ('4584125986', 'Savings', 500.00, 'CU4578963', 'B004');


--Instert Data to Employee table
insert into Employee VALUES ('EM00001', 'P.T. Karunadasa', 'No 747 Negombo Road, Mabola, Wattala', '78986.00', 'B001');
insert into Employee VALUES ('EM00002', 'K.J.L.M. Weerasinghe', 'No 46, Gamage Mw, Poruwadanda', '52336.00', 'B003');
insert into Employee VALUES ('EM00005', 'K.J.I.O. Satharasinghe', 'No567, Siri Medura, Urugala, Ingiriya', '89445.00', 'B001');
insert into Employee VALUES ('EM00006', 'M.P. Mohomad', 'No 76/B, Deveni Rajasinghe Mawatha, Kandy', '145236.00', 'B002');
insert into Employee VALUES ('EM00007', 'R.M.D.L. Bamunusinghe', ' No 325, Dr N M Perera Mawatha, Colombo 08', '365124.00', 'B001');
insert into Employee VALUES ('EM00008', 'P.J.H. Thilakarathna', ' No 57 A, Gangabada Road, Wewala Piliyandala', '40789.00', 'B007');
insert into Employee VALUES ('EM00012', 'U.L.G. Sathsarani', 'No 92, Badulla Road, Nuwara Eliya', '30178.00', 'B006');
insert into Employee VALUES ('EM00015', 'K.M.C.K. Eppa', 'No 1/E, Barnes Place, Colombo 07', '60798.00', 'B002');

--Instert Data to Transaction table
insert into CTransaction VALUES ('7845623987458', '+20369.00', '4584125986');
insert into CTransaction VALUES ('1548546545156', '-40000.00', '7613584964');
insert into CTransaction VALUES ('1311487562862', '-35000.00', '2496325784');
insert into CTransaction VALUES ('2397466952156', '+200000.00', '4584125986');
insert into CTransaction VALUES ('8942583647451', '+4000.00', '7613584964');
insert into CTransaction VALUES ('4925671595258', '-80000.00', '8459746214'); 
insert into CTransaction VALUES ('4592147365478', '-890.00', '4584125986');
insert into CTransaction VALUES ('1569746259846', '-250.00', '4795213674');

--Instert Data to Loan table
insert into Loan VALUES ('L78541', 'Personal loan', 4000000.00);
insert into Loan VALUES ('L84569', 'Personal loan', 8500000.00);
insert into Loan VALUES ('L84621', 'Student loan', 800000.00);
insert into Loan VALUES ('L84716', 'Auto loan', 452000.00);
insert into Loan VALUES ('L84718', 'Debt consolidation loan', 780000.00);
insert into Loan VALUES ('L85234', 'Personal loan', 6500000.00); 
insert into Loan VALUES ('L85478', 'Auto loan', 764000.00);
insert into Loan VALUES ('L87489', 'Personal loan', 4000000.00);

--Instert Data to Payment table
insert into Payment VALUES ('LP789651', 'L85234', 23000.00);
insert into Payment VALUES ('LP789652', 'L87489', 78000.00);
insert into Payment VALUES ('LP789653', 'L84569', 24000.00);
insert into Payment VALUES ('LP789654', 'L84718', 80000.00);
insert into Payment VALUES ('LP789655', 'L85234', 3000.00);
insert into Payment VALUES ('LP789656', 'L85478', 10000.00);
insert into Payment VALUES ('LP789657', 'L84716', 1000.00);
insert into Payment VALUES ('LP789658', 'L85478', 12000.00);
insert into Payment VALUES ('LP789659', 'L84621', 53000.00);

--Instert Data to Customer Phone number table
insert into CustomerPhone VALUES ('CU5836498', '0713298967');
insert into CustomerPhone VALUES ('CU5836498', '0775896741');
insert into CustomerPhone VALUES ('CU5825742', '0714444578');
insert into CustomerPhone VALUES ('CU5874954', '0728795551');
insert into CustomerPhone VALUES ('CU5874954', '0701478965');
insert into CustomerPhone VALUES ('CU4736218', '0774569821');
insert into CustomerPhone VALUES ('CU4736218', '0112789654');
insert into CustomerPhone VALUES ('CU1287495', '0713298967');

--Instert Data to Employee Worked hours(last 30 days) table
insert into WHours VALUES ('EM00001', 'B001',  160);
insert into WHours VALUES ('EM00002', 'B003',  99);
insert into WHours VALUES ('EM00005', 'B001',  130);
insert into WHours VALUES ('EM00006', 'B002',  170);
insert into WHours VALUES ('EM00007', 'B001',  200);
insert into WHours VALUES ('EM00008', 'B007',  140);
insert into WHours VALUES ('EM00012', 'B006', 155);
insert into WHours VALUES ('EM00015', 'B002', 165);
 


