import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tab_notifier.g.dart';

@riverpod
class NavigationNoifier extends _$NavigationNoifier {
  @override
  int build() {
    return 0;
  }

  void setSelectedIndex(int index) {
    state = index;
  }
}
