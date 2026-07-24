import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _Feature = ({String title, String description, List<String> chips});

const List<_Feature> _features = [
  (
    title: 'Effortless Mental Clarity',
    description:
        'We believe that task tracking should be more than just a chore—it should bring peace. Our commitment to '
        'simplicity delivers clarity with effortless ease, ensuring you feel secure and in control.',
    chips: [
      'Quick Task Capture',
      'Calming Reminders',
      'Evidence-Based Validation',
      'Secure Evidence Gallery',
      'Minimalist Task Manager',
      'End-of-Day Assurance',
    ],
  ),
  (
    title: 'Support That Understands You',
    description:
        'Our thoughtful system doesn\u2019t just track tasks—it understands your unique needs and adapts to you. '
        'Paximus\u2019s user-focused design feels personal, helping you find calm without added stress.',
    chips: [
      'Intuitive Task Tracking',
      'Calming Daily Reminders',
      'Quick Worry Capture',
      'Personalized Mind Notes',
      'Evidence for Reassurance',
      'Sleep Assurance Prompt',
    ],
  ),
  (
    title: 'True Support For You',
    description:
        'At Paximus, we believe that your peace deserves true support. We\u2019ve built our platform on the principle '
        'of ease to ensure you\u2019re supported fully, fostering a sustainable and calming daily routine.',
    chips: [
      'Clear Task Validation',
      'Gentle Daily Reminders',
      'Instant Worry Capture',
      'Private Evidence Gallery',
      'Simple Routine Building',
      'Restful Sleep Assurance',
    ],
  ),
];

/// Three feature blocks, each with a description and a set of feature chips.
class Features extends StatelessComponent {
  const Features({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'features', [
      div(classes: 'container', [
        span(classes: 'features-eyebrow', [.text('Features')]),
        h2([.text('The simple, calm, and caring way to thrive')]),
        div(classes: 'features-grid', [
          for (final feature in _features)
            div(classes: 'feature-card', [
              h3([.text(feature.title)]),
              p([.text(feature.description)]),
              ul(classes: 'feature-chips', [
                for (final chip in feature.chips) li([.text(chip)]),
              ]),
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
        letterSpacing: 0.12.em,
        textTransform: .upperCase,
      ),
      css('h2').styles(
        maxWidth: 20.em,
        margin: .symmetric(horizontal: Unit.auto),
        fontSize: 1.875.rem,
        fontWeight: .w700,
        lineHeight: 1.2.em,
        letterSpacing: (-0.01).em,
      ),
      css('.features-grid').styles(
        display: .grid,
        margin: .only(top: 48.px),
        gap: .all(20.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      css('.feature-card', [
        css('&').styles(
          padding: .all(28.px),
          radius: .circular(24.px),
          textAlign: .start,
          backgroundColor: surface,
        ),
        css('h3').styles(
          fontSize: 1.25.rem,
          fontWeight: .w700,
        ),
        css('p').styles(
          margin: .symmetric(vertical: 12.px),
          color: muted,
          fontSize: 0.9375.rem,
        ),
      ]),
      css('.feature-chips', [
        css('&').styles(
          display: .flex,
          flexWrap: .wrap,
          gap: .all(8.px),
          listStyle: .none,
        ),
        css('li').styles(
          padding: .symmetric(horizontal: 12.px, vertical: 5.px),
          border: const Border.all(style: .solid, color: hairline, width: Unit.pixels(1)),
          radius: .circular(999.px),
          fontSize: 0.8125.rem,
          fontWeight: .w600,
          backgroundColor: Colors.white,
        ),
      ]),
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
