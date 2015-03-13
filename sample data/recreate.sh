#!/bin/sh
cat my_university_drop.sql my_university_tables.sql my_university_values.sql | mysql -u root -p my_university 
