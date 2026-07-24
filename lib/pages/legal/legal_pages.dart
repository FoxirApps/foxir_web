import 'package:jaspr/jaspr.dart';

import '../../legal/better_privacy.dart';
import '../../legal/better_terms.dart';
import '../../legal/paximus_privacy.dart';
import '../../legal/paximus_terms.dart';
import '../../legal/vouxe_privacy.dart';
import '../../legal/vouxe_terms.dart';
import 'app_legal_page.dart';

class PaximusPrivacyPage extends StatelessComponent {
  const PaximusPrivacyPage({super.key});

  @override
  Component build(BuildContext context) {
    return const AppLegalPage(
      shell: LegalAppShell.paximus,
      document: paximusPrivacy,
    );
  }
}

class PaximusTermsPage extends StatelessComponent {
  const PaximusTermsPage({super.key});

  @override
  Component build(BuildContext context) {
    return const AppLegalPage(
      shell: LegalAppShell.paximus,
      document: paximusTerms,
    );
  }
}

class VouxePrivacyPage extends StatelessComponent {
  const VouxePrivacyPage({super.key});

  @override
  Component build(BuildContext context) {
    return const AppLegalPage(
      shell: LegalAppShell.vouxe,
      document: vouxePrivacy,
    );
  }
}

class VouxeTermsPage extends StatelessComponent {
  const VouxeTermsPage({super.key});

  @override
  Component build(BuildContext context) {
    return const AppLegalPage(
      shell: LegalAppShell.vouxe,
      document: vouxeTerms,
    );
  }
}

class BetterTodayPrivacyPage extends StatelessComponent {
  const BetterTodayPrivacyPage({super.key});

  @override
  Component build(BuildContext context) {
    return const AppLegalPage(
      shell: LegalAppShell.betterToday,
      document: betterPrivacy,
    );
  }
}

class BetterTodayTermsPage extends StatelessComponent {
  const BetterTodayTermsPage({super.key});

  @override
  Component build(BuildContext context) {
    return const AppLegalPage(
      shell: LegalAppShell.betterToday,
      document: betterTerms,
    );
  }
}
