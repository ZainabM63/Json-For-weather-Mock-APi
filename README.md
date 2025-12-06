## 👩‍💻 Developer

**Author:** Zainab Mughal


# Weather App Flutter (Mock API)

A simple and beautiful Flutter application to display weather information for major Pakistani cities using a mock JSON API.  
Users can select a city to view weather details such as temperature, condition, humidity, and wind fetched live from a remote JSON file.

---

## Features

- 🌆 **City Selection:** Select from Karachi, Lahore, Islamabad, Peshawar, and Quetta.
- ☀️ **Realtime Data:** Weather information is fetched from a remote JSON file hosted on GitHub.
- 🎨 **Modern UI:** Clean and dark-themed user interface with city-specific weather icons.
- 📦 **No Backend:** Uses mock data, so no server setup required.
- 🚀 **Flutter/Dart:** Built with Flutter; runs on Android, iOS, Web, and Desktop (with Flutter support).

---

## Screenshots

<!-- You can add your own screenshots here, for example: -->
<!--
| City Selection              | Weather Details                |
|---------------------------- |-------------------------------|
| ![City Selection](images/city_selection.png) | ![Weather Detail](images/weather_detail.png) |
-->

---

## Getting Started

1. **Clone this repository:**
   ```bash
   git clone https://github.com/ZainabM63/Weather-App-Flutter-Mock-API.git
   cd Weather-App-Flutter-Mock-API
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

---

## Usage

- Launch the app.
- Select a city from the list.
- View weather details including temperature, condition, humidity, and wind.

---

## Mock API

The weather data is fetched from a public JSON file hosted on GitHub:

```
https://raw.githubusercontent.com/ZainabM63/Json-For-weather-Mock-APi/main/Weather-App-Mock-API.json
```

---

## Dependencies

- [Flutter](https://flutter.dev/docs/get-started/install)
- [http](https://pub.dev/packages/http)

---

## Main Structure

- `main.dart`: Contains the full app logic including city selection, weather fetching, and UI.
- `WeatherDetailItem`: Custom widget for displaying weather attributes.

---

## Customization

- To add more cities or modify weather data, update the JSON file at the above URL.
- To use your own API or mock data, change the `jsonUrl` in `main.dart`.

---
