/// Structured legal document content (privacy / terms).
class LegalDocument {
  const LegalDocument({
    required this.title,
    required this.lastUpdated,
    required this.sections,
  });

  final String title;
  final String lastUpdated;
  final List<LegalSection> sections;
}

class LegalSection {
  const LegalSection({
    required this.heading,
    required this.blocks,
  });

  final String heading;
  final List<LegalBlock> blocks;
}

sealed class LegalBlock {
  const LegalBlock();
}

/// Plain paragraph of body text.
class LegalParagraph extends LegalBlock {
  const LegalParagraph(this.text);
  final String text;
}

/// Bold term label followed by body text on one line.
class LegalTerm extends LegalBlock {
  const LegalTerm(this.term, this.body);
  final String term;
  final String body;
}

/// Unordered bullet list.
class LegalBullets extends LegalBlock {
  const LegalBullets(this.items);
  final List<String> items;
}
