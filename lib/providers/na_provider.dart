import 'package:note_add/providers/provider_list.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class NaProvider {
  // This is called at the root of app
  static List<SingleChildWidget> multi() {
    return [
      ListenableProvider<NavigationPath>(create: (_) => NavigationPath()),
      ChangeNotifierProvider(create: (_) => AuthenticationData()),
    ];
  }
}
