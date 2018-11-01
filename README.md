# AWS-Web-and-EC2-MySQL-db-in-terraform-modules
AWS Web and EC2 MySQL db in terraform modules

This is an example of a set of terraform templates in module form to create the network infrastructure and nodes for a Public Web server accessing a private EC2 MySQL database.

This was converted from the terraform template in AWS-Web-and-EC2-MySQL-db-in-one-terraform-template
https://github.com/paulhhallam/AWS-Web-and-EC2-MySQL-db-in-one-terraform-template

The main point of this exercise was to demonstrate the use of variables and one way to pass them in and out of terraform modules.

One of the major issues I found whilst looking into Terraform in the early days was the lack of clear documentation on how this works. Some examples were just too convoluted for following and I certainly didn't want to load a full set of clusters and incurr a heavy cost for my private space.

The cost of this infrastructure is measured in single dollars, especially when almost immediately destroyed.

Once created the infrastructure can be tested by accessing the web pages:

  http://\<Public DNS of the EC2 instance phpapp\>
  
  This will present the Apache web page for the host
  
  http://\<Public DNS of the EC2 instance phpapp\>/mydb2.php
  
  This will present the PHP info page for the phpapp EC2 instance
 
  http://\<Public DNS of the EC2 instance phpapp\>/mydb.php
  
  This will present the result of a query against the Mariadb database on the second EC2 instance.
