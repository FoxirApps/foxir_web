import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/foxir/foxir_footer.dart';
import '../components/foxir/foxir_header.dart';
import '../constants/theme.dart';

/// Contact page with Web3Forms-backed Name / Email / Message form.
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
                'explore together, send a note and we\u2019ll get back to you.'),
          ]),
          p(id: 'contact-status', classes: 'contact-status', []),
          div(id: 'contact-panel', classes: 'contact-panel', [
            form(
              id: 'contact-form',
              classes: 'contact-form',
              action: foxirWeb3FormsEndpoint,
              method: .post,
              [
                input(
                  type: .hidden,
                  name: 'access_key',
                  value: foxirWeb3FormsAccessKey,
                ),
                input(
                  type: .hidden,
                  name: 'subject',
                  value: 'New message from Foxir Apps contact',
                ),
                input(
                  type: .checkbox,
                  name: 'botcheck',
                  attributes: const {
                    'style': 'display:none',
                    'tabindex': '-1',
                    'autocomplete': 'off',
                  },
                ),
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
                  id: 'contact-submit',
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
            div(
              id: 'contact-success',
              classes: 'contact-success',
              attributes: const {'aria-hidden': 'true'},
              [
                div(classes: 'contact-success-card', [
                  span(classes: 'contact-success-eyebrow', [.text('Sent')]),
                  h2([.text('Thanks — we got your message.')]),
                  p([
                    .text('We\u2019ll read it soon and get back to you. '
                        'In the meantime, explore the apps we craft.'),
                  ]),
                  a(classes: 'contact-success-home', href: '/', [.text('Back to home')]),
                ]),
              ],
            ),
          ]),
        ]),
      ]),
      const FoxirFooter(),
      script(content: _submitScript),
    ]);
  }

  /// Submits via fetch; on success shows a blurred overlay with a clear CTA.
  static const _submitScript = '''
(function () {
  var form = document.getElementById('contact-form');
  var status = document.getElementById('contact-status');
  var submit = document.getElementById('contact-submit');
  var panel = document.getElementById('contact-panel');
  var success = document.getElementById('contact-success');
  if (!form || !status || !submit || !panel || !success) return;

  form.addEventListener('submit', function (event) {
    event.preventDefault();
    status.textContent = 'Sending...';
    status.className = 'contact-status is-pending';
    submit.disabled = true;

    fetch(form.action, {
      method: 'POST',
      body: new FormData(form),
      headers: { 'Accept': 'application/json' }
    })
      .then(function (response) { return response.json(); })
      .then(function (data) {
        if (data.success) {
          status.textContent = '';
          status.className = 'contact-status';
          form.reset();
          panel.classList.add('is-sent');
          success.setAttribute('aria-hidden', 'false');
          success.querySelector('.contact-success-home').focus();
        } else {
          status.textContent = data.message || 'Something went wrong. Please try again.';
          status.className = 'contact-status is-error';
        }
      })
      .catch(function () {
        status.textContent = 'Something went wrong. Please try again.';
        status.className = 'contact-status is-error';
      })
      .finally(function () {
        submit.disabled = false;
      });
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
      css('.contact-status', [
        css('&').styles(
          display: .none,
          padding: .symmetric(horizontal: 14.px, vertical: 10.px),
          radius: .circular(12.px),
          fontSize: 0.9375.rem,
          fontWeight: .w600,
          textAlign: .center,
        ),
        css('&.is-pending, &.is-error').styles(display: .block),
        css('&.is-pending').styles(
          color: foxirMuted,
          backgroundColor: foxirElevated,
        ),
        css('&.is-error').styles(
          color: foxirInk,
          backgroundColor: const Color('#3d1f1f'),
        ),
      ]),
      css('.contact-panel', [
        css('&').styles(
          position: const Position.relative(),
          display: .flex,
          flexDirection: .column,
          gap: .all(16.px),
        ),
        css('&.is-sent .contact-form, &.is-sent .contact-note').styles(
          raw: {
            'filter': 'blur(8px)',
            'pointer-events': 'none',
            'user-select': 'none',
            'opacity': '0.45',
          },
        ),
        css('&.is-sent .contact-success').styles(
          display: .flex,
          raw: {'opacity': '1'},
        ),
      ]),
      css('.contact-form').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(16.px),
        raw: {'transition': 'filter 240ms ease, opacity 240ms ease'},
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
        css('&:disabled').styles(
          cursor: .notAllowed,
          opacity: 0.7,
        ),
      ]),
      css('.contact-note', [
        css('&').styles(
          color: foxirMuted,
          fontSize: 0.875.rem,
          fontWeight: .w500,
          textAlign: .center,
          raw: {'transition': 'filter 240ms ease, opacity 240ms ease'},
        ),
        css('a').styles(
          color: foxirAccent,
          fontWeight: .w700,
        ),
      ]),
      css('.contact-success', [
        css('&').styles(
          position: const Position.absolute(),
          display: .none,
          raw: {
            'inset': '0',
            'align-items': 'center',
            'justify-content': 'center',
            'padding': '24px',
            'opacity': '0',
            'transition': 'opacity 240ms ease',
            'z-index': '2',
          },
        ),
      ]),
      css('.contact-success-card', [
        css('&').styles(
          display: .flex,
          maxWidth: 380.px,
          padding: .all(28.px),
          border: const Border.all(style: .solid, color: foxirHairline, width: Unit.pixels(1)),
          radius: .circular(24.px),
          flexDirection: .column,
          alignItems: .center,
          gap: .all(12.px),
          textAlign: .center,
          backgroundColor: const Color('#121212f2'),
          shadow: const BoxShadow(
            offsetX: Unit.zero,
            offsetY: Unit.pixels(18),
            blur: Unit.pixels(40),
            color: Color('#00000088'),
          ),
          raw: {
            'backdrop-filter': 'blur(18px)',
            '-webkit-backdrop-filter': 'blur(18px)',
          },
        ),
        css('.contact-success-eyebrow').styles(
          color: foxirAccent,
          fontSize: 0.8125.rem,
          fontWeight: .w700,
          letterSpacing: 0.12.em,
          textTransform: .upperCase,
        ),
        css('h2').styles(
          color: foxirInk,
          fontSize: 1.5.rem,
          fontWeight: .w700,
          letterSpacing: (-0.02).em,
          lineHeight: 1.2.em,
        ),
        css('p').styles(
          color: foxirMuted,
          fontSize: 0.9375.rem,
          fontWeight: .w500,
        ),
      ]),
      css('.contact-success-home', [
        css('&').styles(
          margin: .only(top: 8.px),
          padding: .symmetric(horizontal: 22.px, vertical: 12.px),
          radius: .circular(999.px),
          color: Colors.white,
          fontSize: 0.9375.rem,
          fontWeight: .w700,
          backgroundColor: foxirAccent,
        ),
        css('&:hover').styles(backgroundColor: const Color('#ff6a2e')),
      ]),
    ]),
    css.media(desktop, [
      css('.foxir .contact', [
        css('&').styles(padding: .symmetric(vertical: 96.px)),
        css('h1').styles(fontSize: 3.25.rem),
        css('.contact-row').styles(flexDirection: .row),
        css('.contact-success-card h2').styles(fontSize: 1.75.rem),
      ]),
    ]),
  ];
}
