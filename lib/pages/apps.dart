import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/foxir/foxir_footer.dart';
import '../components/foxir/foxir_header.dart';
import '../components/foxir/foxir_shader.dart';
import '../constants/theme.dart';

typedef _ArchiveApp = ({
  String name,
  String category,
  String description,
  String url,
  String className,
});

const List<_ArchiveApp> _archiveApps = [
  (
    name: 'Paximus',
    category: 'Mental wellness',
    description: 'A private companion for recognizing OCD and anxiety patterns with greater clarity.',
    url: '/paximus',
    className: 'is-paximus',
  ),
  (
    name: 'Vouxe',
    category: 'Challenge tracker',
    description: 'A focused challenge tracker for turning personal commitments into lasting momentum.',
    url: '/vouxe',
    className: 'is-vouxe',
  ),
  (
    name: 'Better Today',
    category: 'Daily reflection',
    description: 'A calm daily ritual for reflection, intentional growth, and becoming a little better.',
    url: '/bettertoday',
    className: 'is-bettertoday',
  ),
];

/// Complete Foxir product archive, served at `/apps`.
class AppsPage extends StatelessComponent {
  const AppsPage({super.key});

  Component _appCard(_ArchiveApp app, int index) {
    final number = (index + 1).toString().padLeft(2, '0');

    return a(
      classes: 'archive-card ${app.className}',
      href: app.url,
      attributes: {'aria-label': 'Explore ${app.name}'},
      [
        div(classes: 'archive-card-visual', [
          span(classes: 'archive-card-number', [.text(number)]),
          span(classes: 'archive-card-category', [.text(app.category)]),
          div(
            classes: 'archive-card-signal',
            attributes: const {'aria-hidden': 'true'},
            [],
          ),
        ]),
        div(classes: 'archive-card-body', [
          div([
            h2([.text(app.name)]),
            p([.text(app.description)]),
          ]),
          span(
            classes: 'archive-card-arrow',
            attributes: const {'aria-hidden': 'true'},
            [.text('↗')],
          ),
        ]),
      ],
    );
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'foxir apps-archive', [
      const FoxirHeader(appsActive: true),
      Component.element(
        tag: 'main',
        children: [
          section(classes: 'archive-hero', [
            const FoxirShader(
              id: 'foxir-archive-shader',
              classes: 'archive-shader',
              variant: FoxirShaderVariant.archive,
            ),
            div(classes: 'archive-hero-inner', [
              h1([
                span([.text('Explore')]),
                span(classes: 'archive-title-accent', [.text('Our apps')]),
              ]),
              p([
                .text(
                  'Three independent products, built from zero to one and '
                  'shaped around a clear purpose.',
                ),
              ]),
              a(classes: 'archive-scroll', href: '/apps#all-apps', [
                span([.text('Meet the products')]),
                span(attributes: const {'aria-hidden': 'true'}, [.text('↓')]),
              ]),
            ]),
          ]),
          section(id: 'all-apps', classes: 'archive-projects', [
            div(classes: 'archive-projects-heading', [
              div([
                span([.text('Selected products')]),
                p([.text('Available on iOS and Android.')]),
              ]),
              span(classes: 'archive-projects-count', [.text('03 / 03')]),
            ]),
            div(classes: 'archive-grid', [
              for (var index = 0; index < _archiveApps.length; index++) _appCard(_archiveApps[index], index),
            ]),
            div(classes: 'archive-cta', [
              div([
                h2([.text('Have something worth building?')]),
                p([
                  .text(
                    'Bring the idea. We will help shape the product around it.',
                  ),
                ]),
              ]),
              a(classes: 'archive-cta-link', href: foxirContactUrl, [
                span([.text("Let's talk")]),
                span(attributes: const {'aria-hidden': 'true'}, [.text('↗')]),
              ]),
            ]),
          ]),
        ],
      ),
      const FoxirFooter(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir.apps-archive').styles(
      minHeight: 100.vh,
      overflow: .hidden,
      color: foxirInk,
      backgroundColor: foxirBg,
      fontFamily: const .list([
        FontFamily('Geist'),
        FontFamilies.sansSerif,
      ]),
    ),
    css('.foxir .archive-hero', [
      css('&').styles(
        position: const Position.relative(),
        display: .flex,
        minHeight: 440.px,
        overflow: .hidden,
        padding: .symmetric(horizontal: 24.px, vertical: 56.px),
        alignItems: .center,
        backgroundColor: foxirBg,
      ),
      css('.archive-shader').styles(
        position: .absolute(
          left: .zero,
          top: .zero,
          right: .zero,
          bottom: .zero,
        ),
        zIndex: const ZIndex(0),
        display: .block,
        width: 100.percent,
        height: 100.percent,
        opacity: 0.94,
        raw: {
          'pointer-events': 'none',
          'transform': 'translateZ(0)',
        },
      ),
      css('&::before').styles(
        position: .absolute(
          left: .zero,
          top: .zero,
          right: .zero,
          bottom: .zero,
        ),
        zIndex: const ZIndex(1),
        raw: {
          'content': '""',
          'pointer-events': 'none',
          'background-image':
              'linear-gradient(180deg, rgba(14,14,14,.18), rgba(14,14,14,.72)), '
              'linear-gradient(90deg, rgba(14,14,14,.18), rgba(14,14,14,.42))',
        },
      ),
      css('.archive-hero-inner').styles(
        position: const Position.relative(),
        zIndex: const ZIndex(2),
        display: .flex,
        width: 100.percent,
        flexDirection: .column,
        alignItems: .start,
      ),
      css('h1').styles(
        display: .flex,
        flexDirection: .column,
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontWeight: .w900,
        letterSpacing: (-0.05).em,
        lineHeight: 0.88.em,
        textTransform: .upperCase,
        raw: {'font-size': 'clamp(3.75rem, 11vw, 7.5rem)'},
      ),
      css('.archive-title-accent').styles(color: foxirAccent),
      css('.archive-hero-inner p').styles(
        maxWidth: 620.px,
        margin: .only(top: 36.px),
        color: foxirMuted,
        fontSize: 1.rem,
        fontWeight: .w300,
        lineHeight: 1.65.em,
      ),
      css('.archive-scroll', [
        css('&').styles(
          display: .flex,
          margin: .only(top: 28.px),
          padding: .only(bottom: 7.px),
          border: const Border.only(
            bottom: BorderSide(
              style: .solid,
              color: Color('#ffffff55'),
              width: Unit.pixels(1),
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
              width: Unit.pixels(1),
            ),
          ),
          color: foxirAccent,
        ),
      ]),
    ]),
    css('.foxir .archive-projects', [
      css('&').styles(
        padding: .symmetric(horizontal: 24.px, vertical: 56.px),
        backgroundColor: foxirBg,
      ),
      css('.archive-projects-heading').styles(
        display: .flex,
        margin: .only(bottom: 40.px),
        justifyContent: .spaceBetween,
        alignItems: .end,
        gap: .all(24.px),
      ),
      css('.archive-projects-heading > div > span').styles(
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontSize: 1.5.rem,
        fontWeight: .w800,
        letterSpacing: (-0.02).em,
        textTransform: .upperCase,
      ),
      css('.archive-projects-heading p').styles(
        margin: .only(top: 6.px),
        color: const Color('#8d817e'),
        fontSize: 0.875.rem,
        fontWeight: .w300,
      ),
      css('.archive-projects-count').styles(
        color: foxirAccent,
        fontSize: 0.6875.rem,
        fontWeight: .w600,
        letterSpacing: 0.12.em,
      ),
      css('.archive-grid').styles(
        display: .grid,
        gap: .all(24.px),
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1))]),
        ),
      ),
      css('.archive-card', [
        css('&').styles(
          position: const Position.relative(),
          display: .flex,
          minHeight: 470.px,
          border: const Border.all(
            style: .solid,
            color: Color('#ffffff14'),
            width: Unit.pixels(1),
          ),
          flexDirection: .column,
          overflow: .hidden,
          backgroundColor: const Color('#121212'),
          raw: {
            'border-radius': '22px',
            'transition': 'transform 200ms ease, border-color 200ms ease, box-shadow 200ms ease',
          },
        ),
        css('&:hover, &:focus-visible').styles(
          border: const Border.all(
            style: .solid,
            color: Color('#ff572288'),
            width: Unit.pixels(1),
          ),
          shadow: const BoxShadow(
            offsetX: Unit.zero,
            offsetY: Unit.pixels(26),
            blur: Unit.pixels(70),
            color: Color('#00000066'),
          ),
          raw: {'transform': 'translateY(-4px)'},
        ),
      ]),
      css('.archive-card-visual').styles(
        position: const Position.relative(),
        minHeight: 270.px,
        overflow: .hidden,
        padding: .all(22.px),
        backgroundColor: const Color('#151515'),
        raw: {
          'background-image':
              'radial-gradient(circle at 72% 38%, rgba(255,87,34,.18), transparent 34%), '
              'linear-gradient(135deg, rgba(255,255,255,.035), transparent 54%)',
        },
      ),
      css('.archive-card.is-vouxe .archive-card-visual').styles(
        raw: {
          'background-image':
              'radial-gradient(circle at 25% 68%, rgba(255,87,34,.15), transparent 35%), '
              'linear-gradient(155deg, rgba(255,255,255,.04), transparent 58%)',
        },
      ),
      css('.archive-card.is-bettertoday .archive-card-visual').styles(
        raw: {
          'background-image':
              'radial-gradient(circle at 66% 72%, rgba(255,87,34,.14), transparent 34%), '
              'linear-gradient(120deg, rgba(255,255,255,.035), transparent 56%)',
        },
      ),
      css('.archive-card-number').styles(
        position: Position.absolute(left: 22.px, top: 20.px),
        zIndex: const ZIndex(2),
        color: const Color('#ffffff66'),
        fontSize: 0.6875.rem,
        fontWeight: .w600,
        letterSpacing: 0.12.em,
      ),
      css('.archive-card-category').styles(
        position: Position.absolute(right: 22.px, top: 20.px),
        zIndex: const ZIndex(2),
        color: foxirAccent,
        fontSize: 0.625.rem,
        fontWeight: .w600,
        letterSpacing: 0.1.em,
        textTransform: .upperCase,
      ),
      css('.archive-card-signal').styles(
        position: .absolute(
          left: 50.percent,
          top: 50.percent,
        ),
        width: 250.px,
        height: 250.px,
        border: const Border.all(
          style: .solid,
          color: Color('#ff57222e'),
          width: Unit.pixels(1),
        ),
        raw: {
          'border-radius': '48% 52% 43% 57%',
          'box-shadow': '0 0 70px rgba(255,87,34,.08), inset 0 0 55px rgba(255,87,34,.04)',
          'transform': 'translate(-50%, -50%) rotate(-18deg)',
          'transition': 'transform 700ms cubic-bezier(.2,.8,.2,1), border-color 200ms ease',
        },
      ),
      css('.archive-card-signal::before, .archive-card-signal::after').styles(
        position: .absolute(
          left: 50.percent,
          top: 50.percent,
        ),
        border: const Border.all(
          style: .solid,
          color: Color('#ffffff12'),
          width: Unit.pixels(1),
        ),
        raw: {
          'content': '""',
          'border-radius': '44% 56% 58% 42%',
          'transform': 'translate(-50%, -50%) rotate(22deg)',
        },
      ),
      css('.archive-card-signal::before').styles(
        width: 68.percent,
        height: 68.percent,
      ),
      css('.archive-card-signal::after').styles(
        width: 36.percent,
        height: 36.percent,
      ),
      css('.archive-card:hover .archive-card-signal, .archive-card:focus-visible .archive-card-signal').styles(
        border: const Border.all(
          style: .solid,
          color: Color('#ff572266'),
          width: Unit.pixels(1),
        ),
        raw: {'transform': 'translate(-50%, -50%) rotate(12deg) scale(1.06)'},
      ),
      css('.archive-card-body').styles(
        display: .flex,
        minHeight: 200.px,
        padding: .all(24.px),
        justifyContent: .spaceBetween,
        alignItems: .end,
        gap: .all(24.px),
        backgroundColor: const Color('#101010e8'),
        backdropFilter: const Filter.blur(Unit.pixels(16)),
      ),
      css('.archive-card-body h2').styles(
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontSize: 2.25.rem,
        fontWeight: .w800,
        letterSpacing: (-0.035).em,
        lineHeight: 1.em,
        textTransform: .upperCase,
      ),
      css('.archive-card-body p').styles(
        maxWidth: 520.px,
        margin: .only(top: 14.px),
        color: const Color('#a99b97'),
        fontSize: 0.9375.rem,
        fontWeight: .w300,
        lineHeight: 1.55.em,
      ),
      css('.archive-card-arrow').styles(
        display: .flex,
        width: 50.px,
        height: 50.px,
        border: const Border.all(
          style: .solid,
          color: Color('#ffffff28'),
          width: Unit.pixels(1),
        ),
        justifyContent: .center,
        alignItems: .center,
        color: foxirInk,
        fontSize: 1.125.rem,
        backgroundColor: const Color('#ffffff08'),
        raw: {
          'border-radius': '50%',
          'flex': '0 0 auto',
          'transition': 'background-color 160ms ease, border-color 160ms ease, transform 160ms ease',
        },
      ),
      css('.archive-card:hover .archive-card-arrow, .archive-card:focus-visible .archive-card-arrow').styles(
        border: const Border.all(
          style: .solid,
          color: foxirAccent,
          width: Unit.pixels(1),
        ),
        color: Colors.white,
        backgroundColor: foxirAccent,
        raw: {'transform': 'rotate(8deg)'},
      ),
      css('.archive-cta').styles(
        display: .flex,
        margin: .only(top: 72.px),
        padding: .all(28.px),
        border: const Border.all(
          style: .solid,
          color: Color('#ffffff12'),
          width: Unit.pixels(1),
        ),
        flexDirection: .column,
        alignItems: .start,
        gap: .all(28.px),
        backgroundColor: const Color('#ffffff05'),
        raw: {'border-radius': '22px'},
      ),
      css('.archive-cta h2').styles(
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontSize: 2.rem,
        fontWeight: .w800,
        letterSpacing: (-0.03).em,
      ),
      css('.archive-cta p').styles(
        maxWidth: 600.px,
        margin: .only(top: 8.px),
        color: foxirMuted,
        fontSize: 0.9375.rem,
        fontWeight: .w300,
      ),
      css('.archive-cta-link', [
        css('&').styles(
          display: .flex,
          minHeight: 56.px,
          padding: .symmetric(horizontal: 22.px),
          justifyContent: .center,
          alignItems: .center,
          gap: .all(18.px),
          color: Colors.white,
          backgroundColor: foxirAccent,
          fontSize: 0.6875.rem,
          fontWeight: .w600,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
          raw: {
            'border-radius': '12px',
            'transition': 'background-color 160ms ease, color 160ms ease',
          },
        ),
        css('&:hover, &:focus-visible').styles(
          color: foxirBg,
          backgroundColor: foxirInk,
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.foxir .archive-hero', [
        css('&').styles(
          minHeight: 460.px,
          padding: .symmetric(vertical: 64.px),
          raw: {
            'padding-left': 'clamp(48px, 6vw, 112px)',
            'padding-right': 'clamp(48px, 6vw, 112px)',
          },
        ),
        css('.archive-hero-inner p').styles(
          fontSize: 1.25.rem,
          lineHeight: 1.6.em,
        ),
      ]),
      css('.foxir .archive-projects', [
        css('&').styles(
          padding: .symmetric(vertical: 72.px),
          raw: {
            'padding-left': 'clamp(48px, 6vw, 112px)',
            'padding-right': 'clamp(48px, 6vw, 112px)',
          },
        ),
        css('.archive-projects-heading').styles(margin: .only(bottom: 40.px)),
        css('.archive-grid').styles(
          gap: .all(20.px),
          gridTemplate: const GridTemplate(
            columns: GridTracks([
              GridTrack(TrackSize.fr(1)),
              GridTrack(TrackSize.fr(1)),
              GridTrack(TrackSize.fr(1)),
            ]),
          ),
        ),
        css('.archive-card').styles(
          minHeight: 500.px,
        ),
        css('.archive-card-visual').styles(
          minHeight: 280.px,
        ),
        css('.archive-card-body').styles(
          minHeight: 220.px,
          padding: .all(24.px),
        ),
        css('.archive-card-body h2').styles(
          fontSize: 2.rem,
        ),
        css('.archive-card-body p').styles(
          fontSize: 0.875.rem,
        ),
        css('.archive-cta').styles(
          margin: .only(top: 96.px),
          padding: .all(40.px),
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .center,
        ),
      ]),
    ]),
  ];
}
