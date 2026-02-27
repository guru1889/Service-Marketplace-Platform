# 🚀 Service Marketplace Platform

A full-stack web application that connects customers with local service providers through a centralized digital marketplace.

This project demonstrates practical implementation of authentication, REST APIs, protected routes, dashboard management, and full-stack integration using Django and React.

---

## 📌 Problem Statement

Finding reliable local service providers (electricians, plumbers, technicians, etc.) is often unorganized and inefficient.  
This platform provides:

- Centralized service discovery  
- Provider availability management  
- Secure authentication  
- Structured booking workflow  

---

## 🛠 Tech Stack

### 🔹 Backend
- Python 3
- Django
- Django REST Framework
- JWT Authentication
- SQLite (Development)

### 🔹 Frontend
- React.js
- Axios
- React Router DOM
- Context API
- Bootstrap / Custom CSS

---

## 🔐 Core Features

### 👤 User Module
- User Registration & Login
- JWT-based Authentication
- Browse Service Providers
- Filter Services
- View Profile
- Booking Management
- Protected Routes

### 🧑‍🔧 Provider Module
- Provider Dashboard
- Add / Update Services
- Manage Availability
- Booking Visibility

### 🛡 Admin Controls
- Manage Users
- Manage Providers
- Dashboard Routing
- Role-Based Access Logic

---

## 🔄 System Workflow

1. User registers or logs in
2. JWT token is generated
3. Token stored in localStorage
4. User accesses protected routes
5. Backend validates token for every API request
6. Providers manage availability
7. Users book services

---

## 📂 Project Structure

Service-Marketplace-Platform/
│
├── Backend/
│   ├── manage.py
│   ├── apps/
│   ├── settings.py
│   └── api/
│
├── Frontend/
│   ├── src/
│   ├── components/
│   ├── pages/
│   └── api.js
│
├── README.md
└── .gitignore

---

## ⚙️ Installation Guide

### 1️⃣ Clone Repository

```bash
git clone https://github.com/guru1889/Service-Marketplace-Platform.git
cd Service-Marketplace-Platform
```

---

## 🖥 Backend Setup

```bash
cd Backend
python -m venv venv
source venv/bin/activate     # Linux / Mac
venv\Scripts\activate        # Windows

pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

Backend runs at:

```
http://127.0.0.1:8000/
```

---

## 💻 Frontend Setup

```bash
cd Frontend
npm install
npm start
```

Frontend runs at:

```
http://localhost:3000/
```

---

## 🔐 Authentication Implementation

- JWT Token-based authentication
- Axios interceptor attaches Authorization header
- ProtectedRoute component prevents unauthorized access
- Role-based route management

---

## 🧪 API Integration

- RESTful endpoints built using Django REST Framework
- Axios used for API communication
- Error handling for 401 Unauthorized
- Token validation on protected endpoints

---

## 📈 Future Enhancements

- Payment Integration
- Real-time notifications
- Provider availability scheduling optimization
- Deployment on AWS / Render / Vercel
- Docker support

---

## 🧠 What This Project Demonstrates

- Full Stack Development
- REST API Design
- Authentication & Authorization
- React State Management
- Git Version Control
- Structured Project Architecture

---

## 👨‍💻 Author

Guru 
Junior Full stack developer  

GitHub: https://github.com/guru1889