import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/common/utils/app_routes.dart';
import 'package:shoes_store/common/utils/environment.dart';
import 'package:shoes_store/common/utils/kstrings.dart';
import 'package:shoes_store/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:shoes_store/src/splashscreen/views/splashscreen_page.dart';

import 'common/utils/dark_theme.dart';
import 'common/utils/light_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // load environment
  await dotenv.load(fileName: Environment.fileName);

  // load get_storage
  await GetStorage.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingNotifier()),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // get size Screen default
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      // size screen
      designSize: screenSize,
      // auto text resize
      minTextAdapt: true,
      builder: (context, child){
        return MaterialApp.router(
          // turn off banner debug
          debugShowCheckedModeBanner: false,
          title: AppText.kAppName,
          // Set default theme
          theme: lightTheme,
          // Set the dark theme for dark mode
          darkTheme: darkTheme,
          // Use system theme mode
          themeMode: ThemeMode.system,
          routerConfig: router,
        );
      },
      child: const SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("test"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Environment.apiKey,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
