# Soko V2
This Flutter application provides various challenge screens, including Image Challenge, Video Challenge, QR Code Challenge, and Location Challenge. Users can complete these challenges to receive discounts.

## Table of Contents

- [Features](#features)
- [Setup](#setup)
- [Dependencies](#dependencies)
- [Screens](#screens)
  - [Image Challenge Screen](#image-challenge-screen)
  - [Video Challenge Screen](#video-challenge-screen)
  - [QRCode Challenge Screen](#qr-code-challenge-screen)
  - [Location Challenge Screen](#location-challenge-screen)
- [Running the App](#running-the-app)
- [License](#license)

## Features

- Image Challenge: Flip an image and share it to receive a discount.
- Video Challenge: Watch a video and share it to receive a discount.
- QRCode Challenge: Scan a QR code to receive a discount.
- Location Challenge: Go to a specific location to receive a discount.

## Setup

1. **Clone the repository:**

   ```sh
   git clone https://github.com/yourusername/flutter-challenge-app.git
   cd flutter-challenge-app
   ```

2. **Install dependencies:**

   ```sh
   flutter pub get
   ```

3. **Add required assets:**

   Ensure that the following assets are added to your project:
   - `assets/images/`
     - `lc_waikiki.png`
   - `assets/challenges/`
     - `mr_price.mp4`

   Update your `pubspec.yaml` file to include these assets:

   ```yaml
   flutter:
     assets:
       - assets/images/lc_waikiki.png
       - assets/challenges/mr_price.mp4
   ```

4. **Add permissions for location services (for the Location Challenge):**

   Update `AndroidManifest.xml`:

   ```xml
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
   <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
   ```

   Update `Info.plist` for iOS:

   ```xml
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>We need your location to verify the challenge completion.</string>
   <key>NSLocationAlwaysUsageDescription</key>
   <string>We need your location to verify the challenge completion.</string>
   ```

## Dependencies

This project uses the following Flutter packages:

- `flip_card: ^0.5.0`
- `share_plus: ^4.0.4`
- `video_player: ^2.2.19`
- `qr_code_scanner: ^0.7.0`
- `geolocator: ^9.0.0`

## Screens

### Image Challenge Screen

Allows users to flip an image and share it to receive a discount.

```dart
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:share_plus/share_plus.dart';

class ImageChallengeScreen extends StatefulWidget {
  final String title;

  const ImageChallengeScreen({required this.title, super.key});

  @override
  _ImageChallengeScreenState createState() => _ImageChallengeScreenState();
}

class _ImageChallengeScreenState extends State<ImageChallengeScreen> {
  // Implementation details...
}
```

### Video Challenge Screen

Allows users to watch a video and share it to receive a discount.

```dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoChallengeScreen extends StatefulWidget {
  const VideoChallengeScreen({super.key});

  @override
  _VideoChallengeScreenState createState() => _VideoChallengeScreenState();
}

class _VideoChallengeScreenState extends State<VideoChallengeScreen> {
  // Implementation details...
}
```

### QRCode Challenge Screen

Allows users to scan a QR code to receive a discount.

```dart
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeChallengeScreen extends StatefulWidget {
  final String title;

  const QRCodeChallengeScreen({required this.title, super.key});

  @override
  _QRCodeChallengeScreenState createState() => _QRCodeChallengeScreenState();
}

class _QRCodeChallengeScreenState extends State<QRCodeChallengeScreen> {
  // Implementation details...
}
```

### Location Challenge Screen

Allows users to go to a specific location to receive a discount.

```dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationChallengeScreen extends StatefulWidget {
  final String title;

  const LocationChallengeScreen({required this.title, super.key});

  @override
  _LocationChallengeScreenState createState() => _LocationChallengeScreenState();
}

class _LocationChallengeScreenState extends State<LocationChallengeScreen> {
  // Implementation details...
}
```

## Running the App

To run the app, use the following command:

```sh
flutter run
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
