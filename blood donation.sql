create database blood_donation;
use blood_donation;
create table city_master(city_id int primary key,city_name varchar(20));
create table state_master(state_id int primary key,state_name varchar(20));
create table country_master(country_id int primary key,country_name varchar(20));
create table address(address_id int primary key,street varchar(20),city_id int, constraint
fk_ct foreign key(city_id)references city_master(city_id),pincode int,state_id int, constraint
fk_st foreign key(state_id)references state_master(state_id),country_id int, constraint
fk_co foreign key(country_id)references country_master(country_id));

create table blood_group_master(blood_group_id int primary key,blood_group_name varchar(20));
create table gender_master(gender_id int primary key,gender_name char);

create table donor_details(donor_id int primary key,donor_name varchar(20),donor_age int check(donor_age between 20 and 60),
gender_id int,constraint fk_ge foreign key(gender_id)references gender_master(gender_id),
donor_contact long,donor_weight int check(donor_weight >45),address_id int,constraint fk_add foreign key
(address_id)references address(address_id));


create table blood_details(blood_details_id int primary key,blood_group_id int,constraint
fk_bd foreign key(blood_group_id) references blood_group_master(blood_group_id),available_packets int);

create table blood_donation_details(donation_id int primary key,donor_id int,constraint
fk_dd foreign key(donor_id)references donor_details(donor_id),blood_details_id int,constraint
fk_bdd foreign key(blood_details_id)references blood_details(blood_details_id),
blood_packet_id int unique);