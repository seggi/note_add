import 'package:go_router/go_router.dart';
import 'package:note_add/controllers/manage_provider.dart';
import 'package:note_add/providers/provider_list.dart';
import 'package:note_add/screens/screens_list.dart';

final loginInfo = AuthenticationData();

class PageGenerator {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/login",
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/sign-up",
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => const NoteScreen(),
        routes: [],
        redirect: (state) {
          final loggedIn = loginInfo.loggedIn;
          final loggingIn = state.subloc == '/login';
          if (!loggedIn) return loggingIn ? null : '/login';
          if (loggingIn) return '/';

          return null;
        },
      ),
    ],
    refreshListenable: loginInfo,
  );

  // Call this method to navigate to the next screen
  static goTo(context,
      {String? name,
      String? pathName,
      Map<String, String> params = const {},
      Map<String, String> queryParams = const {},
      Object? extra,
      itemData = "notFound",
      provider = "notFound"}) {
    if (pathName != null) {
      NaManageProviders.save[provider](context, itemData: itemData);
      return GoRouter.of(context).go(pathName, extra: extra);
    } else {
      NaManageProviders.save[provider](context, itemData: itemData);
      return GoRouter.of(context).goNamed(name!,
          params: params, queryParams: queryParams, extra: extra);
    }
  }

  static directTo(context, {String? pathName, itemData, provider, token}) {
    NaManageProviders.save["login"](context, itemData: token);
    NaManageProviders.save[provider](context, itemData: itemData);
    return GoRouter.of(context).go(pathName!);
  }
}
