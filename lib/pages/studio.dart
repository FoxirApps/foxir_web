import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/foxir/foxir_arrow.dart';
import '../components/foxir/foxir_footer.dart';
import '../components/foxir/foxir_header.dart';
import '../components/foxir/foxir_shader.dart';
import '../constants/theme.dart';

typedef _StudioPrinciple = ({
  String number,
  String title,
  String description,
});

typedef _StudioStep = ({
  String number,
  String title,
  String description,
});

const List<_StudioPrinciple> _principles = [
  (
    number: '01',
    title: 'Own products first',
    description: 'We ship apps we believe in — Paximus, Vouxe, Better Today, and what comes next.',
  ),
  (
    number: '02',
    title: 'Crafted in-house',
    description: 'Design, engineering, and polish stay close so every detail feels intentional.',
  ),
  (
    number: '03',
    title: 'Calm by design',
    description: 'Interfaces should reduce noise and help people focus on what actually matters.',
  ),
  (
    number: '04',
    title: 'Built to evolve',
    description: 'A launch is the start. Real use shapes every thoughtful iteration that follows.',
  ),
];

const List<_StudioStep> _steps = [
  (
    number: '01',
    title: 'Explore',
    description: 'Find the real problem and the smallest idea worth pursuing.',
  ),
  (
    number: '02',
    title: 'Shape',
    description: 'Turn the idea into a focused product with a clear point of view.',
  ),
  (
    number: '03',
    title: 'Build',
    description: 'Bring design and engineering together from the first working detail.',
  ),
  (
    number: '04',
    title: 'Learn',
    description: 'Release, listen, and improve through real-world use.',
  ),
];

const _facts = [
  (value: '03', label: 'Live products'),
  (value: '01', label: 'Independent studio'),
  (value: 'Design +', label: 'Engineering'),
  (value: 'Zero → One', label: 'Built end to end'),
];

const _studioApps = [
  (name: 'Paximus', category: 'Mental wellness', url: '/paximus'),
  (name: 'Vouxe', category: 'Challenge tracker', url: '/vouxe'),
  (name: 'Better Today', category: 'Daily reflection', url: '/bettertoday'),
];

