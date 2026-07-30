import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../common/foxir_home_link.dart';

/// Sticky header: logo | download CTA.
class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    return header([
      div(classes: 'container header-inner', [
        div(classes: 'header-brands', [
          const FoxirHomeLink(),
          span(classes: 'brand-divider', [.text('/')]),
          a(classes: 'brand', href: '/paximus#top', [
            img(src: '/images/paximus-icon.png', alt: 'Paximus app icon', width: 32, height: 32),
            span([.text('Paximus')]),
          ]),
        ]),
        a(classes: 'download-cta', href: '/paximus#download', [
          span([.text('Get Paximus')]),
          span(classes: 'download-cta-icon', [.text('↓')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.paximus header', [
      css('&').styles(
        position: .sticky(top: .zero),
        zIndex: const ZIndex(10),
        border: const Border.only(
          bottom: BorderSide(style: .solid, color: Color('#e4e8ef'), width: Unit.pixels(1)),
        ),
        backgroundColor: const Color('#f7f9fce6'),
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
          color: const Color('#ffffff'),
          backgroundColor: ink,
          radius: .circular(999.px),
          alignItems: .center,
          gap: .all(8.px),
          fontSize: 0.875.rem,
          fontWeight: .w700,
          lineHeight: 1.em,
          whiteSpace: .noWrap,
          raw: {
            'box-shadow': '0 8px 20px rgba(29, 29, 31, 0.14)',
            'transition': 'transform 180ms ease, box-shadow 180ms ease, background-color 180ms ease',
          },
        ),
        css('&:hover').styles(
          backgroundColor: const Color('#000000'),
          raw: {
            'transform': 'translateY(-1px)',
            'box-shadow': '0 10px 24px rgba(29, 29, 31, 0.2)',
          },
        ),
        css('&:focus-visible').styles(
          raw: {
            'outline': '3px solid rgba(29, 29, 31, 0.22)',
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
