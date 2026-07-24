import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pages/bettertoday.dart';
import 'pages/home.dart';
import 'pages/not_found.dart';
import 'pages/paximus.dart';
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
          title: 'Foxir Apps — Innovative Mobile App Development Solutions',
          builder: (context, state) => const HomePage(),
        ),
        Route(
          path: '/paximus',
          title: 'Paximus — OCD & Anxiety Tracking That Feels Calm',
          builder: (context, state) => const PaximusPage(),
        ),
        Route(
          path: '/vouxe',
          title: 'Vouxe — Build Discipline You Can See',
          builder: (context, state) => const VouxePage(),
        ),
        Route(
          path: '/bettertoday',
          title: 'Better Today — One Daily Reflection. A Better You.',
          builder: (context, state) => const BetterTodayPage(),
        ),
      ],
      errorBuilder: (context, state) => const NotFoundPage(),
    );
  }
}
