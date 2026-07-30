import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/foxir/foxir_apps.dart';
import '../components/foxir/foxir_footer.dart';
import '../components/foxir/foxir_header.dart';
import '../components/foxir/foxir_hero.dart';
import '../constants/theme.dart';

/// Foxir Apps product umbrella homepage, served at `/`.
///
/// Styles are scoped under the `.foxir` wrapper class.
class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'foxir', const [
      FoxirHeader(),
      FoxirHero(),
      FoxirApps(),
      FoxirFooter(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir').styles(
      minHeight: 100.vh,
      color: foxirInk,
      backgroundColor: foxirBg,
      fontFamily: const .list([
        FontFamily('Geist'),
        FontFamilies.sansSerif,
      ]),
      raw: {
        'overflow': 'hidden',
      },
    ),
    css('.foxir .foxir-shell').styles(
      width: 100.percent,
    ),
  ];
}
