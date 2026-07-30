import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

typedef _AppEntry = ({
  String name,
  String? secondLine,
  String category,
  String pageUrl,
});

const _paximus = (
  name: 'Paximus',
  secondLine: null,
  category: 'Mental wellness',
  pageUrl: '/paximus',
);

const List<_AppEntry> _secondaryApps = [
  (
    name: 'Vouxe',
    secondLine: null,
    category: 'Challenge tracker',
    pageUrl: '/vouxe',
  ),
  (
    name: 'Better',
    secondLine: 'Today',
    category: 'Daily reflection',
    pageUrl: '/bettertoday',
  ),
];

/// Image-free bento showcase for Foxir's three products.
class FoxirApps extends StatelessComponent {
  const FoxirApps({super.key});

  Component _projectCard(_AppEntry app, {required String sizeClass}) {
    return a(
      classes: 'app-card $sizeClass',
      href: app.pageUrl,
      attributes: {'aria-label': 'Explore ${app.name}${app.secondLine == null ? '' : ' ${app.secondLine}'}'},
      [
        span(classes: 'app-category', [.text(app.category)]),
        div(classes: 'app-card-footer', [
          h3([
            span([.text(app.name)]),
            if (app.secondLine != null) span(classes: 'app-name-muted', [.text(app.secondLine!)]),
          ]),
          span(
            classes: 'app-arrow',
            attributes: const {'aria-hidden': 'true'},
            [
              .text('↗'),
            ],
          ),
        ]),
      ],
    );
  }

