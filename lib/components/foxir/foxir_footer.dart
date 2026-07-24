import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _FooterLink = ({String label, String url, bool external});

const List<({String title, List<_FooterLink> links})> _columns = [
  (
    title: 'Site',
    links: [
      (label: 'Apps', url: '#apps', external: false),
      (label: 'About', url: '#about', external: false),
      (label: 'Contact', url: foxirContactUrl, external: true),
    ],
  ),
  (
    title: 'Apps',
    links: [
      (label: 'Paximus', url: '/paximus', external: false),
      (label: 'Vouxe', url: '/vouxe', external: false),
    ],
  ),
  (
    title: 'Socials',
    links: [
      (label: 'Twitter/X', url: twitterUrl, external: true),
      (label: 'LinkedIn', url: linkedinUrl, external: true),
      (label: 'Instagram', url: foxirInstagramUrl, external: true),
      (label: 'YouTube', url: youtubeUrl, external: true),
    ],
  ),
];

/// Footer of the Foxir Apps umbrella site.
class FoxirFooter extends StatelessComponent {
  const FoxirFooter({super.key});

  @override
  Component build(BuildContext context) {
    return footer([
      div(classes: 'container', [
        div(classes: 'footer-top', [
          div(classes: 'footer-brand', [
            img(src: 'images/foxir-logo.png', alt: 'Foxir Apps logo', width: 32, height: 32),
            span([.text('Foxir Apps')]),
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
          span([.text('\u00A9 2025 Foxir Apps. All rights reserved.')]),
          span([.text('Innovative mobile experiences.')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir footer', [
      css('&').styles(
        padding: .only(top: 56.px),
        border: const Border.only(top: BorderSide(style: .solid, color: foxirHairline, width: Unit.pixels(1))),
      ),
      css('.footer-top').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(40.px),
      ),
      css('.footer-brand').styles(
        display: .flex,
        alignItems: .center,
        gap: .all(12.px),
        color: foxirInk,
        fontSize: 1.25.rem,
        fontWeight: .w700,
      ),
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
          color: foxirInk,
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
          css('&').styles(color: foxirMuted, fontWeight: .w500),
          css('&:hover').styles(color: foxirInk),
        ]),
      ]),
      css('.footer-bottom').styles(
        display: .flex,
        margin: .only(top: 48.px),
        padding: .symmetric(vertical: 24.px),
        border: const Border.only(top: BorderSide(style: .solid, color: foxirHairline, width: Unit.pixels(1))),
        justifyContent: .spaceBetween,
        flexWrap: .wrap,
        gap: .all(8.px),
        color: foxirMuted,
        fontSize: 0.875.rem,
      ),
    ]),
    css.media(desktop, [
      css('.foxir footer', [
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
