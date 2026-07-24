import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// Sticky top bar for the Foxir Apps umbrella site.
class FoxirHeader extends StatelessComponent {
  const FoxirHeader({super.key});

  @override
  Component build(BuildContext context) {
    return header([
      div(classes: 'container header-inner', [
        a(classes: 'brand', href: '/', [
          img(src: 'images/foxir-logo.png', alt: 'Foxir Apps logo', width: 28, height: 28),
          span([.text('Foxir Apps')]),
        ]),
        nav([
          a(classes: 'nav-link', href: '/#apps', [.text('Apps')]),
          a(classes: 'nav-link', href: '/#about', [.text('About')]),
          a(classes: 'nav-cta', href: foxirContactUrl, [.text('Contact')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir header', [
      css('&').styles(
        position: .sticky(top: .zero),
        zIndex: const ZIndex(10),
        border: const Border.only(bottom: BorderSide(style: .solid, color: foxirHairline, width: Unit.pixels(1))),
        backgroundColor: const Color('#0d0d0de6'),
        backdropFilter: const Filter.blur(Unit.pixels(16)),
      ),
      css('.header-inner').styles(
        display: .flex,
        height: 64.px,
        justifyContent: .spaceBetween,
        alignItems: .center,
      ),
      css('.brand').styles(
        display: .flex,
        alignItems: .center,
        gap: .all(10.px),
        color: foxirInk,
        fontSize: 1.125.rem,
        fontWeight: .w700,
      ),
      css('nav', [
        css('&').styles(
          display: .flex,
          alignItems: .center,
          gap: .all(8.px),
        ),
        css('.nav-link', [
          css('&').styles(
            padding: .symmetric(horizontal: 14.px, vertical: 8.px),
            radius: .circular(999.px),
            color: foxirMuted,
            fontWeight: .w600,
          ),
          css('&:hover').styles(
            color: foxirInk,
            backgroundColor: foxirElevated,
          ),
        ]),
        css('.nav-cta', [
          css('&').styles(
            padding: .symmetric(horizontal: 18.px, vertical: 9.px),
            radius: .circular(999.px),
            color: Colors.white,
            fontWeight: .w600,
            whiteSpace: .noWrap,
            backgroundColor: foxirAccent,
          ),
          css('&:hover').styles(backgroundColor: const Color('#ff6a2e')),
        ]),
      ]),
    ]),
    css('.foxir header .nav-link').styles(display: .none),
    css.media(desktop, [
      css('.foxir header .nav-link').styles(display: .inlineBlock),
    ]),
  ];
}
