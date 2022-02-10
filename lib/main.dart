
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxi_app_flutter/providers/app_provider.dart';
import 'package:taxi_app_flutter/providers/user.dart';
import 'package:taxi_app_flutter/screens/login.dart';
import 'package:taxi_app_flutter/screens/splash.dart';
import 'helpers/constants.dart';
import 'locators/service_locator.dart';
import 'screens/home.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();

  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppStateProvider>.value(
        value: AppStateProvider(),
      ),
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.deepOrange),
        title: "Flutter Taxi",
        home: MyApp()),
  ));
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();


}
class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    _checkPermissionLocation();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider auth = Provider.of<UserProvider>(context);

    return FutureBuilder(
      // Initialize FlutterFire:
      future: initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Something went wrong")],
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          switch (auth.status) {
            case Status.Uninitialized:

              return Splash();
            case Status.Unauthenticated:
            case Status.Authenticating:
            return LoginScreen();
            case Status.Authenticated:
              return MyHomePage(title: 'home',);
            default:
              return LoginScreen();
          }
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        );
      },
    );
  }

  _checkPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('loii_: Location services are disabled.');
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission=await Geolocator.requestPermission();
      if(locationPermission==LocationPermission.denied)
        print('loii_: Location services are disabled.');
    }

    if(locationPermission==LocationPermission.deniedForever){
      print('loii_: Location permissions are permanently denied, we cannot request permissions.');
    }

  }

}





