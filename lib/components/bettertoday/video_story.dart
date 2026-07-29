import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// The Kobe Bryant moment that inspired Better Today's daily reflection ritual.
class VideoStory extends StatelessComponent {
  const VideoStory({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'inspiration', classes: 'video-story', [
      div(classes: 'container video-story-grid', [
        div(classes: 'video-story-copy', [
          span(classes: 'video-story-eyebrow', [
            .text('The question behind the ritual'),
          ]),
          h2([
            .text('The question is simple. Living it for years is the work.'),
          ]),
          p(classes: 'video-story-subtitle', [
            .text(
              'This moment from Kobe Bryant inspired the simplest part of '
              'Better Today?: pause, look inward, answer honestly, and keep going.',
            ),
          ]),
          p(classes: 'video-story-principle', [
            .text(
              'Progress is not one perfect day. It’s the courage to return '
              'to the question every day.',
            ),
          ]),
          span(classes: 'video-story-note', [
            .text('Independently built by Foxir Apps.'),
          ]),
        ]),
        div(classes: 'video-story-media', [
          div(classes: 'video-story-player', [
            iframe(
              src: 'https://www.youtube-nocookie.com/embed/CoRHJ0cUEhU?rel=0&playsinline=1',
              allow:
                  'accelerometer; autoplay; clipboard-write; encrypted-media; '
                  'gyroscope; picture-in-picture; web-share',
              loading: MediaLoading.lazy,
              referrerPolicy: ReferrerPolicy.strictOriginWhenCrossOrigin,
              width: 360,
              height: 640,
              attributes: const {
                'title': 'Kobe Bryant — Did You Get Better Today?',
                'allowfullscreen': '',
              },
              [],
            ),
          ]),
          span(classes: 'video-story-caption', [
            .text('Kobe Bryant — “Did You Get Better Today?” · YouTube'),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bettertoday .video-story', [
      css('&').styles(
        padding: .symmetric(vertical: 72.px),
        raw: const {'scroll-margin-top': '64px'},
      ),
      css('.video-story-grid').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        gap: .all(48.px),
      ),
      css('.video-story-copy').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
        gap: .all(18.px),
      ),
      css('.video-story-eyebrow').styles(
        color: betterAccent,
        fontSize: 0.75.rem,
        fontWeight: .w700,
        letterSpacing: 0.15.em,
        textTransform: .upperCase,
      ),
      css('h2').styles(
        maxWidth: 13.em,
        color: betterInk,
        fontSize: 2.25.rem,
        fontWeight: .w700,
        lineHeight: 1.08.em,
        letterSpacing: (-0.045).em,
      ),
      css('.video-story-subtitle').styles(
        maxWidth: 34.em,
        color: betterMuted,
        fontSize: 1.0625.rem,
        fontWeight: .w500,
        lineHeight: 1.65.em,
      ),
      css('.video-story-principle').styles(
        maxWidth: 32.em,
        color: betterInk,
        fontSize: 1.rem,
        fontWeight: .w600,
        lineHeight: 1.55.em,
      ),
      css('.video-story-note').styles(
        color: const Color('#777f8d'),
        fontSize: 0.75.rem,
        fontWeight: .w500,
      ),
      css('.video-story-media').styles(
        display: .flex,
        width: 360.px,
        maxWidth: 100.percent,
        flexDirection: .column,
        alignItems: .center,
        gap: .all(14.px),
      ),
      css('.video-story-player').styles(
        width: 100.percent,
        padding: .all(10.px),
        radius: .circular(28.px),
        overflow: Overflow.hidden,
        backgroundColor: const Color('#0b111b'),
        raw: {
          'aspect-ratio': '9 / 16',
          'box-shadow': '0 32px 90px rgba(0, 0, 0, 0.38)',
        },
      ),
      css('.video-story-player iframe').styles(
        display: .block,
        width: 100.percent,
        height: 100.percent,
        radius: .circular(20.px),
        raw: {'border': '0'},
      ),
      css('.video-story-caption').styles(
        color: const Color('#777f8d'),
        fontSize: 0.75.rem,
        fontWeight: .w500,
        textAlign: .center,
      ),
    ]),
    css.media(desktop, [
      css('.bettertoday .video-story', [
        css('&').styles(padding: .symmetric(vertical: 104.px)),
        css('.video-story-grid').styles(
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .center,
          gap: .all(72.px),
        ),
        css('.video-story-copy').styles(
          width: 52.percent,
          flex: const Flex(grow: 0, shrink: 0),
        ),
        css('.video-story-media').styles(
          width: 360.px,
          flex: const Flex(grow: 0, shrink: 0),
        ),
        css('h2').styles(fontSize: 3.25.rem),
      ]),
    ]),
  ];
}
