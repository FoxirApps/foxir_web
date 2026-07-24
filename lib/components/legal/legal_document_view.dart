import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../legal/legal_document.dart';

/// Clean prose renderer for privacy / terms documents.
class LegalDocumentView extends StatelessComponent {
  const LegalDocumentView({
    required this.document,
    required this.backHref,
    required this.backLabel,
    super.key,
  });

  final LegalDocument document;
  final String backHref;
  final String backLabel;

  @override
  Component build(BuildContext context) {
    return article(classes: 'legal-doc', [
      a(classes: 'legal-back', href: backHref, [
        span(classes: 'legal-back-chevron', attributes: {'aria-hidden': 'true'}, [
          .text('\u2190'),
        ]),
        span([.text(backLabel)]),
      ]),
      h1([.text(document.title)]),
      p(classes: 'legal-updated', [.text('Last updated: ${document.lastUpdated}')]),
      for (final section in document.sections) ...[
        h2([.text(section.heading)]),
        for (final block in section.blocks) _block(block),
      ],
    ]);
  }

  Component _block(LegalBlock block) {
    return switch (block) {
      LegalParagraph(:final text) => p([.text(text)]),
      LegalTerm(:final term, :final body) => p([
        strong([.text('$term: ')]),
        .text(body),
      ]),
      LegalBullets(:final items) => ul([
        for (final item in items) li([.text(item)]),
      ]),
    };
  }

  @css
  static List<StyleRule> get styles => [
    css('.legal-doc', [
      css('&').styles(
        maxWidth: 720.px,
        margin: .symmetric(horizontal: Unit.auto),
        padding: .symmetric(vertical: 48.px, horizontal: 20.px),
        lineHeight: 1.65.em,
      ),
      css('.legal-back', [
        css('&').styles(
          display: .inlineFlex,
          margin: .only(bottom: 28.px),
          alignItems: .center,
          gap: .all(8.px),
          fontSize: 0.9375.rem,
          fontWeight: .w600,
          opacity: 0.72,
          transition: const Transition('opacity', duration: Duration(milliseconds: 150)),
        ),
        css('&:hover').styles(opacity: 1),
      ]),
      css('.legal-back-chevron').styles(
        display: .inlineFlex,
        width: 28.px,
        height: 28.px,
        border: const Border.all(style: .solid, color: Color('currentColor'), width: Unit.pixels(1)),
        radius: .circular(999.px),
        justifyContent: .center,
        alignItems: .center,
        fontSize: 0.875.rem,
        lineHeight: 1.em,
        opacity: 0.85,
      ),
      css('h1').styles(
        margin: .only(bottom: 12.px),
        fontSize: 2.rem,
        fontWeight: .w700,
        letterSpacing: (-0.02).em,
        lineHeight: 1.2.em,
      ),
      css('.legal-updated').styles(
        margin: .only(bottom: 36.px),
        fontSize: 0.9375.rem,
        fontWeight: .w500,
        opacity: 0.7,
      ),
      css('h2').styles(
        margin: .only(top: 32.px, bottom: 12.px),
        fontSize: 1.25.rem,
        fontWeight: .w700,
        letterSpacing: (-0.01).em,
        lineHeight: 1.3.em,
      ),
      css('p').styles(
        margin: .only(bottom: 12.px),
        fontSize: 1.rem,
      ),
      css('ul').styles(
        margin: .only(bottom: 12.px),
        padding: .only(left: 1.25.em),
        listStyle: .disc,
      ),
      css('li').styles(
        margin: .only(bottom: 6.px),
        fontSize: 1.rem,
      ),
      css('strong').styles(fontWeight: .w700),
    ]),
    css.media(desktop, [
      css('.legal-doc').styles(
        padding: .symmetric(vertical: 64.px, horizontal: 24.px),
      ),
      css('.legal-doc h1').styles(fontSize: 2.5.rem),
    ]),
  ];
}
