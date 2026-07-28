import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// Sticky header: logo | download CTA.
class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    return header([
      div(classes: 'container header-inner', [
        a(classes: 'brand', href: '/vouxe#top', [
          img(src: '/images/vouxe-icon.png', alt: 'Vouxe app icon', width: 32, height: 32),
          span([.text('Vouxe')]),
        ]),
        a(classes: 'download-cta', href: '/vouxe#download', [
          span([.text('Get Vouxe')]),
          span(classes: 'download-cta-icon', [.text('↓')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.vouxe header', [
      css('&').styles(
        position: .sticky(top: .zero),
        zIndex: const ZIndex(10),
        border: const Border.only(
          bottom: BorderSide(style: .solid, color: vouxeHairline, width: Unit.pixels(1)),
        ),
        backgroundColor: const Color('#0a0a0ae6'),
        backdropFilter: const Filter.blur(Unit.pixels(16)),
      ),
      css('.header-inner').styles(
        display: .flex,
        height: 64.px,
        alignItems: .center,
        gap: .all(12.px),
        justifyContent: .spaceBetween,
      ),
      css('.brand', [
        css('&').styles(
          display: .flex,
          alignItems: .center,
          gap: .all(10.px),
          color: vouxeInk,
          fontSize: 1.125.rem,
          fontWeight: .w700,
          whiteSpace: .noWrap,
        ),
        css('img').styles(radius: .circular(8.px)),
      ]),
      css('.download-cta', [
        css('&').styles(
          display: .flex,
          padding: .symmetric(vertical: 10.px, horizontal: 16.px),
          color: vouxeBg,
          backgroundColor: vouxeAccent,
          radius: .circular(999.px),
          alignItems: .center,
          gap: .all(8.px),
          fontSize: 0.875.rem,
          fontWeight: .w700,
          lineHeight: 1.em,
          whiteSpace: .noWrap,
          raw: {
            'box-shadow': '0 8px 20px rgba(200, 240, 0, 0.18)',
            'transition': 'transform 180ms ease, box-shadow 180ms ease, background-color 180ms ease',
          },
        ),
        css('&:hover').styles(
          backgroundColor: const Color('#d8ff16'),
          raw: {
            'transform': 'translateY(-1px)',
            'box-shadow': '0 10px 24px rgba(200, 240, 0, 0.28)',
          },
        ),
        css('&:focus-visible').styles(
          raw: {
            'outline': '3px solid rgba(200, 240, 0, 0.28)',
            'outline-offset': '3px',
          },
        ),
      ]),
      css('.download-cta-icon').styles(
        fontSize: 1.rem,
        lineHeight: 1.em,
      ),
    ]),
  ];
}
