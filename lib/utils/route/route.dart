import 'package:get/get.dart';
import 'package:newshunt/utils/route/route_name.dart';
import 'package:newshunt/view/detail/detail_article.dart';
import 'package:newshunt/view/landing_page/landing_screen.dart';
import 'package:newshunt/view/splash/splash_screen.dart';

appRoutes() => [
      GetPage(
        name: AppRoute.splash,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: AppRoute.landing,
        page: () => LandingPage(),
      ),
      GetPage(
        name: AppRoute.detail,
        page: () => const DetailArticleScreen(),
      )
    ];
