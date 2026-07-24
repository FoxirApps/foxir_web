import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _Feature = ({String title, String description});

const List<_Feature> _features = [
  (
    title: 'Capture Worries Fast',
    description: 'Save a thought in seconds before it starts to spiral.',
  ),
  (
    title: 'Validate with Evidence',
    description: 'Attach proof to completed tasks and revisit it when doubt returns.',
  ),
  (
    title: 'Gentle Reminders',
    description: 'Stay on track with calm prompts that never add pressure.',
  ),
  (
    title: 'Private Evidence Gallery',
    description: 'Keep reassuring photos and notes organized in one private place.',
  ),
  (
    title: 'Build Simple Routines',
    description: 'Create repeatable daily flows without a crowded task list.',
  ),
  (
    title: 'End the Day Reassured',
    description: 'Review what you completed and settle into rest with confidence.',
  ),
];

/// Six compact cards that highlight Paximus's core calming features.
class Features extends StatelessComponent {
  const Features({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'features', [
      div(classes: 'container', [
        span(classes: 'features-eyebrow', [.text('Features')]),
        h2([.text('Calmer days, one simple step at a time')]),
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
    css('.paximus .features', [
      css('&').styles(
        padding: .symmetric(vertical: 72.px),
        textAlign: .center,
      ),
      css('.features-eyebrow').styles(
        display: .block,
        margin: .only(bottom: 12.px),
        color: muted,
        fontSize: 0.875.rem,
        fontWeight: .w700,
        textTransform: .upperCase,
        letterSpacing: 0.12.em,
      ),
      css('h2').styles(
        maxWidth: 20.em,
        margin: .symmetric(horizontal: Unit.auto),
        fontSize: 1.875.rem,
        fontWeight: .w700,
        letterSpacing: (-0.01).em,
        lineHeight: 1.2.em,
      ),
      css('.features-grid').styles(
        display: .grid,
        margin: .only(top: 48.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
        gap: .all(16.px),
      ),
      css('.feature-card', [
        css('&').styles(
          display: .flex,
          minHeight: 180.px,
          padding: .all(24.px),
          border: const Border.all(
            style: .solid,
            color: Color('#dce5ed'),
            width: Unit.pixels(1),
          ),
          radius: .circular(20.px),
          shadow: const BoxShadow(
            offsetX: Unit.zero,
            offsetY: Unit.pixels(10),
            blur: Unit.pixels(30),
            color: Color('#45637a12'),
          ),
          backdropFilter: const Filter.blur(Unit.pixels(12)),
          flexDirection: .column,
          textAlign: .start,
          backgroundColor: const Color('#ffffffc7'),
        ),
        css('.feature-index').styles(
          display: .inlineFlex,
          width: 36.px,
          height: 36.px,
          margin: .only(bottom: 20.px),
          radius: .circular(999.px),
          justifyContent: .center,
          alignItems: .center,
          color: const Color('#526b7f'),
          fontSize: 0.75.rem,
          fontWeight: .w700,
          letterSpacing: 0.08.em,
          backgroundColor: const Color('#e9f0f6'),
        ),
        css('h3').styles(
          fontSize: 1.125.rem,
          fontWeight: .w700,
          lineHeight: 1.3.em,
        ),
        css('p').styles(
          margin: .only(top: 10.px),
          color: muted,
          fontSize: 0.9375.rem,
          lineHeight: 1.55.em,
        ),
      ]),
    ]),
    css.media(const MediaQuery.all(canHover: true), [
      css('.paximus .feature-card', [
        css('&').styles(
          raw: {
            'transition':
                'transform 180ms ease, border-color 180ms ease, box-shadow 180ms ease, background-color 180ms ease',
          },
        ),
        css('&:hover').styles(
          border: const Border.all(
            style: .solid,
            color: Color('#c8d6e2'),
            width: Unit.pixels(1),
          ),
          shadow: const BoxShadow(
            offsetX: Unit.zero,
            offsetY: Unit.pixels(16),
            blur: Unit.pixels(36),
            color: Color('#45637a1a'),
          ),
          backgroundColor: const Color('#ffffffeb'),
          raw: {'transform': 'translateY(-4px)'},
        ),
      ]),
    ]),
    css.media(const MediaQuery.raw('(prefers-reduced-motion: reduce) and (hover: hover)'), [
      css('.paximus .feature-card').styles(raw: {'transition': 'none'}),
    ]),
    css.media(desktop, [
      css('.paximus .features', [
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
