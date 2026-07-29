import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _Feature = ({String title, String description});

const List<_Feature> _features = [
  (
    title: 'The Mirror Moment',
    description: 'End each day by looking inward and answering one honest question.',
  ),
  (
    title: 'One Question Flow',
    description: 'No tasks, goals, or complicated systems—just a simple daily ritual.',
  ),
  (
    title: 'Consistency Calendar',
    description: 'Watch small daily answers turn into a rhythm you can see and sustain.',
  ),
  (
    title: 'Masterpiece Timeline',
    description: 'Zoom out across months, years, and decades to see who you are becoming.',
  ),
  (
    title: 'Mamba Moments',
    description: 'Return to the mindset that progress is built through the process, not shortcuts.',
  ),
  (
    title: 'Gentle Reminders',
    description: 'Receive one respectful nudge that brings you back to the ritual without pressure.',
  ),
];

/// Six feature cards that explain the Better Today product loop.
class Features extends StatelessComponent {
  const Features({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'features', [
      div(classes: 'container', [
        h2([.text('Build your masterpiece, one day at a time.')]),
        p(classes: 'features-subtitle', [
          .text('Everything you need to keep one honest ritual alive for years. Nothing more.'),
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
