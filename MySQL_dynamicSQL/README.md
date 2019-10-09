# MySQL_dynamicSQL
A simple example showing dynamic SQL in MySQL

* Create a table with all sample records
* Create a material type table
* Create a soil sample table with only soil sample records
* Create a water sample table with only water sample records
* Every sample has a unique sample_id and the soil and water records can be found in the general sample table with shared attributes
* The dynamic SQL part is to concatenate the specific material attributes and insert this big string into the general sample table
* Create a temporary table for storing the big string of concatenated attributes



