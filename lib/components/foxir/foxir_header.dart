import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

enum FoxirNavItem { home, apps, studio, contact }

/// Shared Foxir Apps navigation, based on the product-studio Figma shell.
class FoxirHeader extends StatelessComponent {
  const FoxirHeader({
    this.activeItem = FoxirNavItem.home,
    super.key,
  });

  final FoxirNavItem activeItem;

  @override
  Component build(BuildContext context) {
    return header(classes: 'foxir-header', [
      div(classes: 'foxir-shell header-inner', [
        a(
          classes: 'brand',
          href: '/',
          attributes: const {'aria-label': 'Foxir Apps home'},
          [
            img(
              src: '/images/foxir-logo.png',
              alt: 'Foxir Apps',
              width: 32,
              height: 32,
            ),
          ],
        ),
        nav(
          attributes: const {'aria-label': 'Primary navigation'},
          [
            a(
              classes: 'nav-link${activeItem == FoxirNavItem.home ? ' is-active' : ''}',
              href: '/',
              [.text('Home')],
            ),
            a(
              classes: 'nav-link${activeItem == FoxirNavItem.apps ? ' is-active' : ''}',
              href: '/apps',
              [.text('Apps')],
            ),
            a(
              classes: 'nav-link${activeItem == FoxirNavItem.studio ? ' is-active' : ''}',
              href: '/studio',
              [.text('Studio')],
            ),
            a(
              classes: 'nav-link${activeItem == FoxirNavItem.contact ? ' is-active' : ''}',
              href: foxirContactUrl,
              [.text('Contact')],
            ),
          ],
        ),
        a(classes: 'nav-cta', href: foxirContactUrl, [.text("Let's talk")]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir .foxir-header', [
      css('&').styles(
        position: .sticky(top: .zero),
        zIndex: const ZIndex(20),
        border: const Border.only(
          bottom: BorderSide(
            style: .solid,
            color: foxirHairline,
            width: Unit.pixels(2),
          ),
        ),
        backgroundColor: foxirBg,
        fontFamily: const .list([
          FontFamily('Geist'),
          FontFamilies.sansSerif,
        ]),
      ),
      css('.header-inner').styles(
        display: .flex,
        height: 96.px,
        padding: .symmetric(horizontal: 24.px),
        justifyContent: .spaceBetween,
        alignItems: .center,
      ),
      css('.brand').styles(
        display: .flex,
        width: 40.px,
        height: 40.px,
        justifyContent: .start,
        alignItems: .center,
      ),
      css('.brand img').styles(
        width: 32.px,
        height: 32.px,
      ),
      css('nav').styles(
        display: .flex,
        alignItems: .center,
        gap: .all(14.px),
      ),
      css('.nav-link', [
        css('&').styles(
          position: const Position.relative(),
          color: foxirInk,
          fontSize: 0.75.rem,
          fontWeight: .w600,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
          raw: {'transition': 'color 160ms ease'},
        ),
        css('&:hover, &:focus-visible').styles(color: foxirAccent),
        css('&.is-active').styles(color: foxirAccent),
        css('&.is-active::after').styles(
          position: .absolute(
            left: .zero,
            right: .zero,
            bottom: (-10).px,
          ),
          height: 2.px,
          backgroundColor: foxirAccent,
          raw: {'content': '""'},
        ),
      ]),
      css('.nav-cta', [
        css('&').styles(
          display: .none,
          minHeight: 48.px,
          padding: .symmetric(horizontal: 22.px),
          border: const Border.all(
            style: .solid,
            color: foxirInk,
            width: Unit.pixels(2),
          ),
          justifyContent: .center,
          alignItems: .center,
          color: foxirInk,
          fontSize: 0.6875.rem,
          fontWeight: .w600,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
          whiteSpace: .noWrap,
          raw: {
            'transition': 'background-color 160ms ease, color 160ms ease, border-color 160ms ease',
          },
        ),
        css('&:hover, &:focus-visible').styles(
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
      css('.foxir .foxir-header', [
        css('.header-inner').styles(
          raw: {
            'padding-left': 'clamp(48px, 6vw, 112px)',
            'padding-right': 'clamp(48px, 6vw, 112px)',
          },
        ),
        css('nav').styles(
          display: .flex,
          alignItems: .center,
          gap: .all(40.px),
        ),
        css('.nav-cta').styles(
          display: .flex,
          minWidth: 144.px,
          padding: .symmetric(horizontal: 32.px),
        ),
      ]),
    ]),
  ];
}
