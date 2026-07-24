import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// Sticky header: text brand | Features + Reviews | store links.
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
        nav(classes: 'header-nav', [
          a(classes: 'nav-link', href: '#features', [.text('Features')]),
          a(classes: 'nav-link', href: '#reviews', [.text('Reviews')]),
        ]),
        div(classes: 'header-stores', [
          a(classes: 'store-link', href: betterAppStoreUrl, target: .blank, [.text('App Store')]),
          a(classes: 'store-link outline', href: betterPlayStoreUrl, target: .blank, [.text('Google Play')]),
        ]),
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
        justifyContent: .spaceBetween,
        alignItems: .center,
        gap: .all(12.px),
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
      css('.header-nav', [
        css('&').styles(
          display: .none,
          alignItems: .center,
          gap: .all(4.px),
        ),
        css('.nav-link', [
          css('&').styles(
            padding: .symmetric(horizontal: 14.px, vertical: 8.px),
            radius: .circular(999.px),
            color: betterMuted,
            fontWeight: .w600,
          ),
          css('&:hover').styles(
            color: betterInk,
            backgroundColor: betterElevated,
          ),
        ]),
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
            color: betterBg,
            fontSize: 0.8125.rem,
            fontWeight: .w700,
            whiteSpace: .noWrap,
            backgroundColor: betterAccent,
          ),
          css('&:hover').styles(backgroundColor: const Color('#ffe34d')),
          css('&.outline').styles(
            border: const Border.all(style: .solid, color: betterHairline, width: Unit.pixels(1)),
            color: betterInk,
            backgroundColor: const Color('#ffffff0a'),
          ),
          css('&.outline:hover').styles(backgroundColor: betterElevated),
        ]),
      ]),
    ]),
    css.media(desktop, [
      css('.bettertoday header .header-nav').styles(display: .flex),
    ]),
  ];
}
