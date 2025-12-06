import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title:'Weather App',
    theme: ThemeData(primarySwatch: Colors.grey),
    home: CitySelectionScreen(),
  ));
}
class CitySelectionScreen extends StatelessWidget {
   CitySelectionScreen({super.key});

  final List<String> cities = [
    "Karachi", "Lahore", "Islamabad", "Peshawar", "Quetta"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      appBar: AppBar(backgroundColor: Colors.transparent,  elevation: 0,
        title:  Text("Select City to See the Weather ",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),body: ListView.builder(itemCount: cities.length,
        itemBuilder: (context, index) {return Card(color:  Color(0xFF2A2A3D),
            margin:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(title: Text(cities[index],
                style:  TextStyle(fontSize: 18, color: Colors.white),
              ),trailing:  Icon(Icons.arrow_forward_ios, color: Colors.white70),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => WeatherScreen(city: cities[index]),
                  ),
                );
              },),);},),);}}

class WeatherScreen extends StatelessWidget {
  final String city;
  const WeatherScreen({super.key, required this.city});
  final String jsonUrl ="https://raw.githubusercontent.com/ZainabM63/Json-For-weather-Mock-APi/refs/heads/main/Weather-App-Mock-API.json";

  Future<Map<String, dynamic>> loadWeather() async {
    final response = await http.get(Uri.parse(jsonUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data[city]; 
    } else {
      throw Exception("Failed to load JSON file");
    }
  }

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
        return Icons.cloud;}}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A27),
      body: SafeArea(
        child: FutureBuilder(
          future: loadWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  Center(
                child: CircularProgressIndicator(color: Colors.white),
              );}
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style:  TextStyle(color: Colors.red),
                ),
              );}
            final weather = snapshot.data!;
            return Column(
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
                ), SizedBox(height: 10),
                Icon(
                  getIcon(weather["icon"]),
                  size: 120,
                  color: Colors.white,
                ), SizedBox(height: 10),

                Text(
                  weather["temperature"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  weather["condition"],
                  style: TextStyle(color: Colors.white70, fontSize: 22),
                ),
                 SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color:  Color(0xFF26263A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>
                       [
                        WeatherDetailItem(icon: Icons.water_drop,label: "Humidity",
                          value: weather["humidity"],
                        ),
                        WeatherDetailItem(
                          icon: Icons.air,
                          label: "Wind",
                          value: weather["wind"],
                        ),
              WeatherDetailItem(icon: Icons.wb_cloudy,label: "Condition",
                          value: weather["condition"],
                        ),
                      ],),),)
              ],);}
              ,),),);}}

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
        Text(label, style:  TextStyle(color: Colors.white70)),
         SizedBox(height: 4),
        Text(
          value,
          style:
               TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ], );  }
}
