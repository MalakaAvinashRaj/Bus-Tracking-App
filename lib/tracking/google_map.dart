import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:email_password_login/tracking/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  GoogleMapController? _controller;

  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initalization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.deepPurple,
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: Colors.deepPurple,
            animationDuration: const Duration(milliseconds: 300),
            height: 60,
            items: const [
              Icon(
                Icons.directions_bus_filled_rounded,
                color: Colors.white,
              ),
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.person_pin_circle_rounded,
                color: Colors.white,
              ),
            ]),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          //toolbarHeight: 70,
          brightness: Brightness.dark,
          title: const Text(
            'KRU BUSES',
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.white),
          ),
        ),
        body: googleMapUI());
  }

  Widget googleMapUI() {
    return Consumer<LocationProvider>(builder: (consumerContext, model, child) {
      if (model.locationposition != null) {
        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                padding: const EdgeInsets.only(top: 650),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition:
                    CameraPosition(target: model.locationposition, zoom: 15),
                onMapCreated: (GoogleMapController controller) {},
              )
            ],
          ),
        );
      }
      floatingActionButton:
      FloatingActionButton(
        child: const Icon(Icons.location_on),
        onPressed: () {
          Location();
        },
      );
      return Container(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
