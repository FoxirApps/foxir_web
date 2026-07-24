import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/app_favicon.dart';
import '../components/bettertoday/cta.dart';
import '../components/bettertoday/features.dart';
import '../components/bettertoday/footer.dart';
import '../components/bettertoday/header.dart';
import '../components/bettertoday/hero.dart';
import '../components/bettertoday/testimonials.dart';
import '../constants/theme.dart';

/// The Better Today app landing page, served at `/bettertoday`.
///
/// Styles are scoped under `.bettertoday` with a dark + gold grid atmosphere.
class BetterTodayPage extends StatelessComponent {
  const BetterTodayPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'bettertoday', const [
      AppFavicon(href: betterTodayIconSrc),
      Header(),
      Hero(),
      Features(),
      Testimonials(),
      Cta(),
      Footer(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bettertoday').styles(
      minHeight: 100.vh,
      color: betterInk,
      backgroundColor: betterBg,
      raw: {
        'background-image':
            'radial-gradient(ellipse 80% 50% at 10% -5%, rgba(255, 215, 0, 0.16), transparent 55%), '
            'radial-gradient(ellipse 60% 40% at 90% 100%, rgba(255, 215, 0, 0.08), transparent 50%), '
            'linear-gradient(rgba(255,255,255,0.035) 1px, transparent 1px), '
            'linear-gradient(90deg, rgba(255,255,255,0.035) 1px, transparent 1px), '
            'linear-gradient(180deg, #0f0f0f 0%, #0a0a0a 50%, #080808 100%)',
        'background-size': 'auto, auto, 24px 24px, 24px 24px, auto',
        'background-attachment': 'fixed',
      },
    ),
  ];
}
