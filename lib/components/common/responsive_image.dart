import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Renders a WebP source set with the original asset as a browser fallback.
final class ResponsiveImage extends StatelessComponent {
  const ResponsiveImage({
    required this.src,
    required this.webpSrcSet,
    required this.alt,
    this.sizes,
    this.width,
    this.height,
    this.loading,
    this.classes,
    this.attributes,
    super.key,
  });

  final String src;
  final String webpSrcSet;
  final String alt;
  final String? sizes;
  final int? width;
  final int? height;
  final MediaLoading? loading;
  final String? classes;
  final Map<String, String>? attributes;

  @override
  Component build(BuildContext context) {
    return Component.element(
      tag: 'picture',
      styles: const Styles(raw: {'display': 'contents'}),
      children: [
        source(
          type: 'image/webp',
          attributes: {
            'srcset': webpSrcSet,
            'sizes': ?sizes,
          },
        ),
        img(
          src: src,
          alt: alt,
          width: width,
          height: height,
          loading: loading,
          classes: classes,
          attributes: {
            'decoding': 'async',
            ...?attributes,
          },
        ),
      ],
    );
  }
}
