import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'store_buttons.dart';

/// Closing premium tagline band with store buttons.
class Cta extends StatelessComponent {
  const Cta({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'download', classes: 'cta', [
      div(classes: 'container cta-inner', [
        span(classes: 'cta-eyebrow', [.text('Your next challenge starts here')]),
        h2([
          .text('Don’t just set the goal. '),
          span([.text('Sign it.')]),
        ]),
        p(classes: 'cta-copy', [
          .text(
            'Choose your challenge, define the rules, and commit with your '
            'signature. Vouxe turns every day you show up into streaks, XP, '
            'and progress you can prove.',
          ),
        ]),
        div(classes: 'cta-steps', [
          div(classes: 'cta-step', [
            span(classes: 'cta-step-index', [.text('01')]),
            span([.text('Sign the challenge')]),
          ]),
          div(classes: 'cta-step', [
            span(classes: 'cta-step-index', [.text('02')]),
            span([.text('Protect the streak')]),
          ]),
          div(classes: 'cta-step', [
            span(classes: 'cta-step-index', [.text('03')]),
            span([.text('Earn the XP')]),
          ]),
        ]),
        const StoreButtons(),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.vouxe .cta', [
      css('&').styles(
        padding: .symmetric(vertical: 72.px),
        raw: {'scroll-margin-top': '64px'},
      ),
      css('.cta-inner').styles(
        display: .flex,
        position: const Position.relative(),
        maxWidth: 960.px,
        margin: .symmetric(horizontal: Unit.auto),
        padding: .symmetric(vertical: 48.px, horizontal: 24.px),
        border: const Border.all(
          style: .solid,
          color: Color('#c8f00038'),
          width: Unit.pixels(1),
        ),
        radius: .circular(32.px),
        flexDirection: .column,
        alignItems: .center,
        gap: .all(20.px),
        overflow: Overflow.hidden,
        textAlign: .center,
        backgroundColor: const Color('#10120c'),
        raw: {
          'isolation': 'isolate',
          'box-shadow':
              '0 32px 80px rgba(0, 0, 0, 0.36), '
              '0 0 0 1px rgba(200, 240, 0, 0.025), '
              'inset 0 1px 0 rgba(255, 255, 255, 0.05)',
        },
      ),
      css('.cta-inner::before').styles(
        raw: {
          'content': '"VOUXE"',
          'position': 'absolute',
          'z-index': '0',
          'top': '50%',
          'left': '50%',
          'transform': 'translate(-50%, -50%)',
          'color': 'transparent',
          '-webkit-text-stroke': '1px rgba(200, 240, 0, 0.07)',
          'font-family': '"Space Grotesk", sans-serif',
          'font-size': 'clamp(7rem, 19vw, 15rem)',
          'font-weight': '700',
          'letter-spacing': '0.08em',
          'line-height': '1',
          'pointer-events': 'none',
          'user-select': 'none',
          'white-space': 'nowrap',
        },
      ),
      css('.cta-inner::after').styles(
        raw: {
          'content': '""',
          'position': 'absolute',
          'z-index': '0',
          'inset': '14px',
          'border': '1px solid rgba(255, 255, 255, 0.045)',
          'border-radius': '22px',
          'pointer-events': 'none',
        },
      ),
      css('.cta-inner > *').styles(
        position: const Position.relative(),
        zIndex: const ZIndex(1),
      ),
      css('.cta-eyebrow').styles(
        color: vouxeAccent,
        fontSize: 0.75.rem,
        fontWeight: .w700,
        letterSpacing: 0.14.em,
        textTransform: .upperCase,
      ),
      css('h2').styles(
        maxWidth: 14.em,
        color: vouxeInk,
        fontSize: 2.rem,
        fontWeight: .w700,
        lineHeight: 1.08.em,
        letterSpacing: (-0.04).em,
      ),
      css('h2 span').styles(color: vouxeAccent),
      css('.cta-copy').styles(
        maxWidth: 38.em,
        color: vouxeMuted,
        fontSize: 1.rem,
        fontWeight: .w500,
      ),
      css('.cta-steps').styles(
        display: .flex,
        width: 100.percent,
        maxWidth: 720.px,
        margin: .symmetric(vertical: 8.px),
        gap: .all(10.px),
        justifyContent: .center,
        raw: {'flex-wrap': 'wrap'},
      ),
      css('.cta-step').styles(
        display: .flex,
        padding: .symmetric(vertical: 10.px, horizontal: 14.px),
        border: const Border.all(
          style: .solid,
          color: vouxeHairline,
          width: Unit.pixels(1),
        ),
        radius: .circular(999.px),
        alignItems: .center,
        gap: .all(8.px),
        color: vouxeInk,
        backgroundColor: const Color('#ffffff08'),
        fontSize: 0.8125.rem,
        fontWeight: .w600,
        whiteSpace: .noWrap,
      ),
      css('.cta-step-index').styles(
        color: vouxeAccent,
        fontSize: 0.6875.rem,
        fontWeight: .w700,
        letterSpacing: 0.08.em,
      ),
    ]),
    css.media(desktop, [
      css('.vouxe .cta', [
        css('&').styles(padding: .symmetric(vertical: 96.px)),
        css('.cta-inner').styles(
          padding: .symmetric(vertical: 72.px, horizontal: 56.px),
          gap: .all(24.px),
        ),
        css('h2').styles(fontSize: 3.rem),
        css('.cta-copy').styles(fontSize: 1.125.rem),
      ]),
    ]),
  ];
}
