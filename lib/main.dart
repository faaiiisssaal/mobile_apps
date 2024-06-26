import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcareapp/presentation/cubit/claim_info_cubit.dart';
import 'package:healthcareapp/presentation/cubit/claim_list_cubit.dart';
import 'package:healthcareapp/presentation/cubit/policy_check_cubit.dart';
import 'package:healthcareapp/presentation/cubit/policy_num_cubit.dart';
import 'package:healthcareapp/presentation/cubit/provider_area_cubit.dart';
import 'package:healthcareapp/presentation/pages/user/peserta/home/benefits.dart';
import 'package:healthcareapp/presentation/pages/user/peserta/home/provider_search.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:healthcareapp/injection.dart' as di;
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcareapp/common/constant.dart';

import 'package:healthcareapp/presentation/cubit/user_benefit_cubit.dart';
import 'package:healthcareapp/presentation/cubit/user_family_cubit.dart';
import 'package:healthcareapp/presentation/cubit/login_user_cubit.dart';
import 'package:healthcareapp/presentation/cubit/provider_location_cubit.dart';
import 'package:healthcareapp/presentation/pages/gatepass/sign_in.dart';
import 'package:healthcareapp/presentation/pages/onboarding/appwrapper.dart';
import 'package:healthcareapp/presentation/pages/user/peserta/home/provider.dart';

import 'common/utils.dart';

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
    final isDarkMode = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // NavigationBar
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: isDarkMode ? kPureWhite : kBlack,
        systemNavigationBarIconBrightness: isDarkMode ? Brightness.dark : Brightness.light,

        // StatuBar
        systemStatusBarContrastEnforced: true,
        statusBarColor: isDarkMode ? kPureWhite : kBlack,
        statusBarIconBrightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProviderAreaCubit>(
          create: (context) => di.locator<ProviderAreaCubit>(),
        ),
        BlocProvider<ProviderLocationCubit>(
          create: (context) => di.locator<ProviderLocationCubit>(),
        ),
        BlocProvider<LoginUserCubit>(
          create: (context) => di.locator<LoginUserCubit>(),
        ),
        BlocProvider<FamilyUserCubit>(
          create: (context) => di.locator<FamilyUserCubit>(),
        ),
        BlocProvider<BenefitUserCubit>(
          create: (context) => di.locator<BenefitUserCubit>(),
        ),
        BlocProvider<ClaimListUserCubit>(
          create: (context) => di.locator<ClaimListUserCubit>(),
        ),
        BlocProvider<ClaimInfoUserCubit>(
          create: (context) => di.locator<ClaimInfoUserCubit>(),
        ),
        BlocProvider<PolicyCubit>(
          create: (context) => di.locator<PolicyCubit>(),
        ),
        BlocProvider<PolicyCheckCubit>(
          create: (context) => di.locator<PolicyCheckCubit>(),
        ),
      ],
      child: MaterialApp(
        // builder: (context, child) {
        //   return MediaQuery(
        //     data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
        //     child: child!,
        //   );
        // },
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
          scaffoldBackgroundColor: kPureWhite,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme.apply(
              bodyColor: kBlack, // Set text color to black
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
          ),
        ),
        // darkTheme: ThemeData(
        //   scaffoldBackgroundColor: kBlack,
        //   textTheme: GoogleFonts.latoTextTheme(
        //     Theme.of(context).textTheme.apply(
        //           bodyColor: kPureWhite, // Set text color to white
        //         ),
        //   ),
        //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //     type: BottomNavigationBarType.fixed,
        //   ),
        // ),
        title: 'Smilynks',
        home: const AppWrapper(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => const AppWrapper());
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
            case BenefitPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const BenefitPage(),
                settings: settings,
              );

            case ProviderSearch.routeName:
              return MaterialPageRoute(
                builder: (_) => const ProviderSearch(),
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
