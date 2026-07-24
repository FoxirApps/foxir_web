import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/app_favicon.dart';
import '../components/paximus/cta.dart';
import '../components/paximus/features.dart';
import '../components/paximus/footer.dart';
import '../components/paximus/header.dart';
import '../components/paximus/hero.dart';
import '../components/paximus/reviews.dart';
import '../constants/theme.dart';

/// The Paximus app landing page, served at `/paximus`.
class PaximusPage extends StatelessComponent {
  const PaximusPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'paximus', const [
      AppFavicon(href: paximusIconSrc),
      Header(),
      Hero(),
      Features(),
      Reviews(),
      Cta(),
      Footer(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.paximus').styles(
      minHeight: 100.vh,
      color: ink,
      backgroundColor: const Color('#f7f9fc'),
      raw: {
        'background-image':
            'radial-gradient(ellipse 90% 55% at 10% -10%, rgba(140, 180, 210, 0.35), transparent 55%), '
            'radial-gradient(ellipse 70% 45% at 95% 15%, rgba(160, 190, 170, 0.28), transparent 50%), '
            'radial-gradient(ellipse 60% 40% at 50% 100%, rgba(180, 200, 220, 0.22), transparent 55%), '
            'linear-gradient(rgba(255,255,255,0.45) 1px, transparent 1px), '
            'linear-gradient(90deg, rgba(255,255,255,0.45) 1px, transparent 1px), '
            'linear-gradient(180deg, #f7f9fc 0%, #eef3f8 50%, #f5f8fb 100%)',
        'background-size': 'auto, auto, auto, 28px 28px, 28px 28px, auto',
        'background-attachment': 'fixed',
      },
    ),
  ];
}
