import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _FooterLink = ({String label, String url, bool external});

const List<({String title, List<_FooterLink> links})> _columns = [
  (
    title: 'Social',
    links: [
      (label: 'Instagram', url: foxirInstagramUrl, external: true),
      (label: 'LinkedIn', url: linkedinUrl, external: true),
      (label: 'Twitter / X', url: twitterUrl, external: true),
    ],
  ),
  (
    title: 'Apps',
    links: [
      (label: 'Paximus', url: '/paximus', external: false),
      (label: 'Vouxe', url: '/vouxe', external: false),
      (label: 'Better Today', url: '/bettertoday', external: false),
    ],
  ),
];

/// Shared Foxir footer using only live product and social destinations.
class FoxirFooter extends StatelessComponent {
  const FoxirFooter({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'foxir-shell foxir-footer', [
      div(classes: 'footer-inner', [
        div(classes: 'footer-brand', [
          a(
            href: '/',
            classes: 'footer-logo',
            attributes: const {'aria-label': 'Foxir Apps home'},
            [
              img(
                src: '/images/foxir-logo.png',
                alt: 'Foxir Apps',
                width: 48,
                height: 48,
              ),
              span([.text('Foxir Apps')]),
            ],
          ),
          p([
            .text('© 2026 Foxir Apps.'),
            br(),
            .text('Crafted with fierce energy.'),
          ]),
        ]),
        div(classes: 'footer-columns', [
          for (final column in _columns)
            div(classes: 'footer-column', [
              h2([.text(column.title)]),
              ul([
                for (final link in column.links)
                  li([
                    a(
                      href: link.url,
                      target: link.external ? .blank : null,
                      attributes: link.external ? const {'rel': 'noopener noreferrer'} : null,
                      [.text(link.label)],
                    ),
                  ]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir .foxir-footer', [
      css('&').styles(
        padding: .symmetric(horizontal: 24.px, vertical: 72.px),
        border: const Border.all(
          style: .solid,
          color: Color('#2a2a2a80'),
          width: Unit.pixels(2),
        ),
        backgroundColor: foxirBg,
        fontFamily: const .list([
          FontFamily('Geist'),
          FontFamilies.sansSerif,
        ]),
      ),
      css('.footer-inner').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(56.px),
      ),
      css('.footer-brand').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(28.px),
      ),
      css('.footer-logo').styles(
        display: .flex,
        alignItems: .center,
        gap: .all(14.px),
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontSize: 1.5.rem,
        fontWeight: .w800,
        letterSpacing: (-0.02).em,
        textTransform: .upperCase,
      ),
      css('.footer-logo img').styles(
        width: 48.px,
        height: 48.px,
      ),
      css('.footer-brand p').styles(
        color: foxirMuted,
        fontSize: 1.rem,
        fontWeight: .w300,
        lineHeight: 1.6.em,
      ),
      css('.footer-columns').styles(
        display: .grid,
        gap: .all(40.px),
        gridTemplate: const GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
      css('.footer-column h2').styles(
        margin: .only(bottom: 20.px),
        color: foxirAccent,
        fontSize: 0.6875.rem,
        fontWeight: .w600,
        letterSpacing: 0.1.em,
        lineHeight: 1.4.em,
        textTransform: .upperCase,
      ),
      css('.footer-column ul').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(12.px),
        listStyle: .none,
      ),
      css('.footer-column a', [
        css('&').styles(
          color: foxirInk,
          fontFamily: const .list([
            FontFamily('Hanken Grotesk'),
            FontFamilies.sansSerif,
          ]),
          fontSize: 1.125.rem,
          fontWeight: .w600,
          letterSpacing: (-0.01).em,
          textTransform: .upperCase,
          raw: {'transition': 'color 160ms ease'},
        ),
        css('&:hover, &:focus-visible').styles(color: foxirAccent),
      ]),
    ]),
    css.media(desktop, [
      css('.foxir .foxir-footer', [
        css('&').styles(
          minHeight: 380.px,
          padding: .symmetric(vertical: 96.px),
          raw: {
            'padding-left': 'clamp(48px, 6vw, 112px)',
            'padding-right': 'clamp(48px, 6vw, 112px)',
          },
        ),
        css('.footer-inner').styles(
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .start,
        ),
        css('.footer-brand').styles(width: 372.px),
        css('.footer-brand p').styles(
          fontSize: 1.25.rem,
          lineHeight: 1.6.em,
        ),
        css('.footer-columns').styles(
          width: 52.percent,
          gap: .all(64.px),
        ),
        css('.footer-column a').styles(fontSize: 1.5.rem),
      ]),
    ]),
  ];
}
