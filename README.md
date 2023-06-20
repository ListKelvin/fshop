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

## Customer:

### _Register_:
Users arrive at the landing page or homepage of the platform where they want to register. Clicking on the "Sign Up" or "Register" button takes users to a registration form. This form typically includes fields for essential information, such as username, email and password. After the user fills in the registration form, the system validates the information provided. It checks for any errors or missing fields, ensuring the email address is in the correct format, and email is available. If there are any issues, the user is prompted to correct them. Once all the information is successfully validated, the system creates the customer's account. This involves securely storing their information in the platform's database and then they are redirected to a landing page for login. <br>
### _Login for customer_:
Customers arrive at the login page, which is separate from the registration page. They are usually prompted to enter their credentials, email and password, to access their account. After entering their credentials, the system validates the information provided by comparing it to the stored data in the platform's database. The system checks for accuracy, verifies the email exists, and ensures the password matches the stored one. This process involves confirming that the user has the necessary authorization to access the account. They are typically redirected to a home screen. <br>
### _Login via Facebook_:
Users are presented with a "Login with Facebook" button on the login page. This button is often accompanied by other login options. When users click the "Login with Facebook" button, the platform initiates an authorization request to the Facebook API. After the account is created or retrieved, the user is logged in to the website or application using their Facebook account. They gain access to the platform's features and functionalities, customized based on their Facebook profile information. <br>
### _Login via Google_:
Users are presented with a "Login with Google" button on the login page. This button is often accompanied by other login options. When users click the "Login with Google" button, the platform initiates an authorization request to the Google API. The user's browser is redirected to Google's login page. After the account is created or retrieved, the user is logged in to the website or application using their Google account. They gain access to the platform's features and functionalities, customized based on their Google profile information. <br>
### _View account information_:
Personal Information: Users can access and view their personal information, such as their full name, contact details (e.g., address, phone number), date of birth, and any other details they provided during the registration process. <br>
### _Edit account information_:
Modifying Information: Users can update the account details by modifying the fields within the form or interface. They can change their name, update contact information, upload a new profile picture, or make any necessary changes to other editable fields. Saving Changes: After users have made the desired modifications, they can save the changes by clicking on a "Save" or "Update" button within the edit account information section.
 <br>
 ### _View all products_:
Product Details: When users click on a specific product from the list, they are directed to a product details page. This page provides comprehensive information about the selected product, including detailed descriptions, specifications, additional product images, customer reviews, and any available options (e.g., sizes, colors). Add to Cart : While browsing the products, users have the option to add items of interest to their cart. This allows them to compile a list of desired products for future reference or to initiate the purchase process by adding selected items to the cart. <br>
 ### _Searching Product_:
Users typically encounter a search bar prominently placed on the website header. The search bar allows users to enter keywords of product names that are related to the product they are looking for. Auto-suggestions (Optional): As users type their search query, the search bar may provide auto-suggestions to assist them in finding relevant products.  After users submit their search query, they are redirected to a search results page. This page displays a list of products that match the entered keywords or search terms.<br>
### _View product detail:_:
Selection: The user selects a specific product of interest from the product listing by clicking on its title, image, or a similar button. Product Detail Page: The product detail page provides comprehensive information about the selected product. It usually includes: product image, product title, product description, pricing and availability, product variants and options, add to cart, related products. <br>

### _View best seller product for Customer_:
Customers typically arrive at the product page of the website to view best sellers products. This section can be highlighted with titles like "Best Sellers". Within the best seller section, customers are presented with a list of products that are considered top-selling. These products are typically displayed in a grid or list format, showcasing key details such as product images, titles and prices. When customers click on a specific product from the best seller listings, they are directed to the product details page. While browsing the best seller products, customers have the option to add items of interest to their cart. <br>

### _Add to cart_:
Quantity Selection (Optional): Depending on the website or application, customers may have the option to select the desired quantity of the product they want to add to their cart.  Continue Shopping or Proceed to Checkout: Once the product is added to the cart, customers can choose to continue shopping and add more products, or they can proceed to the checkout process. Cart Preview: Throughout the browsing experience, customers can usually access a cart preview or summary that displays the products they have added so far. <br>
### _Update cart_:
Cart Preview: Customers typically have access to a cart preview or summary throughout their browsing experience. Modify Quantities: On the cart page, customers can modify the quantities of the products in their cart. Remove Products: Customers may also have the option to remove specific products from their cart. <br>
### _Buy now_:
Shipping and Billing Information: In the checkout process, customers are required to provide their shipping and billing information. Confirm and Place Order: Customers review the order summary to ensure accuracy. Shipping and Delivery: The website or application proceeds with processing the order, preparing the product(s) for shipment, and arranging for delivery to the customer's specified address. <br>


