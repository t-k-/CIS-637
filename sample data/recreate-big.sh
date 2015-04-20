#!/bin/sh
cat my_university_drop.sql largeRelationsCreateFile.sql largeRelationsInsertFile.sql | mysql -u root -p big_university 
