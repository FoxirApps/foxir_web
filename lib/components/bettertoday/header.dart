import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../common/foxir_home_link.dart';

/// Sticky header: logo | primary download CTA.
class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    return header([
      div(classes: 'container header-inner', [
        div(classes: 'header-brands', [
          const FoxirHomeLink(),
          span(classes: 'brand-divider', [.text('/')]),
          a(classes: 'brand', href: '/bettertoday#top', [
            img(src: betterTodayIconSrc, alt: 'Better Today? logo', width: 34, height: 34),
            span([.text('Better Today?')]),
          ]),
        ]),
        a(classes: 'header-cta', href: '/bettertoday#download', [
          span([.text('Get Better Today')]),
          span(classes: 'header-cta-icon', [.text('\u2192')]),
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
        border: const Border.only(
          bottom: BorderSide(style: .solid, color: betterHairline, width: Unit.pixels(1)),
        ),
        backgroundColor: const Color('#07090cdb'),
        backdropFilter: const Filter.blur(Unit.pixels(22)),
        raw: {
          'box-shadow': '0 12px 40px rgba(0, 0, 0, 0.18)',
        },
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
        css('img').styles(raw: {'object-fit': 'contain'}),
      ]),
      css('.header-cta', [
        css('&').styles(
          display: .flex,
          padding: .symmetric(vertical: 10.px, horizontal: 16.px),
          color: betterBg,
          backgroundColor: betterAccent,
          radius: .circular(999.px),
          alignItems: .center,
          gap: .all(8.px),
          fontSize: 0.875.rem,
          fontWeight: .w700,
          lineHeight: 1.em,
          letterSpacing: (-0.01).em,
          whiteSpace: .noWrap,
          raw: {
            'box-shadow': '0 8px 24px rgba(255, 215, 0, 0.2)',
            'transition': 'transform 180ms ease, box-shadow 180ms ease, background-color 180ms ease',
          },
        ),
        css('&:hover').styles(
          backgroundColor: const Color('#ffe54d'),
          raw: {
            'transform': 'translateY(-1px)',
            'box-shadow': '0 12px 30px rgba(255, 215, 0, 0.3)',
          },
        ),
        css('&:focus-visible').styles(
          raw: {
            'outline': '3px solid rgba(255, 215, 0, 0.32)',
            'outline-offset': '3px',
          },
        ),
      ]),
      css('.header-cta-icon').styles(
        fontSize: 1.rem,
        lineHeight: 1.em,
        raw: {'transition': 'transform 180ms ease'},
      ),
      css('.header-cta:hover .header-cta-icon').styles(
        raw: {'transform': 'translateX(2px)'},
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: Unit.pixels(359)), [
      css('.bettertoday header .brand span').styles(display: .none),
    ]),
  ];
}
