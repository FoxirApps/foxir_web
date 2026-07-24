import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../store_buttons.dart' as shared;

/// App Store / Google Play badges for Vouxe.
class StoreButtons extends StatelessComponent {
  const StoreButtons({this.alignStart = false, this.compact = false, super.key});

  final bool alignStart;
  final bool compact;

  @override
  Component build(BuildContext context) {
    return shared.StoreButtons(
      appStoreUrl: vouxeAppStoreUrl,
      playStoreUrl: vouxePlayStoreUrl,
      alignStart: alignStart,
      compact: compact,
    );
  }
}
