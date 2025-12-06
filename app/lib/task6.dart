import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Weather App',
    theme: ThemeData(primarySwatch: Colors.grey),
    home: CitySelectionScreen(),
  ));
}

class CitySelectionScreen extends StatelessWidget {
  CitySelectionScreen({super.key});

  final Map<String, Map<String, String>> weatherData = {
    "Karachi": {
      "temperature": "28°C",
      "condition": "Sunny",
      "icon": "wb_sunny",
      "humidity": "60%",
      "wind": "12km/h",
    },
    "Lahore": {
      "temperature": "21°C",
      "condition": "Cloudy",
      "icon": "cloud",
      "humidity": "70%",
      "wind": "9km/h",
    },
    "Islamabad": {
      "temperature": "25°C",
      "condition": "Rainy",
      "icon": "umbrella",
      "humidity": "75%",
      "wind": "20km/h",
    },
    "Peshawar": {
      "temperature": "22°C",
      "condition": "Cloudy",
      "icon": "cloud",
      "humidity": "62%",
      "wind": "10km/h",
    },
    "Quetta": {
      "temperature": "20°C",
      "condition": "Windy",
      "icon": "air",
      "humidity": "55%",
      "wind": "18km/h",
    },
  };

  final List<String> cities = [
    "Karachi",
    "Lahore",
    "Islamabad",
    "Peshawar",
    "Quetta"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Select City to See the Weather ",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final String cityName = cities[index];
          return Card(
            color: Color(0xFF2A2A3D),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              title: Text(
                cityName,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white70),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WeatherScreen(
                      city: cityName,
                      weather: weatherData[cityName]!,
                    ),
                  ),
                );},   ),
          );
        }, ),);  }
}

class WeatherScreen extends StatelessWidget {
  final String city;
  final Map<String, String> weather;
  const WeatherScreen({
    super.key,
    required this.city,
    required this.weather,
  });

  IconData getIcon(String key) {
    switch (key) {
      case "cloud":
        return Icons.cloud;
      case "wb_sunny":
        return Icons.wb_sunny;
      case "umbrella":
        return Icons.umbrella;
      case "air":
        return Icons.air;
      default:
        return Icons.cloud;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A27),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              city,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Icon(
              getIcon(weather["icon"]!),
              size: 120,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              weather["temperature"]!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              weather["condition"]!,
              style: TextStyle(color: Colors.white70, fontSize: 22),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF26263A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    WeatherDetailItem(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: weather["humidity"]!,
                    ),
                    WeatherDetailItem(
                      icon: Icons.air,
                      label: "Wind",
                      value: weather["wind"]!,
                    ),
                    WeatherDetailItem(
                      icon: Icons.wb_cloudy,
                      label: "Condition",
                      value: weather["condition"]!,
  ),
                  ],
                ),         ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherDetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherDetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white70)),
        SizedBox(height: 4),
        Text(value,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ],);}}