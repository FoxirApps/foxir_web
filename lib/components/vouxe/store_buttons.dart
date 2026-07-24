import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// App Store / Google Play badges for Vouxe dark surfaces.
class StoreButtons extends StatelessComponent {
  const StoreButtons({this.alignStart = false, super.key});

  final bool alignStart;

  @override
  Component build(BuildContext context) {
    return div(classes: 'store-buttons${alignStart ? ' align-start' : ''}', [
      _badge(vouxeAppStoreUrl, 'Download on the', 'App Store'),
      _badge(vouxePlayStoreUrl, 'Get it on', 'Google Play'),
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
    css('.vouxe .store-buttons', [
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
          border: const Border.all(style: .solid, color: vouxeHairline, width: Unit.pixels(1)),
          radius: .circular(14.px),
          flexDirection: .column,
          alignItems: .center,
          color: vouxeInk,
          lineHeight: 1.3.em,
          backgroundColor: const Color('#ffffff0a'),
          transition: const Transition('transform', duration: Duration(milliseconds: 150)),
        ),
        css('&:hover').styles(
          backgroundColor: vouxeElevated,
          transform: .translate(y: (-2).px),
        ),
      ]),
      css('.store-eyebrow').styles(
        fontSize: 0.75.rem,
        fontWeight: .w500,
        opacity: 0.75,
      ),
      css('.store-name').styles(
        fontSize: 1.0625.rem,
        fontWeight: .w700,
      ),
    ]),
  ];
}
