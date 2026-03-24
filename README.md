# 🍽️ MealTime App

A fully integrated **food service system** built using Flutter, designed to streamline meal management between chefs and administrators.

The system consists of:

* 📱 **Mobile App (for chefs/users)**
* 🛠️ **Admin Dashboard** *(managed separately)*

---

## 🚀 Overview

MealTime enables chefs to create, manage, and publish meals while ensuring quality control through an admin approval system.
The app also provides a seamless experience with **offline support, notifications, and smart network handling**.

---

## 📱 Mobile App Features

---

### 🔐 Authentication & Security

* Register as a chef
* Login with **Remember Me**
* Forgot Password with verification code
* Secure:

  * Logout
  * Change Password
  * Delete Account

---

### 🍽️ Meal Management

* Add meals:

  * Name
  * Description
  * Price
  * Image
* Edit **only your own meals**
* View meal details
* Add to:

  * ❤️ Favorites
  * 📦 Archived

> ⚠️ Meals require **admin approval** before being published

---

### 📶 Offline Mode & Caching

* Meals cached after first load
* Offline behavior:

  * ⚠️ "You are offline" alert
  * Loads cached meals

---

### 🔔 Notification System

* Local notifications for:

  * Meal updates

* Includes:

  * Image
  * Details

* Notification center:

  * Delete single or all notifications

⏰ Scheduled notification:

* Daily reminder at **12:00 AM**
* Works even if the app is closed

---

### 📬 Push Notifications (FCM)

* Enable/Disable from settings
* If enabled:

  * FCM token generated
  * User subscribes to the topic
  * Backend sends real-time notifications

---

### 🌐 Smart Network Handling

* All API calls check internet connection first
* If offline:

  * 🚫 Request is blocked
  * ❗ "No Internet" dialog appears

---

### 📍 Location Services

* Request GPS permission on first launch
* Automatically fetch and store detailed address

---

### 👤 Profile Management

* View & update profile information
* Auto-detect and store user address
* Language switching (🌐 Arabic supported)

---

### ❓ FAQs & Smart Search

* Browse FAQs
* Instant filtering using keywords

---

## 🏗️ Architecture

* Feature-based structure
* MVVM design pattern principles
* State Management:

  * Bloc / Cubit

---

## 🎥 Demo

🎬 **Live App Demo:**

> 📌 This demo showcases the full app flow including authentication, meal management, notifications, and offline handling.

---

## 📱 App Screenshots

> 📌 The following screens demonstrate the full user journey from onboarding to meal management and system features.

---

### 🚀 App Launch

| Splash                                            |
| ------------------------------------------------- |
| ![](./assets/app_screens/splash_screen_image.jpg) |

---

### 🔐 Authentication

| Login                                     | Create Account                                     | Send Code                                     | Forget Password                                 |
| ----------------------------------------- | -------------------------------------------------- | --------------------------------------------- | ----------------------------------------------- |
| ![](./assets/app_screens/login_image.jpg) | ![](./assets/app_screens/create_account_image.jpg) | ![](./assets/app_screens/send_code_image.jpg) | ![](./assets/app_screens/forget_pass_image.jpg) |

---

### 🏠 Home & Meals

| Home                                            | Home (Alt)                                       | Meals in Home                                     | Meals Loading                                         | All Meals                                            |
| ----------------------------------------------- | ------------------------------------------------ | ------------------------------------------------- | ----------------------------------------------------- | ---------------------------------------------------- |
| ![](./assets/app_screens/home_screen_image.jpg) | ![](./assets/app_screens/home_screen_image2.jpg) | ![](./assets/app_screens/meals_in_home_image.jpg) | ![](./assets/app_screens/all_meals_loading_image.jpg) | ![](./assets/app_screens/all_meals_screen_image.jpg) |

---

### 🍽️ Meal Management

| Add Meal                                     | Upload Options                                          | Meal Price                                      |
| -------------------------------------------- | ------------------------------------------------------- | ----------------------------------------------- |
| ![](./assets/app_screens/add_meal_image.jpg) | ![](./assets/app_screens/upload_meal_image_options.jpg) | ![](./assets/app_screens/meals_price_image.jpg) |

---

### 📦 Orders & Archive

| Orders & Archive                                       |
| ------------------------------------------------------ |
| ![](./assets/app_screens/orders_and_archive_image.jpg) |

---

### 🔔 Notifications

| Notifications                                     |
| ------------------------------------------------- |
| ![](./assets/app_screens/notifications_image.jpg) |

---

### 🌐 Network Handling

| No Internet Dialog                                          |
| ----------------------------------------------------------- |
| ![](./assets/app_screens/no_internet_connection_dialog.jpg) |

---

### 👤 Profile & Settings

| Profile                                     | Update Profile                                     | Settings                                     | Change Language                                     |
| ------------------------------------------- | -------------------------------------------------- | -------------------------------------------- | --------------------------------------------------- |
| ![](./assets/app_screens/profile_image.jpg) | ![](./assets/app_screens/update_profile_image.jpg) | ![](./assets/app_screens/settings_image.jpg) | ![](./assets/app_screens/change_language_sheet.jpg) |

---

### 🔐 Account Actions

| Change Password                                     | Logout                                     | Delete Account                                     |
| --------------------------------------------------- | ------------------------------------------ | -------------------------------------------------- |
| ![](./assets/app_screens/change_password_image.jpg) | ![](./assets/app_screens/logout_sheet.jpg) | ![](./assets/app_screens/delete_account_sheet.jpg) |

---

### 🧑‍🍳 Chef Information

| Chef Info                                            | Certification                                          |
| ---------------------------------------------------- | ------------------------------------------------------ |
| ![](./assets/app_screens/chef_information_image.jpg) | ![](./assets/app_screens/chef_certification_image.jpg) |

---

### ❓ FAQs

| FAQ                                     |
| --------------------------------------- |
| ![](./assets/app_screens/faq_image.jpg) |

---

### 📍 Location Access

| Location Permission                                   |
| ----------------------------------------------------- |
| ![](./assets/app_screens/access_location_request.jpg) |

---

## 🎥 Demo
Check out the full demo of **MI Card App** here: [Watch Demo Video](https://lnkd.in/dVjQWPca)

---

## 💼 Project Description

A production-ready Flutter application designed for food service management, enabling chefs to create and manage meals with an admin approval workflow.

The app includes advanced features such as offline caching, smart network handling, local and push notifications (FCM), and real-time updates, ensuring a seamless and scalable user experience.

---

## ⭐ Highlights

* Offline-first experience
* Scalable architecture
* Real-time notifications
* Production-ready

---

