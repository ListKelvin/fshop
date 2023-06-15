# Introduction to F-Shop

_A PRJ301 Assignment Project_
## 1. Requirements:

This is an online shopping web application for customer to buy cloth from the F-Shop online store.

- **What is this project name**: F-Shop.
- **Who use the system**: Customer whom visits website for shopping and buying product from shop and admin whom manage the shop.
- **What you'll build**: We'll make F-Shop online shopping web application is easy to navigate and user-friendly. Customers can browse through the different categories of clothing, including tops, bottoms, dresses, and accessories, and filter their search results based on size, color, style, and price range. Product pages include detailed descriptions, multiple images, and customer reviews, giving shoppers all the information they need to make an informed purchase.
- **Prerequisites**: None. This project is a great practice for us to learn how a website work and behind the scene of an application.
- **How long**: This project takes less than ten week to complete.

## Some features: 
#### UML use case diagram:
 ![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/978f8a97-710f-4d30-a9b6-924ed3020c2c)

#### Functional Diagram:

| **Use case**               | **Actor**       | **Description**                                                                                                                                             |
|----------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Register                   | Customer        | Create a new account, Constraint by filling all necessary fields (email, username, password) with valid information and email is not existed in database    |
| Login                      | Customer, Admin | Access personal account by email and password. Constraint by register function                                                                              |
| Login via Facebook         | Customer        | Access personal account via Facebook account by click Login Facebook button, customer do not need to register account                                       |
| Login via Google           | Customer        | Access personal account via Google account by click Login Google button, customer do not need to register account                                           |
| View account information   | Customer        | Allow customer to view personal information (address, phone, gender, birthday, email,..). Constraint by login function                                      |
| Edit account information   | Customer        | Allow customer to change their personal information (address, phone, gender, birthday, email,..). Validate information fields. Constraint by login function |
| View all products          | Customer, Admin | Function return all product from database then display it to view                                                                                           |
| Searching Product          | Customer, Admin | Function that supports user finding products by insert keyword that matching product name to search box                                                     |
| View product detail        | Customer, Admin | Function return the information of selected product from database then display it to view                                                                   |
| View best seller product   | Customer, Admin | Function that return top 10 products with the highest sales                                                                                                 |
| Add to cart                | Customer        | Adding customer selected products to customer cart. Using session to save cart product. Clear cart after create order. Constraint by login function         |
| Update cart                | Customer        | Functions support remove products and update products quantity in cart. Constraint by login function                                                        |
| Buy now                    | Customer        | Function that create an order of the selected product. Constraint by login function and have all necessary delivery information                             |
| Checkout                   | Customer        | Create order for all products in customer cart. Constraint by login function and have all necessary delivery information                                    |
| Create new product         | Admin           | Create new product to database. Constraint by filling all necessary fields with valid information. Authorization  role admin                                |
| Update product             | Admin           | Update product information in database. Constraint by filling all necessary fields with valid information. Authorization  role admin                        |
| Create new category        | Admin           | Create new category to database. Constraint by filling all necessary fields with valid information. Authorization role admin                                |
| Update category            | Admin           | Change category information in database. Constraint by filling all necessary fields with valid information. Authorization role admin                        |
| Update order status        | Admin           | Function support change order status. Authorization role admin                                                                                              |
| Export PDF file of orders  | Admin           | Export the order detail from database to PDF file. Authorization role admin                                                                                 |




## 2. Wireframe
  **Link userFlow:** [UserFlow](https://www.figma.com/file/qOdcYrZvNDw2W598R0Erm7/UserFlow-F-SHOP?type=whiteboard&node-id=0%3A1&t=H5dp3dI9V4RwEx9K-1)
  ### User Flow:
  - Customer role:<br>
 ![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/87028d16-02d1-4166-8a91-2740a4211cc8)

  
  ### A quick look
  __To see more reviews our figma:__ [Figma](https://www.figma.com/file/0FlAcFU8wu56wJUJJArbcs/PRJ-F-SHOP?type=design&node-id=0%3A1&t=Wvqv2I56Q1ED0Rm3-1)<br>
   Below are some screenshot:
- Landing page
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/61f1f0b1-8ec6-45cc-84a8-afbf0c5a56cd)

- Login page
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/27cb599e-7207-49c8-9bde-6b56c61eb8bc)

