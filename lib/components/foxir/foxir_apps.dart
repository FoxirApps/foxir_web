import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'foxir_arrow.dart';

typedef _AppEntry = ({
  String name,
  String? secondLine,
  String category,
  String pageUrl,
  String imageUrl,
});

const List<_AppEntry> _apps = [
  (
    name: 'Paximus',
    secondLine: null,
    category: 'Mental wellness',
    pageUrl: '/paximus',
    imageUrl: '/images/foxir/apps/paximus-abstract.png',
  ),
  (
    name: 'Vouxe',
    secondLine: null,
    category: 'Challenge tracker',
    pageUrl: '/vouxe',
    imageUrl: '/images/foxir/apps/vouxe-abstract.png',
  ),
  (
    name: 'Better',
    secondLine: 'Today',
    category: 'Daily reflection',
    pageUrl: '/bettertoday',
    imageUrl: '/images/foxir/apps/better-today-abstract.png',
  ),
];

/// Equal-width horizontal showcase for Foxir's three products.
class FoxirApps extends StatelessComponent {
  const FoxirApps({super.key});

  Component _projectCard(_AppEntry app) {
    return a(
      classes: 'app-card',
      href: app.pageUrl,
      attributes: {'aria-label': 'Explore ${app.name}${app.secondLine == null ? '' : ' ${app.secondLine}'}'},
      [
        div(classes: 'app-card-visual', [
          img(
            src: app.imageUrl,
            alt: '',
            width: 1536,
            height: 1024,
            loading: MediaLoading.lazy,
            classes: 'app-card-image',
            attributes: const {
              'aria-hidden': 'true',
              'decoding': 'async',
            },
          ),
          span(classes: 'app-category', [.text(app.category)]),
        ]),
        div(classes: 'app-card-footer', [
          h3([
            span([.text(app.name)]),
            if (app.secondLine != null) span(classes: 'app-name-muted', [.text(app.secondLine!)]),
          ]),
          span(classes: 'app-arrow', [
            const FoxirArrow(classes: 'app-arrow-icon'),
          ]),
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
        for (final app in _apps) _projectCard(app),
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
        padding: .only(bottom: 12.px),
        flexDirection: .row,
        gap: .all(16.px),
        raw: {
          'overflow-x': 'auto',
          'overscroll-behavior-inline': 'contain',
          'scroll-snap-type': 'inline mandatory',
          'scrollbar-width': 'none',
        },
      ),
      css('.apps-grid::-webkit-scrollbar').styles(display: .none),
      css('.app-card', [
        css('&').styles(
          position: const Position.relative(),
          display: .flex,
          border: const Border.all(
            style: .solid,
            color: foxirHairline,
            width: Unit.pixels(2),
          ),
          flexDirection: .column,
          overflow: .hidden,
          backgroundColor: foxirSurface,
          raw: {
            'flex': '0 0 min(calc(100% - 44px), 380px)',
            'scroll-snap-align': 'start',
            'transition': 'border-color 180ms ease, background-color 180ms ease, transform 180ms ease',
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
      css('.app-card-visual').styles(
        position: const Position.relative(),
        overflow: .hidden,
        backgroundColor: foxirBg,
        raw: {'aspect-ratio': '3 / 2'},
      ),
      css('.app-card-visual::after').styles(
        position: .absolute(
          left: .zero,
          top: .zero,
          right: .zero,
          bottom: .zero,
        ),
        zIndex: const ZIndex(0),
        raw: {
          'content': '""',
          'pointer-events': 'none',
          'background':
              'linear-gradient(180deg, rgba(14,14,14,.03), transparent 55%, rgba(14,14,14,.18)), '
              'linear-gradient(90deg, rgba(14,14,14,.08), transparent 48%, rgba(14,14,14,.06))',
        },
      ),
      css('.app-card-image').styles(
        position: .absolute(
          left: .zero,
          top: .zero,
          right: .zero,
          bottom: .zero,
        ),
        zIndex: const ZIndex(0),
        width: 100.percent,
        height: 100.percent,
        opacity: 0.78,
        raw: {
          'object-fit': 'cover',
          'filter': 'saturate(.88) contrast(1.04)',
          'transition': 'opacity 500ms ease, transform 700ms cubic-bezier(.2,.8,.2,1)',
        },
      ),
      css('.app-card:hover .app-card-image, .app-card:focus-visible .app-card-image').styles(
        opacity: 0.94,
        raw: {'transform': 'scale(1.025)'},
      ),
      css('.app-category').styles(
        position: Position.absolute(left: 24.px, top: 24.px),
        zIndex: const ZIndex(1),
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
        minHeight: 148.px,
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
        backgroundColor: const Color('#0e0e0ef2'),
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
        width: 44.px,
        height: 44.px,
        border: const Border.all(
          style: .solid,
          color: Color('#ffffff4d'),
          width: Unit.pixels(1),
        ),
        justifyContent: .center,
        alignItems: .center,
        color: foxirInk,
        backgroundColor: Colors.transparent,
        raw: {
          'flex': '0 0 auto',
          'transition': 'background-color 160ms ease, border-color 160ms ease, color 160ms ease, transform 160ms ease',
        },
      ),
      css('.app-arrow-icon').styles(
        width: 18.px,
        height: 18.px,
        raw: {'transition': 'transform 160ms ease'},
      ),
      css('.app-card:hover .app-arrow, .app-card:focus-visible .app-arrow').styles(
        border: const Border.all(
          style: .solid,
          color: foxirAccent,
          width: Unit.pixels(1),
        ),
        color: foxirAccent,
        backgroundColor: const Color('#ff57220d'),
        raw: {'transform': 'translate(-2px, -2px)'},
      ),
      css('.app-card:hover .app-arrow-icon, .app-card:focus-visible .app-arrow-icon').styles(
        raw: {'transform': 'translate(1px, -1px)'},
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
      ]),
    ]),
    css.media(MediaQuery.screen(minWidth: Unit.pixels(1024)), [
      css('.foxir .apps', [
        css('.apps-grid').styles(
          margin: .only(top: 96.px),
          padding: .zero,
          flexDirection: .row,
          gap: .all(20.px),
          alignItems: .stretch,
          raw: {
            'overflow-x': 'visible',
            'scroll-snap-type': 'none',
          },
        ),
        css('.app-card').styles(
          minWidth: .zero,
          raw: {'flex': '1 1 0'},
        ),
        css('h3').styles(fontSize: 2.25.rem),
      ]),
    ]),
  ];
}
