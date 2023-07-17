// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:get/get.dart';
import 'package:medsur_app/modules/DashBoard/repo/dashboard_repo.dart';
import 'package:medsur_app/modules/teleconsultation/repo/teleconsultation_repo.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class TeleconsultationController extends GetxController {
  final TeleconsultationRepo teleconsultationRepo;
  TeleconsultationController({required this.teleconsultationRepo});
  
  // @override
  // void onInit() {
  //   super.onInit();
  //   initAgora();
  // }

  // generateToken(
  //     String appId, String appCertificate, String channelName, int uid) {
  //   int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  //   int expirationTimeInSeconds = 3600; // valid for one hour

  //   Map<String, dynamic> json = {
  //     'appID': appId,
  //     'iat': timestamp,
  //     'exp': timestamp + expirationTimeInSeconds,
  //     'uid': uid,
  //     'channelName': channelName
  //   };

  //   List<int> encodedData = utf8.encode(jsonEncode(json));
  //   List<int> encodedAppCertificate = base64.decode(appCertificate);
  //   List<int> signature =
  //       Hmac(sha256, encodedAppCertificate).convert(encodedData).bytes;
  //   List<int> signedToken = List.from(encodedData)..addAll(signature);

  //   return base64.encode(signedToken);
  // }

  // static const _token =
  //     "007eJxTYJhe8GyFlul1vUbj3eZfjBin73ocX6fy+njqnB9hVc+vMiYqMJgZpRkbGKVapFmkJpokmVsmGZlaGJqmWVokpyUbGCclNzBYpDQEMjJorPNkZWSAQBBfgCEtp7SkJLWoJLW4JDE9vyiRgQEAIIkkmQ==";
  // static const _appId = '62f302e8f8ea4b79b25815f98cfc03bc';
  // static const _appCertificate = '3b2c43b8e5824a69b3bf6bc9ce7685f3';
  // // You can use a token for added security
  // static const _channelName = 'fluttertestagora';

  // var _users = <int>[];
  // var _rtcEngine = null;

  // int? _remoteUid;

  // get remoteUid => _remoteUid;

  // bool _localUserJoined = false;

  // get localUserJoined => _localUserJoined;

  // late final RtcEngineEx _engine;

  // RtcEngineEx get engine => _engine;

  // Future<void> initAgora() async {
  //   // retrieve permissions
  //   await [Permission.microphone, Permission.camera].request();

  //   //create the engine
  //   _engine = createAgoraRtcEngineEx();
  //   await _engine.initialize(const RtcEngineContext(
  //     appId: _appId,
  //     channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
  //   ));

  //   _engine.registerEventHandler(
  //     RtcEngineEventHandler(
  //       onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
  //         //print(
  //             // "______________________________________________local user ${connection.localUid} joined");

  //         _localUserJoined = true;
  //         update();
  //       },
  //       onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
  //         //print(
  //             // "______________________________________________remote user $remoteUid joined");

  //         _remoteUid = remoteUid;
  //         update();
  //       },
  //       onUserOffline: (RtcConnection connection, int remoteUid,
  //           UserOfflineReasonType reason) {
  //         //print(
  //             // "______________________________________________remote user $remoteUid left channel");

  //         _remoteUid = null;
  //         update();
  //       },
  //       onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
  //         //print(
  //             // '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
  //       },
  //     ),
  //   );

  //   await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
  //   await _engine.enableVideo();
  //   await _engine.startPreview();
  // }

  // Future<void> joinedCall(id) async {
  //   // var _token = generateToken(_appId, _appCertificate, _channelName, id);
  //   //print('token********${id}*******************${_token}');
  //   await _engine.joinChannel(
  //     token: _token,
  //     channelId: _channelName,
  //     uid: id,
  //     options: const ChannelMediaOptions(),
  //   );
  // }

  // Future<void> leaveCall() async {
  //   await _rtcEngine?.leaveChannel();
  //   _users.clear();
  //   _rtcEngine?.destroy();
  //   _rtcEngine = null;
  // }

  // RtcV1() {
  //   return remoteUid != null
  //       ? AgoraVideoView(
  //           controller: VideoViewController(
  //             rtcEngine: _engine,
  //             canvas: const VideoCanvas(uid: 1),
  //           ),
  //         )
  //       : const CircularProgressIndicator();
  // }

  // RtcV2() {
  //   return localUserJoined
  //       ? Align(
  //           alignment: Alignment.center,
  //           child: SizedBox(
  //               width: 100,
  //               height: 150,
  //               child: Center(
  //                   child: AgoraVideoView(
  //                 controller: VideoViewController.remote(
  //                   rtcEngine: _engine,
  //                   canvas: VideoCanvas(uid: 2),
  //                   connection: const RtcConnection(channelId: _channelName),
  //                 ),
  //               ))))
  //       : const CircularProgressIndicator();
  // }

  // bool _loadingContact = true;
  // bool get loadingContact => _loadingContact;
  // List _listContact = [];
  // List get listContact => _listContact;
  // getListContact() async {
  //   var data = [];
  //   try {
  //     Response response = await teleconsultationRepo.listContact(data);

  //     if (response.statusCode == 200) {
  //       _listContact = response.body;
  //       _loadingContact = false;
  //       update();
  //     } else {
  //       //print('erroorrr');
  //     }
  //   } catch (e) {}
  // }
}
