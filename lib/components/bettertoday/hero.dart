import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'store_buttons.dart';

/// Two-column hero: daily reflection message | product screens.
class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'top', classes: 'hero', [
      div(classes: 'container hero-grid', [
        div(classes: 'hero-copy', [
          span(classes: 'hero-eyebrow', [.text('One question. Every day.')]),
          h1([
            .text('Better starts with '),
            span([.text('one honest answer.')]),
          ]),
          p(classes: 'hero-subtitle', [
            .text(
              'Better Today? is the daily self-reflection app that turns a few '
              'honest seconds into progress you can see—and sustain for years.',
            ),
          ]),
          p(classes: 'hero-principle', [
            .text('No task lists. No pressure. Just show up.'),
          ]),
          const StoreButtons(alignStart: true),
        ]),
        div(classes: 'hero-visual', [
          img(
            classes: 'hero-product-image',
            src: betterTodayHeroSrc,
            alt: 'Better Today? app showing the daily reflection, consistency streak, and long-term progress',
            attributes: {'decoding': 'async', 'fetchpriority': 'high'},
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bettertoday .hero', [
      css('&').styles(
        position: const Position.relative(),
        padding: .symmetric(vertical: 56.px),
        overflow: Overflow.hidden,
      ),
      css('.hero-grid').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        gap: .all(44.px),
      ),
      css('.hero-copy').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
        gap: .all(18.px),
        textAlign: .start,
      ),
      css('.hero-eyebrow').styles(
        color: betterAccent,
        fontSize: 0.75.rem,
        fontWeight: .w700,
        letterSpacing: 0.16.em,
        textTransform: .upperCase,
      ),
      css('h1').styles(
        maxWidth: 10.em,
        color: betterInk,
        fontSize: 2.75.rem,
        fontWeight: .w700,
        lineHeight: 1.02.em,
        letterSpacing: (-0.055).em,
      ),
      css('h1 span').styles(color: betterAccent),
      css('.hero-subtitle').styles(
        maxWidth: 31.em,
        color: betterMuted,
        fontSize: 1.0625.rem,
        fontWeight: .w500,
        lineHeight: 1.65.em,
      ),
      css('.hero-principle').styles(
        padding: .only(left: 14.px),
        border: const Border.only(
          left: BorderSide(style: .solid, color: betterAccent, width: Unit.pixels(2)),
        ),
        color: betterInk,
        fontSize: 0.875.rem,
        fontWeight: .w600,
      ),
      css('.hero-visual').styles(
        display: .flex,
        position: const Position.relative(),
        justifyContent: .center,
        width: 100.percent,
      ),
      css('.hero-visual::before').styles(
        raw: {
          'content': '""',
          'position': 'absolute',
          'inset': '8% 4%',
          'border-radius': '50%',
          'background': 'rgba(255, 215, 0, 0.16)',
          'filter': 'blur(70px)',
          'pointer-events': 'none',
        },
      ),
      css('.hero-product-image').styles(
        position: const Position.relative(),
        zIndex: const ZIndex(1),
        width: 640.px,
        maxWidth: 112.percent,
        raw: {
          'height': 'auto',
          'filter': 'drop-shadow(0 32px 52px rgba(0, 0, 0, 0.52))',
        },
      ),
    ]),
    css.media(desktop, [
      css('.bettertoday .hero', [
        css('&').styles(
          minHeight: 760.px,
          padding: .symmetric(vertical: 72.px),
        ),
        css('.hero-grid').styles(
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .center,
          gap: .all(24.px),
        ),
        css('.hero-copy').styles(
          width: 46.percent,
          flex: const Flex(grow: 0, shrink: 0),
        ),
        css('.hero-visual').styles(
          width: 56.percent,
          flex: const Flex(grow: 0, shrink: 0),
        ),
        css('h1').styles(fontSize: 4.5.rem),
        css('.hero-subtitle').styles(fontSize: 1.125.rem),
        css('.hero-product-image').styles(
          width: 680.px,
          maxWidth: 116.percent,
          raw: {'transform': 'translateX(2%)'},
        ),
      ]),
    ]),
  ];
}
