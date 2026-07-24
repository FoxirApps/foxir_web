import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'store_buttons.dart';
import 'testimonials.dart' show vouxeReviews;

/// Two-column hero: copy + mini reviews + downloads | phone mockups.
class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'top', classes: 'hero', [
      div(classes: 'container hero-grid', [
        div(classes: 'hero-copy', [
          h1([.text('Build discipline you can see')]),
          p(classes: 'hero-subtitle', [
            .text('Turn daily effort into visible progress, powerful streaks, and proof worth sharing.'),
          ]),
          const StoreButtons(alignStart: true),
          div(classes: 'hero-proof', [
            for (final review in vouxeReviews.take(2))
              div(classes: 'proof-card', [
                p([.text('\u201C${review.quote}\u201D')]),
                span([.text('${review.name} · ${review.role}')]),
              ]),
          ]),
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
      css('.hero-proof').styles(
        display: .flex,
        width: 100.percent,
        margin: .only(top: 8.px),
        flexDirection: .column,
        gap: .all(10.px),
      ),
      css('.proof-card', [
        css('&').styles(
          padding: .all(14.px),
          border: const Border.all(style: .solid, color: vouxeHairline, width: Unit.pixels(1)),
          radius: .circular(16.px),
          backgroundColor: vouxeSurface,
        ),
        css('p').styles(
          color: vouxeInk,
          fontSize: 0.875.rem,
          fontWeight: .w500,
          lineHeight: 1.4.em,
        ),
        css('span').styles(
          display: .block,
          margin: .only(top: 6.px),
          color: vouxeAccent,
          fontSize: 0.75.rem,
          fontWeight: .w700,
        ),
      ]),
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
        css('.hero-proof').styles(flexDirection: .row),
        css('.hero-phones').styles(maxWidth: 560.px),
      ]),
    ]),
  ];
}
