import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'dart:async';

import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late Marker _position;
  var action = Get.find<ActionController>();

  var latitude = 0.0;
  var longitude = 0.0;
  initState() {
    latitude = action.position.latitude;
    longitude = action.position.longitude;
    super.initState();
    _position = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        markerId: MarkerId('1'),
        draggable: true,
        infoWindow: InfoWindow(
          title: "Ici",
        ),
        onTap: () {},
        position: LatLng(latitude, longitude));
  }

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    CameraPosition _kLake = CameraPosition(
        bearing: 0, target: LatLng(latitude, longitude), tilt: 50, zoom: 18.5);

    return GetBuilder<EtablissementController>(
        builder: (controller) => Scaffold(
            backgroundColor: AppColors.grey3,
            appBar: AppBar(
                title: Text('positionEtablissement'.tr),
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
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    markers: {_position},
                    compassEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    onTap: (LatLng value) {
                      print(value);
                      controller.setPosition(value);
                      setState(() {
                        _position = Marker(
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueCyan),
                            markerId: MarkerId('1'),
                            draggable: true,
                            infoWindow: InfoWindow(
                              title: "Ici",
                            ),
                            onTap: () {},
                            position: LatLng(value.latitude, value.longitude));
                      });
                    }))));
  }
}
