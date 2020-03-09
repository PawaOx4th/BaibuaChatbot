import 'package:baibuaapp/models/user.dart';
import 'package:baibuaapp/screens/Authenticate/autu.dart';
import 'package:baibuaapp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_error_page/flutter_custom_error_message.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'route_genereator.dart';
import 'screens/SplashScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  String message;
  String channelId = "1000";
  String channelName = "FLUTTER_NOTIFICATION_CHANNEL";
  String channelDescription = "FLUTTER_NOTIFICATION_CHANNEL_DETAIL";

  final TextEditingController _topicController =
      TextEditingController(text: 'topic');

  @override
  initState() {
    initFirebaseMessaging();

    message = "No message.";

    var initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) {
      print("onDidReceiveLocalNotification called.");
    });
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) {
      // when user tap on notification.
      print("onSelectNotification called.");
      setState(() {
        message = payload;
      });
    });

    super.initState();
  }

  sendNotification({String title, String body}) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails('10000',
        'FLUTTER_NOTIFICATION_CHANNEL', 'FLUTTER_NOTIFICATION_CHANNEL_DETAIL',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin
        .show(111, title, body, platformChannelSpecifics, payload: '555555');
  }

  void initFirebaseMessaging() {
    firebaseMessaging.subscribeToTopic('News');

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        Map mapNotification = message["notification"];
        Map dataNotification = message["data"];
        String title = mapNotification["title"];

        String body = dataNotification["Description"];

        sendNotification(title: title, body: body);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );

    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });

    firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print("Token : $token");
    });
  }

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder =
        ErrorMessageBuilder.build(theme: ErrorTheme.BlueScreen);
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Example Dialogflow Flutter',
              theme: new ThemeData(
                primarySwatch: Colors.blue,
                //******************************************************************//
                // Set font Default
                textTheme:
                    GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
                primaryTextTheme: GoogleFonts.robotoTextTheme(
                  Theme.of(context)
                      .primaryTextTheme, // ถ้าไม่ใส่ มันจะตั้งค่า Default ทุกอย่างตาม ThemeData.light().textTheme
                ),

                //******************************************************************//
              ),
              home: new SplashScreen(),
              // initialRoute: '/Chatroom-page',
              onGenerateRoute: RouteGenerator.generateRoute,

              //***********************************************//
              // Debug Push Notification
//      home: MainPage(),
              //***********************************************//
              localizationsDelegates: [
                // ... app-specific localization delegate[s] here
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en'), // English
                const Locale('es'), // Spanish
                const Locale('fr'), // French
                const Locale('zh'), // Chinese
                const Locale('th'), // thailand
              ],
            );
          });
        },
      ),
    );
  }
}
