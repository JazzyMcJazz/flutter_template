enum AppScreen {
  splash,
  login,
  error,
  onboarding,
  home,
  subscreen,
}

extension AppScreenExtension on AppScreen {
  String get toPath {
    switch(this) {
      case AppScreen.splash:
        return '/splash';
      case AppScreen.login:
        return '/login';
      case AppScreen.error:
        return '/error';
      case AppScreen.onboarding:
        return '/start';
      case AppScreen.home:
        return '/home';
      case AppScreen.subscreen:
        return '/subscreen';
      default:
        return '/home';
    }
  }

  String get toName {
    switch (this) {
      case AppScreen.login:
        return "LOGIN";
      case AppScreen.splash:
        return "SPLASH";
      case AppScreen.error:
        return "ERROR";
      case AppScreen.onboarding:
        return "START";
      case AppScreen.home:
        return "HOME";
      case AppScreen.subscreen:
        return "SUBSCREEN";
      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case AppScreen.home:
        return "My App";
      case AppScreen.login:
        return "My App Log In";
      case AppScreen.splash:
        return "My App Splash";
      case AppScreen.error:
        return "My App Error";
      case AppScreen.onboarding:
        return "Welcome to My App";
      default:
        return "My App";
    }
  }
}