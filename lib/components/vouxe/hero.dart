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
          h1(classes: 'hero-headline', [
            span(classes: 'headline-line', [.text('Commit.')]),
            span(classes: 'headline-line', [.text('Show up.')]),
            span(classes: 'headline-line headline-accent', [.text('Level up.')]),
          ]),
          p(classes: 'hero-subtitle', [
            .text(
              'Sign your challenge, check in every day, and turn consistency '
              'into streaks, XP, and wins.',
            ),
          ]),
          const StoreButtons(alignStart: true),
        ]),
        div(classes: 'hero-visual', [
          img(
            classes: 'hero-phones',
            src: '/images/vouxe-phones.png',
            alt: 'Vouxe app screens showing challenges, stats and streaks',
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.vouxe .hero', [
      css('&').styles(
        padding: .symmetric(vertical: 48.px),
        raw: {'scroll-margin-top': '64px'},
      ),
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
      css('.hero-headline').styles(
        display: .flex,
        maxWidth: 11.em,
        color: vouxeInk,
        flexDirection: .column,
        gap: .all(2.px),
        fontSize: 2.25.rem,
        fontWeight: .w700,
        lineHeight: 0.96.em,
        letterSpacing: (-0.04).em,
        textTransform: .upperCase,
      ),
      css('.headline-line').styles(
        display: .block,
        whiteSpace: .noWrap,
      ),
      css('.headline-accent').styles(
        color: vouxeAccent,
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
        css('.hero-headline').styles(fontSize: 3.25.rem),
        css('.hero-phones').styles(maxWidth: 560.px),
      ]),
    ]),
  ];
}
