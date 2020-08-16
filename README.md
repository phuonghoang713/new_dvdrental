# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=========
copy data from one database to another.
extract the table and pipe it directly to the target database:

pg_dump -t table_to_copy source_db | psql target_db
Note: If the other database already has the table set up, you should use the -a flag to import data only, else you may see weird errors like "Out of memory":

pg_dump -a -t my_table my_db | psql target_db
=========