import 'package:auto_route/auto_route.dart';
import 'package:voip_calling/app/call/call_view.dart';
import 'package:voip_calling/app/home/home_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: CallRoute.page),
      ];
}
