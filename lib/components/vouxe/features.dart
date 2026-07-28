import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _Feature = ({
  String title,
  String description,
  String imageSrc,
  String imageAlt,
  int imageWidth,
});

const List<_Feature> _features = [
  (
    title: 'Make it official',
    description: 'Set your goal, define the rules, choose the duration, and seal the challenge with your signature.',
    imageSrc: '/images/vp1.png',
    imageAlt: 'Vouxe Create Challenge screen with rules, duration, and signature pledge',
    imageWidth: 1231,
  ),
  (
    title: 'Show up every day',
    description: 'Check in daily, protect your streak, and watch consistency become visible progress.',
    imageSrc: '/images/vp2.png',
    imageAlt: 'Completed 30-day Vouxe challenge with streak and journey map',
    imageWidth: 1231,
  ),
  (
    title: 'Turn progress into proof',
    description: 'Transform completed milestones into bold posters made to customize and share.',
    imageSrc: '/images/vp3.png',
    imageAlt: 'Vouxe milestone poster customization and sharing screen',
    imageWidth: 1231,
  ),
  (
    title: 'Level up together',
    description: 'Earn XP, collect badges, and climb the leaderboard alongside the community.',
    imageSrc: '/images/vp4.png',
    imageAlt: 'Vouxe leaderboard showing players ranked by XP',
    imageWidth: 1320,
  ),
];

