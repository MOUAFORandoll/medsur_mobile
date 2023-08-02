import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_map_page.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
import 'package:medsur_app/modules/alerte/models/etablissement_model.dart';
import 'package:medsur_app/modules/alerte/models/user_alert_model.dart';
import 'package:medsur_app/modules/alerte/views/etablissementView.dart';
import 'package:medsur_app/styles/dimension.dart';
import '../../../constants/assets.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class AppAlertMap extends StatelessWidget {
  var latitude;
  var longitude;
  AppAlertMap({
    required this.latitude,
    required this.longitude,
  });
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    CameraPosition _kLake = CameraPosition(
        bearing: 0 /* 192.8334901395799 */,
        target: LatLng(latitude, longitude),
        // target: LatLng(4.0490879, 9.7619492),
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
          //print('this is where you will arrive');
        },
        position: /*  LatLng(4.0490879, 9.7619492),  */
            LatLng(latitude, longitude));
    return Container(
        height: kHeight * .95,
        // padding: EdgeInsets.symmetric(horizontal: kMarginX),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryGreen),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GoogleMap(
              // mapType: MapType.hybrid,
              initialCameraPosition: _kLake,
              myLocationEnabled: true,
              markers: {_position},
              compassEnabled: true,
              onTap: (value) {
                Get.to(AppAlertMapPage(
                  latitude: latitude,
                  longitude: longitude,
                ));
              },
              onLongPress: (value) {
                Get.to(AppAlertMapPage(
                  latitude: latitude,
                  longitude: longitude,
                ));
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            )));
    //Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //     color: AppColors.whitecolor,
    //   ),
    //   padding: EdgeInsets.symmetric(
    //       horizontal: kMarginX / 1.5, vertical: kMarginY * 2.5),
    //   margin: EdgeInsets.symmetric(vertical: kMarginY / 2),
    //   child: GoogleMap(
    //     // mapType: MapType.terrain,
    //     initialCameraPosition: _kLake,
    //     myLocationEnabled: true,

    //     compassEnabled: true,
    //     onMapCreated: (GoogleMapController controller) {
    //       _controller.complete(controller);
    //     },
    //   ),
    // ),
  }
}
