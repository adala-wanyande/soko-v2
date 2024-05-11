import 'package:flutter/material.dart';

class StoresListScreen extends StatefulWidget {
  const StoresListScreen({super.key});

  @override
  State<StoresListScreen> createState() => _StoresListScreenState();
}

class _StoresListScreenState extends State<StoresListScreen> {
  final List<Map<String, dynamic>> _storeData = [
    {
      'name': 'Gleam Boutique',
      'floor': 'GROUND FLOOR',
      'logo': 'assets/logos/gleam_boutique.png'
    },
    {
      'name': 'Harvest Bliss',
      'floor': 'GROUND FLOOR',
      'logo': 'assets/logos/harvest_bliss.png'
    },
    {
      'name': 'Luminous Glow',
      'floor': 'GROUND FLOOR',
      'logo': 'assets/logos/luminous_glow.png'
    },
    {
      'name': 'Smoky Trails',
      'floor': 'FIRST FLOOR',
      'logo': 'assets/logos/smoky_trails.jpg'
    },
    {
      'name': 'Urban Oasis',
      'floor': 'GROUND FLOOR',
      'logo': 'assets/logos/urban_oasis.jpg'
    },
    {
      'name': 'Urban Threads',
      'floor': 'SECOND FLOOR',
      'logo': 'assets/logos/urban_threads.png'
    },
    {
      'name': 'Velocity Gear',
      'floor': 'LOWER GROUND FLOOR',
      'logo': 'assets/logos/velocity_gear.png'
    },
    {
      'name': 'Vitacare Pharmacy',
      'floor': 'SECOND FLOOR',
      'logo': 'assets/logos/vitacare_pharmacy.jpg'
    },
    {
      'name': 'Vital Bloom',
      'floor': 'SECOND FLOOR',
      'logo': 'assets/logos/vital_bloom.png'
    },
  ];

  List<Map<String, dynamic>> _filteredData = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredData = _storeData;
    _searchController.addListener(_filterList);
  }

  void _filterList() {
    List<Map<String, dynamic>> results = [];
    if (_searchController.text.isEmpty) {
      results = _storeData;
    } else {
      results = _storeData
          .where((item) =>
              item['name']
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()) ||
              item['floor']
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredData = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        ),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredData.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(_filteredData[index]['logo']),
              backgroundColor: Colors.transparent,
            ),
            title: Text(_filteredData[index]['name']),
            subtitle: Text(_filteredData[index]['floor']),
            onTap: () {
              // Optional: Add navigation or other interaction
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
