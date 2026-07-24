import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

/// Overrides the site favicon for the current page via [Document.head].
///
/// Uses a stable `id` so nested pages replace the global favicon from
/// [main.server.dart] during pre-render.
class AppFavicon extends StatelessComponent {
  const AppFavicon({
    required this.href,
    this.type = 'image/png',
    super.key,
  });

  final String href;
  final String type;

  static const elementId = 'site-favicon';

  @override
  Component build(BuildContext context) {
    return Document.head(children: [
      link(id: elementId, rel: 'icon', type: type, href: href),
    ]);
  }
}
