import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/common/utils/app_routes.dart';
import 'package:shoes_store/common/utils/environment.dart';
import 'package:shoes_store/common/utils/kstrings.dart';
import 'package:shoes_store/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:shoes_store/src/home/controllers/home_notifier.dart';
import 'package:shoes_store/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:shoes_store/src/search/controllers/search_notifier.dart';
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
        ChangeNotifierProvider(create: (_) => BottomTabNotifier()),
        ChangeNotifierProvider(create: (_) => HomeNotifier()),
        ChangeNotifierProvider(create: (_) => SearchNotifier())
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
          //title
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
