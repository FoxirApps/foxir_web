import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../store_buttons.dart';

/// Sticky header: logo | store badges.
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
        const StoreButtons(
          appStoreUrl: vouxeAppStoreUrl,
          playStoreUrl: vouxePlayStoreUrl,
          compact: true,
        ),
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
    ]),
  ];
}
