import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'store_buttons.dart';

/// Closing call-to-action section on a dark background.
class Cta extends StatelessComponent {
  const Cta({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cta', [
      div(classes: 'container cta-inner', [
        h2([.text('Find peace today.')]),
        p([
          .text('Reduce stress and reclaim your calm. Discover how Paximus\u2019s simplicity '
              'can bring you peace every day—on your terms.'),
        ]),
        const StoreButtons(inverted: true),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.paximus .cta', [
      css('&').styles(
        padding: .symmetric(vertical: 80.px),
        color: Colors.white,
        backgroundColor: dark,
      ),
      css('.cta-inner').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        gap: .all(20.px),
        textAlign: .center,
      ),
      css('h2').styles(
        fontSize: 2.25.rem,
        fontWeight: .w700,
        lineHeight: 1.15.em,
        letterSpacing: (-0.02).em,
      ),
      css('p').styles(
        maxWidth: 32.em,
        color: mutedOnDark,
        fontSize: 1.125.rem,
        fontWeight: .w500,
      ),
    ]),
    css.media(desktop, [
      css('.paximus .cta', [
        css('&').styles(padding: .symmetric(vertical: 112.px)),
        css('h2').styles(fontSize: 3.rem),
      ]),
    ]),
  ];
}
