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
          h1([.text('When OCD asks, “Did I lock the door?” show it the proof.')]),
          p(classes: 'hero-subtitle', [
            .text(
              'Paximus is a private OCD and anxiety tracker that saves photo evidence '
              'for completed daily tasks—so when doubt returns, you can trust the moment, '
              'avoid another check, and move forward.',
            ),
          ]),
          const StoreButtons(alignStart: true),
        ]),
        div(classes: 'hero-visual', [
          div(classes: 'phone-showcase', [
            img(
              classes: 'phone-mockup phone-mockup-a',
              src: '/images/land_1.png',
              alt: 'Paximus OCD and anxiety tracker capturing photo evidence of a locked front door',
            ),
            img(
              classes: 'phone-mockup phone-mockup-b',
              src: '/images/land_2.png',
              alt: 'Paximus confirmation screen showing saved evidence that the front door is locked',
            ),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css.keyframes('pax-phone-fade', {
      '0%': Styles(opacity: 1),
      '33%': Styles(opacity: 1),
      '50%': Styles(opacity: 0),
      '83%': Styles(opacity: 0),
      '100%': Styles(opacity: 1),
    }),
    css.keyframes('pax-gradient-flow-cool', {
      '0%': const Styles(
        raw: {'transform': 'translate3d(-3%, -2%, 0) scale(1)'},
      ),
      '50%': const Styles(
        raw: {'transform': 'translate3d(2%, 3%, 0) scale(1.06)'},
      ),
      '100%': const Styles(
        raw: {'transform': 'translate3d(4%, -1%, 0) scale(1.02)'},
      ),
    }),
    css.keyframes('pax-gradient-flow-warm', {
      '0%': const Styles(
        raw: {'transform': 'translate3d(3%, 2%, 0) scale(1.04)'},
      ),
      '50%': const Styles(
        raw: {'transform': 'translate3d(-4%, -2%, 0) scale(1)'},
      ),
      '100%': const Styles(
        raw: {'transform': 'translate3d(1%, -4%, 0) scale(1.07)'},
      ),
    }),
    css('.paximus .hero', [
      css('&').styles(
        position: const Position.relative(),
        padding: .symmetric(vertical: 48.px),
        overflow: Overflow.hidden,
        raw: {'isolation': 'isolate'},
      ),
      css('&::before').styles(
        opacity: 0.72,
        raw: {
          'content': '""',
          'position': 'absolute',
          'z-index': '0',
          'inset': '-18% -12%',
          'pointer-events': 'none',
          'background':
              'radial-gradient(ellipse 44% 48% at 16% 30%, rgba(121, 168, 255, 0.28), transparent 70%), '
              'radial-gradient(ellipse 40% 45% at 86% 20%, rgba(112, 215, 184, 0.23), transparent 72%)',
          'filter': 'blur(28px)',
          'will-change': 'transform',
          'animation': 'pax-gradient-flow-cool 18s ease-in-out infinite alternate',
        },
      ),
      css('&::after').styles(
        opacity: 0.56,
        raw: {
          'content': '""',
          'position': 'absolute',
          'z-index': '0',
          'inset': '-14% -10%',
          'pointer-events': 'none',
          'background':
              'radial-gradient(ellipse 42% 38% at 58% 76%, rgba(255, 181, 128, 0.24), transparent 72%), '
              'radial-gradient(ellipse 30% 34% at 28% 68%, rgba(231, 151, 205, 0.17), transparent 74%)',
          'filter': 'blur(34px)',
          'will-change': 'transform',
          'animation': 'pax-gradient-flow-warm 22s ease-in-out infinite alternate',
        },
      ),
      css('.hero-grid').styles(
        display: .flex,
        position: const Position.relative(),
        zIndex: const ZIndex(1),
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
        letterSpacing: (-0.03).em,
        lineHeight: 1.12.em,
      ),
      css('.hero-subtitle').styles(
        maxWidth: 34.em,
        color: muted,
        fontSize: 1.0625.rem,
        fontWeight: .w500,
      ),
      css('.hero-visual').styles(
        display: .flex,
        width: 100.percent,
        justifyContent: .center,
      ),
      css('.phone-showcase').styles(
        position: const Position.relative(),
        width: 250.px,
        maxWidth: 78.vw,
        raw: {
          'aspect-ratio': '1231 / 2488',
          'filter': 'drop-shadow(0 24px 36px rgba(29, 29, 31, 0.16))',
        },
      ),
      css('.phone-mockup').styles(
        position: const Position.absolute(top: Unit.zero, left: Unit.zero, right: Unit.zero, bottom: Unit.zero),
        width: 100.percent,
        height: 100.percent,
        opacity: 0,
        raw: {
          'object-fit': 'contain',
          'will-change': 'opacity',
        },
      ),
      css('.phone-mockup-a').styles(
        opacity: 1,
        raw: {'animation': 'pax-phone-fade 7s ease-in-out infinite both'},
      ),
      css('.phone-mockup-b').styles(
        raw: {'animation': 'pax-phone-fade 7s -3.5s ease-in-out infinite both'},
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
        css('.phone-showcase').styles(width: 270.px),
        css('&::before').styles(opacity: 0.86),
        css('&::after').styles(opacity: 0.68),
      ]),
    ]),
  ];
}
