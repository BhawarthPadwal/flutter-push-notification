# Flutter Push Notification

A Flutter project demonstrating push notifications using Firebase Cloud Messaging (FCM).

## Features

- **Firebase Cloud Messaging (FCM):** Integrated with FCM to receive push notifications.
- **In-App Notifications:** Displays notifications within the app when it is in the foreground.
- **Background Notifications:** Handles notifications when the app is in the background or terminated.
- **Navigation:** Navigates to a specific screen when a notification is tapped.
- **API Service:** A simple service to handle API requests.
- **Logger:** Uses the `logger` package for easy-to-read logs.
- **Environment Variables:** Uses `.env` file to manage environment variables.

## Dependencies

- `flutter`
- `cupertino_icons`
- `firebase_core`
- `firebase_messaging`
- `http`
- `logger`
- `flutter_dotenv`

## Getting Started

### Prerequisites

- Flutter SDK
- A Firebase project

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/BhawarthPadwal/flutter-push-notification.git
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Set up Firebase:**
   - Follow the [Firebase setup guide for Flutter](https://firebase.google.com/docs/flutter/setup) to connect your Flutter app to your Firebase project.
   - Download the `google-services.json` file and place it in the `android/app` directory.
   - Download the `GoogleService-Info.plist` file and place it in the `ios/Runner` directory.

4. **Set up environment variables:**
   - Create a `.env` file in the root of the project.
   - Add your environment variables to the `.env` file. For example:
     ```
     API_ENDPOINT=https://your-api-endpoint.com
     ```

### Running the Application

```sh
flutter run
```

## Project Structure

```
.
├── android
├── ios
├── lib
│   ├── app.dart
│   ├── main.dart
│   ├── screens
│   │   ├── home_screen.dart
│   │   └── notification_screen.dart
│   └── services
│       ├── api_service.dart
│       └── firebase_api.dart
├── test
└── pubspec.yaml
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request.
