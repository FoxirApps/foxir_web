import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

/// Fallback page for unknown routes, shown via [Router.errorBuilder].
class NotFoundPage extends StatelessComponent {
  const NotFoundPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'not-found', [
      div(classes: 'container not-found-inner', [
        span(classes: 'not-found-code', [.text('404')]),
        h1([.text('Page not found')]),
        p([
          .text('This route doesn\u2019t exist. Head back home to explore our apps.'),
        ]),
        a(classes: 'not-found-home', href: '/', [.text('Back to Foxir Apps')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.not-found', [
      css('&').styles(
        display: .flex,
        minHeight: 100.vh,
        color: foxirInk,
        justifyContent: .center,
        alignItems: .center,
        backgroundColor: foxirBg,
        raw: {
          'background-image':
              'radial-gradient(ellipse 80% 50% at 50% 0%, rgba(255, 82, 14, 0.22), transparent 60%)',
        },
      ),
      css('.not-found-inner').styles(
        display: .flex,
        maxWidth: 420.px,
        flexDirection: .column,
        alignItems: .center,
        gap: .all(16.px),
        textAlign: .center,
      ),
      css('.not-found-code').styles(
        color: foxirAccent,
        fontSize: 4.rem,
        fontWeight: .w700,
        letterSpacing: (-0.04).em,
        lineHeight: 1.em,
      ),
      css('h1').styles(
        fontSize: 1.75.rem,
        fontWeight: .w700,
        letterSpacing: (-0.02).em,
      ),
      css('p').styles(
        color: foxirMuted,
        fontSize: 1.rem,
        fontWeight: .w500,
      ),
      css('.not-found-home', [
        css('&').styles(
          margin: .only(top: 8.px),
          padding: .symmetric(horizontal: 22.px, vertical: 12.px),
          radius: .circular(999.px),
          color: Colors.white,
          fontSize: 0.9375.rem,
          fontWeight: .w700,
          backgroundColor: foxirAccent,
        ),
        css('&:hover').styles(backgroundColor: const Color('#ff6a2e')),
      ]),
    ]),
  ];
}
