import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/vouxe/cta.dart';
import '../components/vouxe/features.dart';
import '../components/vouxe/footer.dart';
import '../components/vouxe/header.dart';
import '../components/vouxe/hero.dart';
import '../components/vouxe/testimonials.dart';
import '../constants/theme.dart';

/// The Vouxe app landing page, served at `/vouxe`.
///
/// Styles are scoped under `.vouxe` with a dark + lime grid atmosphere.
class VouxePage extends StatelessComponent {
  const VouxePage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'vouxe', const [
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
    css('.vouxe').styles(
      minHeight: 100.vh,
      color: vouxeInk,
      backgroundColor: vouxeBg,
      raw: {
        'background-image':
            'radial-gradient(ellipse 80% 50% at 10% -5%, rgba(200, 240, 0, 0.18), transparent 55%), '
            'radial-gradient(ellipse 60% 40% at 90% 100%, rgba(200, 240, 0, 0.08), transparent 50%), '
            'linear-gradient(rgba(255,255,255,0.035) 1px, transparent 1px), '
            'linear-gradient(90deg, rgba(255,255,255,0.035) 1px, transparent 1px), '
            'linear-gradient(180deg, #0f0f0f 0%, #0a0a0a 50%, #080808 100%)',
        'background-size': 'auto, auto, 24px 24px, 24px 24px, auto',
        'background-attachment': 'fixed',
      },
    ),
  ];
}
