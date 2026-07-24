import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../store_buttons.dart' as shared;

/// App Store / Google Play badges for Better Today.
class StoreButtons extends StatelessComponent {
  const StoreButtons({this.alignStart = false, this.compact = false, super.key});

  final bool alignStart;
  final bool compact;

  @override
  Component build(BuildContext context) {
    return shared.StoreButtons(
      appStoreUrl: betterAppStoreUrl,
      playStoreUrl: betterPlayStoreUrl,
      alignStart: alignStart,
      compact: compact,
    );
  }
}
