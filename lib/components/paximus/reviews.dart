import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// Shared review snippets for the Paximus reviews section.
const paximusReviews = [
  (
    quote: 'Finally a tracker that feels calming instead of stressful.',
    name: 'Alex R',
    role: 'Therapist',
  ),
  (
    quote: 'Quick worry capture and end-of-day assurance changed my evenings.',
    name: 'Sam K',
    role: 'Designer',
  ),
  (
    quote: 'Evidence gallery gives me reassurance without the spiral.',
    name: 'Jordan M',
    role: 'Student',
  ),
];

/// Full reviews section anchored at `#reviews`.
class Reviews extends StatelessComponent {
  const Reviews({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'reviews', classes: 'reviews', [
      div(classes: 'container', [
        span(classes: 'reviews-eyebrow', [.text('Reviews')]),
        h2([.text('Calm words from people who use Paximus')]),
        div(classes: 'reviews-grid', [
          for (final review in paximusReviews)
            blockquote(classes: 'review-card', [
              p([.text('\u201C${review.quote}\u201D')]),
              footer([
                span(classes: 'review-name', [.text(review.name)]),
                span(classes: 'review-role', [.text(review.role)]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.paximus .reviews', [
      css('&').styles(
        padding: .symmetric(vertical: 72.px),
        textAlign: .center,
      ),
      css('.reviews-eyebrow').styles(
        display: .block,
        margin: .only(bottom: 12.px),
        color: muted,
        fontSize: 0.875.rem,
        fontWeight: .w700,
        letterSpacing: 0.12.em,
        textTransform: .upperCase,
      ),
      css('h2').styles(
        maxWidth: 18.em,
        margin: .symmetric(horizontal: Unit.auto),
        fontSize: 1.875.rem,
        fontWeight: .w700,
        letterSpacing: (-0.02).em,
      ),
      css('.reviews-grid').styles(
        display: .grid,
        margin: .only(top: 40.px),
        gap: .all(16.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
        textAlign: .start,
      ),
      css('.review-card', [
        css('&').styles(
          display: .flex,
          padding: .all(24.px),
          border: const Border.all(style: .solid, color: Color('#e4e8ef'), width: Unit.pixels(1)),
          radius: .circular(20.px),
          flexDirection: .column,
          justifyContent: .spaceBetween,
          gap: .all(20.px),
          backgroundColor: const Color('#ffffffcc'),
        ),
        css('p').styles(
          fontSize: 1.rem,
          fontWeight: .w500,
          lineHeight: 1.45.em,
        ),
        css('footer').styles(
          display: .flex,
          flexDirection: .column,
          gap: .all(2.px),
        ),
        css('.review-name').styles(fontSize: 0.875.rem, fontWeight: .w700),
        css('.review-role').styles(color: muted, fontSize: 0.8125.rem, fontWeight: .w500),
      ]),
    ]),
    css.media(desktop, [
      css('.paximus .reviews', [
        css('&').styles(padding: .symmetric(vertical: 96.px)),
        css('h2').styles(fontSize: 2.25.rem),
        css('.reviews-grid').styles(
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
