import 'package:flutter_routing/router/route_utils.dart';
import 'package:flutter_routing/screens/error_screen.dart';
import 'package:flutter_routing/screens/home_screen.dart';
import 'package:flutter_routing/screens/login_screen.dart';
import 'package:flutter_routing/screens/onboarding_screen.dart';
import 'package:flutter_routing/screens/splash_screen.dart';
import 'package:flutter_routing/screens/sub_screen.dart';
import 'package:flutter_routing/services/app_service.dart';
import 'package:go_router/go_router.dart';

class AppRouter { 
  late final AppService appService;
  GoRouter get router => _goRouter;

  AppRouter(this.appService);

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: appService,
    initialLocation: AppScreen.home.toPath,
    routes: <GoRoute>[
      GoRoute( // SPLASH
        path: AppScreen.splash.toPath,
        name: AppScreen.splash.toName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute( // LOGIN
        path: AppScreen.login.toPath,
        name: AppScreen.login.toName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute( // ONBOARDING
        path: AppScreen.onboarding.toPath,
        name: AppScreen.onboarding.toName,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute( // ERROR
        path: AppScreen.error.toPath,
        name: AppScreen.error.toName,
        builder: (context, state) => ErrorScreen(error: state.extra.toString())
      ),
      GoRoute( // HOME
        path: AppScreen.home.toPath,
        name: AppScreen.home.toName,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute( // SUBSCREEN
        path: '${AppScreen.subscreen.toPath}/:id',
        name: AppScreen.subscreen.toName,
        builder: (context, state)  {
          print(state);
          return SubScreen(id: state.pathParameters['id']!);
        },
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),
    redirect: (context, state) {
      
      print('Redirecting to ${state.location}');

      final isLoggedIn = appService.loginState;
      final isInitialized = appService.initialized;
      final isOnboarded = appService.onboarded;

      final homeLocation = AppScreen.home.toPath;// state.namedLocation(AppScreen.home.toPath);
      final loginLocation = AppScreen.login.toPath;// state.namedLocation(AppScreen.login.toPath);
      final splashLocation = AppScreen.splash.toPath;// state.namedLocation(AppScreen.splash.toPath);
      final onboardLocation = AppScreen.onboarding.toPath;// state.namedLocation(AppScreen.onboarding.toPath);
      
      final isGoingToLogin = state.location == loginLocation;
      final isGoingToInit = state.location == splashLocation;
      final isGoingToOnboard = state.location == onboardLocation;

      // If not Initialized and not going to Initialized redirect to Splash
      if (!isInitialized && !isGoingToInit) {
        return splashLocation;
      
      // If not onboard and not going to onboard redirect to OnBoarding
      } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
        return onboardLocation;

      // If not logedin and not going to login redirect to Login
      } else if (isInitialized && isOnboarded && !isLoggedIn && !isGoingToLogin) {
        return loginLocation;

      // If all the scenarios are cleared but still going to any of that screen redirect to Home
      } else if ((isLoggedIn && isGoingToLogin) || (isInitialized && isGoingToInit) || (isOnboarded && isGoingToOnboard)) {
        return homeLocation;
      
      // Else Don't do anything
      } else {
        return null;
      }
    },
  );
}