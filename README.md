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
#### Functional Diagram:
**UPDATE**
## Customer:

## Admin:


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
| Export PDF file of orders  | Admin           | (Extend function)Export the order detail from database to PDF file. Authorization role admin                                                                                 |




## 2. Wireframe
  **Link userFlow:** [UserFlow](https://www.figma.com/file/qOdcYrZvNDw2W598R0Erm7/UserFlow-F-SHOP?type=whiteboard&node-id=0%3A1&t=H5dp3dI9V4RwEx9K-1)
  ### User Flow:
  - Customer role:<br>
 ![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/87028d16-02d1-4166-8a91-2740a4211cc8)

  
  ### A quick look
  __To see more reviews our figma:__ [Figma](https://www.figma.com/file/0FlAcFU8wu56wJUJJArbcs/PRJ-F-SHOP?type=design&node-id=0%3A1&t=Wvqv2I56Q1ED0Rm3-1)<br>
GUI of F-SHOP:
   #### CUSTOMER:
- Landing page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/Screenshot%202023-06-18%20202412.png)

- Login page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/login.png)

- Register page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/register.png)

- Home page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/9a037a85-617b-42aa-8502-a7746d64b6e4)

- Product Information<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/productInfo.png)

- Cart page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/cart.png)

- Order page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/order.png)

- Order List page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/order_list.png)

- View Order page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/view_order.png)

- User Information page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/edit_account.png)

- Edit User Information page<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/edit_account_active.png)

#### ADMIN
- Manage product [admin]<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/productlist.png)

- Manage order [admin]<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/Orderlist-admin.png)

- Dashboard [admin]<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/dashboard.png)
<br>


## 3. Database design:
**Enter link for better view:**  [UML](https://lucid.app/lucidchart/fc91acdf-a287-445d-9e45-d049e9bd632d/edit?viewport_loc=64%2C-179%2C3840%2C1752%2C0_0&invitationId=inv_686281d8-d00e-41f0-bc58-fe309c93f50e)<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/ce7dc532-3a06-41cf-af98-01c80c9621d7)<br>
**Enter link for better view:**  [ERD](https://dbdiagram.io/d/646c2f85dca9fb07c491dc7e)<br>
![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/assets/92376692/23ae06ec-89c9-4409-b5a1-785a09a63cd3)
## 4. System design
**UPCOMMING**
## 5. Conclusion and Discussion
 **UPCOMING**
## Installation
**UPCOMING**
## Tech Stack
**UPCOMING**
## About us
  - Nguyễn Gia Linh
  - Phạm Công Minh
  - Quản Nguyễn Duy An
