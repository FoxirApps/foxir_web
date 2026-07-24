import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _Feature = ({String title, String description});

const List<_Feature> _features = [
  (
    title: 'Daily Mirror Check-In',
    description: 'End each day with one honest question and capture a single takeaway.',
  ),
  (
    title: 'Insightful Trends',
    description: 'See what truly moves you forward with clear patterns and simple analytics.',
  ),
  (
    title: 'Masterpiece Timeline',
    description: 'Track weeks and years of progress on a clean timeline that highlights consistency.',
  ),
  (
    title: 'Set Clear Intentions',
    description: 'Define one small, meaningful intention for tomorrow—no endless to-do lists.',
  ),
  (
    title: 'Smart Reminders',
    description: 'Get gentle nudges for reflections and streaks without noise or pressure.',
  ),
  (
    title: 'Secure & Private',
    description: 'Your reflections are protected with strong privacy controls—your journey stays yours.',
  ),
];

/// Six feature cards that explain the Better Today product loop.
class Features extends StatelessComponent {
  const Features({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'features', [
      div(classes: 'container', [
        h2([.text('Own Your Growth Journey')]),
        p(classes: 'features-subtitle', [
          .text('Build clarity, keep momentum, and turn small steps into lasting excellence.'),
        ]),
        div(classes: 'features-grid', [
          for (var i = 0; i < _features.length; i++)
            div(classes: 'feature-card', [
              span(classes: 'feature-index', [.text((i + 1).toString().padLeft(2, '0'))]),
              h3([.text(_features[i].title)]),
              p([.text(_features[i].description)]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bettertoday .features', [
      css('&').styles(
        padding: .symmetric(vertical: 72.px),
        textAlign: .center,
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
      css('.features-subtitle').styles(
        maxWidth: 34.em,
        margin: .only(top: 12.px, left: Unit.auto, right: Unit.auto),
        color: betterMuted,
        fontSize: 1.0625.rem,
        fontWeight: .w500,
      ),
      css('.features-grid').styles(
        display: .grid,
        margin: .only(top: 40.px),
        gap: .all(16.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
        textAlign: .start,
      ),
      css('.feature-card', [
        css('&').styles(
          padding: .all(24.px),
          border: const Border.all(style: .solid, color: betterHairline, width: Unit.pixels(1)),
          radius: .circular(20.px),
          backgroundColor: betterSurface,
        ),
        css('.feature-index').styles(
          color: betterAccent,
          fontSize: 0.8125.rem,
          fontWeight: .w700,
          letterSpacing: 0.08.em,
        ),
        css('h3').styles(
          margin: .only(top: 8.px, bottom: 8.px),
          color: betterInk,
          fontSize: 1.125.rem,
          fontWeight: .w700,
        ),
        css('p').styles(
          color: betterMuted,
          fontSize: 0.9375.rem,
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.bettertoday .features', [
        css('&').styles(padding: .symmetric(vertical: 96.px)),
        css('h2').styles(fontSize: 2.25.rem),
        css('.features-grid').styles(
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
