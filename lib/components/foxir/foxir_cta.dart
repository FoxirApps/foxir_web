import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// Closing call-to-action band with accent emphasis.
class FoxirCta extends StatelessComponent {
  const FoxirCta({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cta', [
      div(classes: 'container cta-inner', [
        h2([.text('Share your vision.')]),
        p([
          .text('Book a complimentary consultation today, and together we\u2019ll start '
              'building your digital success.'),
        ]),
        a(classes: 'cta-button', href: foxirContactUrl, target: .blank, [.text('Book a call')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir .cta', [
      css('&').styles(
        padding: .symmetric(vertical: 80.px),
        color: foxirInk,
      ),
      css('.cta-inner').styles(
        display: .flex,
        maxWidth: 720.px,
        margin: .symmetric(horizontal: Unit.auto),
        padding: .all(40.px),
        border: const Border.all(style: .solid, color: foxirHairline, width: Unit.pixels(1)),
        radius: .circular(28.px),
        flexDirection: .column,
        alignItems: .center,
        gap: .all(20.px),
        textAlign: .center,
        backgroundColor: foxirSurface,
        raw: {
          'background-image':
              'radial-gradient(ellipse 80% 70% at 50% 0%, rgba(255, 82, 14, 0.22), transparent 65%)',
        },
      ),
      css('h2').styles(
        fontSize: 2.25.rem,
        fontWeight: .w700,
        lineHeight: 1.15.em,
        letterSpacing: (-0.02).em,
      ),
      css('p').styles(
        maxWidth: 32.em,
        color: foxirMuted,
        fontSize: 1.125.rem,
        fontWeight: .w500,
      ),
      css('.cta-button', [
        css('&').styles(
          padding: .symmetric(horizontal: 28.px, vertical: 12.px),
          radius: .circular(999.px),
          color: Colors.white,
          fontWeight: .w700,
          backgroundColor: foxirAccent,
          transition: const Transition('transform', duration: Duration(milliseconds: 150)),
        ),
        css('&:hover').styles(
          backgroundColor: const Color('#ff6a2e'),
          transform: .translate(y: (-2).px),
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.foxir .cta', [
        css('&').styles(padding: .symmetric(vertical: 112.px)),
        css('h2').styles(fontSize: 3.rem),
        css('.cta-inner').styles(padding: .all(56.px)),
      ]),
    ]),
  ];
}
