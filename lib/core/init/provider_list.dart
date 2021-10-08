import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [];
  List<SingleChildWidget> uiChangesItems = [];
}
