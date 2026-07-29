import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _Feature = ({String title, String description});

const List<_Feature> _features = [
  (
    title: 'One Honest Question',
    description: 'Answer “Did I get better today?” in seconds and end the day with clarity.',
  ),
  (
    title: 'Progress Without Pressure',
    description: 'No tasks, scores, or complicated systems—just a daily reflection you can keep.',
  ),
  (
    title: 'Consistency You Can See',
    description: 'Turn daily check-ins into a visual rhythm across your calendar and streaks.',
  ),
  (
    title: 'The Long View',
    description: 'Zoom out from today to months, years, and decades—and see who you are becoming.',
  ),
  (
    title: 'Mamba Moments',
    description: 'Stay close to a process-first mindset: show up, do the work, and let time compound it.',
  ),
  (
    title: 'Gentle Reminders',
    description: 'Get one respectful nudge to pause, reflect, and return to the ritual.',
  ),
];

/// Six feature cards that explain the Better Today product loop.
class Features extends StatelessComponent {
  const Features({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'features', [
      div(classes: 'container', [
        h2([.text('Simple enough for today. Meaningful enough for years.')]),
        p(classes: 'features-subtitle', [
          .text(
            'One daily reflection, gentle reminders, and a visual record of '
            'the days you chose to show up.',
          ),
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
        border: const Border.symmetric(
          horizontal: BorderSide(
            style: .solid,
            color: Color('#ffffff12'),
            width: Unit.pixels(1),
          ),
        ),
        textAlign: .center,
        backgroundColor: const Color('#07090dc7'),
        backdropFilter: const Filter.blur(Unit.pixels(18)),
        raw: {
          'box-shadow':
              'inset 0 1px 0 rgba(255, 255, 255, 0.025), '
              'inset 0 -1px 0 rgba(255, 215, 0, 0.025)',
        },
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
          border: const Border.all(
            style: .solid,
            color: Color('#ffffff16'),
            width: Unit.pixels(1),
          ),
          radius: .circular(20.px),
          backgroundColor: const Color('#0c0f15d9'),
          backdropFilter: const Filter.blur(Unit.pixels(20)),
          raw: {
            'box-shadow':
                '0 18px 50px rgba(0, 0, 0, 0.24), '
                'inset 0 1px 0 rgba(255, 255, 255, 0.035)',
            'transition': 'transform 180ms ease, border-color 180ms ease, background-color 180ms ease',
          },
        ),
        css('&:hover').styles(
          border: const Border.all(
            style: .solid,
            color: Color('#ffd7004a'),
            width: Unit.pixels(1),
          ),
          backgroundColor: const Color('#11151ddf'),
          raw: {'transform': 'translateY(-3px)'},
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
