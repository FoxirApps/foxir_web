import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'components/bettertoday/metadata.dart';
import 'components/paximus/metadata.dart';
import 'components/vouxe/metadata.dart';
import 'pages/apps.dart';
import 'pages/bettertoday.dart';
import 'pages/contact.dart';
import 'pages/home.dart';
import 'pages/legal/legal_pages.dart';
import 'pages/not_found.dart';
import 'pages/paximus.dart';
import 'pages/studio.dart';
import 'pages/vouxe.dart';

/// The root component: the Foxir Apps umbrella site with one route per app.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Router(
      routes: [
        Route(
          path: '/',
          title: 'Foxir Apps — Home to the Apps We Craft',
          builder: (context, state) => const HomePage(),
        ),
        Route(
          path: '/contact',
          title: 'Contact — Foxir Apps',
          builder: (context, state) => const ContactPage(),
        ),
        Route(
          path: '/apps',
          title: 'App Archive — Foxir Apps',
          builder: (context, state) => const AppsPage(),
        ),
        Route(
          path: '/studio',
          title: 'Studio — Foxir Apps',
          builder: (context, state) => const StudioPage(),
        ),
        Route(
          path: '/paximus',
          title: paximusPageTitle,
          builder: (context, state) => const PaximusPage(),
        ),
        Route(
          path: '/paximus/privacy-policy',
          title: 'Privacy Policy — Paximus',
          builder: (context, state) => const PaximusPrivacyPage(),
        ),
        Route(
          path: '/paximus/terms-of-service',
          title: 'Terms of Service — Paximus',
          builder: (context, state) => const PaximusTermsPage(),
        ),
        Route(
          path: '/vouxe',
          title: vouxePageTitle,
          builder: (context, state) => const VouxePage(),
        ),
        Route(
          path: '/vouxe/privacy-policy',
          title: 'Privacy Policy — Vouxe',
          builder: (context, state) => const VouxePrivacyPage(),
        ),
        Route(
          path: '/vouxe/terms-of-service',
          title: 'Terms of Service — Vouxe',
          builder: (context, state) => const VouxeTermsPage(),
        ),
        Route(
          path: '/bettertoday',
          title: betterTodayPageTitle,
          builder: (context, state) => const BetterTodayPage(),
        ),
        Route(
          path: '/bettertoday/privacy-policy',
          title: 'Privacy Policy — Better Today',
          builder: (context, state) => const BetterTodayPrivacyPage(),
        ),
        Route(
          path: '/bettertoday/terms-of-service',
          title: 'Terms of Service — Better Today',
          builder: (context, state) => const BetterTodayTermsPage(),
        ),
      ],
      errorBuilder: (context, state) => const NotFoundPage(),
    );
  }
}
