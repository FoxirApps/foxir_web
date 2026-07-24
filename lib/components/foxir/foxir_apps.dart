import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../store_buttons.dart';

typedef _AppEntry = ({
  String name,
  String tagline,
  String description,
  String? icon,
  String initials,
  String pageUrl,
  String appStore,
  String playStore,
});

/// Apps shown in the showcase. Adding a new app is a single new entry here.
const List<_AppEntry> _apps = [
  (
    name: 'Paximus',
    tagline: 'OCD & Anxiety Tracker',
    description: 'Finally, OCD & anxiety tracking that feels calm. Capture worries, '
        'validate tasks with evidence, and close every day with quiet reassurance.',
    icon: 'images/paximus-icon.png',
    initials: 'PX',
    pageUrl: '/paximus',
    appStore: appStoreUrl,
    playStore: playStoreUrl,
  ),
  (
    name: 'Vouxe',
    tagline: 'Challenge Tracker',
    description: 'Build discipline you can see. Turn daily check-ins into visible streaks, '
        'clear stats, and milestones worth sharing.',
    icon: 'images/vouxe-icon.png',
    initials: 'VX',
    pageUrl: '/vouxe',
    appStore: vouxeAppStoreUrl,
    playStore: vouxePlayStoreUrl,
  ),
  (
    name: 'Better Today',
    tagline: 'Daily Growth',
    description: 'One daily reflection. A better you. Reflect honestly, set clear intentions, '
        'and build the Mamba Mentality—small steps that compound into lifelong excellence.',
    icon: betterTodayIconSrc,
    initials: 'BT',
    pageUrl: '/bettertoday',
    appStore: betterAppStoreUrl,
    playStore: betterPlayStoreUrl,
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
          .text('In-house products, designed to feel calm and effortless.'),
        ]),
        div(classes: 'apps-grid', [
          for (final app in _apps)
            div(classes: 'app-card', [
              if (app.icon case final icon?)
                img(src: icon, alt: '${app.name} app icon', width: 72, height: 72)
              else
                span(classes: 'app-initials', [.text(app.initials)]),
              div(classes: 'app-info', [
                span(classes: 'app-tagline', [.text(app.tagline)]),
                h3([.text(app.name)]),
                p([.text(app.description)]),
                div(classes: 'app-links', [
                  a(classes: 'app-link-primary', href: app.pageUrl, [.text('Learn more')]),
                  StoreButtons(
                    appStoreUrl: app.appStore,
                    playStoreUrl: app.playStore,
                    compact: true,
                  ),
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
        css('.app-initials').styles(
          display: .flex,
          width: 72.px,
          height: 72.px,
          radius: .circular(18.px),
          justifyContent: .center,
          alignItems: .center,
          color: betterBg,
          fontSize: 1.25.rem,
          fontWeight: .w700,
          letterSpacing: 0.04.em,
          backgroundColor: betterAccent,
        ),
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
          alignItems: .center,
          flexWrap: .wrap,
          gap: .all(12.px),
          justifyContent: .center,
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
