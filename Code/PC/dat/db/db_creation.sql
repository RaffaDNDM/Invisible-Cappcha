-- Database Creation
CREATE DATABASE cloudservice OWNER POSTGRES ENCODING = 'UTF8';

-- Connect to cloudservice db to create data for its 'public' schema
\c cloudservice

-- Create new domains
-- Correct password format
CREATE DOMAIN pwd AS char(128)
	CONSTRAINT properpassword CHECK (((VALUE)::text ~* '[a-f0-9]'::text));

-- Correct password format
CREATE DOMAIN userformat AS char(128)
	CONSTRAINT properpassword CHECK (((VALUE)::text ~* '[A-Za-z0-9]'::text));

--Correct mail format
CREATE DOMAIN mail AS character varying(254)
  CONSTRAINT propermail CHECK (((VALUE)::text ~* '[A-Za-z0-9._%-]+@[A-Za-z0-9._%]+$'::text));

--Create new data type
CREATE TYPE gendertype AS ENUM (
    'Male',
    'Female'
);

--Create tables
CREATE TABLE CloudUser (
    Name VARCHAR NOT NULL,
    Surname VARCHAR NOT NULL,
    Username userformat NOT NULL,
    Email mail NOT NULL,
    Sex gendertype,
    Password pwd NOT NULL,
    PRIMARY KEY (Username)
);
