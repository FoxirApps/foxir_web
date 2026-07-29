import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _FooterLink = ({String label, String url, bool external});

const List<({String title, List<_FooterLink> links})> _columns = [
  (
    title: 'Company',
    links: [
      (label: 'Privacy Policy', url: betterPrivacyUrl, external: false),
      (label: 'Terms of Service', url: betterTermsUrl, external: false),
    ],
  ),
  (
    title: 'Downloads',
    links: [
      (label: 'For iPhone', url: betterAppStoreUrl, external: true),
      (label: 'For Android', url: betterPlayStoreUrl, external: true),
    ],
  ),
  (
    title: 'Socials',
    links: [
      (label: 'TikTok', url: betterTiktokUrl, external: true),
      (label: 'Instagram', url: betterInstagramUrl, external: true),
      (label: 'YouTube', url: youtubeUrl, external: true),
    ],
  ),
];

/// Site footer for the Better Today landing page.
class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer([
      div(classes: 'container', [
        div(classes: 'footer-top', [
          div(classes: 'footer-brand', [
            img(src: betterTodayIconSrc, alt: 'Better Today? logo', width: 42, height: 42),
            span([.text('Better Today?')]),
          ]),
          div(classes: 'footer-columns', [
            for (final column in _columns)
              div(classes: 'footer-column', [
                h4([.text(column.title)]),
                ul([
                  for (final link in column.links)
                    li([
                      a(href: link.url, target: link.external ? .blank : null, [.text(link.label)]),
                    ]),
                ]),
              ]),
          ]),
        ]),
        div(classes: 'footer-bottom', [
          span([.text('\u00A9 2026 Better Today?. All rights reserved.')]),
          a(href: '/', [.text('Made by Foxir Apps')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bettertoday footer', [
      css('&').styles(
        padding: .only(top: 56.px),
        border: const Border.only(
          top: BorderSide(style: .solid, color: betterHairline, width: Unit.pixels(1)),
        ),
        backgroundColor: const Color('#040507c9'),
        backdropFilter: const Filter.blur(Unit.pixels(20)),
        raw: {
          'box-shadow': '0 -24px 72px rgba(0, 0, 0, 0.2)',
        },
      ),
      css('.footer-top').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(40.px),
      ),
      css('.footer-brand', [
        css('&').styles(
          display: .flex,
          alignItems: .center,
          gap: .all(12.px),
          color: betterInk,
          fontSize: 1.25.rem,
          fontWeight: .w700,
        ),
        css('img').styles(raw: {'object-fit': 'contain'}),
      ]),
      css('.footer-columns').styles(
        display: .grid,
        gap: .all(32.px),
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
      ),
      css('.footer-column', [
        css('h4').styles(
          margin: .only(bottom: 12.px),
          color: betterInk,
          fontSize: 0.875.rem,
          fontWeight: .w700,
          letterSpacing: 0.08.em,
          textTransform: .upperCase,
        ),
        css('ul').styles(
          display: .flex,
          flexDirection: .column,
          gap: .all(8.px),
          listStyle: .none,
        ),
        css('a', [
          css('&').styles(color: betterMuted, fontWeight: .w500),
          css('&:hover').styles(color: betterInk),
        ]),
      ]),
      css('.footer-bottom', [
        css('&').styles(
          display: .flex,
          margin: .only(top: 48.px),
          padding: .symmetric(vertical: 24.px),
          border: const Border.only(
            top: BorderSide(style: .solid, color: betterHairline, width: Unit.pixels(1)),
          ),
          justifyContent: .spaceBetween,
          flexWrap: .wrap,
          gap: .all(8.px),
          color: betterMuted,
          fontSize: 0.875.rem,
        ),
        css('a:hover').styles(color: betterInk),
      ]),
    ]),
    css.media(desktop, [
      css('.bettertoday footer', [
        css('.footer-top').styles(
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .start,
        ),
        css('.footer-columns').styles(
          gap: .all(64.px),
          gridTemplate: const GridTemplate(
            columns: GridTracks([
              GridTrack(TrackSize.auto),
              GridTrack(TrackSize.auto),
              GridTrack(TrackSize.auto),
            ]),
          ),
        ),
      ]),
    ]),
  ];
}
