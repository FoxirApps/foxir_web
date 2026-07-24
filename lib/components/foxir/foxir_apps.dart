import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _AppEntry = ({
  String name,
  String tagline,
  String description,
  String icon,
  String pageUrl,
  String appStore,
  String playStore,
});

/// Apps shown in the showcase. Adding a new app is a single new entry here.
const List<_AppEntry> _apps = [
  (
    name: 'Paximus',
    tagline: 'OCD & Anxiety Tracker',
    description: 'Your peace of mind, like never before. The simple, calm, and caring way to '
        'capture worries, validate tasks with evidence, and end every day with reassurance.',
    icon: 'images/paximus-icon.png',
    pageUrl: '/paximus',
    appStore: appStoreUrl,
    playStore: playStoreUrl,
  ),
  (
    name: 'Vouxe',
    tagline: 'Challenge Tracker',
    description: 'Build discipline you can see. Turn daily effort into visible progress, '
        'powerful streaks, and proof worth sharing.',
    icon: 'images/vouxe-icon.png',
    pageUrl: '/vouxe',
    appStore: vouxeAppStoreUrl,
    playStore: vouxePlayStoreUrl,
  ),
];

/// The app showcase grid of the umbrella site.
class FoxirApps extends StatelessComponent {
  const FoxirApps({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'apps', classes: 'apps', [
      div(classes: 'container', [
        h2([.text('Our apps.')]),
        p(classes: 'apps-subtitle', [
          .text('Crafted in-house, designed to feel calm and effortless.'),
        ]),
        div(classes: 'apps-grid', [
          for (final app in _apps)
            div(classes: 'app-card', [
              img(src: app.icon, alt: '${app.name} app icon', width: 72, height: 72),
              div(classes: 'app-info', [
                span(classes: 'app-tagline', [.text(app.tagline)]),
                h3([.text(app.name)]),
                p([.text(app.description)]),
                div(classes: 'app-links', [
                  a(classes: 'app-link-primary', href: app.pageUrl, [.text('Learn more')]),
                  a(classes: 'app-link', href: app.appStore, target: .blank, [.text('App Store')]),
                  a(classes: 'app-link', href: app.playStore, target: .blank, [.text('Google Play')]),
                ]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir .apps', [
      css('&').styles(
        padding: .symmetric(vertical: 72.px),
        textAlign: .center,
      ),
      css('h2').styles(
        color: foxirInk,
        fontSize: 1.875.rem,
        fontWeight: .w700,
        letterSpacing: (-0.01).em,
      ),
      css('.apps-subtitle').styles(
        margin: .only(top: 8.px),
        color: foxirMuted,
        fontSize: 1.125.rem,
        fontWeight: .w500,
      ),
      css('.apps-grid').styles(
        display: .flex,
        margin: .only(top: 40.px),
        flexDirection: .column,
        alignItems: .center,
        gap: .all(20.px),
      ),
      css('.app-card', [
        css('&').styles(
          display: .flex,
          maxWidth: 720.px,
          padding: .all(28.px),
          border: const Border.all(style: .solid, color: foxirHairline, width: Unit.pixels(1)),
          radius: .circular(24.px),
          flexDirection: .column,
          alignItems: .center,
          gap: .all(20.px),
          textAlign: .center,
          backgroundColor: foxirSurface,
          raw: {'backdrop-filter': 'blur(12px)'},
        ),
        css('img').styles(radius: .circular(18.px)),
        css('.app-tagline').styles(
          color: foxirAccent,
          fontSize: 0.8125.rem,
          fontWeight: .w700,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
        ),
        css('h3').styles(
          margin: .only(top: 4.px),
          color: foxirInk,
          fontSize: 1.5.rem,
          fontWeight: .w700,
        ),
        css('p').styles(
          margin: .symmetric(vertical: 12.px),
          color: foxirMuted,
          fontSize: 0.9375.rem,
        ),
      ]),
      css('.app-links', [
        css('&').styles(
          display: .flex,
          justifyContent: .center,
          flexWrap: .wrap,
          gap: .all(10.px),
        ),
        css('.app-link-primary', [
          css('&').styles(
            padding: .symmetric(horizontal: 18.px, vertical: 8.px),
            radius: .circular(999.px),
            color: Colors.white,
            fontSize: 0.875.rem,
            fontWeight: .w600,
            backgroundColor: foxirAccent,
          ),
          css('&:hover').styles(backgroundColor: const Color('#ff6a2e')),
        ]),
        css('.app-link', [
          css('&').styles(
            padding: .symmetric(horizontal: 18.px, vertical: 8.px),
            border: const Border.all(style: .solid, color: foxirHairline, width: Unit.pixels(1)),
            radius: .circular(999.px),
            color: foxirInk,
            fontSize: 0.875.rem,
            fontWeight: .w600,
            backgroundColor: const Color('#ffffff0a'),
          ),
          css('&:hover').styles(backgroundColor: foxirElevated),
        ]),
      ]),
    ]),
    css.media(desktop, [
      css('.foxir .apps', [
        css('&').styles(padding: .symmetric(vertical: 96.px)),
        css('h2').styles(fontSize: 2.25.rem),
        css('.app-card').styles(
          flexDirection: .row,
          textAlign: .start,
        ),
        css('.app-card .app-links').styles(justifyContent: .start),
      ]),
    ]),
  ];
}