/// Brand-first story of how Foxir explores, builds, and evolves products.
class StudioPage extends StatelessComponent {
  const StudioPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'foxir studio-page', [
      const FoxirHeader(activeItem: FoxirNavItem.studio),
      Component.element(
        tag: 'main',
        children: [
          section(classes: 'studio-hero', [
            const FoxirShader(
              id: 'foxir-studio-shader',
              classes: 'studio-shader',
              variant: FoxirShaderVariant.studio,
            ),
            div(classes: 'studio-hero-inner', [
              h1([
                span(classes: 'studio-title-line', [.text('Small studio.')]),
                span(classes: 'studio-title-line is-accent', [
                  .text('Useful products.'),
                ]),
              ]),
              p(classes: 'studio-hero-copy', [
                .text(
                  'Foxir Apps is an independent product studio exploring '
                  'focused ideas and turning them into thoughtful digital experiences.',
                ),
              ]),
              a(classes: 'studio-scroll-link', href: '/studio#why', [
                span([.text('See how we build')]),
                span(attributes: const {'aria-hidden': 'true'}, [.text('↓')]),
              ]),
            ]),
          ]),
          section(
            id: 'why',
            classes: 'studio-manifesto studio-reveal',
            attributes: const {
              'data-reveal': '',
            },
            [
              div(classes: 'studio-section-index', [
                span([.text('01')]),
                span([.text('Why')]),
              ]),
              div(classes: 'studio-manifesto-content', [
                h2([.text('We build products we want to exist.')]),
                p([
                  .text(
                    'Every project begins with a real problem, a narrow purpose, '
                    'and the belief that software can feel calmer. We remove the '
                    'noise, keep the useful parts, and build from there.',
                  ),
                ]),
              ]),
            ],
          ),
          div(
            classes: 'studio-marquee',
            attributes: const {'aria-hidden': 'true'},
            [
              div(classes: 'studio-marquee-track', [
                for (var repeat = 0; repeat < 2; repeat++)
                  div(classes: 'studio-marquee-group', [
                    span([.text('Explore')]),
                    span(classes: 'studio-marquee-dot', [.text('•')]),
                    span([.text('Shape')]),
                    span(classes: 'studio-marquee-dot', [.text('•')]),
                    span([.text('Build')]),
                    span(classes: 'studio-marquee-dot', [.text('•')]),
                    span([.text('Learn')]),
                    span(classes: 'studio-marquee-dot', [.text('•')]),
                  ]),
              ]),
            ],
          ),
          section(classes: 'studio-principles', [
            div(
              classes: 'studio-section-heading studio-reveal',
              attributes: const {'data-reveal': ''},
              [
                div(classes: 'studio-section-index', [
                  span([.text('02')]),
                  span([.text('Principles')]),
                ]),
                h2([.text('A point of view, not a playbook.')]),
              ],
            ),
            div(classes: 'studio-principles-grid', [
              for (var index = 0; index < _principles.length; index++)
                article(
                  classes: 'studio-principle-card studio-reveal reveal-delay-${index + 1}',
                  attributes: const {
                    'data-reveal': '',
                    'tabindex': '0',
                  },
                  [
                    div(
                      classes: 'studio-principle-art art-${index + 1}',
                      attributes: const {'aria-hidden': 'true'},
                      [
                        span(classes: 'art-line art-line-a', []),
                        span(classes: 'art-line art-line-b', []),
                        span(classes: 'art-line art-line-c', []),
                        span(classes: 'art-line art-line-d', []),
                      ],
                    ),
                    span(classes: 'studio-principle-number', [
                      .text(_principles[index].number),
                    ]),
                    h3([.text(_principles[index].title)]),
                    p([.text(_principles[index].description)]),
                  ],
                ),
            ]),
          ]),
          section(
            classes: 'studio-process studio-reveal',
            attributes: const {'data-reveal': ''},
            [
              div(classes: 'studio-section-heading', [
                div(classes: 'studio-section-index', [
                  span([.text('03')]),
                  span([.text('Approach')]),
                ]),
                h2([.text('From a question to a living product.')]),
              ]),
              div(classes: 'studio-process-track', [
                for (final step in _steps)
                  div(classes: 'studio-process-step', [
                    span(classes: 'studio-process-number', [
                      .text(step.number),
                    ]),
                    h3([.text(step.title)]),
                    p([.text(step.description)]),
                  ]),
              ]),
            ],
          ),
          section(classes: 'studio-facts', [
            div(
              classes: 'studio-facts-intro studio-reveal',
              attributes: const {'data-reveal': ''},
              [
                div(classes: 'studio-section-index', [
                  span([.text('04')]),
                  span([.text('Today')]),
                ]),
                h2([.text('Small by design. Close to every detail.')]),
              ],
            ),
            div(classes: 'studio-facts-grid', [
              for (var index = 0; index < _facts.length; index++)
                div(
                  classes: 'studio-fact studio-reveal reveal-delay-${index + 1}',
                  attributes: const {'data-reveal': ''},
                  [
                    strong([.text(_facts[index].value)]),
                    span([.text(_facts[index].label)]),
                  ],
                ),
            ]),
          ]),
          section(
            classes: 'studio-products studio-reveal',
            attributes: const {
              'data-reveal': '',
            },
            [
              div(classes: 'studio-products-heading', [
                div(classes: 'studio-section-index', [
                  span([.text('05')]),
                  span([.text('Products')]),
                ]),
                h2([.text('Currently building and evolving.')]),
              ]),
              div(classes: 'studio-product-links', [
                for (final app in _studioApps)
                  a(href: app.url, [
                    div([
                      span([.text(app.category)]),
                      h3([.text(app.name)]),
                    ]),
                    const FoxirArrow(classes: 'studio-product-arrow'),
                  ]),
              ]),
            ],
          ),
          a(
            classes: 'studio-cta studio-reveal',
            href: foxirContactUrl,
            attributes: const {
              'data-reveal': '',
            },
            [
              div([
                span([.text('Start a conversation')]),
                h2([.text('Have an idea worth exploring?')]),
              ]),
              span(classes: 'studio-cta-link', [
                span([.text("Let's talk")]),
                const FoxirArrow(classes: 'studio-cta-arrow'),
              ]),
            ],
          ),
        ],
      ),
      const FoxirFooter(),
      script(content: _motionScript),
    ]);
  }

  static const _motionScript = r'''
(function () {
  const root = document.querySelector('.studio-page');
  if (!root || root.dataset.motionReady === 'true') return;
  root.dataset.motionReady = 'true';

  const targets = root.querySelectorAll('[data-reveal]');
  const reducedMotion = window.matchMedia(
    '(prefers-reduced-motion: reduce)'
  );

  root.classList.add('has-motion');

  function revealEverything() {
    targets.forEach(function (target) {
      target.classList.add('is-visible');
    });
  }

  if (reducedMotion.matches || typeof IntersectionObserver === 'undefined') {
    root.classList.add('reduced-motion');
    revealEverything();
    return;
  }

  const observer = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (!entry.isIntersecting) return;
      entry.target.classList.add('is-visible');
      observer.unobserve(entry.target);
    });
  }, {
    threshold: 0.12,
    rootMargin: '0px 0px -8% 0px'
  });

  targets.forEach(function (target) {
    observer.observe(target);
  });
})();
''';

  @css
  static List<StyleRule> get styles => [
    css.keyframes('studio-title-in', {
      '0%': const Styles(
        opacity: 0,
        raw: {'transform': 'translateY(34px)'},
      ),
      '100%': const Styles(
        opacity: 1,
        raw: {'transform': 'translateY(0)'},
      ),
    }),
    css.keyframes('studio-marquee-flow', {
      '0%': const Styles(raw: {'transform': 'translateX(0)'}),
      '100%': const Styles(raw: {'transform': 'translateX(-50%)'}),
    }),
    css('.foxir.studio-page').styles(
      minHeight: 100.vh,
      overflow: .hidden,
      color: foxirInk,
      backgroundColor: foxirBg,
      fontFamily: const .list([
        FontFamily('Geist'),
        FontFamilies.sansSerif,
      ]),
    ),
    css('.foxir .studio-hero', [
      css('&').styles(
        position: const Position.relative(),
        display: .flex,
        minHeight: 560.px,
        overflow: .hidden,
        padding: .symmetric(horizontal: 24.px, vertical: 64.px),
        alignItems: .center,
        backgroundColor: foxirBg,
      ),
      css('.studio-shader').styles(
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
              'linear-gradient(180deg, rgba(14,14,14,.18), rgba(14,14,14,.68)), '
              'linear-gradient(90deg, rgba(14,14,14,.22), rgba(14,14,14,.48))',
        },
      ),
      css('.studio-hero-inner').styles(
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
        letterSpacing: (-0.055).em,
        lineHeight: 0.88.em,
        textTransform: .upperCase,
        raw: {'font-size': 'clamp(2.9rem, 10vw, 8rem)'},
      ),
      css('.studio-title-line.is-accent').styles(color: foxirAccent),
      css('.studio-hero-copy').styles(
        maxWidth: 650.px,
        margin: .only(top: 34.px),
        color: foxirMuted,
        fontSize: 1.0625.rem,
        fontWeight: .w300,
        lineHeight: 1.65.em,
      ),
      css('.studio-scroll-link', [
        css('&').styles(
          display: .flex,
          margin: .only(top: 34.px),
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
    css('.foxir .studio-section-index').styles(
      display: .flex,
      alignItems: .center,
      gap: .all(12.px),
      color: foxirAccent,
      fontSize: 0.6875.rem,
      fontWeight: .w600,
      letterSpacing: 0.11.em,
      textTransform: .upperCase,
    ),
    css('.foxir .studio-section-index span:first-child').styles(
      color: const Color('#766b68'),
    ),
    css('.foxir .studio-manifesto').styles(
      display: .flex,
      padding: .symmetric(horizontal: 24.px, vertical: 88.px),
      flexDirection: .column,
      gap: .all(38.px),
    ),
    css('.foxir .studio-manifesto-content h2').styles(
      maxWidth: 900.px,
      color: foxirInk,
      fontFamily: const .list([
        FontFamily('Hanken Grotesk'),
        FontFamilies.sansSerif,
      ]),
      fontWeight: .w900,
      letterSpacing: (-0.045).em,
      lineHeight: 0.96.em,
      textTransform: .upperCase,
      raw: {'font-size': 'clamp(2.75rem, 7vw, 6rem)'},
    ),
    css('.foxir .studio-manifesto-content p').styles(
      maxWidth: 680.px,
      margin: .only(top: 28.px),
      color: foxirMuted,
      fontSize: 1.0625.rem,
      fontWeight: .w300,
      lineHeight: 1.7.em,
    ),
    css('.foxir .studio-marquee').styles(
      overflow: .hidden,
      padding: .symmetric(vertical: 26.px),
      border: const Border.symmetric(
        horizontal: BorderSide(
          style: .solid,
          color: Color('#ffffff12'),
          width: Unit.pixels(1),
        ),
      ),
      backgroundColor: const Color('#111111'),
    ),
    css('.foxir .studio-marquee-track').styles(
      display: .flex,
      width: .maxContent,
      raw: {
        'animation': 'studio-marquee-flow 36s linear infinite',
        'will-change': 'transform',
      },
    ),
    css('.foxir .studio-marquee-group').styles(
      display: .flex,
      padding: .only(right: 34.px),
      alignItems: .center,
      gap: .all(34.px),
      color: foxirInk,
      fontFamily: const .list([
        FontFamily('Hanken Grotesk'),
        FontFamilies.sansSerif,
      ]),
      fontWeight: .w900,
      letterSpacing: (-0.04).em,
      textTransform: .upperCase,
      whiteSpace: .noWrap,
      raw: {'font-size': 'clamp(2.5rem, 6vw, 5.5rem)'},
    ),
    css('.foxir .studio-marquee-dot').styles(color: foxirAccent),
    css('.foxir .studio-principles').styles(
      padding: .symmetric(horizontal: 24.px, vertical: 88.px),
    ),
    css('.foxir .studio-section-heading').styles(
      display: .flex,
      margin: .only(bottom: 42.px),
      flexDirection: .column,
      gap: .all(20.px),
    ),
    css('.foxir .studio-section-heading h2').styles(
      maxWidth: 760.px,
      color: foxirInk,
      fontFamily: const .list([
        FontFamily('Hanken Grotesk'),
        FontFamilies.sansSerif,
      ]),
      fontSize: 2.5.rem,
      fontWeight: .w800,
      letterSpacing: (-0.04).em,
      lineHeight: 1.em,
      textTransform: .upperCase,
    ),
    css('.foxir .studio-principles-grid').styles(
      display: .grid,
      gap: .all(16.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1))]),
      ),
    ),
    css('.foxir .studio-principle-card', [
      css('&').styles(
        position: const Position.relative(),
        display: .flex,
        minHeight: 220.px,
        overflow: .hidden,
        padding: .all(26.px),
        border: const Border.all(
          style: .solid,
          color: Color('#ffffff12'),
          width: Unit.pixels(1),
        ),
        flexDirection: .column,
        justifyContent: .end,
        backgroundColor: const Color('#121212'),
        raw: {
          'border-radius': '18px',
          'transition':
              'transform 220ms ease, border-color 220ms ease, background-color 220ms ease, box-shadow 220ms ease',
        },
      ),
      css('&:hover, &:focus-visible').styles(
        border: const Border.all(
          style: .solid,
          color: Color('#ff572266'),
          width: Unit.pixels(1),
        ),
        shadow: const BoxShadow(
          offsetX: Unit.zero,
          offsetY: Unit.pixels(18),
          blur: Unit.pixels(44),
          color: Color('#00000052'),
        ),
        backgroundColor: const Color('#151515'),
        raw: {'transform': 'translateY(-3px)'},
      ),
      css('h3').styles(
        position: const Position.relative(),
        zIndex: const ZIndex(1),
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontSize: 1.5.rem,
        fontWeight: .w800,
        letterSpacing: (-0.03).em,
        textTransform: .upperCase,
      ),
      css('p').styles(
        position: const Position.relative(),
        zIndex: const ZIndex(1),
        maxWidth: 460.px,
        margin: .only(top: 12.px),
        color: const Color('#a99b97'),
        fontSize: 0.9375.rem,
        fontWeight: .w300,
        lineHeight: 1.55.em,
      ),
    ]),
    css('.foxir .studio-principle-art').styles(
      position: .absolute(top: (-8).px, right: (-10).px),
      zIndex: const ZIndex(0),
      width: 178.px,
      height: 128.px,
      opacity: 0.22,
      raw: {
        'pointer-events': 'none',
        'transition': 'opacity 220ms ease, transform 600ms cubic-bezier(.2,.8,.2,1)',
      },
    ),
    css('.foxir .studio-principle-art .art-line').styles(
      position: const Position.absolute(),
      display: .block,
      border: const Border.all(
        style: .solid,
        color: Color('#ff572266'),
        width: Unit.pixels(1),
      ),
      raw: {
        'transition': 'transform 600ms cubic-bezier(.2,.8,.2,1), border-color 220ms ease',
      },
    ),
    css(
      '.foxir .studio-principle-card:hover .studio-principle-art, .foxir .studio-principle-card:focus-visible .studio-principle-art',
    ).styles(
      opacity: 0.42,
      raw: {'transform': 'translate(-5px, 5px) scale(1.06)'},
    ),
    css(
      '.foxir .studio-principle-card:hover .art-line, .foxir .studio-principle-card:focus-visible .art-line',
    ).styles(
      raw: {'border-color': 'rgba(255,87,34,.78)'},
    ),

    // 01 — a focused core held by independent orbits.
    css('.foxir .studio-principle-art.art-1 .art-line-a').styles(
      raw: {
        'left': '2px',
        'top': '24px',
        'width': '118px',
        'height': '42px',
        'border-radius': '50%',
        'transform': 'rotate(-9deg)',
      },
    ),
    css('.foxir .studio-principle-art.art-1 .art-line-b').styles(
      raw: {
        'left': '31px',
        'top': '3px',
        'width': '54px',
        'height': '84px',
        'border-radius': '50%',
        'transform': 'rotate(34deg)',
      },
    ),
    css('.foxir .studio-principle-art.art-1 .art-line-c').styles(
      raw: {
        'left': '53px',
        'top': '38px',
        'width': '12px',
        'height': '12px',
        'border-radius': '50%',
        'background': '#ff5722',
        'box-shadow': '0 0 22px rgba(255,87,34,.45)',
      },
    ),
    css('.foxir .studio-principle-art.art-1 .art-line-d').styles(
      raw: {
        'left': '44px',
        'top': '29px',
        'width': '30px',
        'height': '30px',
        'border-radius': '50%',
      },
    ),

    // 02 — three crafted frames meeting at one precise joint.
    css('.foxir .studio-principle-art.art-2 .art-line').styles(
      width: 48.px,
      height: 48.px,
      raw: {'transform': 'rotate(45deg)'},
    ),
    css('.foxir .studio-principle-art.art-2 .art-line-a').styles(
      position: .absolute(left: 12.px, top: 12.px),
    ),
    css('.foxir .studio-principle-art.art-2 .art-line-b').styles(
      position: .absolute(left: 54.px, top: 12.px),
    ),
    css('.foxir .studio-principle-art.art-2 .art-line-c').styles(
      position: .absolute(left: 33.px, top: 48.px),
    ),
    css('.foxir .studio-principle-art.art-2 .art-line-d').styles(
      position: .absolute(left: 51.px, top: 42.px),
      width: 12.px,
      height: 12.px,
      backgroundColor: foxirAccent,
      shadow: const BoxShadow(
        offsetX: Unit.zero,
        offsetY: Unit.zero,
        blur: Unit.pixels(18),
        color: Color('#ff572266'),
      ),
      raw: {
        'border-radius': '3px',
        'transform': 'rotate(45deg)',
      },
    ),

    // 03 — three measured waves settling around one calm point.
    css(
      '.foxir .studio-principle-art.art-3 .art-line-a, .foxir .studio-principle-art.art-3 .art-line-b, .foxir .studio-principle-art.art-3 .art-line-c',
    ).styles(
      height: 22.px,
      raw: {
        'border': '0',
        'border-top': '1px solid rgba(255,87,34,.55)',
        'border-radius': '50%',
      },
    ),
    css('.foxir .studio-principle-art.art-3 .art-line-a').styles(
      position: .absolute(left: .zero, top: 8.px),
      width: 126.px,
    ),
    css('.foxir .studio-principle-art.art-3 .art-line-b').styles(
      position: .absolute(left: 9.px, top: 27.px),
      width: 108.px,
    ),
    css('.foxir .studio-principle-art.art-3 .art-line-c').styles(
      position: .absolute(left: 18.px, top: 46.px),
      width: 90.px,
    ),
    css('.foxir .studio-principle-art.art-3 .art-line-d').styles(
      position: .absolute(left: 56.px, top: 73.px),
      width: 9.px,
      height: 9.px,
      border: Border.none,
      backgroundColor: foxirAccent,
      shadow: const BoxShadow(
        offsetX: Unit.zero,
        offsetY: Unit.zero,
        blur: Unit.pixels(16),
        color: Color('#ff572266'),
      ),
      raw: {'border-radius': '50%'},
    ),

    // 04 — modular blocks with room to keep evolving.
    css('.foxir .studio-principle-art.art-4 .art-line').styles(
      width: 22.px,
      backgroundColor: const Color('#ff57220d'),
      raw: {
        'bottom': '0',
        'border-radius': '4px 4px 1px 1px',
      },
    ),
    css('.foxir .studio-principle-art.art-4 .art-line-a').styles(
      position: .absolute(left: 2.px),
      height: 22.px,
    ),
    css('.foxir .studio-principle-art.art-4 .art-line-b').styles(
      position: .absolute(left: 33.px),
      height: 42.px,
    ),
    css('.foxir .studio-principle-art.art-4 .art-line-c').styles(
      position: .absolute(left: 64.px),
      height: 63.px,
    ),
    css('.foxir .studio-principle-art.art-4 .art-line-d').styles(
      position: .absolute(left: 95.px),
      height: 86.px,
      backgroundColor: const Color('#ff57221f'),
    ),
    css('.foxir .studio-principle-number').styles(
      position: .absolute(right: 24.px, top: 22.px),
      zIndex: const ZIndex(1),
      color: foxirAccent,
      fontSize: 0.6875.rem,
      fontWeight: .w600,
      letterSpacing: 0.1.em,
    ),
    css('.foxir .studio-process').styles(
      padding: .symmetric(horizontal: 24.px, vertical: 88.px),
      backgroundColor: const Color('#111111'),
    ),
    css('.foxir .studio-process-track').styles(
      position: const Position.relative(),
      display: .grid,
      gap: .all(34.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1))]),
      ),
    ),
    css('.foxir .studio-process-track::before, .foxir .studio-process-track::after').styles(
      position: .absolute(left: 14.px, top: .zero, bottom: .zero),
      zIndex: const ZIndex(0),
      width: 1.px,
      raw: {
        'content': '""',
        'transform-origin': 'top',
      },
    ),
    css('.foxir .studio-process-track::before').styles(
      backgroundColor: const Color('#ffffff18'),
    ),
    css('.foxir .studio-process-track::after').styles(
      backgroundColor: foxirAccent,
      raw: {
        'transform': 'scaleY(0)',
        'transition': 'transform 1200ms cubic-bezier(.2,.8,.2,1) 180ms',
      },
    ),
    css('.foxir .studio-process.is-visible .studio-process-track::after').styles(
      raw: {'transform': 'scaleY(1)'},
    ),
    css('.foxir .studio-process-step').styles(
      position: const Position.relative(),
      zIndex: const ZIndex(1),
      padding: .only(left: 52.px),
    ),
    css('.foxir .studio-process-number').styles(
      position: .absolute(left: .zero, top: 2.px),
      display: .flex,
      zIndex: const ZIndex(2),
      width: 29.px,
      height: 29.px,
      border: const Border.all(
        style: .solid,
        color: foxirAccent,
        width: Unit.pixels(1),
      ),
      justifyContent: .center,
      alignItems: .center,
      color: foxirInk,
      backgroundColor: const Color('#111111'),
      fontSize: 0.5625.rem,
      fontWeight: .w700,
      raw: {
        'border-radius': '50%',
        'box-shadow': '0 0 0 6px #111111',
      },
    ),
    css('.foxir .studio-process-step h3').styles(
      color: foxirInk,
      fontFamily: const .list([
        FontFamily('Hanken Grotesk'),
        FontFamilies.sansSerif,
      ]),
      fontSize: 1.5.rem,
      fontWeight: .w800,
      letterSpacing: (-0.025).em,
      textTransform: .upperCase,
    ),
    css('.foxir .studio-process-step p').styles(
      maxWidth: 360.px,
      margin: .only(top: 8.px),
      color: const Color('#a99b97'),
      fontSize: 0.9375.rem,
      fontWeight: .w300,
      lineHeight: 1.55.em,
    ),
    css('.foxir .studio-facts').styles(
      padding: .symmetric(horizontal: 24.px, vertical: 88.px),
    ),
    css('.foxir .studio-facts-intro').styles(
      display: .flex,
      margin: .only(bottom: 42.px),
      flexDirection: .column,
      gap: .all(20.px),
    ),
    css('.foxir .studio-facts-intro h2').styles(
      maxWidth: 760.px,
      color: foxirInk,
      fontFamily: const .list([
        FontFamily('Hanken Grotesk'),
        FontFamilies.sansSerif,
      ]),
      fontSize: 2.5.rem,
      fontWeight: .w800,
      letterSpacing: (-0.04).em,
      lineHeight: 1.em,
      textTransform: .upperCase,
    ),
    css('.foxir .studio-facts-grid').styles(
      display: .grid,
      gap: .all(1.px),
      backgroundColor: const Color('#ffffff12'),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
    ),
    css('.foxir .studio-fact').styles(
      display: .flex,
      minHeight: 180.px,
      padding: .all(22.px),
      flexDirection: .column,
      justifyContent: .spaceBetween,
      backgroundColor: foxirBg,
    ),
    css('.foxir .studio-fact strong').styles(
      color: foxirInk,
      fontFamily: const .list([
        FontFamily('Hanken Grotesk'),
        FontFamilies.sansSerif,
      ]),
      fontSize: 2.25.rem,
      fontWeight: .w900,
      letterSpacing: (-0.04).em,
      lineHeight: 1.em,
      textTransform: .upperCase,
    ),
    css('.foxir .studio-fact span').styles(
      color: foxirAccent,
      fontSize: 0.6875.rem,
      fontWeight: .w600,
      letterSpacing: 0.1.em,
      textTransform: .upperCase,
    ),
    css('.foxir .studio-products').styles(
      padding: .symmetric(horizontal: 24.px, vertical: 88.px),
      backgroundColor: const Color('#111111'),
    ),
    css('.foxir .studio-products-heading').styles(
      display: .flex,
      margin: .only(bottom: 40.px),
      flexDirection: .column,
      gap: .all(20.px),
    ),
    css('.foxir .studio-products-heading h2').styles(
      maxWidth: 760.px,
      color: foxirInk,
      fontFamily: const .list([
        FontFamily('Hanken Grotesk'),
        FontFamilies.sansSerif,
      ]),
      fontSize: 2.5.rem,
      fontWeight: .w800,
      letterSpacing: (-0.04).em,
      lineHeight: 1.em,
      textTransform: .upperCase,
    ),
    css('.foxir .studio-product-links').styles(
      display: .flex,
      overflow: .hidden,
      border: const Border.all(
        style: .solid,
        color: Color('#ffffff18'),
        width: Unit.pixels(1),
      ),
      flexDirection: .column,
      gap: .all(1.px),
      backgroundColor: const Color('#ffffff18'),
      raw: {'border-radius': '18px'},
    ),
    css('.foxir .studio-product-links > a', [
      css('&').styles(
        display: .flex,
        minHeight: 130.px,
        padding: .all(24.px),
        justifyContent: .spaceBetween,
        alignItems: .center,
        gap: .all(24.px),
        backgroundColor: const Color('#111111'),
        raw: {
          'transition': 'color 180ms ease, background-color 180ms ease',
        },
      ),
      css('&:hover, &:focus-visible').styles(
        color: foxirAccent,
        backgroundColor: const Color('#171412'),
      ),
      css('span:first-child').styles(
        color: const Color('#8d817e'),
        fontSize: 0.625.rem,
        fontWeight: .w600,
        letterSpacing: 0.1.em,
        textTransform: .upperCase,
      ),
      css('h3').styles(
        margin: .only(top: 6.px),
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontSize: 2.rem,
        fontWeight: .w800,
        letterSpacing: (-0.035).em,
        textTransform: .upperCase,
      ),
      css('&:hover h3, &:focus-visible h3').styles(
        color: foxirAccent,
      ),
    ]),
    css('.foxir .studio-product-arrow').styles(
      color: foxirInk,
      fontSize: 1.25.rem,
      raw: {'transition': 'color 180ms ease, transform 180ms ease'},
    ),
    css(
      '.foxir .studio-product-links > a:hover .studio-product-arrow, .foxir .studio-product-links > a:focus-visible .studio-product-arrow',
    ).styles(
      color: foxirAccent,
      raw: {'transform': 'translate(3px, -3px)'},
    ),
    css('.foxir .studio-cta').styles(
      display: .flex,
      margin: .symmetric(horizontal: 24.px, vertical: 64.px),
      padding: .all(26.px),
      border: const Border.all(
        style: .solid,
        color: Color('#ffffff18'),
        width: Unit.pixels(1),
      ),
      flexDirection: .column,
      alignItems: .start,
      gap: .all(24.px),
      backgroundColor: const Color('#111111'),
      raw: {
        'border-radius': '18px',
        'transition': 'border-color 180ms ease, background-color 180ms ease',
      },
    ),
    css('.foxir .studio-cta:hover, .foxir .studio-cta:focus-visible').styles(
      border: const Border.all(
        style: .solid,
        color: Color('#ff572266'),
        width: Unit.pixels(1),
      ),
      backgroundColor: const Color('#151515'),
    ),
    css('.foxir .studio-cta > div > span').styles(
      color: foxirAccent,
      fontSize: 0.6875.rem,
      fontWeight: .w600,
      letterSpacing: 0.1.em,
      textTransform: .upperCase,
    ),
    css('.foxir .studio-cta h2').styles(
      maxWidth: 700.px,
      margin: .only(top: 12.px),
      color: foxirInk,
      fontFamily: const .list([
        FontFamily('Hanken Grotesk'),
        FontFamilies.sansSerif,
      ]),
      fontWeight: .w900,
      letterSpacing: (-0.035).em,
      lineHeight: 1.em,
      textTransform: .upperCase,
      raw: {'font-size': 'clamp(1.75rem, 4.5vw, 2.75rem)'},
    ),
    css('.foxir .studio-cta-link', [
      css('&').styles(
        display: .flex,
        minHeight: 36.px,
        padding: .only(bottom: 7.px),
        border: const Border.only(
          bottom: BorderSide(
            style: .solid,
            color: Color('#ffffff55'),
            width: Unit.pixels(1),
          ),
        ),
        justifyContent: .center,
        alignItems: .center,
        gap: .all(14.px),
        color: foxirInk,
        fontSize: 0.6875.rem,
        fontWeight: .w600,
        letterSpacing: 0.1.em,
        textTransform: .upperCase,
        whiteSpace: .noWrap,
        raw: {
          'transition': 'border-color 160ms ease, color 160ms ease',
        },
      ),
    ]),
    css(
      '.foxir .studio-cta:hover .studio-cta-link, .foxir .studio-cta:focus-visible .studio-cta-link',
    ).styles(
      border: const Border.only(
        bottom: BorderSide(
          style: .solid,
          color: foxirAccent,
          width: Unit.pixels(1),
        ),
      ),
      color: foxirAccent,
    ),
    css('.foxir .studio-cta-arrow').styles(
      raw: {'transition': 'transform 180ms ease'},
    ),
    css(
      '.foxir .studio-cta:hover .studio-cta-arrow, .foxir .studio-cta:focus-visible .studio-cta-arrow',
    ).styles(
      raw: {'transform': 'translate(3px, -3px)'},
    ),
    css('.foxir.studio-page.has-motion .studio-title-line').styles(
      opacity: 0,
      raw: {
        'animation': 'studio-title-in 780ms cubic-bezier(.2,.8,.2,1) forwards',
      },
    ),
    css('.foxir.studio-page.has-motion .studio-title-line:nth-child(2)').styles(
      raw: {'animation-delay': '110ms'},
    ),
    css('.foxir.studio-page.has-motion .studio-reveal').styles(
      opacity: 0,
      raw: {
        'transform': 'translateY(28px)',
        'transition': 'opacity 720ms ease, transform 720ms cubic-bezier(.2,.8,.2,1)',
      },
    ),
    css('.foxir.studio-page.has-motion .studio-reveal.is-visible').styles(
      opacity: 1,
      raw: {'transform': 'translateY(0)'},
    ),
    css('.foxir.studio-page.has-motion .reveal-delay-1').styles(
      raw: {'transition-delay': '60ms'},
    ),
    css('.foxir.studio-page.has-motion .reveal-delay-2').styles(
      raw: {'transition-delay': '120ms'},
    ),
    css('.foxir.studio-page.has-motion .reveal-delay-3').styles(
      raw: {'transition-delay': '180ms'},
    ),
    css('.foxir.studio-page.has-motion .reveal-delay-4').styles(
      raw: {'transition-delay': '240ms'},
    ),
    css.media(desktop, [
      css('.foxir .studio-hero', [
        css('&').styles(
          minHeight: 650.px,
          padding: .symmetric(vertical: 80.px),
          raw: {
            'padding-left': 'clamp(48px, 6vw, 112px)',
            'padding-right': 'clamp(48px, 6vw, 112px)',
          },
        ),
        css('.studio-hero-copy').styles(
          fontSize: 1.25.rem,
          lineHeight: 1.6.em,
        ),
      ]),
      css('.foxir .studio-manifesto').styles(
        minHeight: 620.px,
        padding: .symmetric(vertical: 120.px),
        flexDirection: .row,
        justifyContent: .spaceBetween,
        alignItems: .start,
        raw: {
          'padding-left': 'clamp(48px, 6vw, 112px)',
          'padding-right': 'clamp(48px, 6vw, 112px)',
        },
      ),
      css('.foxir .studio-manifesto-content').styles(width: 72.percent),
      css('.foxir .studio-manifesto-content p').styles(
        fontSize: 1.25.rem,
        lineHeight: 1.65.em,
      ),
      css('.foxir .studio-principles').styles(
        padding: .symmetric(vertical: 120.px),
        raw: {
          'padding-left': 'clamp(48px, 6vw, 112px)',
          'padding-right': 'clamp(48px, 6vw, 112px)',
        },
      ),
      css('.foxir .studio-section-heading').styles(
        margin: .only(bottom: 60.px),
        flexDirection: .row,
        justifyContent: .spaceBetween,
        alignItems: .start,
      ),
      css('.foxir .studio-section-heading h2').styles(width: 62.percent),
      css('.foxir .studio-principles-grid').styles(
        gap: .all(20.px),
        gridTemplate: const GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
      css('.foxir .studio-principle-card').styles(
        minHeight: 230.px,
        padding: .all(32.px),
      ),
      css('.foxir .studio-process').styles(
        padding: .symmetric(vertical: 120.px),
        raw: {
          'padding-left': 'clamp(48px, 6vw, 112px)',
          'padding-right': 'clamp(48px, 6vw, 112px)',
        },
      ),
      css('.foxir .studio-process-track').styles(
        gap: .all(32.px),
        gridTemplate: const GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
      css('.foxir .studio-process-track::before, .foxir .studio-process-track::after').styles(
        position: .absolute(left: .zero, top: 14.px, right: .zero),
        width: Unit.auto,
        height: 1.px,
        raw: {'transform-origin': 'left'},
      ),
      css('.foxir .studio-process-track::after').styles(
        raw: {'transform': 'scaleX(0)'},
      ),
      css('.foxir .studio-process.is-visible .studio-process-track::after').styles(
        raw: {'transform': 'scaleX(1)'},
      ),
      css('.foxir .studio-process-step').styles(
        padding: .only(top: 58.px, left: .zero),
      ),
      css('.foxir .studio-process-number').styles(
        position: .absolute(left: .zero, top: .zero),
      ),
      css('.foxir .studio-facts').styles(
        padding: .symmetric(vertical: 120.px),
        raw: {
          'padding-left': 'clamp(48px, 6vw, 112px)',
          'padding-right': 'clamp(48px, 6vw, 112px)',
        },
      ),
      css('.foxir .studio-facts-intro').styles(
        margin: .only(bottom: 60.px),
        flexDirection: .row,
        justifyContent: .spaceBetween,
        alignItems: .start,
      ),
      css('.foxir .studio-facts-intro h2').styles(width: 62.percent),
      css('.foxir .studio-facts-grid').styles(
        gridTemplate: const GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
      css('.foxir .studio-fact').styles(
        minHeight: 230.px,
        padding: .all(28.px),
      ),
      css('.foxir .studio-fact strong').styles(fontSize: 2.75.rem),
      css('.foxir .studio-products').styles(
        padding: .symmetric(vertical: 120.px),
        raw: {
          'padding-left': 'clamp(48px, 6vw, 112px)',
          'padding-right': 'clamp(48px, 6vw, 112px)',
        },
      ),
      css('.foxir .studio-products-heading').styles(
        margin: .only(bottom: 56.px),
        flexDirection: .row,
        justifyContent: .spaceBetween,
        alignItems: .start,
      ),
      css('.foxir .studio-products-heading h2').styles(width: 62.percent),
      css('.foxir .studio-product-links > a').styles(
        minHeight: 280.px,
        padding: .all(30.px),
        flexDirection: .column,
        alignItems: .start,
      ),
      css('.foxir .studio-product-links').styles(
        display: .grid,
        gridTemplate: const GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
      css('.foxir .studio-product-links > a h3').styles(
        fontSize: 2.5.rem,
      ),
      css('.foxir .studio-product-arrow').styles(
        alignSelf: .end,
      ),
      css('.foxir .studio-cta').styles(
        margin: .symmetric(
          vertical: 72.px,
          horizontal: .zero,
        ),
        padding: .symmetric(horizontal: 34.px, vertical: 30.px),
        flexDirection: .row,
        justifyContent: .spaceBetween,
        alignItems: .center,
        raw: {
          'margin-left': 'clamp(48px, 6vw, 112px)',
          'margin-right': 'clamp(48px, 6vw, 112px)',
        },
      ),
    ]),
    css.media(const MediaQuery.raw('(prefers-reduced-motion: reduce)'), [
      css('.foxir.studio-page .studio-title-line').styles(
        opacity: 1,
        animation: Animation.none,
        raw: {'transform': 'none'},
      ),
      css('.foxir.studio-page .studio-reveal').styles(
        opacity: 1,
        raw: {
          'transform': 'none',
          'transition': 'none',
        },
      ),
      css('.foxir.studio-page .studio-marquee-track').styles(
        animation: Animation.none,
        raw: {'transform': 'none'},
      ),
      css('.foxir.studio-page .studio-process-track::after').styles(
        raw: {
          'transform': 'scale(1)',
          'transition': 'none',
        },
      ),
      css(
        '.foxir.studio-page .studio-principle-card, .foxir.studio-page .studio-principle-art, .foxir.studio-page .studio-principle-art .art-line, .foxir.studio-page .studio-product-links > a, .foxir.studio-page .studio-cta, .foxir.studio-page .studio-cta-link, .foxir.studio-page .studio-cta-link span',
      ).styles(
        raw: {'transition': 'none'},
      ),
    ]),
  ];
}
