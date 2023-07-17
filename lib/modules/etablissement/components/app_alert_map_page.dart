import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class AppAlertMapPage extends StatelessWidget {
  final latitude;
  final longitude;
  AppAlertMapPage({
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    CameraPosition _kLake = CameraPosition(
        bearing: 0  ,
        target: LatLng(latitude, longitude),
        tilt: 50,
        zoom: 18.5);

    Marker _position = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        markerId: MarkerId('1'),
        draggable: true,
        infoWindow: InfoWindow(
          title: "Ici",
        ),
        onTap: () {
          },
        position:  
            LatLng(latitude, longitude));
    return Scaffold(
        backgroundColor: AppColors.grey3,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left_outlined,
                color: AppColors.primaryBlue,
              ),
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              onPressed: () {
                Get.back();
              },
            ),
           

            backgroundColor: Colors.transparent,
            elevation: 0),
        body: Container(
            height: kHeight * .95,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: AppColors.whitecolor,
            ),
            child: GoogleMap(
               initialCameraPosition: _kLake,
              myLocationEnabled: true, myLocationButtonEnabled: true,
               markers: {_position},
              compassEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ))); 
  }
}