- Register page
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/c237429b-9668-486f-9628-fd655db69bc4)

- Home page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/9a037a85-617b-42aa-8502-a7746d64b6e4)

- Product Information<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/8640f492-fb72-498a-8e7b-b34c0373685a)

- Cart page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/b99eac1f-8611-49e9-bd71-4a7f15ccab04)

- Order page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/9ebcd7e3-8e55-4c25-b10d-5997fb1fc044)

- Manage product [admin]
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/04cc29bb-2cb0-4590-93d8-263ec7ba6be1)
<br>


## 3. Database design:
**Enter link for better view:**  [UML](https://lucid.app/lucidchart/fc91acdf-a287-445d-9e45-d049e9bd632d/edit?viewport_loc=64%2C-179%2C3840%2C1752%2C0_0&invitationId=inv_686281d8-d00e-41f0-bc58-fe309c93f50e)<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/b019da40-bbbb-4830-ba13-49b49a190836)<br>
**Enter link for better view:**  [ERD](https://dbdiagram.io/d/646c2f85dca9fb07c491dc7e)<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/23ae06ec-89c9-4409-b5a1-785a09a63cd3)
## 4. System design
This project is a shopping cart web application using maven for built tool. Apply the MVC2 model to support the interaction between the user and the website <br>
**Tool Require:** <br>
- Netbeans IDE Version 8.2
- JDK 1.8
- MSSQL Server
- Tomcat 8.x.x
- ... 
<br>

MVC2 base on MVC model (Model-View-Controller) but more complicated. The MVC2 model offers several advantages. It is easy to test, maintain, extend, and the MVC2 model isolates presentation logic from business logic.<br>

- Model: Represents state (data), and is the lowest layer in the pattern. It responds to requests from the view, and it also responds to instructions from the controller to update itself.
- View: It is the a place to display your data in a particular form that developer can design its by themselves
- Controller: Acts as an interface between View and Model. It is responsible for responding to all requests (receiving input and commands) to the Model/View to perform the corresponding interactions. Controller receives input, it performs validation and then performs operations that modify Model's state.<br>

In MVC model 2, one or more servlets (usually one) act as the Controller, Java Beans act as the Model, and JSP pages act as the display (View). The complex logic of the program is written entirely in servlets, which are Java programs. The display only consists of JSP pages with a few simple codes to get the data available, no complicated logic.

When servlet received a request from browser, it will call java bean to interact with the database and return the data throw relevent jsp page to client.

## 5. Conclusion and Discussion
 **UPCOMING**
## Installation
1. Sass Compiler 

Objectives: CSS on its own can be fun, but stylesheets are getting larger, more complex, and harder to maintain. So we need a preprocessor can help maintainable CSS.

To put it simply, Sass is a tool that can transform your preprocessed Sass code into standard CSS code that can be used in your website. This process can be accomplished through the terminal using the "sass" command. By specifying the input and output files, Sass will compile the Sass code in the input file and save the resulting CSS code in the output file. For instance, running "sass input.scss output.css" in the terminal will take the Sass file named "input.scss" and convert it into a CSS file called "output.css".

Link setup: https://stackoverflow.com/questions/25965982/how-to-use-sass-with-netbeans-8-0-1

bỏ qua bước install sass trong link setup

Link to download ruby sass(version Ruby+Devkit 3.2.2-1): https://rubyinstaller.org/downloads/

Learn to use sass: https://sass-lang.com/guide
## Tech Stack
Using **Bootstrap 5** for improving UI and some of main stack below:
<div>
  <img src="https://img.shields.io/badge/-TomCat-yellow" />
  <img src="https://img.shields.io/badge/-MVC-blue" />
  <img src="https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white" />
  <img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" />
</div>

## About us
  - Nguyễn Gia Linh
  - Phạm Công Minh
  - Quản Nguyễn Duy An
