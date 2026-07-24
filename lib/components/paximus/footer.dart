import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _FooterLink = ({String label, String url, bool external});

const List<({String title, List<_FooterLink> links})> _columns = [
  (
    title: 'Company',
    links: [
      (label: 'Privacy Policy', url: privacyPolicyUrl, external: false),
      (label: 'Terms of Service', url: termsOfServiceUrl, external: false),
    ],
  ),
  (
    title: 'Downloads',
    links: [
      (label: 'For iPhone', url: appStoreUrl, external: true),
      (label: 'For Android', url: playStoreUrl, external: true),
    ],
  ),
  (
    title: 'Socials',
    links: [
      (label: 'TikTok', url: tiktokUrl, external: true),
      (label: 'Instagram', url: instagramUrl, external: true),
      (label: 'LinkedIn', url: linkedinUrl, external: true),
      (label: 'Twitter/X', url: twitterUrl, external: true),
      (label: 'YouTube', url: youtubeUrl, external: true),
    ],
  ),
];

/// Site footer with brand, link columns and copyright bar.
class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer([
      div(classes: 'container', [
        div(classes: 'footer-top', [
          div(classes: 'footer-brand', [
            img(src: '/images/paximus-icon.png', alt: 'Paximus app icon', width: 40, height: 40),
            span([.text('Paximus')]),
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
          span([.text('\u00A9 2025 Paximus. All rights reserved.')]),
          a(href: '/', [.text('Made by Foxir Apps')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.paximus footer', [
      css('&').styles(
        padding: .only(top: 56.px),
        backgroundColor: surface,
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
          fontSize: 1.25.rem,
          fontWeight: .w700,
        ),
        css('img').styles(radius: .circular(10.px)),
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
          css('&').styles(color: muted, fontWeight: .w500),
          css('&:hover').styles(color: ink),
        ]),
      ]),
      css('.footer-bottom', [
        css('&').styles(
          display: .flex,
          margin: .only(top: 48.px),
          padding: .symmetric(vertical: 24.px),
          border: const Border.only(top: BorderSide(style: .solid, color: hairline, width: Unit.pixels(1))),
          justifyContent: .spaceBetween,
          flexWrap: .wrap,
          gap: .all(8.px),
          color: muted,
          fontSize: 0.875.rem,
        ),
        css('a:hover').styles(color: ink),
      ]),
    ]),
    css.media(desktop, [
      css('.paximus footer', [
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
