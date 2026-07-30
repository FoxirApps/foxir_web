import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'foxir_shader.dart';

/// Foxir Apps product-studio hero.
class FoxirHero extends StatelessComponent {
  const FoxirHero({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'foxir-shell hero', [
      const FoxirShader(
        id: 'foxir-hero-shader',
        classes: 'hero-shader',
      ),
      div(classes: 'hero-inner', [
        h1([
          span(classes: 'hero-line', [.text('Building')]),
          span(classes: 'hero-line is-accent', [.text('Ideas into')]),
          span(classes: 'hero-line is-muted', [.text('Digital reality')]),
        ]),
        div(classes: 'hero-divider', []),
        div(classes: 'hero-bottom', [
          p([
            .text(
              'The personal lab of Foxir Apps. Exploring ideas, crafting '
              'interfaces, and building applications from zero to one.',
            ),
          ]),
          div(classes: 'hero-actions', [
            a(classes: 'hero-button is-primary', href: '/#apps', [
              .text('Explore apps'),
            ]),
            a(classes: 'hero-button is-secondary', href: foxirContactUrl, [
              .text("Let's talk"),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir .hero', [
      css('&').styles(
        position: const Position.relative(),
        display: .flex,
        minHeight: 700.px,
        overflow: .hidden,
        padding: .symmetric(horizontal: 24.px, vertical: 64.px),
        border: const Border.only(
          left: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
          right: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
          bottom: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
        ),
        alignItems: .center,
        backgroundColor: foxirBg,
      ),
      css('.hero-shader').styles(
        position: .absolute(
          left: .zero,
          top: .zero,
          right: .zero,
          bottom: .zero,
        ),
        zIndex: const ZIndex(0),
        display: .block,
        width: 100.percent,
        height: 100.percent,
        opacity: 0.92,
        raw: {
          'pointer-events': 'none',
          'transform': 'translateZ(0)',
        },
      ),
      css('&::before').styles(
        position: .absolute(
          left: .zero,
          top: .zero,
          right: .zero,
          bottom: .zero,
        ),
        zIndex: const ZIndex(1),
        backgroundColor: const Color('#0e0e0e38'),
        backdropFilter: const Filter.blur(Unit.pixels(1.5)),
        raw: {
          'content': '""',
          'pointer-events': 'none',
          '-webkit-backdrop-filter': 'blur(1.5px)',
          'background-image':
              'linear-gradient(180deg, rgba(14,14,14,.52) 0%, '
              'rgba(14,14,14,.08) 42%, rgba(14,14,14,.22) 62%, '
              'rgba(14,14,14,.78) 100%)',
        },
      ),
      css('.hero-inner').styles(
        position: const Position.relative(),
        zIndex: const ZIndex(2),
        display: .flex,
        width: 100.percent,
        flexDirection: .column,
        alignItems: .start,
      ),
      css('h1').styles(
        display: .flex,
        width: 100.percent,
        flexDirection: .column,
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontWeight: .w900,
        letterSpacing: (-0.05).em,
        lineHeight: 0.9.em,
        textTransform: .upperCase,
        raw: {'font-size': 'clamp(3.25rem, 11vw, 8rem)'},
      ),
      css('.hero-line').styles(display: .block),
      css('.hero-line.is-accent').styles(color: foxirAccent),
      css('.hero-line.is-muted').styles(color: const Color('#ab8980')),
      css('.hero-divider').styles(
        width: 100.percent,
        height: 2.px,
        margin: .symmetric(vertical: 36.px),
        backgroundColor: const Color('#2a2a2a80'),
      ),
      css('.hero-bottom').styles(
        display: .flex,
        width: 100.percent,
        flexDirection: .column,
        gap: .all(28.px),
      ),
      css('.hero-bottom p').styles(
        maxWidth: 576.px,
        color: foxirMuted,
        fontSize: 1.rem,
        fontWeight: .w300,
        lineHeight: 1.6.em,
      ),
      css('.hero-actions').styles(
        display: .flex,
        flexWrap: .wrap,
        gap: .all(12.px),
      ),
      css('.hero-button', [
        css('&').styles(
          display: .flex,
          minHeight: 56.px,
          padding: .symmetric(horizontal: 24.px),
          justifyContent: .center,
          alignItems: .center,
          fontSize: 0.6875.rem,
          fontWeight: .w600,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
          raw: {
            'transition': 'background-color 160ms ease, color 160ms ease, border-color 160ms ease',
          },
        ),
        css('&.is-primary').styles(
          border: const Border.all(
            style: .solid,
            color: foxirAccent,
            width: Unit.pixels(2),
          ),
          color: Colors.white,
          backgroundColor: foxirAccent,
        ),
        css('&.is-primary:hover, &.is-primary:focus-visible').styles(
          border: const Border.all(
            style: .solid,
            color: foxirInk,
            width: Unit.pixels(2),
          ),
          color: foxirBg,
          backgroundColor: foxirInk,
        ),
        css('&.is-secondary').styles(
          border: const Border.all(
            style: .solid,
            color: foxirInk,
            width: Unit.pixels(2),
          ),
          color: foxirInk,
          backgroundColor: const Color('#0e0e0ecc'),
        ),
        css('&.is-secondary:hover, &.is-secondary:focus-visible').styles(
          border: const Border.all(
            style: .solid,
            color: foxirAccent,
            width: Unit.pixels(2),
          ),
          color: Colors.white,
          backgroundColor: foxirAccent,
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.foxir .hero', [
        css('&').styles(
          padding: .symmetric(vertical: 64.px),
          raw: {
            'min-height': 'clamp(720px, 82vh, 900px)',
            'padding-left': 'clamp(48px, 6vw, 112px)',
            'padding-right': 'clamp(48px, 6vw, 112px)',
          },
        ),
        css('.hero-bottom').styles(
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .start,
        ),
        css('.hero-bottom p').styles(
          padding: .only(right: 36.px),
          fontSize: 1.25.rem,
          lineHeight: 1.6.em,
        ),
        css('.hero-actions').styles(
          justifyContent: .end,
        ),
        css('.hero-button').styles(
          minHeight: 64.px,
          padding: .symmetric(horizontal: 30.px),
        ),
      ]),
    ]),
  ];
}
