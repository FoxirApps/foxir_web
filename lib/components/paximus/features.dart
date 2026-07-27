import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

enum _FeatureKind { snap, routines, history, mood, notes, calm }

typedef _Feature = ({
  _FeatureKind kind,
  String title,
  String description,
});

const List<_Feature> _features = [
  (
    kind: _FeatureKind.snap,
    title: 'Capture one clear record',
    description:
        'Save a timestamped photo as you complete an everyday task, then let Paximus keep it organized for you.',
  ),
  (
    kind: _FeatureKind.routines,
    title: 'Build calmer routines',
    description: 'Create simple steps for leaving home, bedtime, kitchen safety, work, personal care, or travel.',
  ),
  (
    kind: _FeatureKind.history,
    title: 'Find the moment, fast',
    description:
        'See photo records, completed routines, notes, moods, and calm sessions together in one clear history.',
  ),
  (
    kind: _FeatureKind.mood,
    title: 'Notice how your day feels',
    description: 'Log your mood and spot patterns over time, without scores, streaks, or judgment.',
  ),
  (
    kind: _FeatureKind.notes,
    title: 'Write it—or say it',
    description: 'Save a personal text or voice note with its mood and time attached.',
  ),
  (
    kind: _FeatureKind.calm,
    title: 'Reset when thoughts feel loud',
    description: 'Choose a short breathing, grounding, body-release, sleep-prep, or desk-break exercise.',
  ),
];

