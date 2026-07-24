import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef VouxeReview = ({String quote, String name, String role});

/// Shared review list for hero strip and reviews section.
const List<VouxeReview> vouxeReviews = [
  (
    quote: 'Vouxe made my progress feel real, not just logged.',
    name: 'Maya T',
    role: 'Product Designer',
  ),
  (
    quote: 'The daily check-in is so simple that I actually stick to it.',
    name: 'Ethan K',
    role: 'Content Creator',
  ),
  (
    quote: 'I love seeing my streak, stats, and progress all in one place.',
    name: 'Sophie L',
    role: 'Startup Founder',
  ),
  (
    quote: 'The milestone posters made me want to keep going.',
    name: 'Jordan L',
    role: 'Fitness Coach',
  ),
  (
    quote: 'It feels more like a commitment than a habit tracker.',
    name: 'Daniel C',
    role: 'Indie Maker',
  ),
  (
    quote: 'Vouxe turned consistency into something I\u2019m proud to share.',
    name: 'Nina V',
    role: 'Brand Strategist',
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
        h2([.text('People aren\u2019t just tracking. They\u2019re proving it.')]),
        div(classes: 'quotes-grid', [
          for (final item in vouxeReviews)
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
    css('.vouxe .reviews', [
      css('&').styles(
        padding: .symmetric(vertical: 72.px),
        textAlign: .center,
      ),
      css('.reviews-eyebrow').styles(
        display: .block,
        margin: .only(bottom: 12.px),
        color: vouxeMuted,
        fontSize: 0.875.rem,
        fontWeight: .w700,
        letterSpacing: 0.12.em,
        textTransform: .upperCase,
      ),
      css('h2').styles(
        maxWidth: 16.em,
        margin: .symmetric(horizontal: Unit.auto),
        color: vouxeInk,
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
          border: const Border.all(style: .solid, color: vouxeHairline, width: Unit.pixels(1)),
          radius: .circular(20.px),
          flexDirection: .column,
          justifyContent: .spaceBetween,
          gap: .all(20.px),
          backgroundColor: vouxeSurface,
        ),
        css('p').styles(
          color: vouxeInk,
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
          color: vouxeAccent,
          fontSize: 0.875.rem,
          fontWeight: .w700,
        ),
        css('.quote-role').styles(
          color: vouxeMuted,
          fontSize: 0.8125.rem,
          fontWeight: .w500,
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.vouxe .reviews', [
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
