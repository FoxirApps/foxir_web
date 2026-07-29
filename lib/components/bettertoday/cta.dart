import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../common/responsive_image.dart';
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
            span(classes: 'cta-eyebrow', [.text('One question. Start tonight.')]),
            h2([
              .text('Don’t wait for a better year. Start with a better today.'),
            ]),
            p(classes: 'cta-subtitle', [
              .text(
                'Download Better Today? and turn one honest daily reflection '
                'into consistency you can see—and a life you can shape.',
              ),
            ]),
            span(classes: 'cta-principle', [
              .text('Reflect in seconds. Grow for years.'),
            ]),
            const StoreButtons(alignStart: true),
          ]),
          div(classes: 'cta-visual', [
            ResponsiveImage(
              src: betterTodayDownloadSrc,
              webpSrcSet:
                  '/images/optimized/bt-bottom-640.webp 640w, '
                  '/images/optimized/bt-bottom-1280.webp 1280w',
              sizes: '(max-width: 767px) 100vw, 590px',
              alt: 'Better Today? daily reflection and progress screens',
              width: 5224,
              height: 4804,
              loading: MediaLoading.lazy,
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
        radius: .circular(32.px),
        flexDirection: .column,
        gap: .all(32.px),
        overflow: Overflow.hidden,
        backgroundColor: const Color('#0b111b'),
        raw: {
          'background-image':
              'radial-gradient(ellipse 74% 86% at 8% 4%, rgba(39, 82, 148, 0.20), transparent 74%), '
              'linear-gradient(140deg, #111b2a 0%, #0a1019 52%, #0c0e10 100%)',
          'box-shadow': '0 30px 80px rgba(0, 0, 0, 0.28)',
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
          alignSelf: .center,
          flex: const Flex(grow: 0, shrink: 0),
          margin: .zero,
        ),
        css('.cta-visual img').styles(
          width: 590.px,
          maxWidth: 115.percent,
          raw: {'transform': 'translateX(2%)'},
        ),
      ]),
    ]),
  ];
}
