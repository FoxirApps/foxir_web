import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _Feature = ({String title, String description});

const List<_Feature> _features = [
  (
    title: 'Create Your Challenge',
    description: 'Set your goal, define the rules, and start with intention.',
  ),
  (
    title: 'Check In Daily',
    description: 'Log your progress in seconds and keep your streak alive.',
  ),
  (
    title: 'Track Visible Progress',
    description: 'See your consistency grow through streaks, stats, and daily momentum.',
  ),
  (
    title: 'Earn XP & Badges',
    description: 'Turn discipline into rewards with levels, badges, and momentum boosts.',
  ),
  (
    title: 'Share Your Milestones',
    description: 'Turn progress into bold shareable posters made for your style.',
  ),
  (
    title: 'Build Your Trophy Wall',
    description: 'Collect completed challenges and milestone posters in one place.',
  ),
];

/// Six feature cards that explain the Vouxe product loop.
class Features extends StatelessComponent {
  const Features({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'features', [
      div(classes: 'container', [
        h2([.text('Everything you need to stay committed')]),
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
    css('.vouxe .features', [
      css('&').styles(
        padding: .symmetric(vertical: 72.px),
        textAlign: .center,
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
          border: const Border.all(style: .solid, color: vouxeHairline, width: Unit.pixels(1)),
          radius: .circular(20.px),
          backgroundColor: vouxeSurface,
        ),
        css('.feature-index').styles(
          color: vouxeAccent,
          fontSize: 0.8125.rem,
          fontWeight: .w700,
          letterSpacing: 0.08.em,
        ),
        css('h3').styles(
          margin: .only(top: 8.px, bottom: 8.px),
          color: vouxeInk,
          fontSize: 1.125.rem,
          fontWeight: .w700,
        ),
        css('p').styles(
          color: vouxeMuted,
          fontSize: 0.9375.rem,
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.vouxe .features', [
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
