Mega City Cab System
------------------------------------------------
Mega City Cab System is a web-based application that allows users to book cabs, manage their accounts, and handle ride requests efficiently. The system is built using Jakarta EE and follows a DAO-based architecture for database interactions.

Technology Stack
------------------------------------------------
•	Java 17 <br>
•	Jakarta EE 10.0.0 (JSP, Servlets, DAO) <br>
•	Apache-Tomcat-10.1.34 <br>
•	MySQL WorkBench 8.0 <br>
•	JUnit and Mockito <br>

System Overview
------------------------------------------------
The system has the following functionalities:

•	User Registration and Login <br>
•	Manage Bookings <br>
•	Manage Drivers <br>
•	Manage Vehicles <br>
•	Email Notifications (Registration and Booking) <br>

File Structure
------------------------------------------------

MegaCityCab <br>
├── src/ <br>
│   ├── main/ <br>
│   │   ├── java/ <br>
│   │   │   ├── config/ <br>
│   │   │   │   ├── connectionProvider.java <br>
│   │   │   │   ├── DatabaseConnection.java <br>
│   │   │   │   ├── db.sql <br>
│   │   │   ├── controllers/ <br>
│   │   │   │   ├── AuthServlet.java <br>
│   │   │   │   ├── LogoutServlet.java <br>
│   │   │   │   ├── RegisterServlet.java <br>
│   │   │   │   ├── UpdateImageServlet.java <br>
│   │   │   ├── dao/ <br>
│   │   │   │   ├── UserDAO.java <br>
│   │   │   ├── models/ <br>
│   │   │   │   ├── Booking.java <br>
│   │   │   │   ├── Car.java <br>
│   │   │   │   ├── Driver.java <br>
│   │   │   │   ├── User.java <br>
│   │   │   ├── services <br>
│   │   │   │   ├── EmailService <br>
│   │   ├── resources/ <br>
│   │   ├── webapp/ <br>
│   │   │   ├── assets/ <br>
│   │   │   │   ├── Styles/ <br>
│   │   │   │   │   ├── carstyle.css <br>
│   │   │   │   │   ├── main.css <br>
│   │   │   ├── image/ <br>
│   │   │   │   ├── cabs/ <br>
│   │   │   │   ├── background3.jpg <br>
│   │   │   ├── interfaces/ <br>
│   │   │   │   ├── admin/ <br>
│   │   │   │   │   ├── manage-booking/ <br>
│   │   │   │   │   │   ├── calculateBill.jsp <br>
│   │   │   │   │   │   ├── delete.jsp <br>
│   │   │   │   │   │   ├── fee.jsp <br>
│   │   │   │   │   │   ├── managebooking.jsp <br>
│   │   │   │   │   │   ├── printBill.jsp <br>
│   │   │   │   │   │   ├── status.jsp <br>
│   │   │   │   │   │   ├── updateFeeAction.jsp <br>
│   │   │   │   │   │   ├── updateStatus.jsp <br>
│   │   │   │   │   ├── manage-car/ <br>
│   │   │   │   │   │   ├── addcar.jsp <br>
│   │   │   │   │   │   ├── addCarAction.jsp <br>
│   │   │   │   │   │   ├── deletecar.jsp <br>
│   │   │   │   │   │   ├── editcar.jsp <br>
│   │   │   │   │   │   ├── editCarAction.jsp <br>
│   │   │   │   │   │   ├── managecar.jsp <br>
│   │   │   │   │   │   ├── updateimage.jsp <br>
│   │   │   │   │   │   ├── updatestatus.jsp <br>
│   │   │   │   │   │   ├── updatestatusAction.jsp <br>
│   │   │   │   │   ├── manage-driver/ <br>
│   │   │   │   │   │   ├── adddriver.jsp <br>
│   │   │   │   │   │   ├── addDriverAction.jsp <br>
│   │   │   │   │   │   ├── deletedriver.jsp <br>
│   │   │   │   │   │   ├── editdriver.jsp <br>
│   │   │   │   │   │   ├── editDriverAction.jsp <br>
│   │   │   │   │   │   ├── managedriver <br>
│   │   │   │   │   ├── admin-dashboard.jsp <br>
│   │   │   │   ├── customer/ <br>
│   │   │   │   │   ├── Booking/ <br>
│   │   │   │   │   │   ├── booking.jsp <br>
│   │   │   │   │   │   ├── bookingAction.jsp <br>
│   │   │   │   │   │   ├── delete.jsp <br>
│   │   │   │   │   ├── printBill.jsp <br>
│   │   │   │   │   ├── customer-dashboard.jsp <br>
│   │   │   │   ├── cars.jsp <br>
│   │   │   │   ├── help.jsp <br>
│   │   │   │   ├── login.jsp <br>
│   │   │   │   ├── register.jsp <br>
│   │   │   ├── WEB-INF/ <br>
│   │   │   │   ├── web.xml <br>
│   │   │   ├── index.jsp <br>
│   ├── test <br>
│   │   ├── java <br>
│   │   │   ├── dao <br>
│   │   │   │   ├── UserDAOTest <br>
