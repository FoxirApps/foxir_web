import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _Value = ({String number, String title, String description});

const List<_Value> _values = [
  (
    number: '01',
    title: 'Own products first',
    description: 'We ship apps we believe in—Paximus, Vouxe, Better Today, and more to come.',
  ),
  (
    number: '02',
    title: 'Crafted in-house',
    description: 'Design, engineering, and polish stay close so every detail feels intentional.',
  ),
  (
    number: '03',
    title: 'Calm by design',
    description: 'Interfaces that reduce noise and help people focus on what matters.',
  ),
  (
    number: '04',
    title: 'Built to last',
    description: 'We iterate with real feedback and keep improving long after launch day.',
  ),
];

/// Who we are: the team behind our own apps.
class FoxirAbout extends StatelessComponent {
  const FoxirAbout({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'about', [
      div(classes: 'container', [
        h2([.text('The home of apps we build ourselves.')]),
        p(classes: 'about-mission', [
          .text('Foxir Apps is our product umbrella. We focus on thoughtful mobile '
              'experiences—and if you have an idea you\u2019d love to explore together, '
              'we\u2019re always happy to talk.'),
        ]),
        div(classes: 'about-steps', [
          for (final value in _values)
            div(classes: 'about-step', [
              span(classes: 'step-number', [.text(value.number)]),
              h3([.text(value.title)]),
              p([.text(value.description)]),
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
        maxWidth: 16.em,
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
