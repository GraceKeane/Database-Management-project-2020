# Database-management
Designed and constructed a relational database that can to be deployed on the cloud using WAMP. It includes a relational schema, attributes, primary keys, foreign keys and BLOB's

## How to deploy on your own virtual machine

1) Create a google cloud account and set up a virtual machine

2) Start the virtual machine

3) In the C drive create a folder e.g employees

4) Put all images into the "employees" folder

5) Go to c:/wamp64/www and put all images into this folder aswell

6) Run the sql file in the mySQL console window

7) Open phpmyadmin and check if data is correct (must see blobs for pictures)

8) Put emps.php and image_emps.php into c:/wamp64/www

9) Open emps.php and image_emps.php in notepad++

10) Change line 30/31 of both scrips to 
    - $host = "localhost"
    - $user = "root"
    - $password = ""
    - $database = "DatabaseNameGoesHere"
 
11) Go to the search bar online and type localhost/emps.php and your database table should appear.




## How to deploy on your own local machine

1) In the C drive create a folder e.g employees

2) Put all images into the "employees" folder

3) Go to c:/wamp64/www and put all images into this folder aswell

4) Run the sql file in the mySQL console window

5) Open phpmyadmin and check if data is correct(must see blobs for pictures)

6) Put emps.php and image_emps.php into c:/wamp64/www

7) Open emps.php and image_emps.php in notepad++

8) Change line 30/31 of both scrips to 
    - $host = "IPAddressOfServerGoesHere"
    - $user = "DatabaseUsernameGoesHere"
    - $password = "DatabasePasswordGoesHere"
    - $database = "DatabaseNameGoesHere"
 
9) Go to the search bar online and type localhost/emps.php and your database table should appear.
