import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'store_buttons.dart';

/// Two-column hero: headline + subtitle + downloads | phone mockups.
class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'top', classes: 'hero', [
      div(classes: 'container hero-grid', [
        div(classes: 'hero-copy', [
          h1([.text('Build discipline you can see')]),
          p(classes: 'hero-subtitle', [
            .text('Vouxe is the challenge tracker that turns daily check-ins into '
                'visible streaks, clear stats, and milestones worth sharing.'),
          ]),
          const StoreButtons(alignStart: true),
        ]),
        div(classes: 'hero-visual', [
          img(
            classes: 'hero-phones',
            src: 'images/vouxe-phones.png',
            alt: 'Vouxe app screens showing challenges, stats and streaks',
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.vouxe .hero', [
      css('&').styles(padding: .symmetric(vertical: 48.px)),
      css('.hero-grid').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        gap: .all(36.px),
      ),
      css('.hero-copy').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
        gap: .all(20.px),
        textAlign: .start,
      ),
      css('h1').styles(
        maxWidth: 11.em,
        color: vouxeInk,
        fontSize: 2.25.rem,
        fontWeight: .w700,
        lineHeight: 1.1.em,
        letterSpacing: (-0.03).em,
      ),
      css('.hero-subtitle').styles(
        maxWidth: 34.em,
        color: vouxeMuted,
        fontSize: 1.0625.rem,
        fontWeight: .w500,
      ),
      css('.hero-visual').styles(
        display: .flex,
        justifyContent: .center,
        width: 100.percent,
      ),
      css('.hero-phones').styles(
        width: 100.percent,
        maxWidth: 520.px,
      ),
    ]),
    css.media(desktop, [
      css('.vouxe .hero', [
        css('&').styles(padding: .symmetric(vertical: 64.px)),
        css('.hero-grid').styles(
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .center,
          gap: .all(40.px),
        ),
        css('.hero-copy').styles(flex: const Flex.grow(1)),
        css('.hero-visual').styles(flex: const Flex.grow(1)),
        css('h1').styles(fontSize: 3.25.rem),
        css('.hero-phones').styles(maxWidth: 560.px),
      ]),
    ]),
  ];
}
