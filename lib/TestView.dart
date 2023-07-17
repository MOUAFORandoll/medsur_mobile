import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:medsur_app/general_component/app_input_search.dart';
import 'package:medsur_app/general_component/app_text_title.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/home/components/App_btn_text.dart';
import 'package:medsur_app/modules/home/components/app_btn_home.dart';
import 'package:medsur_app/modules/splashscreen/components/app_carroussel_item.dart';
import '../../../constants/index_common.dart';
import 'package:medsur_app/styles/dimension.dart';
import 'package:medsur_app/general_component/index_widgets.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'general_controllers/start_controller.dart';
import 'modules/home/controller/home_controller.dart';

// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'modules/teleconsultation/controller/teleconsultation_controller.dart';

import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

const appId = "<-- Insert App Id -->";
const token = "<-- Insert Token -->";
const channel = "<-- Insert Channel Name -->";

// class TestView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//   final formKey = GlobalKey<FormState>();
//     return  GetBuilder<AuthController>(
//         builder: (authCont)=>  Scaffold(
//           appBar: AppBar(
//             leading: AppBackButton(),
//             title:Text("Test Page") ,centerTitle:true, backgroundColor:Colors.transparent , elevation:0),
//       body: SafeArea(
//             child: Padding(
//                 padding: EdgeInsets.symmetric(vertical:10, horizontal:kMarginX *2
//                   ),

//               child: SingleChildScrollView(
//                 child:  Column(
//                     children: [

//                        AppButton(
//                           text: 'Test Permiss',
//                           onTap: () async{

//                              await   await Get.find<HomeController>().getUserinfo_BD();

//                           },

//             ),   AppButton(
//                           text: 'Test Role',
//                           onTap: () async{

//                              await   authCont.getUserRole_BD();

//                           },

//             )],
//                 )))))
//      );
//   }
// }

// class TestView extends StatefulWidget {
//   const TestView({Key? key}) : super(key: key);

//   @override
//   State<TestView> createState() => _TestViewState();
// }

// class _TestViewState extends State<TestView> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   // Create UI with local view and remote view
//   @override
//   Widget build(BuildContext context) {
//     Scaffold(
//         // appBar: AppBar(
//         //   title: const Text('Agora Video Call'),
//         // ),
//         body: Row(children: [
//       AppButton(
//         text: "Login",
//         size: MainAxisSize.max,
//         onTap: () async {
//           //print('dsds');
//         },
//       ),
//       AppButton(
//         text: "Login",
//         size: MainAxisSize.max,
//         onTap: () async {
//           //print('dsds');
//         },
//       )
//     ]));
//   }
// }

// class TestView extends StatefulWidget {
//   const TestView({Key? key}) : super(key: key);

//   @override
//   State<TestView> createState() => _TestViewState();
// }

// class _TestViewState extends State<TestView> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   // Create UI with local view and remote view
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TeleconsultationController>(
//       builder: (_teleConsultation) => Scaffold(
//           // appBar: AppBar(
//           //   title: const Text('Agora Video Call'),
//           // ),
//           body: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 20),
//               child: AppButton(
//                 text: "Appel",
//                 size: MainAxisSize.max,
//                 onTap: () async {
//                   //print('Reception');

//                   await _teleConsultation.joinedCall(2);
//                   ;
//                 },
//               ),
//             ),
//             AppButton(
//               text: "Recevoir",
//               size: MainAxisSize.max,
//               onTap: () async {
//                 //print('Reception');

//                 await _teleConsultation.joinedCall(1);
//               },
//             ),
//             Center(
//               child: _teleConsultation.RtcV2(),
//             ),
//             SizedBox(
//               width: 100,
//               height: 150,
//               child: Center(child: _teleConsultation.RtcV1()),
//             ),
//           ])),
//     );
//   }

//   // Display remote user's video
//   Widget _remoteVideo() {
//     return GetBuilder<TeleconsultationController>(builder: (_teleConsultation) {
//       if (_teleConsultation.remoteUid != null) {
//         return _teleConsultation.RtcV1();
//       } else {
//         return const Text(
//           'Please wait for remote user to join',
//           textAlign: TextAlign.center,
//         );
//       }
//     });
//   }
// }

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
   
     GoogleMapController? _mapController;
  LocationData? _currentLocation;
  Location _locationService = Location();

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }
  
  Future<void> _initializeLocation() async {
    bool serviceEnabled;
    // PermissionStatus permissionGranted;
    
    serviceEnabled = await _locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationService.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // permissionGranted = await _locationService.hasPermission();
    // if (permissionGranted == PermissionStatus.denied) {
    //   permissionGranted = await _locationService.requestPermission();
    //   if (permissionGranted != PermissionStatus.granted) {
    //     return;
    //   }
    // }

    LocationData currentLocation = await _locationService.getLocation();
    setState(() {
      _currentLocation = currentLocation;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              setState(() {
                _mapController = controller;
              });
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(0, 0), // Coordonnées initiales de la carte
              zoom: 15.0,
            ),
            myLocationEnabled: true, // Activer la localisation de l'utilisateur
            myLocationButtonEnabled:
                true, // Afficher le bouton pour recentrer la carte sur la localisation de l'utilisateur
          ),
          if (_currentLocation != null)
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  _mapController?.animateCamera(
                    CameraUpdate.newLatLng(
                      LatLng(
                        _currentLocation!.latitude!,
                        _currentLocation!.longitude!,
                      ),
                    ),
                  );
                },
                child: Icon(Icons.location_searching),
              ),
            ),
        ],
      ),
    );
  }
}






















// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Google Maps',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.white,
//       ),
//       home: MapScreen(),
//     );
//   }
// }

// class TestView extends StatefulWidget {
//   @override
//   _TestViewState createState() => _TestViewState();
// }

// class _TestViewState extends State<TestView> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
  
//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(4.0490879, 9.7619492),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         // mapType: MapType.terrain,
//         initialCameraPosition: _kGooglePlex,
//         myLocationEnabled: true,

//         compassEnabled: true,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: const Text('To the lake!'),
//         icon: const Icon(Icons.directions_boat),
//       ),
//     );
//   }
  /* 
  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        // Reset destination
        _destination = null;

        // Reset info
        _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin.position, destination: pos);
      setState(() => _info = directions);
    }
  }
 */ 