/// A responsive bento grid presenting Paximus's six core features.
class Features extends StatelessComponent {
  const Features({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'features', [
      div(classes: 'container', [
        div(classes: 'features-heading', [
          div(classes: 'features-title-group', [
            //span(classes: 'features-eyebrow', [.text('Features')]),
            h2([.text('More than a photo. One calm place for everyday doubt.')]),
          ]),
          p(classes: 'features-intro', [
            .text(
              'Capture a moment, follow a routine, notice patterns, and use short '
              'grounding tools—without streaks, scores, or pressure.',
            ),
          ]),
        ]),
        div(classes: 'features-grid', [
          for (final feature in _features)
            article(classes: 'feature-card feature-card--${feature.kind.name}', [
              _featureVisual(feature.kind),
              div(classes: 'feature-copy', [
                h3([.text(feature.title)]),
                p([.text(feature.description)]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css.keyframes('pax-scan-line', {
      '0%': const Styles(
        opacity: 0,
        raw: {'transform': 'translateY(-44px)'},
      ),
      '20%': const Styles(opacity: 0.7),
      '80%': const Styles(opacity: 0.7),
      '100%': const Styles(
        opacity: 0,
        raw: {'transform': 'translateY(84px)'},
      ),
    }),
    css.keyframes('pax-breathe', {
      '0%': const Styles(
        opacity: 0.72,
        raw: {'transform': 'scale(0.86)'},
      ),
      '50%': const Styles(
        opacity: 1,
        raw: {'transform': 'scale(1.05)'},
      ),
      '100%': const Styles(
        opacity: 0.72,
        raw: {'transform': 'scale(0.86)'},
      ),
    }),
    css('.paximus .features', [
      css('&').styles(
        padding: .symmetric(vertical: 80.px),
      ),
      css('.features-heading').styles(
        display: .grid,
        alignItems: .end,
        gap: .all(24.px),
      ),
      css('.features-title-group').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
        gap: .all(12.px),
      ),
      css('.features-eyebrow').styles(
        color: const Color('#60778a'),
        fontSize: 0.8125.rem,
        fontWeight: .w700,
        textTransform: .upperCase,
        letterSpacing: 0.14.em,
      ),
      css('h2').styles(
        maxWidth: 12.em,
        fontSize: 2.rem,
        fontWeight: .w700,
        letterSpacing: (-0.025).em,
        lineHeight: 1.12.em,
      ),
      css('.features-intro').styles(
        maxWidth: 38.em,
        color: muted,
        fontSize: 1.rem,
        fontWeight: .w500,
        lineHeight: 1.65.em,
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
          position: const Position.relative(),
          minHeight: 390.px,
          padding: .all(18.px),
          border: const Border.all(
            style: .solid,
            color: Color('#dce5ed'),
            width: Unit.pixels(1),
          ),
          radius: .circular(26.px),
          overflow: Overflow.hidden,
          shadow: const BoxShadow(
            offsetX: Unit.zero,
            offsetY: Unit.pixels(14),
            blur: Unit.pixels(36),
            color: Color('#45637a12'),
          ),
          flexDirection: .column,
          textAlign: .start,
          backgroundColor: const Color('#f8fbfd'),
        ),
        css('&::after').styles(
          opacity: 0.65,
          raw: {
            'content': '""',
            'position': 'absolute',
            'z-index': '0',
            'inset': '0',
            'pointer-events': 'none',
            'background': 'linear-gradient(135deg, rgba(255,255,255,0.65), transparent 38%, rgba(255,255,255,0.2))',
          },
        ),
        css('.feature-visual').styles(
          display: .flex,
          position: const Position.relative(),
          zIndex: const ZIndex(1),
          height: 225.px,
          padding: .all(16.px),
          border: const Border.all(
            style: .solid,
            color: Color('#ffffffb8'),
            width: Unit.pixels(1),
          ),
          radius: .circular(20.px),
          overflow: Overflow.hidden,
          flexDirection: .column,
          justifyContent: .center,
          alignItems: .center,
          backgroundColor: const Color('#ffffff73'),
        ),
        css('.feature-visual--asset').styles(
          padding: .all(8.px),
          backgroundColor: const Color('#ffffff9e'),
        ),
        css('.feature-asset').styles(
          width: 100.percent,
          height: 100.percent,
          radius: .circular(15.px),
          raw: {'object-fit': 'contain'},
        ),
        css('.feature-copy').styles(
          display: .flex,
          position: const Position.relative(),
          zIndex: const ZIndex(1),
          margin: .only(top: 22.px),
          flexDirection: .column,
          gap: .all(9.px),
        ),
        css('h3').styles(
          fontSize: 1.1875.rem,
          fontWeight: .w700,
          letterSpacing: (-0.012).em,
          lineHeight: 1.28.em,
        ),
        css('.feature-copy p').styles(
          color: muted,
          fontSize: 0.9375.rem,
          lineHeight: 1.58.em,
        ),
      ]),
      css('.feature-card--snap').styles(
        backgroundColor: const Color('#edf5ff'),
        raw: {
          'background-image': 'linear-gradient(160deg, #fbfdff 0%, #e8f3ff 100%)',
        },
      ),
      css('.feature-card--snap .feature-visual--asset').styles(
        padding: .zero,
        border: Border.none,
        backgroundColor: Colors.transparent,
      ),
      css('.feature-card--routines').styles(
        backgroundColor: const Color('#fcfaf8'),
        raw: {
          'background-image':
              'radial-gradient(circle at 88% 12%, rgba(222, 237, 220, 0.68), transparent 40%), '
              'radial-gradient(circle at 12% 88%, rgba(255, 226, 208, 0.48), transparent 42%), '
              'linear-gradient(155deg, #fffdfb 0%, #fbf9f7 58%, #f3f7f1 100%)',
        },
      ),
      css('.feature-card--routines .feature-visual--asset').styles(
        padding: .zero,
        border: Border.none,
        backgroundColor: const Color('#fcfaf8'),
      ),
      css('.feature-card--routines .feature-visual').styles(height: 285.px),
      css('.feature-card--history').styles(
        backgroundColor: const Color('#fbfaff'),
        raw: {
          'background-image':
              'radial-gradient(circle at 12% 18%, rgba(232, 239, 255, 0.74), transparent 38%), '
              'radial-gradient(circle at 88% 82%, rgba(237, 232, 255, 0.66), transparent 42%), '
              'linear-gradient(155deg, #fefeff 0%, #fafaff 58%, #f5f3ff 100%)',
        },
      ),
      css('.feature-card--history .feature-visual--asset').styles(
        padding: .zero,
        border: Border.none,
        backgroundColor: const Color('#fbfaff'),
      ),
      css('.feature-card--history .feature-visual').styles(height: 190.px),
      css('.feature-card--mood').styles(
        minHeight: 360.px,
        backgroundColor: const Color('#fbf8f8'),
        raw: {
          'background-image':
              'radial-gradient(circle at 18% 18%, rgba(237, 230, 255, 0.72), transparent 38%), '
              'linear-gradient(155deg, #fffdfb 0%, #fbf6f8 56%, #f8f2fb 100%)',
        },
      ),
      css('.feature-card--mood .feature-visual--asset').styles(
        padding: .zero,
        border: Border.none,
        backgroundColor: const Color('#fbf8f8'),
      ),
      css('.feature-card--notes').styles(
        backgroundColor: const Color('#fffaf7'),
        raw: {
          'background-image':
              'radial-gradient(circle at 86% 18%, rgba(255, 226, 210, 0.62), transparent 40%), '
              'radial-gradient(circle at 12% 86%, rgba(255, 239, 227, 0.58), transparent 42%), '
              'linear-gradient(155deg, #fffefd 0%, #fff9f5 58%, #fff2e9 100%)',
        },
      ),
      css('.feature-card--notes .feature-visual--asset').styles(
        padding: .zero,
        border: Border.none,
        backgroundColor: const Color('#fffaf7'),
      ),
      css('.feature-card--calm').styles(
        backgroundColor: const Color('#eaf4f0'),
        raw: {
          'background-image':
              'radial-gradient(circle at 12% 18%, rgba(224, 215, 255, 0.55), transparent 38%), '
              'radial-gradient(circle at 88% 20%, rgba(255, 221, 190, 0.5), transparent 40%), '
              'linear-gradient(155deg, #f7fbf9 0%, #eaf4f0 54%, #dceee8 100%)',
        },
      ),
      css('.feature-card--calm .feature-visual--asset').styles(
        padding: .zero,
        border: Border.none,
        backgroundColor: const Color('#eaf4f0'),
      ),
      css('.mini-panel').styles(
        width: 100.percent,
        maxWidth: 330.px,
        padding: .all(14.px),
        border: const Border.all(
          style: .solid,
          color: Color('#dce5ed'),
          width: Unit.pixels(1),
        ),
        radius: .circular(16.px),
        shadow: const BoxShadow(
          offsetX: Unit.zero,
          offsetY: Unit.pixels(10),
          blur: Unit.pixels(24),
          color: Color('#45637a18'),
        ),
        backgroundColor: const Color('#fffffff2'),
      ),
      css('.mini-label').styles(
        color: const Color('#718393'),
        fontSize: 0.6875.rem,
        fontWeight: .w700,
        textTransform: .upperCase,
        letterSpacing: 0.1.em,
      ),
      css('.mini-muted').styles(
        color: const Color('#7d8b96'),
        fontSize: 0.6875.rem,
        fontWeight: .w600,
      ),
      css('.mini-strong').styles(
        color: ink,
        fontSize: 0.875.rem,
        fontWeight: .w700,
      ),
      css('.snap-ui').styles(
        position: const Position.relative(),
        height: 180.px,
        maxWidth: 310.px,
        padding: .all(12.px),
        radius: .circular(22.px),
        overflow: Overflow.hidden,
        shadow: const BoxShadow(
          offsetX: Unit.zero,
          offsetY: Unit.pixels(14),
          blur: Unit.pixels(28),
          color: Color('#34566e24'),
        ),
        backgroundColor: const Color('#263746'),
        raw: {
          'background-image':
              'radial-gradient(circle at 28% 35%, rgba(185, 220, 235, 0.5), transparent 38%), '
              'linear-gradient(135deg, #8ba6b1 0%, #334653 55%, #1e2b35 100%)',
        },
      ),
      css('.snap-toolbar').styles(
        display: .flex,
        position: const Position.relative(),
        zIndex: const ZIndex(2),
        justifyContent: .spaceBetween,
        alignItems: .center,
        gap: .all(8.px),
        color: Colors.white,
        fontSize: 0.625.rem,
        fontWeight: .w700,
      ),
      css('.snap-toolbar-pill').styles(
        padding: .symmetric(vertical: 6.px, horizontal: 10.px),
        radius: .circular(999.px),
        backgroundColor: const Color('#11182099'),
      ),
      css('.snap-focus').styles(
        position: const Position.absolute(
          top: Unit.pixels(52),
          left: Unit.pixels(56),
          right: Unit.pixels(56),
          bottom: Unit.pixels(42),
        ),
        border: const Border.all(
          style: .solid,
          color: Color('#ffffffd9'),
          width: Unit.pixels(1),
        ),
        radius: .circular(14.px),
      ),
      css('.snap-scan').styles(
        position: const Position.absolute(top: Unit.pixels(78), left: Unit.pixels(62), right: Unit.pixels(62)),
        zIndex: const ZIndex(1),
        height: 1.px,
        backgroundColor: const Color('#8fffe0'),
        raw: {
          'box-shadow': '0 0 10px rgba(143, 255, 224, 0.9)',
          'animation': 'pax-scan-line 4.8s ease-in-out infinite',
        },
      ),
      css('.snap-action').styles(
        display: .flex,
        position: const Position.absolute(left: Unit.percent(50), bottom: Unit.pixels(10)),
        zIndex: const ZIndex(2),
        width: 112.px,
        padding: .symmetric(vertical: 7.px, horizontal: 12.px),
        radius: .circular(999.px),
        justifyContent: .center,
        alignItems: .center,
        gap: .all(6.px),
        color: ink,
        fontSize: 0.6875.rem,
        fontWeight: .w700,
        whiteSpace: .noWrap,
        backgroundColor: Colors.white,
        raw: {'transform': 'translateX(-50%)'},
      ),
      css('.snap-action-dot').styles(
        width: 7.px,
        height: 7.px,
        radius: .circular(999.px),
        backgroundColor: const Color('#ff8d63'),
      ),
      css('.routine-head, .history-head, .notes-head').styles(
        display: .flex,
        justifyContent: .spaceBetween,
        alignItems: .center,
      ),
      css('.routine-title').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(2.px),
      ),
      css('.routine-progress').styles(
        padding: .symmetric(vertical: 5.px, horizontal: 8.px),
        radius: .circular(999.px),
        color: const Color('#34725d'),
        fontSize: 0.6875.rem,
        fontWeight: .w700,
        backgroundColor: const Color('#dff5ec'),
      ),
      css('.routine-list').styles(
        display: .flex,
        margin: .only(top: 10.px),
        flexDirection: .column,
        gap: .all(5.px),
      ),
      css('.routine-row').styles(
        display: .flex,
        padding: .symmetric(vertical: 5.px, horizontal: 8.px),
        radius: .circular(10.px),
        alignItems: .center,
        gap: .all(8.px),
        backgroundColor: const Color('#f6faf8'),
      ),
      css('.routine-check').styles(
        display: .inlineFlex,
        width: 18.px,
        height: 18.px,
        radius: .circular(999.px),
        justifyContent: .center,
        alignItems: .center,
        color: Colors.white,
        fontSize: 0.625.rem,
        fontWeight: .w700,
        backgroundColor: const Color('#62ad91'),
      ),
      css('.history-panel').styles(maxWidth: 560.px),
      css('.history-list').styles(
        display: .grid,
        margin: .only(top: 12.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
        gap: .all(7.px),
      ),
      css('.history-item').styles(
        display: .flex,
        padding: .all(8.px),
        radius: .circular(11.px),
        alignItems: .center,
        gap: .all(9.px),
        backgroundColor: const Color('#f8f7ff'),
      ),
      css('.history-icon').styles(
        display: .inlineFlex,
        width: 30.px,
        height: 30.px,
        radius: .circular(9.px),
        justifyContent: .center,
        alignItems: .center,
        color: const Color('#615d91'),
        fontSize: 0.75.rem,
        fontWeight: .w700,
        backgroundColor: const Color('#e6e2ff'),
      ),
      css('.history-text').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(1.px),
        flex: const Flex.grow(1),
      ),
      css('.mood-panel').styles(
        display: .flex,
        maxWidth: 280.px,
        flexDirection: .column,
        gap: .all(13.px),
      ),
      css('.mood-faces').styles(
        display: .flex,
        justifyContent: .spaceBetween,
        alignItems: .center,
        gap: .all(7.px),
      ),
      css('.mood-face').styles(
        display: .inlineFlex,
        width: 34.px,
        height: 34.px,
        border: const Border.all(
          style: .solid,
          color: Color('#eadce5'),
          width: Unit.pixels(1),
        ),
        radius: .circular(999.px),
        justifyContent: .center,
        alignItems: .center,
        color: const Color('#926d83'),
        fontSize: 0.6875.rem,
        fontWeight: .w700,
        backgroundColor: const Color('#fff8fb'),
      ),
      css('.mood-face--selected').styles(
        border: const Border.all(
          style: .solid,
          color: Color('#d482ac'),
          width: Unit.pixels(1),
        ),
        shadow: const BoxShadow(
          offsetX: Unit.zero,
          offsetY: Unit.pixels(5),
          blur: Unit.pixels(12),
          color: Color('#d482ac33'),
        ),
        color: const Color('#7d345a'),
        backgroundColor: const Color('#f7cee2'),
      ),
      css('.mood-pattern').styles(
        display: .flex,
        height: 34.px,
        alignItems: .end,
        gap: .all(5.px),
      ),
      css('.mood-bar').styles(
        radius: .circular(999.px),
        flex: const Flex.grow(1),
        backgroundColor: const Color('#e7b9d0'),
      ),
      css('.mood-bar--1').styles(height: 14.px),
      css('.mood-bar--2').styles(height: 22.px),
      css('.mood-bar--3').styles(height: 30.px),
      css('.notes-stage').styles(
        display: .flex,
        position: const Position.relative(),
        width: 100.percent,
        height: 172.px,
        maxWidth: 360.px,
        alignItems: .center,
      ),
      css('.note-card').styles(
        position: const Position.absolute(top: Unit.pixels(6), left: Unit.zero),
        zIndex: const ZIndex(1),
        width: 72.percent,
        padding: .all(14.px),
        border: const Border.all(
          style: .solid,
          color: Color('#f0d9c8'),
          width: Unit.pixels(1),
        ),
        radius: .circular(15.px),
        shadow: const BoxShadow(
          offsetX: Unit.zero,
          offsetY: Unit.pixels(10),
          blur: Unit.pixels(22),
          color: Color('#9a60431c'),
        ),
        backgroundColor: const Color('#fffaf6'),
        raw: {'transform': 'rotate(-3deg)'},
      ),
      css('.note-text').styles(
        margin: .only(top: 10.px),
        color: const Color('#4b403a'),
        fontSize: 0.8125.rem,
        fontWeight: .w600,
        lineHeight: 1.4.em,
      ),
      css('.note-meta').styles(
        margin: .only(top: 12.px),
        color: const Color('#a17d68'),
        fontSize: 0.625.rem,
        fontWeight: .w700,
      ),
      css('.voice-card').styles(
        display: .flex,
        position: const Position.absolute(right: Unit.zero, bottom: Unit.pixels(4)),
        zIndex: const ZIndex(2),
        width: 62.percent,
        padding: .all(12.px),
        border: const Border.all(
          style: .solid,
          color: Color('#e9d6ca'),
          width: Unit.pixels(1),
        ),
        radius: .circular(15.px),
        shadow: const BoxShadow(
          offsetX: Unit.zero,
          offsetY: Unit.pixels(12),
          blur: Unit.pixels(24),
          color: Color('#9a604328'),
        ),
        alignItems: .center,
        gap: .all(10.px),
        backgroundColor: const Color('#ffffffed'),
        raw: {'transform': 'rotate(2deg)'},
      ),
      css('.record-dot').styles(
        width: 22.px,
        height: 22.px,
        radius: .circular(999.px),
        backgroundColor: const Color('#ff8d72'),
        raw: {'box-shadow': 'inset 0 0 0 6px #fff'},
      ),
      css('.waveform').styles(
        display: .flex,
        height: 30.px,
        alignItems: .center,
        gap: .all(3.px),
        flex: const Flex.grow(1),
      ),
      css('.wave-bar').styles(
        width: 3.px,
        radius: .circular(999.px),
        backgroundColor: const Color('#d78d6d'),
      ),
      css('.wave-bar--0').styles(height: 8.px),
      css('.wave-bar--1').styles(height: 20.px),
      css('.wave-bar--2').styles(height: 28.px),
      css('.wave-bar--3').styles(height: 14.px),
      css('.calm-stage').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        gap: .all(13.px),
      ),
      css('.breathing-orb').styles(
        display: .flex,
        position: const Position.relative(),
        width: 122.px,
        height: 122.px,
        radius: .circular(999.px),
        justifyContent: .center,
        alignItems: .center,
        color: const Color('#315f68'),
        fontSize: 0.75.rem,
        fontWeight: .w700,
        backgroundColor: const Color('#d9f2f2'),
        raw: {
          'box-shadow': '0 0 0 15px rgba(171, 224, 225, 0.3), 0 0 0 30px rgba(171, 224, 225, 0.14)',
          'animation': 'pax-breathe 5.5s ease-in-out infinite',
        },
      ),
      css('.duration-list').styles(
        display: .flex,
        gap: .all(7.px),
      ),
      css('.duration-chip').styles(
        padding: .symmetric(vertical: 6.px, horizontal: 10.px),
        border: const Border.all(
          style: .solid,
          color: Color('#cfe2e5'),
          width: Unit.pixels(1),
        ),
        radius: .circular(999.px),
        color: const Color('#5b7379'),
        fontSize: 0.6875.rem,
        fontWeight: .w700,
        backgroundColor: const Color('#ffffffb8'),
      ),
      css('.duration-chip--selected').styles(
        color: Colors.white,
        backgroundColor: const Color('#4d8790'),
      ),
    ]),
    css.media(const MediaQuery.all(canHover: true), [
      css('.paximus .feature-card', [
        css('&').styles(
          raw: {
            'transition': 'transform 220ms ease, border-color 220ms ease, box-shadow 220ms ease',
          },
        ),
        css('&:hover').styles(
          border: const Border.all(
            style: .solid,
            color: Color('#c4d3df'),
            width: Unit.pixels(1),
          ),
          shadow: const BoxShadow(
            offsetX: Unit.zero,
            offsetY: Unit.pixels(18),
            blur: Unit.pixels(42),
            color: Color('#45637a1c'),
          ),
          raw: {'transform': 'translateY(-3px)'},
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.paximus .features', [
        css('&').styles(padding: .symmetric(vertical: 112.px)),
        css('.features-heading').styles(
          gridTemplate: const GridTemplate(
            columns: GridTracks([
              GridTrack(TrackSize.fr(1)),
              GridTrack(TrackSize.fr(1)),
            ]),
          ),
          gap: .all(56.px),
        ),
        css('h2').styles(fontSize: 3.rem),
        css('.features-intro').styles(
          maxWidth: 34.em,
          justifySelf: .end,
        ),
        css('.features-grid').styles(
          raw: {
            'grid-template-columns': 'repeat(12, minmax(0, 1fr))',
            'grid-auto-flow': 'dense',
          },
        ),
        css('.feature-card--snap').styles(
          minHeight: 430.px,
          raw: {'grid-column': 'span 6'},
        ),
        css('.feature-card--routines').styles(
          minHeight: 430.px,
          raw: {'grid-column': 'span 6'},
        ),
        css('.feature-card--history').styles(
          minHeight: 360.px,
          raw: {
            'grid-column': '5 / span 8',
            'grid-row': '2',
          },
        ),
        css('.feature-card--mood').styles(
          minHeight: 360.px,
          raw: {
            'grid-column': '1 / span 4',
            'grid-row': '2',
          },
        ),
        css('.feature-card--notes').styles(
          minHeight: 390.px,
          raw: {'grid-column': 'span 6'},
        ),
        css('.feature-card--calm').styles(
          minHeight: 390.px,
          raw: {'grid-column': 'span 6'},
        ),
        css('.feature-card--snap .feature-visual').styles(height: 245.px),
        css('.feature-card--routines .feature-visual').styles(height: 285.px),
        css('.feature-card--history .feature-visual, .feature-card--mood .feature-visual').styles(height: 190.px),
        css('.feature-card--history .feature-asset').styles(
          raw: {'object-fit': 'cover'},
        ),
        css('.feature-card--notes .feature-asset').styles(
          raw: {'object-fit': 'cover'},
        ),
        css('.feature-card--calm .feature-asset').styles(
          raw: {'object-fit': 'cover'},
        ),
        css('.feature-card--history .history-list').styles(
          raw: {'grid-template-columns': 'repeat(3, minmax(0, 1fr))'},
        ),
      ]),
    ]),
    css.media(const MediaQuery.raw('(prefers-reduced-motion: reduce)'), [
      css('.paximus .features', [
        css('.snap-scan, .breathing-orb').styles(raw: {'animation': 'none'}),
        css('.feature-card').styles(raw: {'transition': 'none'}),
      ]),
    ]),
  ];
}

Component _featureVisual(_FeatureKind kind) {
  return switch (kind) {
    _FeatureKind.snap => _assetVisual('/images/feat1.png'),
    _FeatureKind.routines => _assetVisual('/images/paximus-feature-calm-routines.png'),
    _FeatureKind.history => _assetVisual(
      '/images/paximus-feature-history.png',
      width: 1713,
      height: 918,
    ),
    _FeatureKind.mood => _assetVisual('/images/feat_mood.png'),
    _FeatureKind.notes => _assetVisual(
      '/images/paximus-feature-notes.png',
      width: 1619,
      height: 971,
    ),
    _FeatureKind.calm => _assetVisual('/images/paximus-feature-meditation.png'),
  };
}

Component _assetVisual(
  String src, {
  int width = 1536,
  int height = 1024,
}) {
  return div(
    classes: 'feature-visual feature-visual--asset',
    attributes: const {'aria-hidden': 'true'},
    [
      img(
        classes: 'feature-asset',
        src: src,
        alt: '',
        width: width,
        height: height,
        attributes: const {
          'loading': 'lazy',
          'decoding': 'async',
        },
      ),
    ],
  );
}
