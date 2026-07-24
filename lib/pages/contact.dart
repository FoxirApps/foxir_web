import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/foxir/foxir_footer.dart';
import '../components/foxir/foxir_header.dart';
import '../constants/theme.dart';

/// Contact page with a mailto-backed form (Name, Email, Message).
class ContactPage extends StatelessComponent {
  const ContactPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'foxir', [
      const FoxirHeader(),
      section(id: 'top', classes: 'contact', [
        div(classes: 'container contact-inner', [
          h1([.text('Contact')]),
          p(classes: 'contact-soft', [
            .text('We build our own apps first. If you have an idea you\u2019d love to '
                'explore together, send a note—we\u2019ll open your mail app to finish sending.'),
          ]),
          form(
            id: 'contact-form',
            classes: 'contact-form',
            [
              div(classes: 'contact-row', [
                div(classes: 'contact-field', [
                  label(htmlFor: 'contact-name', [.text('Name*')]),
                  input(
                    type: .text,
                    name: 'name',
                    id: 'contact-name',
                    attributes: const {
                      'placeholder': 'Jane Smith',
                      'required': '',
                      'autocomplete': 'name',
                    },
                  ),
                ]),
                div(classes: 'contact-field', [
                  label(htmlFor: 'contact-email', [.text('Email*')]),
                  input(
                    type: .email,
                    name: 'email',
                    id: 'contact-email',
                    attributes: const {
                      'placeholder': 'example@foxirapps.co',
                      'required': '',
                      'autocomplete': 'email',
                    },
                  ),
                ]),
              ]),
              div(classes: 'contact-field', [
                label(htmlFor: 'contact-message', [.text('Message*')]),
                textarea(
                  name: 'message',
                  id: 'contact-message',
                  rows: 5,
                  required: true,
                  placeholder: 'Your message...',
                  [],
                ),
              ]),
              button(
                type: .submit,
                classes: 'contact-submit',
                [.text('Submit')],
              ),
            ],
          ),
          p(classes: 'contact-note', [
            .text('Or reach us anytime at '),
            a(href: 'mailto:$foxirEmail', [.text(foxirEmail)]),
            .text('.'),
          ]),
        ]),
      ]),
      const FoxirFooter(),
      script(content: _mailtoScript),
    ]);
  }

  static const _mailtoScript = '''
(function () {
  var form = document.getElementById('contact-form');
  if (!form) return;
  form.addEventListener('submit', function (event) {
    event.preventDefault();
    var name = document.getElementById('contact-name').value.trim();
    var email = document.getElementById('contact-email').value.trim();
    var message = document.getElementById('contact-message').value.trim();
    if (!name || !email || !message) return;
    var subject = encodeURIComponent('Foxir Apps contact from ' + name);
    var body = encodeURIComponent(
      'Name: ' + name + '\\nEmail: ' + email + '\\n\\n' + message
    );
    window.location.href = 'mailto:$foxirEmail?subject=' + subject + '&body=' + body;
  });
})();
''';

  @css
  static List<StyleRule> get styles => [
    css('.foxir').styles(
      minHeight: 100.vh,
      color: foxirInk,
      backgroundColor: foxirBg,
      raw: {
        'background-image':
            'radial-gradient(ellipse 90% 55% at 15% -5%, rgba(255, 82, 14, 0.32), transparent 55%), '
            'radial-gradient(ellipse 70% 45% at 95% 15%, rgba(255, 82, 14, 0.14), transparent 50%), '
            'radial-gradient(ellipse 60% 50% at 50% 110%, rgba(255, 82, 14, 0.10), transparent 55%), '
            'linear-gradient(180deg, #121212 0%, #0d0d0d 45%, #0a0a0a 100%)',
        'background-attachment': 'fixed',
      },
    ),
    css('.foxir .contact', [
      css('&').styles(padding: .symmetric(vertical: 72.px)),
      css('.contact-inner').styles(
        display: .flex,
        maxWidth: 560.px,
        margin: .symmetric(horizontal: Unit.auto),
        flexDirection: .column,
        alignItems: .stretch,
        gap: .all(20.px),
      ),
      css('h1').styles(
        color: foxirInk,
        fontSize: 2.5.rem,
        fontWeight: .w700,
        letterSpacing: (-0.03).em,
        lineHeight: 1.1.em,
        textAlign: .center,
      ),
      css('.contact-soft').styles(
        color: foxirMuted,
        fontSize: 1.0625.rem,
        fontWeight: .w500,
        textAlign: .center,
      ),
      css('.contact-form').styles(
        display: .flex,
        margin: .only(top: 8.px),
        flexDirection: .column,
        gap: .all(16.px),
      ),
      css('.contact-row').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(16.px),
      ),
      css('.contact-field', [
        css('&').styles(
          display: .flex,
          width: 100.percent,
          flexDirection: .column,
          gap: .all(8.px),
        ),
        css('label').styles(
          color: foxirInk,
          fontSize: 0.875.rem,
          fontWeight: .w600,
        ),
        css('input, textarea').styles(
          width: 100.percent,
          padding: .symmetric(horizontal: 16.px, vertical: 14.px),
          border: const Border.all(style: .solid, color: foxirHairline, width: Unit.pixels(1)),
          radius: .circular(14.px),
          color: foxirBg,
          fontFamily: FontFamily.inherit,
          fontSize: 1.rem,
          fontWeight: .w500,
          backgroundColor: const Color('#e8e8ed'),
          raw: {'outline': 'none'},
        ),
        css('textarea').styles(
          minHeight: 140.px,
          raw: {'resize': 'vertical'},
        ),
      ]),
      css('.contact-submit', [
        css('&').styles(
          width: 100.percent,
          padding: .symmetric(vertical: 14.px),
          border: Border.none,
          radius: .circular(14.px),
          color: Colors.white,
          cursor: .pointer,
          fontFamily: FontFamily.inherit,
          fontSize: 1.rem,
          fontWeight: .w700,
          backgroundColor: foxirAccent,
        ),
        css('&:hover').styles(backgroundColor: const Color('#ff6a2e')),
      ]),
      css('.contact-note', [
        css('&').styles(
          color: foxirMuted,
          fontSize: 0.875.rem,
          fontWeight: .w500,
          textAlign: .center,
        ),
        css('a').styles(
          color: foxirAccent,
          fontWeight: .w700,
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.foxir .contact', [
        css('&').styles(padding: .symmetric(vertical: 96.px)),
        css('h1').styles(fontSize: 3.25.rem),
        css('.contact-row').styles(flexDirection: .row),
      ]),
    ]),
  ];
}