  @override
  Component build(BuildContext context) {
    return section(id: 'apps', classes: 'foxir-shell apps', [
      div(classes: 'apps-heading', [
        div([
          h2([.text('Featured apps')]),
          p([
            .text(
              'A collection of personal products and experimental applications.',
            ),
          ]),
        ]),
        a(classes: 'apps-all', href: '/apps', [
          span([.text('All projects')]),
          span(attributes: const {'aria-hidden': 'true'}, [.text('→')]),
        ]),
      ]),
      div(classes: 'apps-grid', [
        _projectCard(_paximus, sizeClass: 'is-large'),
        div(classes: 'secondary-apps', [
          for (final app in _secondaryApps) _projectCard(app, sizeClass: 'is-small'),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir .apps', [
      css('&').styles(
        padding: .symmetric(horizontal: 24.px, vertical: 72.px),
        border: const Border.only(
          left: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
          right: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
        ),
        backgroundColor: foxirBg,
      ),
      css('.apps-heading').styles(
        display: .flex,
        padding: .only(bottom: 44.px),
        border: const Border.only(
          bottom: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
        ),
        flexDirection: .column,
        gap: .all(24.px),
      ),
      css('h2').styles(
        color: foxirAccent,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontWeight: .w900,
        letterSpacing: (-0.04).em,
        lineHeight: 0.95.em,
        textTransform: .upperCase,
        raw: {'font-size': 'clamp(3rem, 7vw, 5rem)'},
      ),
      css('.apps-heading p').styles(
        maxWidth: 576.px,
        margin: .only(top: 20.px),
        color: foxirMuted,
        fontSize: 1.rem,
        fontWeight: .w300,
        lineHeight: 1.6.em,
      ),
      css('.apps-all', [
        css('&').styles(
          display: .flex,
          alignSelf: .start,
          padding: .only(bottom: 8.px),
          border: const Border.only(
            bottom: BorderSide(
              style: .solid,
              color: foxirInk,
              width: Unit.pixels(2),
            ),
          ),
          alignItems: .center,
          gap: .all(14.px),
          color: foxirInk,
          fontSize: 0.6875.rem,
          fontWeight: .w600,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
          raw: {
            'transition': 'color 160ms ease, border-color 160ms ease',
          },
        ),
        css('&:hover, &:focus-visible').styles(
          border: const Border.only(
            bottom: BorderSide(
              style: .solid,
              color: foxirAccent,
              width: Unit.pixels(2),
            ),
          ),
          color: foxirAccent,
        ),
      ]),
      css('.apps-grid').styles(
        display: .flex,
        margin: .only(top: 40.px),
        flexDirection: .column,
        gap: .all(24.px),
      ),
      css('.secondary-apps').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(24.px),
      ),
      css('.app-card', [
        css('&').styles(
          position: const Position.relative(),
          display: .flex,
          minHeight: 380.px,
          padding: .all(24.px),
          border: const Border.all(
            style: .solid,
            color: foxirHairline,
            width: Unit.pixels(2),
          ),
          flexDirection: .column,
          justifyContent: .spaceBetween,
          overflow: .hidden,
          backgroundColor: foxirSurface,
          raw: {
            'background-image':
                'linear-gradient(145deg, rgba(255,87,34,.035), transparent 42%), '
                'linear-gradient(rgba(255,255,255,.018) 1px, transparent 1px), '
                'linear-gradient(90deg, rgba(255,255,255,.018) 1px, transparent 1px)',
            'background-size': 'auto, 48px 48px, 48px 48px',
            'transition': 'border-color 180ms ease, background-color 180ms ease, transform 180ms ease',
          },
        ),
        css('&::after').styles(
          position: .absolute(
            left: .zero,
            right: .zero,
            bottom: .zero,
          ),
          height: 45.percent,
          raw: {
            'content': '""',
            'pointer-events': 'none',
            'background': 'linear-gradient(180deg, transparent, rgba(14,14,14,.92))',
          },
        ),
        css('&:hover, &:focus-visible').styles(
          border: const Border.all(
            style: .solid,
            color: foxirAccent,
            width: Unit.pixels(2),
          ),
          backgroundColor: foxirElevated,
          raw: {'transform': 'translateY(-2px)'},
        ),
      ]),
      css('.app-category').styles(
        position: const Position.relative(),
        zIndex: const ZIndex(1),
        alignSelf: .start,
        padding: .symmetric(horizontal: 16.px, vertical: 10.px),
        border: const Border.all(
          style: .solid,
          color: foxirHairline,
          width: Unit.pixels(1),
        ),
        color: foxirAccent,
        backgroundColor: foxirBg,
        fontSize: 0.625.rem,
        fontWeight: .w600,
        letterSpacing: 0.1.em,
        textTransform: .upperCase,
      ),
      css('.app-card-footer').styles(
        position: const Position.relative(),
        zIndex: const ZIndex(1),
        display: .flex,
        margin: .only(left: (-24).px, right: (-24).px, bottom: (-24).px),
        padding: .symmetric(horizontal: 24.px, vertical: 28.px),
        border: const Border.only(
          top: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
        ),
        justifyContent: .spaceBetween,
        alignItems: .end,
        backgroundColor: const Color('#0e0e0ecc'),
        backdropFilter: const Filter.blur(Unit.pixels(2)),
      ),
      css('h3').styles(
        display: .flex,
        flexDirection: .column,
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontSize: 2.5.rem,
        fontWeight: .w800,
        letterSpacing: (-0.03).em,
        lineHeight: 0.95.em,
        textTransform: .upperCase,
      ),
      css('.app-name-muted').styles(color: foxirMuted),
      css('.app-arrow').styles(
        display: .flex,
        width: 52.px,
        height: 52.px,
        border: const Border.all(
          style: .solid,
          color: foxirInk,
          width: Unit.pixels(2),
        ),
        justifyContent: .center,
        alignItems: .center,
        color: foxirInk,
        fontSize: 1.25.rem,
        raw: {'flex': '0 0 auto'},
      ),
      css('.app-card:hover .app-arrow, .app-card:focus-visible .app-arrow').styles(
        border: const Border.all(
          style: .solid,
          color: foxirAccent,
          width: Unit.pixels(2),
        ),
        color: Colors.white,
        backgroundColor: foxirAccent,
      ),
    ]),
    css.media(desktop, [
      css('.foxir .apps', [
        css('&').styles(
          padding: .symmetric(vertical: 128.px),
          raw: {
            'padding-left': 'clamp(48px, 6vw, 112px)',
            'padding-right': 'clamp(48px, 6vw, 112px)',
          },
        ),
        css('.apps-heading').styles(
          minHeight: 218.px,
          padding: .only(bottom: 50.px),
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .end,
        ),
        css('.apps-heading p').styles(
          fontSize: 1.25.rem,
          lineHeight: 1.6.em,
        ),
        css('.apps-all').styles(alignSelf: .end),
        css('.apps-grid').styles(
          height: 600.px,
          margin: .only(top: 96.px),
          flexDirection: .row,
          gap: .all(32.px),
        ),
        css('.app-card.is-large').styles(
          width: 58.333.percent,
          height: 600.px,
          minHeight: 600.px,
          padding: .all(32.px),
        ),
        css('.secondary-apps').styles(
          flex: const Flex(grow: 1),
          gap: .all(32.px),
        ),
        css('.app-card.is-small').styles(
          minHeight: .zero,
          height: 284.px,
          padding: .all(32.px),
        ),
        css('.app-card-footer').styles(
          margin: .only(left: (-32).px, right: (-32).px, bottom: (-32).px),
          padding: .symmetric(horizontal: 32.px, vertical: 28.px),
        ),
        css('h3').styles(fontSize: 3.rem),
        css('.app-card.is-small h3').styles(fontSize: 2.25.rem),
      ]),
    ]),
  ];
}
