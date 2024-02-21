import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helathcareapp/presentation/cubit/provider_location_cubit.dart';
import 'package:helathcareapp/presentation/pages/gatepass/sign_in.dart';
import 'package:helathcareapp/presentation/pages/onboarding/appwrapper.dart';
import 'package:helathcareapp/presentation/pages/user/peserta/home/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:helathcareapp/injection.dart' as di;
import 'package:google_fonts/google_fonts.dart';
import 'package:helathcareapp/common/constant.dart';

import 'common/utils.dart';
// import 'package:helathcareapp/presentation/pages/gatepass/sign_in.dart';
// import 'package:helathcareapp/presentation/pages/onboarding/appwrapper.dart';
//
// import 'common/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(

        // NavigationBar
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: kLightBlue,
        systemNavigationBarIconBrightness: Brightness.dark,

        // StatuBar
        systemStatusBarContrastEnforced: true,
        statusBarColor: kLightBlue,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [
        BlocProvider<ProviderLocationCubit>(
          create: (context) => di.locator<ProviderLocationCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kPureWhite,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
          ),
        ),
        title: 'Smilynks',
        home: const AppWrapper(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (_) => const AppWrapper()
              );
            case SignInScreen.routeName:
              return MaterialPageRoute(
                builder: (_) => const SignInScreen(),
                settings: settings,
              );
            case MapsPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const MapsPage(),
                settings: settings,
              );


          // divider detail over widget

            // case ListdetailOffers_Page.ROUTE_NAME:
            //   final allOffers = settings.arguments as AllOffers;
            //   return MaterialPageRoute(
            //     builder: (_) => ListdetailOffers_Page(allOffers: allOffers),
            //     settings: settings,
            //   );

            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}