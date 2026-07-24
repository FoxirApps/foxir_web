import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/foxir/foxir_about.dart';
import '../components/foxir/foxir_apps.dart';
import '../components/foxir/foxir_cta.dart';
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
      FoxirAbout(),
      FoxirCta(),
      FoxirFooter(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Full-page charcoal base + ambient orange radial washes.
    css('.foxir').styles(
      minHeight: 100.vh,
      color: foxirInk,
      backgroundColor: foxirBg,
      raw: {
        'background-image':
            'radial-gradient(ellipse 90% 55% at 15% -5%, rgba(255, 82, 14, 0.32), transparent 55%), '
            'radial-gradient(ellipse 70% 45% at 95% 15%, rgba(255, 82, 14, 0.14), transparent 50%), '
            'radial-gradient(ellipse 60% 50% at 50% 110%, rgba(255, 82, 14, 0.10), transparent 55%), '
            'linear-gradient(180deg, #121212 0%, #0d0d0d 45%, #0a0a0a 100%)',
        'background-attachment': 'fixed',
      },
    ),
  ];
}
