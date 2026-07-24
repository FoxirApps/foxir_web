import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'store_buttons.dart';

/// Two-column hero: headline + subtitle + downloads | phone visual.
class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'top', classes: 'hero', [
      div(classes: 'container hero-grid', [
        div(classes: 'hero-copy', [
          h1([.text('Finally, OCD & anxiety tracking that feels calm')]),
          p(classes: 'hero-subtitle', [
            .text('Paximus helps you capture worries, validate tasks with evidence, '
                'and close every day with quiet reassurance—without the spiral.'),
          ]),
          const StoreButtons(alignStart: true),
        ]),
        div(classes: 'hero-visual', [
          div(classes: 'phone-frame', [
            div(classes: 'phone-screen', [
              img(src: '/images/paximus-icon.png', alt: 'Paximus app', width: 120, height: 120),
              span(classes: 'phone-label', [.text('Paximus')]),
              span(classes: 'phone-tagline', [.text('Calm task tracking')]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.paximus .hero', [
      css('&').styles(padding: .symmetric(vertical: 48.px)),
      css('.hero-grid').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        gap: .all(40.px),
      ),
      css('.hero-copy').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
        gap: .all(20.px),
        textAlign: .start,
      ),
      css('h1').styles(
        maxWidth: 14.em,
        fontSize: 2.25.rem,
        fontWeight: .w700,
        lineHeight: 1.12.em,
        letterSpacing: (-0.03).em,
      ),
      css('.hero-subtitle').styles(
        maxWidth: 34.em,
        color: muted,
        fontSize: 1.0625.rem,
        fontWeight: .w500,
      ),
      css('.hero-visual').styles(
        display: .flex,
        justifyContent: .center,
        width: 100.percent,
      ),
      css('.phone-frame').styles(
        padding: .all(12.px),
        border: const Border.all(style: .solid, color: Color('#d8dde6'), width: Unit.pixels(1)),
        radius: .circular(40.px),
        backgroundColor: const Color('#1d1d1f'),
        shadow: const BoxShadow(
          offsetX: Unit.zero,
          offsetY: Unit.pixels(24),
          blur: Unit.pixels(48),
          color: Color('#1d1d1f22'),
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
        gap: .all(16.px),
        backgroundColor: const Color('#f5f7fa'),
        raw: {
          'background-image':
              'radial-gradient(ellipse 80% 50% at 50% 20%, rgba(120, 160, 200, 0.25), transparent 70%)',
        },
      ),
      css('.phone-screen img').styles(radius: .circular(28.px)),
      css('.phone-label').styles(
        fontSize: 1.25.rem,
        fontWeight: .w700,
      ),
      css('.phone-tagline').styles(
        color: muted,
        fontSize: 0.875.rem,
        fontWeight: .w500,
      ),
    ]),
    css.media(desktop, [
      css('.paximus .hero', [
        css('&').styles(padding: .symmetric(vertical: 72.px)),
        css('.hero-grid').styles(
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .center,
          gap: .all(48.px),
        ),
        css('.hero-copy').styles(flex: const Flex.grow(1)),
        css('h1').styles(fontSize: 3.25.rem),
        css('.phone-screen').styles(width: 260.px, height: 520.px),
      ]),
    ]),
  ];
}
