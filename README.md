# JavaServeletProject

----- Electronic Items Booking and Management by Sanyam Jain -----

Abstract
To provide a fullfletch website where users can book andmanage the electronic items and their
credentials, the payment with just a signup/login to the website.The websitemainly focuses on building
a dynamic website that doesn’trequire any hardcore typing fromthe admin side for updating data. 

Introduction
The website firstly has a signup/login page tomake a website all ofthe usersso that users can see and
update their data and they can book products or cancel product booking with no error of‘user not
identified’. For website the useris divided into two types user and superuser, here the useristhe
customer who can login/signup the website to order a product or cancel the bookings ofthe previous
order and whereasthe superuser can do the userfunctionalities and they can alsomanage product by
add a new product orremove an existing productfromwebsite which will be reflected in the website for
all the users/superuser.The user can alsomanage products by purchasing a superuseridentity after
providing some amountforit.The user/superuser can also pay their booked products amount with some
offersfor differentmodes of payment with some special offerforthe superuser on each product, they
can also set or change their password credential ifin case ifthey want to change their password orthey
forgot their previous password respectively. 

H/W and S/W specifications
Computerspecification – x32/x64 bit
Minimum2GBram
JDK – 16
MySQL– 8.0 version
I have used JSP and JavaBeans (Apache NetBeans IDE 12.5) and MySQL (WampServer)

Architecture - DFD

Modules
Database: electronic
Tables:
booking
product
user
superuser
customer


JSPfiles:
addbooking.jsp – It usestheBooking.java file by sending the variables from the booked.jsp form which user has entered and it will call the add() function in the java file to add the details in the database and in case of any error it will be displayed to the user. addpro.jsp – It uses the Addproduct.java file to add a new product in the database it will collect all the details from newproduct.jsp file form and set property of the java file using these details and then if there is any error while adding product it will be displayed to user else it will be added successfully in the database. 

addsuper.jsp – It will be used for promoting the user to superuser at a constant cost, to avoid using extra files unnecessarily the connection to database is done in this file only and if it’s all clear and no error then user will be successfully promoted to superuser. booked.jsp – It is used to take the input from user in the forms, to make the project more efficient both the booking product and cancel booking form are used on same page and directed to addbooking.jsp and cancelbooking.jsp respectively for validating inputs and performing the respective functions, it also has a section on top of the page to display the total amount pending for user to pay? 

cancelbooking.jsp – It is made to do the opposite functionality of addbooking.jsp i.e., cancelling the product which user has selected and reducing the amount of product from user remaining amount as per the quantity of product user entered it also displays an error message in case of any mistake made by user. 

change.jsp – To make the website friendlier to user the option of changing password is added in the website in case the user for gets the previous password, and this functionality is done in this same file only by connecting to database and for case of no errors the new credentials are updated in the database and for any error a suitable message is displayed to the user. 

home.jsp – It is the main part of website the home page from where all the pages get connected and this file changes its options to next pages based on the type of user i.e., for superuser the options will be somewhat different from the normal user(For this website language it is user). 

itsme.jsp – This is the file which displays all the data from database i.e., the tables and their respective entries. To be concern with security the password of any user or superuser is not displayed on the page. 

list.jsp – It is used to make a list of all product items and the quantity of each item to display it on the booked.jsp page for the user reference when they will be adding or cancelling a product and it will also be dynamically updated when the adding or cancelling of product occurs from user side. 

login.jsp – It contains a form forletting the user logging in the home page of website and it checks validation for all the text fields. 

main.jsp – It is the first page of website which has three options for a user using these options user will be directed to itsme.jsp, login.jsp and signup,jsp. 

newproduct.jsp – This page will be available for superuser in the home page options. Same as done for booked.jsp, two forms are used in this file to get more efficiency these two forms are to add a new product in database and remove the product from database respectively which will be done using a JavaBeans file which connected through addpro.jsp and removepro.jsp for respective functionality. 

pay.jsp – It is used to get the details of user from payment.jsp file and set property of the Payment.java file using these details and get the update of payment from the by calling the pay() function of java file and knowing if any error occurs during payment using err()function which will let to display suitable error to the user. 

payment.jsp – It will get the details of payment from the user like the amount(in Rs.) and the mode of payment and send these details to pay.jsp for verification and updating it in database if it’s valid. 

removepro.jsp – This will get the name of product which has to be removed from the newproduct.jsp file and does check if it’s a valid name, if yes then the product will be removed from the database and website too. 

reset.jsp – It is used to reset the password of user/superuser by getting the username of them, the new password to be updated and if they are no error then it will be successfully updated in the database. 

setpass.jsp – Same as the booking.jsp and newproduct.jsp two form are used in this file which are to change the password if user want to change it and reset the password if user forgot the previous one, they both are linked to change.jsp and reset.jsp file for respective functions. 

signup.jsp – Same as the name suggestsignup.jsp is used to register user. It checks validation for all the text fields and display the user a suitable error on any invalid credentials, after signup the user will be registered as user(In website language, not the superuser). 

