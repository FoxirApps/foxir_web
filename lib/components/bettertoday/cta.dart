import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'store_buttons.dart';

/// Closing download band with store buttons.
class Cta extends StatelessComponent {
  const Cta({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cta', [
      div(classes: 'container cta-inner', [
        h2([
          .text('Take Control of Your Growth Today, Download Better Today'),
        ]),
        p(classes: 'cta-subtitle', [
          .text('Reflect daily, track your progress effortlessly, and embrace the Mamba Mindset '
              'one small step at a time toward lifelong excellence.'),
        ]),
        const StoreButtons(),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bettertoday .cta', [
      css('&').styles(padding: .symmetric(vertical: 72.px)),
      css('.cta-inner').styles(
        display: .flex,
        maxWidth: 800.px,
        margin: .symmetric(horizontal: Unit.auto),
        padding: .all(40.px),
        border: const Border.all(style: .solid, color: betterHairline, width: Unit.pixels(1)),
        radius: .circular(28.px),
        flexDirection: .column,
        alignItems: .center,
        gap: .all(20.px),
        textAlign: .center,
        backgroundColor: betterSurface,
        raw: {
          'background-image':
              'radial-gradient(ellipse 80% 70% at 50% 0%, rgba(255, 215, 0, 0.16), transparent 65%)',
        },
      ),
      css('h2').styles(
        color: betterInk,
        fontSize: 1.5.rem,
        fontWeight: .w700,
        lineHeight: 1.3.em,
        letterSpacing: (-0.02).em,
      ),
      css('.cta-subtitle').styles(
        maxWidth: 36.em,
        color: betterMuted,
        fontSize: 1.rem,
        fontWeight: .w500,
      ),
    ]),
    css.media(desktop, [
      css('.bettertoday .cta', [
        css('&').styles(padding: .symmetric(vertical: 96.px)),
        css('.cta-inner').styles(padding: .all(56.px), gap: .all(28.px)),
        css('h2').styles(fontSize: 1.875.rem),
      ]),
    ]),
  ];
}
