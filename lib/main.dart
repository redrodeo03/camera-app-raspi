import 'dart:convert';
import 'dart:io';
import 'package:E3InspectionsMultiTenant/src/bloc/settings_bloc.dart';
import 'package:E3InspectionsMultiTenant/src/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:provider/provider.dart';
import 'src/app.dart';
import 'src/bloc/notificationcontroller.dart';
import 'src/resources/realm/app_services.dart';
import 'src/resources/realm/realm_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final realmConfig = json
      .decode(await rootBundle.loadString('assets/config/atlasConfig.json'));
  String appId = realmConfig['appId'];
  Uri baseUrl = Uri.parse(realmConfig['baseUrl']);
  // Always initialize Awesome Notifications
  await NotificationController.initializeLocalNotifications();
  await NotificationController.initializeIsolateReceivePort();
  if (Platform.isAndroid) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppServices>(
        create: (_) => AppServices(appId, baseUrl)),
    ChangeNotifierProxyProvider<AppSettings, RealmProjectServices?>(
        create: (context) => null,
        update: (BuildContext context, AppSettings appSettings,
            RealmProjectServices? realmServices) {
          realmServices?.uploadLocalImages();
          return realmServices;
        }),
    ChangeNotifierProxyProvider<AppServices, RealmProjectServices?>(
        // RealmServices can only be initialized only if the user is logged in.
        create: (context) => null,
        update: (BuildContext context, AppServices appServices,
            RealmProjectServices? realmServices) {
          return (appServices.app.currentUser != null &&
                  usersBloc.userDetails.username != null)
              ? RealmProjectServices(
                  appServices.app,
                  usersBloc.userDetails.username as String,
                  usersBloc.userDetails.companyidentifer as String)
              : null;
        }),
  ], child: const App()));
}
