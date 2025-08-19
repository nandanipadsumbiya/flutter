# MediCare - Medicine Reminder App

A beautiful Flutter application for managing medicine reminders with user authentication and animated UI.

## Features

### 🔐 Authentication System
- **User Registration**: Create new accounts with secure password hashing
- **User Login**: Secure login with username/email and password
- **Database Storage**: Local SQLite database for storing user data

### 🎨 Beautiful UI with Animations
- **Smooth Animations**: Using `animate_do` package for entrance animations
- **Gradient Backgrounds**: Beautiful gradient designs throughout the app
- **Google Fonts**: Modern typography using Google Fonts (Poppins)
- **Responsive Design**: Works on different screen sizes

### 💊 Medicine Management (Coming Soon)
- Add medicines with dosage information
- Set custom reminders
- View medicine history
- Generate reports

## Database Schema

### Users Table
```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  full_name TEXT NOT NULL,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
);
```

### Medicines Table
```sql
CREATE TABLE medicines (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  medicine_name TEXT NOT NULL,
  dosage TEXT NOT NULL,
  frequency TEXT NOT NULL,
  start_date TEXT NOT NULL,
  end_date TEXT,
  notes TEXT,
  created_at TEXT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id)
);
```

### Medicine Reminders Table
```sql
CREATE TABLE medicine_reminders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  medicine_id INTEGER NOT NULL,
  reminder_time TEXT NOT NULL,
  is_taken INTEGER DEFAULT 0,
  reminder_date TEXT NOT NULL,
  created_at TEXT NOT NULL,
  FOREIGN KEY (medicine_id) REFERENCES medicines (id)
);
```

## Dependencies

- **flutter**: SDK framework
- **sqflite**: SQLite database for local storage
- **path**: Path manipulation utilities
- **animate_do**: Beautiful animations
- **google_fonts**: Custom fonts
- **provider**: State management
- **email_validator**: Email validation
- **crypto**: Password hashing
- **cupertino_icons**: iOS-style icons

## Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd medi_care3
```

2. Get dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## App Structure

```
lib/
├── database/
│   └── database_helper.dart      # SQLite database operations
├── models/
│   └── user_model.dart          # User data model
├── screens/
│   ├── login_page.dart          # Login page with animations
│   ├── signup_page.dart         # Registration page
│   └── home_page.dart           # Main dashboard
└── main.dart                    # App entry point
```

## Security Features

- **Password Hashing**: All passwords are hashed using SHA-256 before storage
- **Input Validation**: Comprehensive form validation for all user inputs
- **SQL Injection Protection**: Using parameterized queries
- **Email Validation**: Proper email format validation

## UI/UX Features

- **Gradient Backgrounds**: Beautiful blue-purple gradients
- **Smooth Animations**: Fade-in, slide-up, and bounce animations
- **Modern Design**: Material Design 3 with custom theming
- **Responsive Layout**: Adapts to different screen sizes
- **Loading States**: Visual feedback during async operations
- **Error Handling**: User-friendly error messages

## Future Enhancements

- [ ] Medicine CRUD operations
- [ ] Push notifications for reminders
- [ ] Medicine interaction warnings
- [ ] Export medicine history
- [ ] Doctor consultation integration
- [ ] Pharmacy integration
- [ ] Pill identification using camera
- [ ] Family member medicine tracking

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, email support@medicare.com or create an issue in the repository.