### _Checkout_:
Confirm and Place Order: After reviewing the order summary, customers proceed to confirm and place the order. Order Confirmation: After successfully placing the order and completing the payment, customers receive an order confirmation page. This confirms that their purchase was successful and provides them with a summary of their order, including the order number, product(s) purchased, and estimated delivery details. Shipping and Delivery: The website or application proceeds with processing the order, preparing the product(s) for shipment, and arranging for delivery to the customer's specified address. <br>



## Admin:
### _Login for admin_:
Admins arrive at the login page, enter their unique credentials: email address and password. The system validates the provided information, ensuring the accuracy of the admin’s email and matching it with the correct password. This step confirms that the admin user is authorized to access the administrative features and functionality of the platform. Upon successful authentication and authorization, admin users gain access to the admin dashboard. <br>
### _View best seller product for Admin_:
Product Listings: Within the best seller products section, admin users are presented with a list or grid view of the products that are considered top-selling or highly popular. These products are typically displayed with key details such as product names, SKUs (stock keeping units), prices, and any other relevant information. Clicking on a Product: When admin users click on a specific product from the best seller listings, they can access the detailed view of that product within the admin interface. This detailed view provides comprehensive information about the selected product, including details such as product descriptions, images, pricing. <br>
### _Create new product_:
Fill in Product Details: Admin users enter the necessary information in the respective fields of the product information form. Upload Product Images: Admin users may have the option to upload images of the new product. They can select and upload relevant product images from their device or choose from a predefined set of images if available. Set Pricing: Admin users specify the pricing details of the new product. Review and Save: Before finalizing the new product, admin users have the opportunity to review all the entered information. Once satisfied, they click the "Save" or "Create Product" button to save the new product in the system. <br>


### _Update product_:
Modify Product Information: Admin users make the necessary modifications to the product details based on their requirements. They can update any field that needs to be changed, such as the product name, description, pricing, images, or other attributes. Upload New Images (if applicable): If admin users want to update the product images, they have the option to upload new images to replace the existing ones. They can select and upload the updated images from their device. Save Changes: After making the necessary updates to the product, admin users click the "Save" or "Update" button to save the changes. <br>

### _Create new category_:
Category: If the new category is a subcategory or belongs to a parent category, admin users can select the appropriate parent category from a dropdown or hierarchical selection. This helps establish the category structure and hierarchy within the website or application. Review and Save: Before finalizing the new category, admin users have the opportunity to review all the entered information. Once satisfied, they click the "Save" or "Create Category" button to save the new category in the system. <br>

### _Update category_:
Modify Category Information: Admin users make the necessary modifications to the category details based on their requirements. They can update any field that needs to be changed, such as the category name. Save Changes: After making the necessary updates to the category, admin users click the "Save" or "Update" button to save the changes. This action updates the category details in the system and makes the updated information available for organizing products. <br>

### _Update order status_:
Modify Order Status: Admin users have the option to modify the order status based on the available status options provided by the system. This can include status options such as "Checking," "Packaging," "Delivered," "Canceled," or custom status options defined by the website or application. Update Status and Add Notes: Admin users update the order status to the appropriate value based on the progress of the order. Save Changes: After updating the order status, admin users click the "Save" or "Update" button to save the changes. This action updates the order status in the system and makes the updated information available for tracking and communication purposes. <br>

### _Export PDF file of orders_:
Download PDF File: Once the PDF file is generated, admin users are provided with a link or option to download the PDF file to their device. They can click on the download link or button to save the PDF file locally.<br>
## 2. Wireframe
  **Link userFlow:** [UserFlow](https://www.figma.com/file/qOdcYrZvNDw2W598R0Erm7/UserFlow-F-SHOP?type=whiteboard&node-id=0%3A1&t=H5dp3dI9V4RwEx9K-1)
  ### User Flow:
  - Customer role:<br>
 ![image](https://github.com/dunghuynh-teaching/prj301-se1714-10/blob/main/assets/CustomerFlow.png)

  
  ### A quick look
  __To see more reviews our figma:__ [Figma](https://www.figma.com/file/0FlAcFU8wu56wJUJJArbcs/PRJ-F-SHOP?type=design&node-id=0%3A1&t=Wvqv2I56Q1ED0Rm3-1)<br>
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

#### ADMIN:
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
