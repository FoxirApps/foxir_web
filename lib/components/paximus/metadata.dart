import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import '../../constants/theme.dart';

const paximusPageTitle = 'Paximus: OCD & Anxiety Tracker with Photo Proof';
const paximusPageDescription =
    'Paximus is an OCD and anxiety tracker with timestamped photo records, '
    'calming routines, mood check-ins, notes, and guided resets for iPhone and Android.';
const paximusCanonicalUrl = 'https://foxirapps.co/paximus';
const paximusOgImageUrl = 'https://foxirapps.co/images/paximus-og.png';

/// Page-specific search, social sharing, and app metadata for `/paximus`.
class PaximusMetadata extends StatelessComponent {
  const PaximusMetadata({super.key});

  @override
  Component build(BuildContext context) {
    return Document.head(
      title: paximusPageTitle,
      meta: const {'description': paximusPageDescription},
      children: [
        link(rel: 'canonical', href: paximusCanonicalUrl),
        meta(attributes: const {'property': 'og:type'}, content: 'website'),
        meta(attributes: const {'property': 'og:site_name'}, content: 'Paximus'),
        meta(attributes: const {'property': 'og:title'}, content: paximusPageTitle),
        meta(
          attributes: const {'property': 'og:description'},
          content: paximusPageDescription,
        ),
        meta(attributes: const {'property': 'og:url'}, content: paximusCanonicalUrl),
        meta(attributes: const {'property': 'og:image'}, content: paximusOgImageUrl),
        meta(
          attributes: const {'property': 'og:image:width'},
          content: '1200',
        ),
        meta(
          attributes: const {'property': 'og:image:height'},
          content: '630',
        ),
        meta(
          attributes: const {'property': 'og:image:alt'},
          content: 'Paximus OCD and anxiety tracker with a saved front-door record',
        ),
        meta(name: 'twitter:card', content: 'summary_large_image'),
        meta(name: 'twitter:title', content: paximusPageTitle),
        meta(name: 'twitter:description', content: paximusPageDescription),
        meta(name: 'twitter:image', content: paximusOgImageUrl),
        meta(
          name: 'twitter:image:alt',
          content: 'Paximus OCD and anxiety tracker with a saved front-door record',
        ),
        script(
          id: 'paximus-structured-data',
          attributes: const {'type': 'application/ld+json'},
          content:
              '''
{
  "@context": "https://schema.org",
  "@type": "MobileApplication",
  "name": "Paximus",
  "url": "$paximusCanonicalUrl",
  "description": "$paximusPageDescription",
  "applicationCategory": "HealthApplication",
  "operatingSystem": "iOS, Android",
  "downloadUrl": [
    "$appStoreUrl",
    "$playStoreUrl"
  ],
  "sameAs": [
    "$appStoreUrl",
    "$playStoreUrl"
  ]
}
''',
        ),
      ],
    );
  }
}
