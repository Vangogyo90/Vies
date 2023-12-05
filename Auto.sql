set ansi_padding on
go
set ansi_nulls on
go
set quoted_identifier on
go
create database [Auto]
use [Auto]

create table [dbo].[Role]
(
[ID_Role] [int] not null identity(1,1),
[Name_Role] [varchar] (50) not null,
constraint [PK_Role] primary key clustered
([ID_Role] ASC) on [PRIMARY],
constraint [UQ_Name_Role] unique
([Name_Role])
)
go

insert into [dbo].[Role] values
('MANAGER')

select [Login], [Name_Role] from [User] inner join [Role] on [Role_ID] = Role.Id

create table [dbo].[User]
(
[ID_User] [int] not null identity(1,1),
[Login] [varchar] (50) not null,
[Password] [varchar] (50) not null,
[Role_ID] [int] not null,
constraint [PK_User] primary key clustered
([ID_User] ASC) on [PRIMARY],
constraint [UQ_Login] unique
([Login]),
constraint [Min_Login] check (len([Login]) >= 8),
constraint [Min_Password] check (len([Password]) >= 8),
constraint [FK_Role] foreign key
([Role_ID]) references [dbo].[Role] ([ID_Role])
)
go

insert into [dbo].[User] values
('USER12345', 'USER12345', 1),
('ADMIN12345', 'USER12345', 2)

create table [dbo].[Brand]
(
[ID_Brand] [int] not null identity(1,1),
[Name_Brand] [varchar] (50) not null,
constraint [PK_Brand] primary key clustered
([ID_Brand] ASC) on [PRIMARY],
constraint [UQ_Name_Brand] unique
([Name_Brand])
)
go

create table [dbo].[Model_Brand]
(
[ID_Model_Brand] [int] not null identity(1,1),
[Name_Model] [varchar] (50) not null,
[Brand_ID] [int] not null
constraint [PK_Model_Brand] primary key clustered
([ID_Model_Brand] ASC) on [PRIMARY],
constraint [UQ_Name_Model] unique
([Name_Model]),
constraint [FK_Brand] foreign key
([Brand_ID]) references [dbo].[Brand] ([ID_Brand])
)
go

create table [dbo].[Type_Fuel]
(
[ID_Type_Fuel] [int] not null identity(1,1),
[Name_Type_Fuel] [varchar] (50) not null,
constraint [PK_Type_Fuel] primary key clustered
([ID_Type_Fuel] ASC) on [PRIMARY],
constraint [UQ_Name_Type_Fuel] unique
([Name_Type_Fuel])
)
go

insert into [dbo].[Type_Fuel] values 
('Бензин'), 
('Дизель'), 
('Электричество')

create table [dbo].[Brand_Model_Engine]
(
[ID_Brand_Model_Engine] [int] not null identity(1,1),
[Volume_Engine] [float] not null,
[Count_Horsepower] [int] not null,
[Model_Brand_ID] [int] not null,
[Type_Fuel_ID] [int] not null
constraint [PK_Brand_Model_Engine] primary key clustered
([ID_Brand_Model_Engine] ASC) on [PRIMARY],
constraint [FK_Model_Brand] foreign key
([Model_Brand_ID]) references [dbo].[Model_Brand] ([ID_Model_Brand]),
constraint [FK_Type_Fuel] foreign key
([Type_Fuel_ID]) references [dbo].[Type_Fuel] ([ID_Type_Fuel])
)
go

create table [dbo].[Type_Box]
(
[ID_Type_Box] [int] not null identity(1,1),
[Name_Type_Box] [varchar] (50) not null,
constraint [PK_Type_Box] primary key clustered
([ID_Type_Box] ASC) on [PRIMARY],
constraint [UQ_Name_Type_Box] unique
([Name_Type_Box])
)
go

insert into [dbo].[Type_Box] values 
('Вариатор'), 
('Автомат'), 
('Робот'),
('Механика')

create table [dbo].[Type_Drive]
(
[ID_Type_Drive] [int] not null identity(1,1),
[Name_Type_Drive] [varchar] (50) not null,
constraint [PK_Type_Drive] primary key clustered
([ID_Type_Drive] ASC) on [PRIMARY],
constraint [UQ_Name_Type_Drive] unique
([Name_Type_Drive])
)
go

insert into [dbo].[Type_Drive] values 
('Полный'), 
('Задний'), 
('Передний')

create table [dbo].[Car]
(
[ID_Car] [int] not null identity(1,1),
[User_ID] [int] not null,
[Brand_Model_Engine_ID] [int] not null,
[Type_Box_ID] [int] not null,
[Type_Drive_ID] [int] not null,
[Release_Year] [varchar] (4) not null,
[Mileage] [int] not null,
[Condition] [bit] not null,
[Owners] [int] not null,
[Customs] [bit] not null,
[Number_Telephone] [varchar] (11)
constraint [PK_Car] primary key clustered
([ID_Car] ASC) on [PRIMARY],
constraint [FK_User] foreign key
([User_ID]) references [dbo].[User] ([ID_User]),
constraint [FK_Brand_Model_Engine] foreign key
([Brand_Model_Engine_ID]) references [dbo].[Brand_Model_Engine] ([ID_Brand_Model_Engine]),
constraint [FK_Type_Box] foreign key
([Type_Box_ID]) references [dbo].[Type_Box] ([ID_Type_Box]),
constraint [FK_Type_Drive] foreign key
([Type_Drive_ID]) references [dbo].[Type_Drive] ([ID_Type_Drive])
)
go