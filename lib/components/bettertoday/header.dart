import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../store_buttons.dart';

/// Sticky header: text brand | store badges.
class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    return header([
      div(classes: 'container header-inner', [
        a(classes: 'brand', href: '#top', [
          span(classes: 'brand-mark', [.text('BT')]),
          span([.text('Better Today')]),
        ]),
        const StoreButtons(
          appStoreUrl: betterAppStoreUrl,
          playStoreUrl: betterPlayStoreUrl,
          compact: true,
        ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bettertoday header', [
      css('&').styles(
        position: .sticky(top: .zero),
        zIndex: const ZIndex(10),
        border: const Border.only(bottom: BorderSide(style: .solid, color: betterHairline, width: Unit.pixels(1))),
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
          color: betterInk,
          fontSize: 1.125.rem,
          fontWeight: .w700,
          whiteSpace: .noWrap,
        ),
        css('.brand-mark').styles(
          display: .flex,
          width: 32.px,
          height: 32.px,
          radius: .circular(8.px),
          justifyContent: .center,
          alignItems: .center,
          color: betterBg,
          fontSize: 0.6875.rem,
          fontWeight: .w700,
          letterSpacing: 0.04.em,
          backgroundColor: betterAccent,
        ),
      ]),
    ]),
  ];
}
