import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _Step = ({String number, String title, String description});

const List<_Step> _steps = [
  (
    number: '01',
    title: 'Discovery',
    description: 'We understand your vision, audience and goals before writing a single line.',
  ),
  (
    number: '02',
    title: 'Concept',
    description: 'Wireframes and UX flows shaped around your brand identity.',
  ),
  (
    number: '03',
    title: 'Design',
    description: 'Intuitive UI and interactive prototypes, refined with your feedback.',
  ),
  (
    number: '04',
    title: 'Launch',
    description: 'Build, test, ship — with stable deployment and ongoing support.',
  ),
];

/// Mission statement plus a condensed four-step process overview.
class FoxirAbout extends StatelessComponent {
  const FoxirAbout({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'about', [
      div(classes: 'container', [
        h2([.text('Craft high-performance mobile apps to boost business growth.')]),
        p(classes: 'about-mission', [
          .text('Your ideas deserve the best execution. Our mission is to deliver scalable, '
              'user-focused apps that drive engagement and innovation. Empower your brand with '
              'seamless digital experiences that leave a lasting impact.'),
        ]),
        div(classes: 'about-steps', [
          for (final step in _steps)
            div(classes: 'about-step', [
              span(classes: 'step-number', [.text(step.number)]),
              h3([.text(step.title)]),
              p([.text(step.description)]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir .about', [
      css('&').styles(
        padding: .symmetric(vertical: 72.px),
        textAlign: .center,
      ),
      css('h2').styles(
        maxWidth: 18.em,
        margin: .symmetric(horizontal: Unit.auto),
        color: foxirInk,
        fontSize: 1.875.rem,
        fontWeight: .w700,
        lineHeight: 1.2.em,
        letterSpacing: (-0.01).em,
      ),
      css('.about-mission').styles(
        maxWidth: 40.em,
        margin: .only(top: 16.px, left: Unit.auto, right: Unit.auto),
        color: foxirMuted,
        fontSize: 1.0625.rem,
        fontWeight: .w500,
      ),
      css('.about-steps').styles(
        display: .grid,
        margin: .only(top: 48.px),
        gap: .all(16.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      css('.about-step', [
        css('&').styles(
          padding: .all(24.px),
          border: const Border.all(style: .solid, color: foxirHairline, width: Unit.pixels(1)),
          radius: .circular(20.px),
          textAlign: .start,
          backgroundColor: foxirSurface,
        ),
        css('.step-number').styles(
          color: foxirAccent,
          fontSize: 0.8125.rem,
          fontWeight: .w700,
          letterSpacing: 0.1.em,
        ),
        css('h3').styles(
          margin: .symmetric(vertical: 6.px),
          color: foxirInk,
          fontSize: 1.125.rem,
          fontWeight: .w700,
        ),
        css('p').styles(
          color: foxirMuted,
          fontSize: 0.9375.rem,
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.foxir .about', [
        css('&').styles(padding: .symmetric(vertical: 96.px)),
        css('h2').styles(fontSize: 2.25.rem),
        css('.about-steps').styles(
          gridTemplate: const GridTemplate(
            columns: GridTracks([
              GridTrack(TrackSize.fr(1)),
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
