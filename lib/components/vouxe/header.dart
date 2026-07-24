import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// Sticky header: logo | store links.
class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    return header([
      div(classes: 'container header-inner', [
        a(classes: 'brand', href: '#top', [
          img(src: 'images/vouxe-icon.png', alt: 'Vouxe app icon', width: 32, height: 32),
          span([.text('Vouxe')]),
        ]),
        div(classes: 'header-stores', [
          a(classes: 'store-link', href: vouxeAppStoreUrl, target: .blank, [.text('App Store')]),
          a(classes: 'store-link outline', href: vouxePlayStoreUrl, target: .blank, [.text('Google Play')]),
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
        border: const Border.only(bottom: BorderSide(style: .solid, color: vouxeHairline, width: Unit.pixels(1))),
        backgroundColor: const Color('#0a0a0ae6'),
        backdropFilter: const Filter.blur(Unit.pixels(16)),
      ),
      css('.header-inner').styles(
        display: .flex,
        height: 64.px,
        justifyContent: .spaceBetween,
        alignItems: .center,
        gap: .all(12.px),
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
      css('.header-stores', [
        css('&').styles(
          display: .flex,
          alignItems: .center,
          gap: .all(8.px),
        ),
        css('.store-link', [
          css('&').styles(
            padding: .symmetric(horizontal: 14.px, vertical: 8.px),
            radius: .circular(999.px),
            color: vouxeBg,
            fontSize: 0.8125.rem,
            fontWeight: .w700,
            whiteSpace: .noWrap,
            backgroundColor: vouxeAccent,
          ),
          css('&:hover').styles(backgroundColor: const Color('#d4ff33')),
          css('&.outline').styles(
            border: const Border.all(style: .solid, color: vouxeHairline, width: Unit.pixels(1)),
            color: vouxeInk,
            backgroundColor: const Color('#ffffff0a'),
          ),
          css('&.outline:hover').styles(backgroundColor: vouxeElevated),
        ]),
      ]),
    ]),
  ];
}
