import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// App Store / Google Play badges for Paximus.
///
/// [compact] shrinks padding for denser layouts. [inverted] flips colors on dark CTAs.
/// [alignStart] left-aligns the row (hero); default is centered.
class StoreButtons extends StatelessComponent {
  const StoreButtons({
    this.inverted = false,
    this.compact = false,
    this.alignStart = false,
    super.key,
  });

  final bool inverted;
  final bool compact;
  final bool alignStart;

  @override
  Component build(BuildContext context) {
    final classes = [
      'store-buttons',
      if (inverted) 'inverted',
      if (compact) 'compact',
      if (alignStart) 'align-start',
    ].join(' ');

    return div(classes: classes, [
      _badge(appStoreUrl, 'Download on the', 'App Store'),
      _badge(playStoreUrl, 'Get it on', 'Google Play'),
    ]);
  }

  Component _badge(String url, String eyebrow, String store) {
    return a(classes: 'store-badge', href: url, target: .blank, [
      span(classes: 'store-eyebrow', [.text(eyebrow)]),
      span(classes: 'store-name', [.text(store)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.paximus .store-buttons', [
      css('&').styles(
        display: .flex,
        justifyContent: .center,
        flexWrap: .wrap,
        gap: .all(12.px),
      ),
      css('&.align-start').styles(justifyContent: .start),
      css('.store-badge', [
        css('&').styles(
          display: .flex,
          minWidth: 160.px,
          padding: .symmetric(horizontal: 22.px, vertical: 10.px),
          radius: .circular(14.px),
          flexDirection: .column,
          alignItems: .center,
          color: Colors.white,
          lineHeight: 1.3.em,
          backgroundColor: dark,
          transition: const Transition('transform', duration: Duration(milliseconds: 150)),
        ),
        css('&:hover').styles(transform: .translate(y: (-2).px)),
      ]),
      css('&.compact .store-badge').styles(
        minWidth: Unit.auto,
        padding: .symmetric(horizontal: 16.px, vertical: 8.px),
      ),
      css('.store-eyebrow').styles(
        fontSize: 0.75.rem,
        fontWeight: .w500,
        opacity: 0.75,
      ),
      css('.store-name').styles(
        fontSize: 1.0625.rem,
        fontWeight: .w700,
      ),
      css('&.inverted .store-badge').styles(
        color: ink,
        backgroundColor: Colors.white,
      ),
    ]),
  ];
}
