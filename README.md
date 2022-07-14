# Project Movie

## 💡 Introduction

This is a movie theater project and these are the APIs used by the client to get data from the server.

## 👋 Background

This is the final project of the Cybersoft programming center in the NodeJS developer course.

## ⚙️ Technology
- Backend
  - `Node Js` - Node.js is an open-source, cross-platform, back-end JavaScript runtime environment that runs on the V8 engine and executes JavaScript code outside a web browser, which was designed to build scalable network applications
  - `Express Js` - Express.js, or simply Express, is a back end web application framework for Node.js, released as free and open-source software under the MIT License
  - `MY SQL` - MySQL is an open-source relational database management system
  - `Sequelize` - Sequelize is an easy-to-use and promise-based Node.js ORM tool for Postgres, MySQL, MariaDB, SQLite, DB2, Microsoft SQL Server, Snowflake, and IBM i

## 🌿 Preview images

<br>
<img src="./img/Homepage.png" width="400" height="217" />
&nbsp;
<img src="./img/Product.png" width="400" height="217" />
&nbsp;
<img src="./img/Cart.png" width="400" height="217" />
&nbsp;
<img src="./img/login.png" width="400" height="217" />
&nbsp;
<img src="./img/Register.png" width="400" height="217" />
&nbsp;
<img src="./img/admin_page.png" width="400" height="217" />
&nbsp;
<img src="./img/update_product.png" width="400" height="217" />
&nbsp;
<img src="./img/create_product.png" width="400" height="217" />

<br>

## 🏃‍♂️ How to run project

- To run this project, you should use Netbeans IDE (especially version 12.4) to run easily, another IDE like IntelliJ, Eclipse,... You need to find the way to config this project before using.
- After import project to IDE, please import `JSTL Library` and `external library` from `lib` folder.
- At `src\java\sendemail\SendEmail.java` file, you need to change this code into your email and password to use `Send Email function`.

```java
    String myAccountEmail = "YourEmail";
    String password = "YourEmailPassword";
```

- After that, you click [here](https://myaccount.google.com/security?hl=en), sign in with the gmail account you have entered above `(if you haven't logged in yet)`, scroll down to `Less secure app access` and turn it `ON`
- At `web\META-INF\context.xml` file, you need to config as below:

```java
<Context path="/VegetableStore">
    <Resource name="DBCon" auth="Container" type="javax.sql.DataSource"
              username="YourDBUser(Change it)" password="YourDBPassword(Change it)"
              driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"
              url="jdbc:sqlserver://localhost:1433;databaseName=VegetableStore">
    </Resource>
</Context>
```

- Set up database by running the `script.sql` file in `database` folder.
- Finally, let's try to go shopping 🛒

## ⚠️ Note

- To use `Admin` role with this project, please login with `username: admin@gmail.com; password: 1`
- To use `User` role with this project, please login with `username: user@gmail.com; password: 1` or use `Sign up` to create account.

## License & copyright

© Tung Nguyen | Licensed under the [MIT LICENSE](LICENSE).
