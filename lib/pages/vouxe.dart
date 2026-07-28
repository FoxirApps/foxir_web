import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/app_favicon.dart';
import '../components/vouxe/cta.dart';
import '../components/vouxe/features.dart';
import '../components/vouxe/footer.dart';
import '../components/vouxe/header.dart';
import '../components/vouxe/hero.dart';
import '../constants/theme.dart';

/// The Vouxe app landing page, served at `/vouxe`.
///
/// Styles are scoped under `.vouxe` with a dark, premium lime atmosphere.
class VouxePage extends StatelessComponent {
  const VouxePage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'vouxe', const [
      AppFavicon(href: vouxeIconSrc),
      Header(),
      Hero(),
      Features(),
      Cta(),
      Footer(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.vouxe').styles(
      minHeight: 100.vh,
      color: vouxeInk,
      fontFamily: const .list([FontFamily('Space Grotesk'), FontFamilies.sansSerif]),
      backgroundColor: vouxeBg,
      raw: {
        'background-image':
            'url("data:image/svg+xml,%3Csvg viewBox=%270 0 180 180%27 xmlns=%27http://www.w3.org/2000/svg%27%3E%3Cfilter id=%27noise%27%3E%3CfeTurbulence type=%27fractalNoise%27 baseFrequency=%27.86%27 numOctaves=%273%27 stitchTiles=%27stitch%27/%3E%3C/filter%3E%3Crect width=%27100%25%27 height=%27100%25%27 filter=%27url(%23noise)%27 opacity=%27.24%27/%3E%3C/svg%3E"), '
            'radial-gradient(ellipse 78% 46% at 6% -8%, rgba(200, 240, 0, 0.14) 0%, rgba(200, 240, 0, 0.035) 42%, transparent 72%), '
            'radial-gradient(ellipse 52% 38% at 96% 32%, rgba(123, 145, 255, 0.055) 0%, transparent 70%), '
            'radial-gradient(ellipse 68% 42% at 52% 108%, rgba(200, 240, 0, 0.05) 0%, transparent 72%), '
            'linear-gradient(155deg, #0d0f0c 0%, #090b09 34%, #070807 68%, #0b0c0a 100%)',
        'background-size': '180px 180px, auto, auto, auto, auto',
        'background-blend-mode': 'soft-light, screen, screen, screen, normal',
        'background-attachment': 'fixed',
      },
    ),
  ];
}
