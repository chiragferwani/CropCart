import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';

class MyMap extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyMap> {
  late GoogleMapController _controller;
  static const CameraPosition _dhankavdiCameraPosition = CameraPosition(
    target: LatLng(18.4575, 73.8560), // Dhankavdi, Pune coordinates
    zoom: 11.0,
  );

  final Map<MarkerId, Marker> _markers = {}; // Store markers

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Ionicons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Explore Markets", style: TextStyle(fontFamily: 'boldfont')),
          backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _dhankavdiCameraPosition,
              mapType: MapType.normal,
              onMapCreated: (controller) {
                setState(() {
                  _controller = controller;
                  _addMarkers();
                });
              },
              markers: Set<Marker>.of(_markers.values),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLegendItem(Colors.orange, 'Grocery Shops'),
                    _buildLegendItem(Colors.purple, 'Markets'),
                    _buildLegendItem(Colors.cyan, 'Daily Needs'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Icon(Icons.location_on, color: color),
        SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.black, fontFamily: 'boldfont')),
      ],
    );
  }

  void _addMarkers() {
    final List<Map<String, dynamic>> places = [
      {'name': 'Reliance Fresh', 'type': 'grocery', 'lat': 18.5204, 'lng': 73.8567},
      {'name': 'Big Bazaar', 'type': 'market', 'lat': 18.5300, 'lng': 73.8650},
      {'name': 'D-Mart', 'type': 'grocery', 'lat': 18.5405, 'lng': 73.8120},
      {'name': 'Local Vegetable Market', 'type': 'market', 'lat': 18.5502, 'lng': 73.8253},
      {'name': 'Medical & General Store', 'type': 'daily_needs', 'lat': 18.5158, 'lng': 73.8725},
      {'name': 'Vishal Mega Mart', 'type': 'market', 'lat': 18.5035, 'lng': 73.8902},
      {'name': 'More Supermarket', 'type': 'grocery', 'lat': 18.4701, 'lng': 73.9010},
      {'name': '7-Eleven', 'type': 'daily_needs', 'lat': 18.4953, 'lng': 73.8420},
      {'name': 'Star Bazaar', 'type': 'market', 'lat': 18.4850, 'lng': 73.8355},
      {'name': 'Natures Basket', 'type': 'grocery', 'lat': 18.4600, 'lng': 73.8200},
      {'name': 'Pune Central Mall', 'type': 'market', 'lat': 18.5705, 'lng': 73.8052},
      {'name': 'Smart Bazaar', 'type': 'market', 'lat': 18.5150, 'lng': 73.8525},
      {'name': 'Fresco Supermarket', 'type': 'grocery', 'lat': 18.4980, 'lng': 73.8785},
      {'name': 'Daily Mart', 'type': 'grocery', 'lat': 18.4802, 'lng': 73.8999},
      {'name': 'Mega Mart', 'type': 'market', 'lat': 18.5253, 'lng': 73.8600},
      {'name': 'Apollo Pharmacy', 'type': 'daily_needs', 'lat': 18.5550, 'lng': 73.7925},
      {'name': 'Spencer’s Retail', 'type': 'market', 'lat': 18.4925, 'lng': 73.8180},
      {'name': 'Sahyadri Supermarket', 'type': 'grocery', 'lat': 18.5630, 'lng': 73.7855},
      {'name': 'Fresh N Fine', 'type': 'grocery', 'lat': 18.4780, 'lng': 73.8650},
      {'name': 'Food Bazaar', 'type': 'market', 'lat': 18.4505, 'lng': 73.8123},
      {'name': 'General Store', 'type': 'daily_needs', 'lat': 18.5402, 'lng': 73.8950},
      {'name': 'Health & Glow', 'type': 'daily_needs', 'lat': 18.4983, 'lng': 73.8452},
      {'name': 'Heritage Fresh', 'type': 'grocery', 'lat': 18.5100, 'lng': 73.8955},
      {'name': 'City Market', 'type': 'market', 'lat': 18.4800, 'lng': 73.8600},
      {'name': 'V-Mart', 'type': 'market', 'lat': 18.5452, 'lng': 73.8300},
      {'name': 'Organic Mart', 'type': 'grocery', 'lat': 18.5000, 'lng': 73.8455},
      {'name': 'Gourmet Basket', 'type': 'grocery', 'lat': 18.5250, 'lng': 73.8725},
      {'name': 'Everfresh Supermarket', 'type': 'grocery', 'lat': 18.5555, 'lng': 73.8500},
      {'name': 'Shoppers Stop', 'type': 'market', 'lat': 18.5720, 'lng': 73.7890},
      {'name': 'Metro Supermarket', 'type': 'market', 'lat': 18.5905, 'lng': 73.8025},
      {'name': 'QuickMart', 'type': 'grocery', 'lat': 18.5302, 'lng': 73.8605},
      {'name': 'Best Price Store', 'type': 'market', 'lat': 18.5155, 'lng': 73.8990},
      {'name': 'Convenience Store', 'type': 'daily_needs', 'lat': 18.5000, 'lng': 73.8220},
      {'name': 'Nature’s Fresh', 'type': 'grocery', 'lat': 18.4650, 'lng': 73.8555},
      {'name': 'Deli Mart', 'type': 'grocery', 'lat': 18.4855, 'lng': 73.9025},
      {'name': 'Village Market', 'type': 'market', 'lat': 18.5405, 'lng': 73.8052},
      {'name': 'Farmers Fresh', 'type': 'grocery', 'lat': 18.5700, 'lng': 73.8305},
      {'name': 'New Market Square', 'type': 'market', 'lat': 18.5100, 'lng': 73.8999},
      {'name': 'Daily Essentials', 'type': 'daily_needs', 'lat': 18.5902, 'lng': 73.7805},
      {'name': 'Pune Grocery Hub', 'type': 'grocery', 'lat': 18.5255, 'lng': 73.8655},
      {'name': 'City Hypermart', 'type': 'market', 'lat': 18.4955, 'lng': 73.8100},
    ];



    for (final place in places) {
      final markerId = MarkerId(place['name']);
      final marker = Marker(
        markerId: markerId,
        position: LatLng(place['lat'], place['lng']),
        infoWindow: InfoWindow(title: place['name']),
        icon: _getMarkerIcon(place['type']),
      );
      _markers[markerId] = marker;
    }
  }

  BitmapDescriptor _getMarkerIcon(String type) {
    switch (type) {
      case 'grocery':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
      case 'market':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);
      case 'daily_needs':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan);
      default:
        return BitmapDescriptor.defaultMarker;
    }
  }
}
