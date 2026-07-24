import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef BetterReview = ({String quote, String name, String role});

/// Shared review list for hero strip and reviews section.
const List<BetterReview> betterReviews = [
  (
    quote: 'One honest question at night changed how I show up the next day.',
    name: 'Ava M',
    role: 'Product Manager',
  ),
  (
    quote: 'The timeline makes small steps feel like real momentum.',
    name: 'Leo R',
    role: 'Founder',
  ),
  (
    quote: 'Gentle reminders, zero pressure. I actually stick with it.',
    name: 'Priya S',
    role: 'Designer',
  ),
];

/// Full reviews section anchored at `#reviews`.
class Testimonials extends StatelessComponent {
  const Testimonials({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'reviews', classes: 'reviews', [
      div(classes: 'container', [
        span(classes: 'reviews-eyebrow', [.text('Reviews')]),
        h2([.text('Small reflections. Lasting excellence.')]),
        div(classes: 'quotes-grid', [
          for (final item in betterReviews)
            blockquote(classes: 'quote-card', [
              p([.text('\u201C${item.quote}\u201D')]),
              footer([
                span(classes: 'quote-name', [.text(item.name)]),
                span(classes: 'quote-role', [.text(item.role)]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bettertoday .reviews', [
      css('&').styles(
        padding: .symmetric(vertical: 72.px),
        textAlign: .center,
      ),
      css('.reviews-eyebrow').styles(
        display: .block,
        margin: .only(bottom: 12.px),
        color: betterMuted,
        fontSize: 0.875.rem,
        fontWeight: .w700,
        letterSpacing: 0.12.em,
        textTransform: .upperCase,
      ),
      css('h2').styles(
        maxWidth: 16.em,
        margin: .symmetric(horizontal: Unit.auto),
        color: betterInk,
        fontSize: 1.875.rem,
        fontWeight: .w700,
        lineHeight: 1.2.em,
        letterSpacing: (-0.02).em,
      ),
      css('.quotes-grid').styles(
        display: .grid,
        margin: .only(top: 40.px),
        gap: .all(16.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
        textAlign: .start,
      ),
      css('.quote-card', [
        css('&').styles(
          display: .flex,
          padding: .all(24.px),
          border: const Border.all(style: .solid, color: betterHairline, width: Unit.pixels(1)),
          radius: .circular(20.px),
          flexDirection: .column,
          justifyContent: .spaceBetween,
          gap: .all(20.px),
          backgroundColor: betterSurface,
        ),
        css('p').styles(
          color: betterInk,
          fontSize: 1.rem,
          fontWeight: .w500,
          lineHeight: 1.45.em,
        ),
        css('footer').styles(
          display: .flex,
          flexDirection: .column,
          gap: .all(2.px),
        ),
        css('.quote-name').styles(
          color: betterAccent,
          fontSize: 0.875.rem,
          fontWeight: .w700,
        ),
        css('.quote-role').styles(
          color: betterMuted,
          fontSize: 0.8125.rem,
          fontWeight: .w500,
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.bettertoday .reviews', [
        css('&').styles(padding: .symmetric(vertical: 96.px)),
        css('h2').styles(fontSize: 2.25.rem),
        css('.quotes-grid').styles(
          gridTemplate: const GridTemplate(
            columns: GridTracks([
              GridTrack(TrackSize.fr(1)),
              GridTrack(TrackSize.fr(1)),
              GridTrack(TrackSize.fr(1)),
            ]),
          ),
        ),
      ]),
    ]),
  ];
}
