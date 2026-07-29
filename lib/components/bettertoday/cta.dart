import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'store_buttons.dart';

/// Closing download band with store buttons.
class Cta extends StatelessComponent {
  const Cta({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'download', classes: 'cta', [
      div(classes: 'container', [
        div(classes: 'cta-panel', [
          div(classes: 'cta-copy', [
            span(classes: 'cta-eyebrow', [.text('Your masterpiece starts today')]),
            h2([
              .text('Your masterpiece isn’t built in a day.'),
            ]),
            p(classes: 'cta-subtitle', [
              .text(
                'It’s built by showing up, looking in the mirror, and asking one '
                'honest question—day after day, year after year.',
              ),
            ]),
            span(classes: 'cta-principle', [
              .text('Small steps. Long horizon. Lifelong growth.'),
            ]),
            const StoreButtons(alignStart: true),
          ]),
          div(classes: 'cta-visual', [
            img(
              src: betterTodayDownloadSrc,
              alt: 'Better Today? daily reflection and progress screens',
              attributes: {'decoding': 'async', 'loading': 'lazy'},
            ),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bettertoday .cta', [
      css('&').styles(
        padding: .symmetric(vertical: 72.px),
        raw: {'scroll-margin-top': '64px'},
      ),
      css('.cta-panel').styles(
        display: .flex,
        position: const Position.relative(),
        minHeight: 600.px,
        padding: .only(top: 44.px, left: 28.px, right: 28.px),
        border: const Border.all(
          style: .solid,
          color: Color('#ffd7002e'),
          width: Unit.pixels(1),
        ),
        radius: .circular(32.px),
        flexDirection: .column,
        gap: .all(32.px),
        overflow: Overflow.hidden,
        backgroundColor: const Color('#100b16'),
        raw: {
          'background-image':
              'radial-gradient(ellipse 70% 85% at 84% 80%, rgba(255, 215, 0, 0.14), transparent 70%), '
              'radial-gradient(ellipse 58% 70% at 12% 10%, rgba(92, 45, 120, 0.24), transparent 72%), '
              'linear-gradient(135deg, #15101d 0%, #09070d 62%, #060607 100%)',
          'box-shadow': '0 36px 100px rgba(0, 0, 0, 0.44), inset 0 1px 0 rgba(255, 255, 255, 0.04)',
        },
      ),
      css('.cta-copy').styles(
        display: .flex,
        position: const Position.relative(),
        zIndex: const ZIndex(2),
        flexDirection: .column,
        alignItems: .start,
        gap: .all(18.px),
        textAlign: .start,
      ),
      css('.cta-eyebrow').styles(
        color: betterAccent,
        fontSize: 0.75.rem,
        fontWeight: .w700,
        letterSpacing: 0.15.em,
        textTransform: .upperCase,
      ),
      css('h2').styles(
        maxWidth: 12.em,
        color: betterInk,
        fontSize: 2.25.rem,
        fontWeight: .w700,
        lineHeight: 1.06.em,
        letterSpacing: (-0.05).em,
      ),
      css('.cta-subtitle').styles(
        maxWidth: 31.em,
        color: betterMuted,
        fontSize: 1.rem,
        fontWeight: .w500,
        lineHeight: 1.65.em,
      ),
      css('.cta-principle').styles(
        color: betterInk,
        fontSize: 0.875.rem,
        fontWeight: .w600,
      ),
      css('.cta-visual').styles(
        display: .flex,
        position: const Position.relative(),
        zIndex: const ZIndex(1),
        justifyContent: .center,
        alignItems: .end,
        margin: .only(top: Unit.auto),
      ),
      css('.cta-visual img').styles(
        width: 540.px,
        maxWidth: 118.percent,
        raw: {
          'height': 'auto',
          'filter': 'drop-shadow(0 28px 52px rgba(0, 0, 0, 0.58))',
        },
      ),
    ]),
    css.media(desktop, [
      css('.bettertoday .cta', [
        css('&').styles(padding: .symmetric(vertical: 96.px)),
        css('.cta-panel').styles(
          minHeight: 620.px,
          padding: .only(left: 56.px),
          flexDirection: .row,
          alignItems: .center,
          gap: .all(16.px),
        ),
        css('.cta-copy').styles(
          width: 48.percent,
          flex: const Flex(grow: 0, shrink: 0),
        ),
        css('h2').styles(fontSize: 3.35.rem),
        css('.cta-visual').styles(
          width: 54.percent,
          height: 100.percent,
          alignSelf: .end,
          flex: const Flex(grow: 0, shrink: 0),
          margin: .zero,
        ),
        css('.cta-visual img').styles(
          width: 590.px,
          maxWidth: 115.percent,
          raw: {'transform': 'translate(2%, 5%)'},
        ),
      ]),
    ]),
  ];
}
