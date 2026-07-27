import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'store_buttons.dart';

/// Closing call-to-action section on a dark background.
class Cta extends StatelessComponent {
  const Cta({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'download', classes: 'cta', [
      div(classes: 'container cta-inner', [
        h2([.text('You checked it. Paximus remembers.')]),
        p([
          .text(
            'Save photo evidence once. When doubt returns, open Paximus, '
            'trust the moment, and move forward—without checking twice.',
          ),
        ]),
        const StoreButtons(),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css.keyframes('pax-cta-aurora-cool', {
      '0%': const Styles(
        raw: {'transform': 'translate3d(-4%, -2%, 0) scale(1)'},
      ),
      '50%': const Styles(
        raw: {'transform': 'translate3d(3%, 4%, 0) scale(1.08)'},
      ),
      '100%': const Styles(
        raw: {'transform': 'translate3d(5%, -3%, 0) scale(1.03)'},
      ),
    }),
    css.keyframes('pax-cta-aurora-warm', {
      '0%': const Styles(
        raw: {'transform': 'translate3d(4%, 3%, 0) scale(1.05)'},
      ),
      '50%': const Styles(
        raw: {'transform': 'translate3d(-5%, -2%, 0) scale(1)'},
      ),
      '100%': const Styles(
        raw: {'transform': 'translate3d(1%, -5%, 0) scale(1.09)'},
      ),
    }),
    css('.paximus .cta', [
      css('&').styles(
        position: const Position.relative(),
        padding: .symmetric(vertical: 80.px),
        border: const Border.symmetric(
          horizontal: BorderSide(style: .solid, color: Color('#ffffff12'), width: Unit.pixels(1)),
        ),
        overflow: Overflow.hidden,
        color: Colors.white,
        backgroundColor: const Color('#0b0c0f'),
        raw: {
          'isolation': 'isolate',
          'scroll-margin-top': '80px',
          'background-image':
              'linear-gradient(rgba(255, 255, 255, 0.025) 1px, transparent 1px), '
              'linear-gradient(90deg, rgba(255, 255, 255, 0.025) 1px, transparent 1px), '
              'radial-gradient(ellipse 80% 55% at 50% 45%, rgba(255, 255, 255, 0.035), transparent 72%)',
          'background-size': '32px 32px, 32px 32px, auto',
        },
      ),
      css('&::before').styles(
        opacity: 0.48,
        raw: {
          'content': '""',
          'position': 'absolute',
          'z-index': '0',
          'inset': '-45% -20%',
          'pointer-events': 'none',
          'background':
              'radial-gradient(ellipse 42% 45% at 20% 36%, rgba(91, 144, 255, 0.32), transparent 72%), '
              'radial-gradient(ellipse 40% 44% at 82% 28%, rgba(77, 214, 176, 0.25), transparent 72%)',
          'filter': 'blur(54px)',
          'will-change': 'transform',
          'animation': 'pax-cta-aurora-cool 22s ease-in-out infinite alternate',
        },
      ),
      css('&::after').styles(
        opacity: 0.36,
        raw: {
          'content': '""',
          'position': 'absolute',
          'z-index': '0',
          'inset': '-40% -18%',
          'pointer-events': 'none',
          'background':
              'radial-gradient(ellipse 44% 42% at 58% 78%, rgba(255, 158, 94, 0.26), transparent 72%), '
              'radial-gradient(ellipse 30% 38% at 30% 68%, rgba(229, 121, 195, 0.2), transparent 74%)',
          'filter': 'blur(62px)',
          'will-change': 'transform',
          'animation': 'pax-cta-aurora-warm 26s ease-in-out infinite alternate',
        },
      ),
      css('.cta-inner').styles(
        display: .flex,
        position: const Position.relative(),
        zIndex: const ZIndex(1),
        flexDirection: .column,
        alignItems: .center,
        gap: .all(20.px),
        textAlign: .center,
      ),
      css('h2').styles(
        fontSize: 2.25.rem,
        fontWeight: .w700,
        letterSpacing: (-0.02).em,
        lineHeight: 1.15.em,
      ),
      css('p').styles(
        maxWidth: 32.em,
        color: mutedOnDark,
        fontSize: 1.125.rem,
        fontWeight: .w500,
      ),
    ]),
    css.media(desktop, [
      css('.paximus .cta', [
        css('&').styles(padding: .symmetric(vertical: 112.px)),
        css('h2').styles(fontSize: 3.rem),
        css('&::before').styles(opacity: 0.64),
        css('&::after').styles(opacity: 0.48),
      ]),
    ]),
    css.media(MediaQuery.raw('(prefers-reduced-motion: reduce)'), [
      css('.paximus .cta', [
        css('&::before').styles(
          raw: {
            'animation': 'none',
            'transform': 'translate3d(0, 0, 0)',
          },
        ),
        css('&::after').styles(
          raw: {
            'animation': 'none',
            'transform': 'translate3d(0, 0, 0)',
          },
        ),
      ]),
    ]),
  ];
}
