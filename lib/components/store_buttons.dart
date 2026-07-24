import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

/// Official App Store / Google Play badge pair.
///
/// [compact] uses a smaller badge height (headers / dense rows).
/// [alignStart] left-aligns the row (hero); default is centered.
class StoreButtons extends StatelessComponent {
  const StoreButtons({
    required this.appStoreUrl,
    required this.playStoreUrl,
    this.alignStart = false,
    this.compact = false,
    super.key,
  });

  final String appStoreUrl;
  final String playStoreUrl;
  final bool alignStart;
  final bool compact;

  @override
  Component build(BuildContext context) {
    final classes = [
      'store-buttons',
      if (compact) 'compact',
      if (alignStart) 'align-start',
    ].join(' ');

    return div(classes: classes, [
      _badge(
        href: appStoreUrl,
        src: appStoreBadgeSrc,
        alt: 'Download on the App Store',
      ),
      _badge(
        href: playStoreUrl,
        src: playStoreBadgeSrc,
        alt: 'Get it on Google Play',
      ),
    ]);
  }

  Component _badge({
    required String href,
    required String src,
    required String alt,
  }) {
    return a(
      classes: 'store-badge',
      href: href,
      target: .blank,
      attributes: {'rel': 'noopener noreferrer'},
      [
        img(src: src, alt: alt, classes: 'store-badge-img'),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.store-buttons', [
      css('&').styles(
        display: .flex,
        alignItems: .center,
        flexWrap: .wrap,
        gap: .all(12.px),
        justifyContent: .center,
      ),
      css('&.align-start').styles(justifyContent: .start),
      css('&.compact').styles(gap: .all(8.px)),
      css('.store-badge', [
        css('&').styles(
          display: .block,
          lineHeight: 0.em,
          transition: const Transition('transform', duration: Duration(milliseconds: 150)),
        ),
        css('&:hover').styles(transform: .translate(y: (-2).px)),
      ]),
      css('.store-badge-img').styles(
        display: .block,
        width: Unit.auto,
        height: 40.px,
      ),
      css('&.compact .store-badge-img').styles(height: 32.px),
    ]),
  ];
}
