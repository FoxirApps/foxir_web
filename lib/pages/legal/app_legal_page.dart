import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../components/bettertoday/footer.dart' as better;
import '../../components/bettertoday/header.dart' as better;
import '../../components/legal/legal_document_view.dart';
import '../../components/paximus/footer.dart' as paximus;
import '../../components/paximus/header.dart' as paximus;
import '../../components/vouxe/footer.dart' as vouxe;
import '../../components/vouxe/header.dart' as vouxe;
import '../../legal/legal_document.dart';

/// Which app chrome (header/footer + page class) wraps a legal document.
enum LegalAppShell { paximus, vouxe, betterToday }

/// Legal document page inside an app landing shell.
class AppLegalPage extends StatelessComponent {
  const AppLegalPage({
    required this.shell,
    required this.document,
    super.key,
  });

  final LegalAppShell shell;
  final LegalDocument document;

  @override
  Component build(BuildContext context) {
    final (:pageClass, :backHref, :backLabel, :header, :footer) = switch (shell) {
      LegalAppShell.paximus => (
          pageClass: 'paximus',
          backHref: '/paximus',
          backLabel: 'Back to Paximus',
          header: const paximus.Header(),
          footer: const paximus.Footer(),
        ),
      LegalAppShell.vouxe => (
          pageClass: 'vouxe',
          backHref: '/vouxe',
          backLabel: 'Back to Vouxe',
          header: const vouxe.Header(),
          footer: const vouxe.Footer(),
        ),
      LegalAppShell.betterToday => (
          pageClass: 'bettertoday',
          backHref: '/bettertoday',
          backLabel: 'Back to Better Today',
          header: const better.Header(),
          footer: const better.Footer(),
        ),
    };

    return div(classes: pageClass, [
      header,
      main_([
        div(classes: 'container', [
          LegalDocumentView(
            document: document,
            backHref: backHref,
            backLabel: backLabel,
          ),
        ]),
      ]),
      footer,
    ]);
  }
}