/// Four-step interactive product story with a CSS-only phone stack.
class Features extends StatelessComponent {
  const Features({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'features', [
      div(classes: 'container', [
        div(classes: 'features-heading', [
          span(classes: 'features-eyebrow', [.text('How Vouxe works')]),
          h2([.text('From promise to proof.')]),
          p([
            .text(
              'Vouxe turns one decision into a challenge you sign, track, '
              'finish, and level up from.',
            ),
          ]),
        ]),
        div(
          classes: 'features-shell',
          attributes: const {
            'role': 'radiogroup',
            'aria-label': 'How Vouxe works',
          },
          [
            for (var i = 0; i < _features.length; i++)
              input<bool>(
                id: 'vouxe-feature-${i + 1}',
                classes: 'feature-toggle',
                type: .radio,
                name: 'vouxe-feature',
                value: '${i + 1}',
                checked: i == 0,
                attributes: {'aria-label': _features[i].title},
              ),
            div(classes: 'features-layout', [
              div(classes: 'feature-menu', [
                for (var i = 0; i < _features.length; i++)
                  label(
                    htmlFor: 'vouxe-feature-${i + 1}',
                    classes: 'feature-option feature-option-${i + 1}',
                    [
                      span(classes: 'feature-index', [
                        .text((i + 1).toString().padLeft(2, '0')),
                      ]),
                      div(classes: 'feature-option-copy', [
                        h3([.text(_features[i].title)]),
                        p([.text(_features[i].description)]),
                      ]),
                    ],
                  ),
              ]),
              div(classes: 'phone-stage', [
                for (var i = 0; i < _features.length; i++)
                  img(
                    classes: 'feature-phone feature-phone-${i + 1}',
                    src: _features[i].imageSrc,
                    alt: _features[i].imageAlt,
                    width: _features[i].imageWidth,
                    height: 2488,
                    attributes: const {'decoding': 'async'},
                  ),
              ]),
              div(classes: 'feature-controls', [
                for (var i = 0; i < _features.length; i++)
                  div(classes: 'feature-control-set feature-control-set-${i + 1}', [
                    label(
                      htmlFor: 'vouxe-feature-${i == 0 ? _features.length : i}',
                      classes: 'feature-arrow feature-arrow-previous',
                      attributes: const {
                        'aria-label': 'Previous feature',
                        'title': 'Previous feature',
                      },
                      [
                        span(attributes: const {'aria-hidden': 'true'}, [.text('‹')]),
                      ],
                    ),
                    label(
                      htmlFor: 'vouxe-feature-${i == _features.length - 1 ? 1 : i + 2}',
                      classes: 'feature-arrow feature-arrow-next',
                      attributes: const {
                        'aria-label': 'Next feature',
                        'title': 'Next feature',
                      },
                      [
                        span(attributes: const {'aria-hidden': 'true'}, [.text('›')]),
                      ],
                    ),
                  ]),
              ]),
            ]),
          ],
        ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.vouxe .features', [
      css('&').styles(
        padding: .symmetric(vertical: 80.px),
        overflow: Overflow.hidden,
        raw: {'scroll-margin-top': '64px'},
      ),
      css('.features-heading').styles(
        maxWidth: 660.px,
      ),
      css('.features-eyebrow').styles(
        color: vouxeAccent,
        fontSize: 0.75.rem,
        fontWeight: .w700,
        letterSpacing: 0.14.em,
        textTransform: .upperCase,
      ),
      css('.features-heading h2').styles(
        margin: .only(top: 12.px),
        color: vouxeInk,
        fontSize: 2.25.rem,
        fontWeight: .w700,
        lineHeight: 1.05.em,
        letterSpacing: (-0.04).em,
      ),
      css('.features-heading p').styles(
        maxWidth: 36.em,
        margin: .only(top: 16.px),
        color: vouxeMuted,
        fontSize: 1.rem,
        fontWeight: .w500,
      ),
      css('.features-shell').styles(
        position: const Position.relative(),
        margin: .only(top: 44.px),
      ),
      css('.feature-toggle').styles(
        position: const Position.absolute(),
        width: 1.px,
        height: 1.px,
        padding: .zero,
        margin: .all((-1).px),
        border: Border.none,
        overflow: Overflow.hidden,
        raw: {
          'clip': 'rect(0, 0, 0, 0)',
          'clip-path': 'inset(50%)',
          'white-space': 'nowrap',
        },
      ),
      css('.features-layout').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(36.px),
      ),
      css('.feature-menu', [
        css('&').styles(
          display: .flex,
          width: 100.percent,
          overflow: Overflow.visible,
          raw: {'order': '3'},
        ),
      ]),
      css('.feature-option', [
        css('&').styles(
          display: .flex,
          minWidth: 272.px,
          padding: .all(20.px),
          border: const Border.all(
            style: .solid,
            color: vouxeHairline,
            width: Unit.pixels(1),
          ),
          radius: .circular(20.px),
          alignItems: .start,
          gap: .all(14.px),
          color: vouxeInk,
          backgroundColor: vouxeSurface,
          cursor: Cursor.pointer,
          raw: {
            'transition':
                'border-color 220ms ease, background-color 220ms ease, '
                'box-shadow 220ms ease, transform 220ms ease',
          },
        ),
        css('&:hover').styles(
          border: const Border.all(
            style: .solid,
            color: Color('#c8f00066'),
            width: Unit.pixels(1),
          ),
          raw: {'transform': 'translateY(-2px)'},
        ),
      ]),
      css('.feature-option').styles(
        display: Display.none,
        minWidth: Unit.zero,
        width: 100.percent,
      ),
      css('.feature-index').styles(
        display: .flex,
        width: 34.px,
        height: 34.px,
        radius: .circular(10.px),
        flex: const Flex(shrink: 0),
        alignItems: .center,
        justifyContent: .center,
        color: vouxeAccent,
        backgroundColor: const Color('#c8f00012'),
        fontSize: 0.6875.rem,
        fontWeight: .w700,
        letterSpacing: 0.06.em,
      ),
      css('.feature-option-copy').styles(
        minWidth: Unit.zero,
      ),
      css('.feature-option h3').styles(
        color: vouxeInk,
        fontSize: 1.rem,
        fontWeight: .w700,
        lineHeight: 1.25.em,
      ),
      css('.feature-option p').styles(
        margin: .only(top: 7.px),
        color: vouxeMuted,
        fontSize: 0.875.rem,
        fontWeight: .w500,
        lineHeight: 1.5.em,
      ),
      css('.phone-stage').styles(
        position: const Position.relative(),
        width: 100.percent,
        maxWidth: 560.px,
        height: 520.px,
        margin: .symmetric(horizontal: Unit.auto),
        overflow: Overflow.hidden,
        raw: {
          'isolation': 'isolate',
          'order': '1',
          '--phone-stack-1': '10px',
          '--phone-stack-2': '20px',
          '--phone-stack-3': '30px',
        },
      ),
      css('.phone-stage::before').styles(
        raw: {
          'content': '""',
          'position': 'absolute',
          'z-index': '0',
          'left': '50%',
          'bottom': '24px',
          'width': '72%',
          'height': '24px',
          'transform': 'translateX(-50%)',
          'border-radius': '50%',
          'background': 'rgba(200, 240, 0, 0.12)',
          'filter': 'blur(24px)',
        },
      ),
      css('.feature-phone').styles(
        position: const Position.absolute(
          left: Unit.percent(50),
          bottom: Unit.pixels(16),
        ),
        zIndex: const ZIndex(1),
        width: 62.percent,
        maxWidth: 225.px,
        height: Unit.auto,
        opacity: 0,
        raw: {
          'transform-origin': '50% 100%',
          'will-change': 'transform, opacity',
          'transition':
              'transform 650ms cubic-bezier(0.22, 1, 0.36, 1), '
              'opacity 420ms ease',
        },
      ),
      css('.feature-controls').styles(
        display: .flex,
        width: 100.percent,
        minHeight: 54.px,
        alignItems: .center,
        justifyContent: .center,
        raw: {'order': '2'},
      ),
      css('.feature-control-set').styles(
        display: Display.none,
        alignItems: .center,
        gap: .all(12.px),
      ),
      css('.feature-arrow', [
        css('&').styles(
          display: .flex,
          width: 54.px,
          height: 54.px,
          border: const Border.all(
            style: .solid,
            color: vouxeHairline,
            width: Unit.pixels(1),
          ),
          radius: .circular(999.px),
          alignItems: .center,
          justifyContent: .center,
          color: vouxeInk,
          backgroundColor: vouxeElevated,
          cursor: Cursor.pointer,
          fontSize: 2.rem,
          fontWeight: .w500,
          lineHeight: 1.em,
          raw: {
            'transition':
                'transform 180ms ease, border-color 180ms ease, '
                'background-color 180ms ease',
          },
        ),
        css('&:hover').styles(
          border: const Border.all(
            style: .solid,
            color: Color('#c8f00088'),
            width: Unit.pixels(1),
          ),
          raw: {'transform': 'translateY(-2px)'},
        ),
      ]),
      css('.feature-arrow-next').styles(
        color: vouxeBg,
        backgroundColor: vouxeAccent,
      ),
      for (var i = 1; i <= _features.length; i++) ...[
        css('#vouxe-feature-$i:checked ~ .features-layout .feature-option-$i').styles(
          display: .flex,
          border: const Border.all(
            style: .solid,
            color: Color('#c8f00099'),
            width: Unit.pixels(1),
          ),
          backgroundColor: const Color('#c8f0000d'),
          raw: {
            'box-shadow':
                '0 16px 36px rgba(0, 0, 0, 0.24), '
                'inset 0 1px 0 rgba(255, 255, 255, 0.035)',
          },
        ),
        css(
          '#vouxe-feature-$i:focus-visible ~ .features-layout .feature-option-$i',
        ).styles(
          raw: {
            'outline': '3px solid rgba(200, 240, 0, 0.32)',
            'outline-offset': '3px',
          },
        ),
        css(
          '#vouxe-feature-$i:checked ~ .features-layout '
          '.feature-control-set-$i',
        ).styles(display: .flex),
      ],
      css(
        '#vouxe-feature-1:checked ~ .features-layout .feature-phone-1',
      ).styles(
        zIndex: const ZIndex(4),
        opacity: 1,
        raw: {'transform': 'translate3d(-50%, 0, 0) rotate(0deg) scale(1)'},
      ),
      css(
        '#vouxe-feature-1:checked ~ .features-layout .feature-phone-2',
      ).styles(
        zIndex: const ZIndex(3),
        opacity: 1,
        raw: {
          'transform':
              'translate3d(calc(-50% + var(--phone-stack-1)), 0, 0) '
              'rotate(2deg) scale(0.97)',
        },
      ),
      css(
        '#vouxe-feature-1:checked ~ .features-layout .feature-phone-3',
      ).styles(
        zIndex: const ZIndex(2),
        opacity: 1,
        raw: {
          'transform':
              'translate3d(calc(-50% + var(--phone-stack-2)), 0, 0) '
              'rotate(3deg) scale(0.94)',
        },
      ),
      css(
        '#vouxe-feature-1:checked ~ .features-layout .feature-phone-4',
      ).styles(
        opacity: 1,
        raw: {
          'transform':
              'translate3d(calc(-50% + var(--phone-stack-3)), 0, 0) '
              'rotate(4deg) scale(0.91)',
        },
      ),
      css(
        '#vouxe-feature-2:checked ~ .features-layout .feature-phone-1',
      ).styles(
        opacity: 0,
        raw: {'transform': 'translate3d(calc(-50% - 420px), 0, 0) rotate(-12deg) scale(0.94)'},
      ),
      css(
        '#vouxe-feature-2:checked ~ .features-layout .feature-phone-2',
      ).styles(
        zIndex: const ZIndex(4),
        opacity: 1,
        raw: {'transform': 'translate3d(-50%, 0, 0) rotate(0deg) scale(1)'},
      ),
      css(
        '#vouxe-feature-2:checked ~ .features-layout .feature-phone-3',
      ).styles(
        zIndex: const ZIndex(3),
        opacity: 1,
        raw: {
          'transform':
              'translate3d(calc(-50% + var(--phone-stack-1)), 0, 0) '
              'rotate(3deg) scale(0.96)',
        },
      ),
      css(
        '#vouxe-feature-2:checked ~ .features-layout .feature-phone-4',
      ).styles(
        zIndex: const ZIndex(2),
        opacity: 1,
        raw: {
          'transform':
              'translate3d(calc(-50% + var(--phone-stack-2)), 0, 0) '
              'rotate(4deg) scale(0.92)',
        },
      ),
      css(
        '#vouxe-feature-3:checked ~ .features-layout .feature-phone-1',
      ).styles(
        opacity: 0,
        raw: {'transform': 'translate3d(calc(-50% - 470px), 0, 0) rotate(-14deg) scale(0.9)'},
      ),
      css(
        '#vouxe-feature-3:checked ~ .features-layout .feature-phone-2',
      ).styles(
        opacity: 0,
        raw: {'transform': 'translate3d(calc(-50% - 420px), 0, 0) rotate(-12deg) scale(0.94)'},
      ),
      css(
        '#vouxe-feature-3:checked ~ .features-layout .feature-phone-3',
      ).styles(
        zIndex: const ZIndex(4),
        opacity: 1,
        raw: {'transform': 'translate3d(-50%, 0, 0) rotate(0deg) scale(1)'},
      ),
      css(
        '#vouxe-feature-3:checked ~ .features-layout .feature-phone-4',
      ).styles(
        zIndex: const ZIndex(3),
        opacity: 1,
        raw: {
          'transform':
              'translate3d(calc(-50% + var(--phone-stack-1)), 0, 0) '
              'rotate(3deg) scale(0.95)',
        },
      ),
      css(
        '#vouxe-feature-4:checked ~ .features-layout .feature-phone-1',
      ).styles(
        opacity: 0,
        raw: {'transform': 'translate3d(calc(-50% - 510px), 0, 0) rotate(-16deg) scale(0.88)'},
      ),
      css(
        '#vouxe-feature-4:checked ~ .features-layout .feature-phone-2',
      ).styles(
        opacity: 0,
        raw: {'transform': 'translate3d(calc(-50% - 465px), 0, 0) rotate(-14deg) scale(0.9)'},
      ),
      css(
        '#vouxe-feature-4:checked ~ .features-layout .feature-phone-3',
      ).styles(
        opacity: 0,
        raw: {'transform': 'translate3d(calc(-50% - 420px), 0, 0) rotate(-12deg) scale(0.94)'},
      ),
      css(
        '#vouxe-feature-4:checked ~ .features-layout .feature-phone-4',
      ).styles(
        zIndex: const ZIndex(4),
        opacity: 1,
        raw: {'transform': 'translate3d(-50%, 0, 0) rotate(0deg) scale(1)'},
      ),
    ]),
    css.media(desktop, [
      css('.vouxe .features', [
        css('&').styles(padding: .symmetric(vertical: 112.px)),
        css('.features-heading h2').styles(fontSize: 3.rem),
        css('.features-heading p').styles(fontSize: 1.125.rem),
        css('.features-shell').styles(margin: .only(top: 56.px)),
        css('.features-layout').styles(
          flexDirection: .row,
          alignItems: .center,
          gap: .all(64.px),
        ),
        css('.feature-menu').styles(
          width: 42.percent,
          padding: .zero,
          flexDirection: .column,
          gap: .all(12.px),
          overflow: Overflow.visible,
          raw: {'order': '1'},
        ),
        css('.feature-option').styles(
          display: .flex,
          minWidth: Unit.zero,
          width: 100.percent,
          padding: .all(22.px),
        ),
        css('.feature-option h3').styles(fontSize: 1.0625.rem),
        css('.phone-stage').styles(
          maxWidth: 620.px,
          height: 680.px,
          flex: const Flex.grow(1),
          raw: {
            'order': '2',
            '--phone-stack-1': '110px',
            '--phone-stack-2': '210px',
            '--phone-stack-3': '292px',
          },
        ),
        css('.feature-controls').styles(display: Display.none),
        css('.feature-phone').styles(
          width: 300.px,
          raw: {
            'max-width': 'none',
            'bottom': '20px',
            'left': '25%',
          },
        ),
      ]),
    ]),
    css.media(MediaQuery.raw('(prefers-reduced-motion: reduce)'), [
      css('.vouxe .features .feature-phone').styles(
        raw: {'transition': 'none'},
      ),
      css('.vouxe .features .feature-option').styles(
        raw: {'transition': 'none'},
      ),
    ]),
  ];
}
