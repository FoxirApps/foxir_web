import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/app_favicon.dart';
import '../components/bettertoday/cta.dart';
import '../components/bettertoday/features.dart';
import '../components/bettertoday/footer.dart';
import '../components/bettertoday/header.dart';
import '../components/bettertoday/hero.dart';
import '../components/bettertoday/metadata.dart';
import '../constants/theme.dart';

/// The Better Today app landing page, served at `/bettertoday`.
///
/// Styles are scoped under `.bettertoday` with a premium digital atmosphere.
class BetterTodayPage extends StatelessComponent {
  const BetterTodayPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'bettertoday', const [
      BetterTodayMetadata(),
      AppFavicon(href: betterTodayIconSrc),
      Header(),
      Hero(),
      Features(),
      Cta(),
      Footer(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bettertoday').styles(
      position: const Position.relative(),
      minHeight: 100.vh,
      color: betterInk,
      backgroundColor: const Color('#05070c'),
      fontFamily: const .list([FontFamily('Space Grotesk'), FontFamilies.sansSerif]),
      raw: {
        'isolation': 'isolate',
        'overflow': 'clip',
      },
    ),
    css('.bettertoday::before').styles(
      position: const Position.fixed(),
      zIndex: const ZIndex(0),
      raw: {
        'content': '""',
        'top': '20%',
        'left': '50%',
        'width': '1px',
        'height': '1px',
        'pointer-events': 'none',
        'box-shadow':
            '-620px -280px 260px 190px rgba(24, 54, 135, 0.16), '
            '580px -20px 250px 170px rgba(255, 215, 0, 0.055), '
            '-260px 720px 300px 200px rgba(70, 38, 116, 0.12), '
            '520px 1180px 320px 220px rgba(18, 48, 100, 0.12)',
      },
    ),
    css('.bettertoday::after').styles(
      position: const Position.fixed(),
      zIndex: const ZIndex(0),
      backgroundColor: const Color('#02040a14'),
      raw: {
        'content': '""',
        'inset': '0',
        'pointer-events': 'none',
        'box-shadow':
            'inset 0 0 220px rgba(0, 0, 0, 0.46), '
            'inset 0 -160px 220px rgba(0, 0, 0, 0.3), '
            'inset 0 1px 0 rgba(255, 255, 255, 0.015)',
      },
    ),
    css('.bettertoday > section, .bettertoday > footer').styles(
      position: const Position.relative(),
      zIndex: const ZIndex(1),
    ),
    css('.bettertoday h1, .bettertoday h2, .bettertoday h3').styles(
      fontWeight: .w700,
      letterSpacing: (-0.035).em,
    ),
  ];
}
