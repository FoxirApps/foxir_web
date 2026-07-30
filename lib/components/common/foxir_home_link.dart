import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Compact breadcrumb link back to the Foxir Apps home page.
final class FoxirHomeLink extends StatelessComponent {
  const FoxirHomeLink({super.key});

  @override
  Component build(BuildContext context) {
    return a(
      classes: 'foxir-home-link',
      href: '/',
      attributes: const {
        'aria-label': 'Back to Foxir Apps home',
        'title': 'Back to Foxir Apps',
      },
      [
        span(classes: 'foxir-home-arrow', [.text('\u2190')]),
        span(classes: 'foxir-home-label', [.text('Foxir Apps')]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.header-brands').styles(
      display: .flex,
      minWidth: Unit.zero,
      alignItems: .center,
      gap: .all(10.px),
    ),
    css('.foxir-home-link', [
      css('&').styles(
        display: .flex,
        alignItems: .center,
        gap: .all(6.px),
        fontSize: 0.8125.rem,
        fontWeight: .w600,
        whiteSpace: .noWrap,
        raw: {
          'opacity': '0.62',
          'transition': 'opacity 160ms ease, transform 160ms ease',
        },
      ),
      css('&:hover').styles(
        opacity: 1,
        raw: {'transform': 'translateX(-2px)'},
      ),
      css('&:focus-visible').styles(
        opacity: 1,
        raw: {
          'outline': '2px solid currentColor',
          'outline-offset': '4px',
          'border-radius': '4px',
        },
      ),
    ]),
    css('.foxir-home-arrow').styles(
      fontSize: 1.rem,
      lineHeight: 1.em,
    ),
    css('.brand-divider').styles(
      opacity: 0.28,
      userSelect: .none,
    ),
    css.media(MediaQuery.screen(maxWidth: Unit.pixels(767)), [
      css('.foxir-home-label').styles(display: .none),
      css('.brand-divider').styles(display: .none),
      css('.header-brands').styles(gap: .all(8.px)),
    ]),
    css.media(MediaQuery.screen(maxWidth: Unit.pixels(479)), [
      css('.header-brands .brand span').styles(display: .none),
    ]),
  ];
}