superu.jsp – This page will be available for user in the home page options. It will just be given the conditions for the user to become a superuser and if the user agree the conditions and the condition are satisfied by user then they will become a superuser. 

welcomelogin.jsp – It is used to display errors for any invalid credentials in login page from Logincheck.java after setting the credentials in it and redirect the user to home page if the credentials match with what it is present in database. welcomesignup.jsp – It is used to display errors for any invalid credentials in signup page from Signupadd.java after setting the credentials in it and redirect the user to home page if the details entered by user are valid. 


JavaBeans files:
Addproduct.java – This will do the job of adding the details in database for the product given by superuser after checking the credentials are valid and they are not present in the database already, it is also used to remove the given product from the database if it exists and show an error if any error occurs in any of these sections. 

Booking.java – This will do the job to book a product for user/superuser, cancel a booking for user/superuser and it also update the total amount of user/superuser after every functionality and it also returns an error which occurs in any of these sections. It also given some special discount for the superusers.

Logincheck.java – It will validate the credentials given by user/superuser in login.jsp, which will be added in this java file using welcomelogin.jsp and it will perform the validation perforate given credentials and return a suitable erroring case of unmistaken the credentials. 

Payment.java – It will get the payment amount and mode of payment from pay.jsp and check for discount based on the mode of payment and the previously available amount minus the final amount will be updated for the user/superuser. 

Signupadd.java – It will validate the credentials given by user/superuser in signup.jsp, which will be added in this java file using welcomesignup.jsp and it will perform the validation part for the given credentials and return a suitable error in case of any mistakes in the credentials. CSS files: In the website three CSS files are used one for home (homestyling.css), casual.css for all forms(Same styling for all forms is used in website) and final.css is used for all two forms page (booked.jsp, newproduct.jsp and setpass.jsp) and itsme.jsp page.



Result and discussion
The functionality of all pagesis:
Main – The main page from which the website begins directs to the login page, signup page and it’s me page. 
![mainpage](https://user-images.githubusercontent.com/78720027/192109133-15decc8f-44cd-4d2e-92df-a24ce8d925e4.png)


Login – It checks whether the userislogging in with correct credentials if it’s correct they will be directed to the home page and if in case the userforgot the password or what to change, they can direct to set password page. 
![login page](https://user-images.githubusercontent.com/78720027/192109144-f8a60e20-9641-485a-9a1a-9b8d33a1a6da.png)


Set password – Where the user can change its password with a strong one or also make a new password if in case the user forgot the previous one. 
![set password page](https://user-images.githubusercontent.com/78720027/192109161-c95fcb0f-06bb-4a92-8507-132fa1465d68.png)


Signup – It checks if the password is strong enough and makes a new user with the given name and password if it’s correct, they will be directed to the home page. 
![signup page](https://user-images.githubusercontent.com/78720027/192109172-9424ded7-e27e-4703-b436-66d6c1334534.png)


It’s me – It will contain all the database lists and the data inside them with the privacy that the user password is not visible. 
![all datas page](https://user-images.githubusercontent.com/78720027/192109186-1a8ed903-8c8f-4c3a-9b49-0199e0f1aa15.png)


Home – It contains the image, name, and price of each item and in the navbar it contains Payment, booking, user name, sign out option and if the user is not a superuser then it will have an option of Superuser else it will have the option of Manage products. 
For User:
![home page for user](https://user-images.githubusercontent.com/78720027/192109199-48fbd955-03a4-47bc-b0be-27d61ffe0fa3.png)


For Superuser:
![home page for superuser](https://user-images.githubusercontent.com/78720027/192109198-83648706-7fba-4ee6-9389-e08a700752ea.png)


Payment – It will take the payment amount and mode of payment from the user and deduct the given amount or more depending upon themode of payment, from the pending amount of user present in the database. 
![payment page](https://user-images.githubusercontent.com/78720027/192109231-f1dd7bfc-9214-4681-b208-ec13a8743fba.png)


Booking – Here a user can book or cancel a booking ofthe product and likewise the amount will be managed in the database. 
![my bookings page](https://user-images.githubusercontent.com/78720027/192109239-6284a670-537f-4107-8a56-c3e126714dff.png)


Sign out – It will direct the user to the login page.
For User:
![home page for user](https://user-images.githubusercontent.com/78720027/192109199-48fbd955-03a4-47bc-b0be-27d61ffe0fa3.png)


For Superuser:
![home page for superuser](https://user-images.githubusercontent.com/78720027/192109198-83648706-7fba-4ee6-9389-e08a700752ea.png)


Manage products – It will let the user add a new product to the database or remove an existing one. To make the navigation in the website easiersign out is added in all the options page present on the home page and some direct navigation is used to avoid much work from the user. 
![manage product page](https://user-images.githubusercontent.com/78720027/192109258-2bb07d3d-4cdb-42ad-8101-e6e211df50ad.png)




Conclusion
So, here after I can conclude that the website has tried to full fill all the requirements from the user point of view and in future the website can be used for marketing the electronic products online and it can also be expanded for all kind of product items not only electronic.
