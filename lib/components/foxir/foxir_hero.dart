import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// Hero section for the Foxir Apps umbrella site.
class FoxirHero extends StatelessComponent {
  const FoxirHero({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'hero', [
      div(classes: 'container hero-inner', [
        span(classes: 'hero-eyebrow', [.text('Mobile app studio')]),
        h1([.text('Innovative mobile experiences, refined to inspire results.')]),
        p(classes: 'hero-subtitle', [
          .text('Your vision, our code — turning ideas into mobile solutions.'),
        ]),
        div(classes: 'hero-actions', [
          a(classes: 'btn-primary', href: '#apps', [.text('Explore our apps')]),
          a(classes: 'btn-secondary', href: foxirContactUrl, target: .blank, [.text('Build your idea')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir .hero', [
      css('&').styles(padding: .symmetric(vertical: 80.px)),
      css('.hero-inner').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        gap: .all(24.px),
        textAlign: .center,
      ),
      css('.hero-eyebrow').styles(
        padding: .symmetric(horizontal: 14.px, vertical: 6.px),
        border: const Border.all(style: .solid, color: foxirHairline, width: Unit.pixels(1)),
        radius: .circular(999.px),
        color: foxirMuted,
        fontSize: 0.875.rem,
        fontWeight: .w600,
        backgroundColor: const Color('#ffffff0a'),
      ),
      css('h1').styles(
        maxWidth: 15.em,
        color: foxirInk,
        fontSize: 2.5.rem,
        fontWeight: .w700,
        lineHeight: 1.15.em,
        letterSpacing: (-0.02).em,
      ),
      css('.hero-subtitle').styles(
        maxWidth: 30.em,
        color: foxirMuted,
        fontSize: 1.25.rem,
        fontWeight: .w500,
      ),
      css('.hero-actions').styles(
        display: .flex,
        justifyContent: .center,
        flexWrap: .wrap,
        gap: .all(12.px),
      ),
      css('.btn-primary', [
        css('&').styles(
          padding: .symmetric(horizontal: 24.px, vertical: 12.px),
          radius: .circular(999.px),
          color: Colors.white,
          fontWeight: .w600,
          backgroundColor: foxirAccent,
        ),
        css('&:hover').styles(backgroundColor: const Color('#ff6a2e')),
      ]),
      css('.btn-secondary', [
        css('&').styles(
          padding: .symmetric(horizontal: 24.px, vertical: 12.px),
          border: const Border.all(style: .solid, color: foxirHairline, width: Unit.pixels(1)),
          radius: .circular(999.px),
          color: foxirInk,
          fontWeight: .w600,
          backgroundColor: const Color('#ffffff0a'),
        ),
        css('&:hover').styles(backgroundColor: foxirElevated),
      ]),
    ]),
    css.media(desktop, [
      css('.foxir .hero', [
        css('&').styles(padding: .symmetric(vertical: 120.px)),
        css('h1').styles(fontSize: 3.5.rem),
      ]),
    ]),
  ];
}
