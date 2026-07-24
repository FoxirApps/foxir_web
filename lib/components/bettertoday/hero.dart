import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'store_buttons.dart';
import 'testimonials.dart' show betterReviews;

/// Two-column hero: copy + store CTAs + light proof | CSS phone placeholder.
class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'top', classes: 'hero', [
      div(classes: 'container hero-grid', [
        div(classes: 'hero-copy', [
          h1([.text('Take Charge of Your Daily Growth')]),
          p(classes: 'hero-subtitle', [
            .text('Effortlessly reflect each day, embrace the Mamba Mentality, '
                'and turn small steps into lifelong excellence.'),
          ]),
          const StoreButtons(alignStart: true),
          div(classes: 'hero-proof', [
            for (final review in betterReviews.take(2))
              div(classes: 'proof-card', [
                p([.text('\u201C${review.quote}\u201D')]),
                span([.text('${review.name} · ${review.role}')]),
              ]),
          ]),
        ]),
        div(classes: 'hero-visual', [
          div(classes: 'phone-glow', [
            div(classes: 'phone-frame', [
              div(classes: 'phone-screen', [
                span(classes: 'phone-mark', [.text('BT')]),
                span(classes: 'phone-label', [.text('Better Today')]),
                span(classes: 'phone-tagline', [.text('Daily growth, one reflection at a time')]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bettertoday .hero', [
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
        maxWidth: 12.em,
        color: betterInk,
        fontSize: 2.25.rem,
        fontWeight: .w700,
        lineHeight: 1.1.em,
        letterSpacing: (-0.03).em,
      ),
      css('.hero-subtitle').styles(
        maxWidth: 34.em,
        color: betterMuted,
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
          border: const Border.all(style: .solid, color: betterHairline, width: Unit.pixels(1)),
          radius: .circular(16.px),
          backgroundColor: betterSurface,
        ),
        css('p').styles(
          color: betterInk,
          fontSize: 0.875.rem,
          fontWeight: .w500,
          lineHeight: 1.4.em,
        ),
        css('span').styles(
          display: .block,
          margin: .only(top: 6.px),
          color: betterAccent,
          fontSize: 0.75.rem,
          fontWeight: .w700,
        ),
      ]),
      css('.hero-visual').styles(
        display: .flex,
        justifyContent: .center,
        width: 100.percent,
      ),
      css('.phone-glow').styles(
        padding: .all(24.px),
        radius: .circular(48.px),
        raw: {
          'background-image':
              'radial-gradient(ellipse 70% 70% at 50% 50%, rgba(255, 215, 0, 0.22), transparent 70%)',
        },
      ),
      css('.phone-frame').styles(
        padding: .all(12.px),
        border: const Border.all(style: .solid, color: betterHairline, width: Unit.pixels(1)),
        radius: .circular(40.px),
        backgroundColor: const Color('#111113'),
        shadow: const BoxShadow(
          offsetX: Unit.zero,
          offsetY: Unit.pixels(24),
          blur: Unit.pixels(48),
          color: Color('#00000066'),
        ),
      ),
      css('.phone-screen').styles(
        display: .flex,
        width: 240.px,
        height: 480.px,
        padding: .all(28.px),
        radius: .circular(30.px),
        flexDirection: .column,
        justifyContent: .center,
        alignItems: .center,
        gap: .all(14.px),
        textAlign: .center,
        backgroundColor: betterSurface,
        raw: {
          'background-image':
              'radial-gradient(ellipse 80% 50% at 50% 20%, rgba(255, 215, 0, 0.18), transparent 70%)',
        },
      ),
      css('.phone-mark').styles(
        display: .flex,
        width: 72.px,
        height: 72.px,
        radius: .circular(20.px),
        justifyContent: .center,
        alignItems: .center,
        color: betterBg,
        fontSize: 1.25.rem,
        fontWeight: .w700,
        letterSpacing: 0.04.em,
        backgroundColor: betterAccent,
      ),
      css('.phone-label').styles(
        color: betterInk,
        fontSize: 1.25.rem,
        fontWeight: .w700,
      ),
      css('.phone-tagline').styles(
        maxWidth: 14.em,
        color: betterMuted,
        fontSize: 0.875.rem,
        fontWeight: .w500,
      ),
    ]),
    css.media(desktop, [
      css('.bettertoday .hero', [
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
        css('.phone-screen').styles(width: 260.px, height: 520.px),
      ]),
    ]),
  ];
}
