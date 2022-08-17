import 'package:provider/provider.dart';
import 'package:note_add/providers/provider_list.dart';

class NaManageProviders {
  static Map save = {
    "notFound": (context, {itemData}) => [],
    "auth": (context, {itemData}) =>
        Provider.of<AuthenticationData>(context, listen: false).add(itemData),
    "login": (context, {itemData}) =>
        Provider.of<AuthenticationData>(context, listen: false).login(itemData),
  };

  static Map update(context) {
    return {};
  }

  static Map delete(context) {
    return {};
  }

  static Map get(context) {
    return {
      "auth": Provider.of<AuthenticationData>(context).getUserData,
      "get-token": Provider.of<AuthenticationData>(context).userToken,
    };
  }
}
