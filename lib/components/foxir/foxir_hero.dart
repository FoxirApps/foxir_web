import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// Foxir Apps product-studio hero.
class FoxirHero extends StatelessComponent {
  const FoxirHero({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'foxir-shell hero', [
      Component.element(
        tag: 'canvas',
        id: 'foxir-hero-shader',
        classes: 'hero-shader',
        attributes: const {'aria-hidden': 'true'},
      ),
      const script(content: _shaderScript),
      div(classes: 'hero-inner', [
        h1([
          span(classes: 'hero-line', [.text('Building')]),
          span(classes: 'hero-line is-accent', [.text('Ideas into')]),
          span(classes: 'hero-line is-muted', [.text('Digital reality')]),
        ]),
        div(classes: 'hero-divider', []),
        div(classes: 'hero-bottom', [
          p([
            .text(
              'The personal lab of Foxir Apps. Exploring ideas, crafting '
              'interfaces, and building applications from zero to one.',
            ),
          ]),
          div(classes: 'hero-actions', [
            a(classes: 'hero-button is-primary', href: '/#apps', [
              .text('Explore apps'),
            ]),
            a(classes: 'hero-button is-secondary', href: foxirContactUrl, [
              .text("Let's talk"),
            ]),
          ]),
        ]),
      ]),
      a(
        classes: 'scroll-indicator',
        href: '/#apps',
        attributes: const {'aria-label': 'Scroll to featured apps'},
        [
          span([.text('Scroll')]),
          span(classes: 'scroll-arrow', [.text('↓')]),
        ],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.foxir .hero', [
      css('&').styles(
        position: const Position.relative(),
        display: .flex,
        minHeight: 700.px,
        overflow: .hidden,
        padding: .symmetric(horizontal: 24.px, vertical: 64.px),
        border: const Border.only(
          left: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
          right: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
          bottom: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
        ),
        alignItems: .center,
        backgroundColor: foxirBg,
      ),
      css('.hero-shader').styles(
        position: .absolute(
          left: .zero,
          top: .zero,
          right: .zero,
          bottom: .zero,
        ),
        zIndex: const ZIndex(0),
        display: .block,
        width: 100.percent,
        height: 100.percent,
        opacity: 0.92,
        raw: {
          'pointer-events': 'none',
          'transform': 'translateZ(0)',
        },
      ),
      css('&::before').styles(
        position: .absolute(
          left: .zero,
          top: .zero,
          right: .zero,
          bottom: .zero,
        ),
        zIndex: const ZIndex(1),
        backgroundColor: const Color('#0e0e0e38'),
        backdropFilter: const Filter.blur(Unit.pixels(1.5)),
        raw: {
          'content': '""',
          'pointer-events': 'none',
          '-webkit-backdrop-filter': 'blur(1.5px)',
          'background-image':
              'linear-gradient(180deg, rgba(14,14,14,.52) 0%, '
              'rgba(14,14,14,.08) 42%, rgba(14,14,14,.22) 62%, '
              'rgba(14,14,14,.78) 100%)',
        },
      ),
      css('.hero-inner').styles(
        position: const Position.relative(),
        zIndex: const ZIndex(2),
        display: .flex,
        width: 100.percent,
        flexDirection: .column,
        alignItems: .start,
      ),
      css('h1').styles(
        display: .flex,
        width: 100.percent,
        flexDirection: .column,
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontWeight: .w900,
        letterSpacing: (-0.05).em,
        lineHeight: 0.9.em,
        textTransform: .upperCase,
        raw: {'font-size': 'clamp(3.25rem, 11vw, 8rem)'},
      ),
      css('.hero-line').styles(display: .block),
      css('.hero-line.is-accent').styles(color: foxirAccent),
      css('.hero-line.is-muted').styles(color: const Color('#ab8980')),
      css('.hero-divider').styles(
        width: 100.percent,
        height: 2.px,
        margin: .symmetric(vertical: 36.px),
        backgroundColor: const Color('#2a2a2a80'),
      ),
      css('.hero-bottom').styles(
        display: .flex,
        width: 100.percent,
        flexDirection: .column,
        gap: .all(28.px),
      ),
      css('.hero-bottom p').styles(
        maxWidth: 576.px,
        color: foxirMuted,
        fontSize: 1.rem,
        fontWeight: .w300,
        lineHeight: 1.6.em,
      ),
      css('.hero-actions').styles(
        display: .flex,
        flexWrap: .wrap,
        gap: .all(12.px),
      ),
      css('.hero-button', [
        css('&').styles(
          display: .flex,
          minHeight: 56.px,
          padding: .symmetric(horizontal: 24.px),
          justifyContent: .center,
          alignItems: .center,
          fontSize: 0.6875.rem,
          fontWeight: .w600,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
          raw: {
            'transition': 'background-color 160ms ease, color 160ms ease, border-color 160ms ease',
          },
        ),
        css('&.is-primary').styles(
          border: const Border.all(
            style: .solid,
            color: foxirAccent,
            width: Unit.pixels(2),
          ),
          color: Colors.white,
          backgroundColor: foxirAccent,
        ),
        css('&.is-primary:hover, &.is-primary:focus-visible').styles(
          border: const Border.all(
            style: .solid,
            color: foxirInk,
            width: Unit.pixels(2),
          ),
          color: foxirBg,
          backgroundColor: foxirInk,
        ),
        css('&.is-secondary').styles(
          border: const Border.all(
            style: .solid,
            color: foxirInk,
            width: Unit.pixels(2),
          ),
          color: foxirInk,
          backgroundColor: const Color('#0e0e0ecc'),
        ),
        css('&.is-secondary:hover, &.is-secondary:focus-visible').styles(
          border: const Border.all(
            style: .solid,
            color: foxirAccent,
            width: Unit.pixels(2),
          ),
          color: Colors.white,
          backgroundColor: foxirAccent,
        ),
      ]),
      css('.scroll-indicator').styles(display: .none),
    ]),
    css.media(desktop, [
      css('.foxir .hero', [
        css('&').styles(
          padding: .symmetric(vertical: 64.px),
          raw: {
            'min-height': 'clamp(752px, 58.75vw, 1080px)',
            'padding-left': 'clamp(48px, 6vw, 112px)',
            'padding-right': 'clamp(48px, 6vw, 112px)',
          },
        ),
        css('.hero-bottom').styles(
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .start,
        ),
        css('.hero-bottom p').styles(
          padding: .only(right: 36.px),
          fontSize: 1.25.rem,
          lineHeight: 1.6.em,
        ),
        css('.hero-actions').styles(
          justifyContent: .end,
        ),
        css('.hero-button').styles(
          minHeight: 64.px,
          padding: .symmetric(horizontal: 30.px),
        ),
        css('.scroll-indicator').styles(
          position: .absolute(left: .zero, bottom: .zero),
          zIndex: const ZIndex(3),
          display: .flex,
          minHeight: 64.px,
          padding: .symmetric(horizontal: 30.px),
          border: const Border.only(
            top: BorderSide(
              style: .solid,
              color: Color('#2a2a2a80'),
              width: Unit.pixels(2),
            ),
            right: BorderSide(
              style: .solid,
              color: Color('#2a2a2a80'),
              width: Unit.pixels(2),
            ),
          ),
          alignItems: .center,
          gap: .all(16.px),
          color: foxirMuted,
          backgroundColor: foxirBg,
          fontSize: 0.6875.rem,
          fontWeight: .w600,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
        ),
        css('.scroll-indicator:hover, .scroll-indicator:focus-visible').styles(
          color: foxirAccent,
        ),
        css('.scroll-arrow').styles(
          color: foxirAccent,
          fontSize: 1.rem,
        ),
      ]),
    ]),
  ];

  static const _shaderScript = r'''
(function () {
  const canvas = document.getElementById('foxir-hero-shader');
  if (!canvas || canvas.dataset.shaderReady === 'true') return;
  canvas.dataset.shaderReady = 'true';

  const gl = canvas.getContext('webgl', {
    alpha: true,
    antialias: false,
    powerPreference: 'low-power'
  }) || canvas.getContext('experimental-webgl');
  if (!gl) return;

  const vertexSource = `
attribute vec2 a_position;
varying vec2 v_texCoord;

void main() {
  v_texCoord = a_position * 0.5 + 0.5;
  gl_Position = vec4(a_position, 0.0, 1.0);
}`;

  const fragmentSource = `
precision highp float;

varying vec2 v_texCoord;
uniform float u_time;
uniform vec2 u_resolution;
uniform vec2 u_mouse;

const vec3 color_bg = vec3(0.047, 0.047, 0.047);
const vec3 color_accent = vec3(1.0, 0.341, 0.133);
const vec3 color_secondary = vec3(0.15, 0.15, 0.18);

vec3 mod289(vec3 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec2 mod289(vec2 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec3 permute(vec3 x) {
  return mod289(((x * 34.0) + 1.0) * x);
}

float snoise(vec2 v) {
  const vec4 C = vec4(
    0.211324865405187,
    0.366025403784439,
    -0.577350269189626,
    0.024390243902439
  );
  vec2 i = floor(v + dot(v, C.yy));
  vec2 x0 = v - i + dot(i, C.xx);
  vec2 i1 = x0.x > x0.y ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
  vec4 x12 = x0.xyxy + C.xxzz;
  x12.xy -= i1;
  i = mod289(i);
  vec3 p = permute(
    permute(i.y + vec3(0.0, i1.y, 1.0)) +
    i.x + vec3(0.0, i1.x, 1.0)
  );
  vec3 m = max(
    0.5 - vec3(
      dot(x0, x0),
      dot(x12.xy, x12.xy),
      dot(x12.zw, x12.zw)
    ),
    0.0
  );
  m = m * m;
  m = m * m;
  vec3 x = 2.0 * fract(p * C.www) - 1.0;
  vec3 h = abs(x) - 0.5;
  vec3 ox = floor(x + 0.5);
  vec3 a0 = x - ox;
  m *= 1.79284291400159 -
    0.85373472095314 * (a0 * a0 + h * h);
  vec3 g;
  g.x = a0.x * x0.x + h.x * x0.y;
  g.yz = a0.yz * x12.xz + h.yz * x12.yw;
  return 130.0 * dot(m, g);
}

void main() {
  vec2 uv = v_texCoord;
  vec2 mouse_norm = u_mouse / u_resolution;
  float t = u_time * 0.2;

  float n1 = snoise(uv * 2.0 + t);
  float n2 = snoise(uv * 4.0 - t * 0.5 + n1);
  float n3 = snoise(uv * 1.5 + mouse_norm * 0.2 + n2);
  float intensity = n3 * 0.5 + 0.5;

  vec3 base = mix(color_bg, color_secondary, n1 * 0.5 + 0.5);
  vec3 highlights = mix(
    base,
    color_accent,
    pow(intensity, 8.0) * 0.2
  );

  float glass =
    smoothstep(0.4, 0.5, n2) *
    smoothstep(0.6, 0.5, n2);
  vec3 final_color = mix(
    highlights,
    color_accent * 0.4,
    glass * 0.1
  );

  float grain = fract(
    sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453
  ) * 0.02;
  final_color += grain;

  gl_FragColor = vec4(final_color, 1.0);
}`;

  function compileShader(type, source) {
    const shader = gl.createShader(type);
    if (!shader) return null;
    gl.shaderSource(shader, source);
    gl.compileShader(shader);
    if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
      gl.deleteShader(shader);
      return null;
    }
    return shader;
  }

  const vertexShader = compileShader(gl.VERTEX_SHADER, vertexSource);
  const fragmentShader = compileShader(gl.FRAGMENT_SHADER, fragmentSource);
  if (!vertexShader || !fragmentShader) return;

  const program = gl.createProgram();
  if (!program) return;
  gl.attachShader(program, vertexShader);
  gl.attachShader(program, fragmentShader);
  gl.linkProgram(program);
  if (!gl.getProgramParameter(program, gl.LINK_STATUS)) return;
  gl.useProgram(program);

  const buffer = gl.createBuffer();
  gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
  gl.bufferData(
    gl.ARRAY_BUFFER,
    new Float32Array([-1, -1, 1, -1, -1, 1, 1, 1]),
    gl.STATIC_DRAW
  );

  const position = gl.getAttribLocation(program, 'a_position');
  gl.enableVertexAttribArray(position);
  gl.vertexAttribPointer(position, 2, gl.FLOAT, false, 0, 0);

  const timeLocation = gl.getUniformLocation(program, 'u_time');
  const resolutionLocation = gl.getUniformLocation(program, 'u_resolution');
  const mouseLocation = gl.getUniformLocation(program, 'u_mouse');
  const reducedMotion = window.matchMedia(
    '(prefers-reduced-motion: reduce)'
  );

  let mouseX = 0;
  let mouseY = 0;
  let frameId = 0;
  let elapsed = 0;
  let previousTimestamp = 0;
  let isVisible = true;

  function syncSize() {
    const pixelRatio = Math.min(window.devicePixelRatio || 1, 1.25);
    const width = Math.max(
      1,
      Math.round((canvas.clientWidth || 1280) * pixelRatio)
    );
    const height = Math.max(
      1,
      Math.round((canvas.clientHeight || 720) * pixelRatio)
    );

    if (canvas.width !== width || canvas.height !== height) {
      canvas.width = width;
      canvas.height = height;
      mouseX = mouseX || width * 0.5;
      mouseY = mouseY || height * 0.5;
      drawFrame();
    }
  }

  function drawFrame() {
    gl.viewport(0, 0, canvas.width, canvas.height);
    if (timeLocation) gl.uniform1f(timeLocation, elapsed * 0.001);
    if (resolutionLocation) {
      gl.uniform2f(resolutionLocation, canvas.width, canvas.height);
    }
    if (mouseLocation) gl.uniform2f(mouseLocation, mouseX, mouseY);
    gl.drawArrays(gl.TRIANGLE_STRIP, 0, 4);
  }

  function render(timestamp) {
    if (previousTimestamp) {
      elapsed += Math.min(timestamp - previousTimestamp, 34);
    }
    previousTimestamp = timestamp;
    drawFrame();

    if (!reducedMotion.matches && isVisible && !document.hidden) {
      frameId = window.requestAnimationFrame(render);
    }
  }

  function startAnimation() {
    window.cancelAnimationFrame(frameId);
    previousTimestamp = 0;
    if (reducedMotion.matches) {
      drawFrame();
      return;
    }
    frameId = window.requestAnimationFrame(render);
  }

  window.addEventListener('pointermove', function (event) {
    const rect = canvas.getBoundingClientRect();
    if (!rect.width || !rect.height) return;
    mouseX = ((event.clientX - rect.left) / rect.width) * canvas.width;
    mouseY =
      (1 - (event.clientY - rect.top) / rect.height) * canvas.height;
  }, { passive: true });

  document.addEventListener('visibilitychange', function () {
    if (document.hidden) {
      window.cancelAnimationFrame(frameId);
    } else if (isVisible) {
      startAnimation();
    }
  });

  const visibilityObserver = new IntersectionObserver(function (entries) {
    isVisible = entries[0].isIntersecting;
    if (isVisible && !document.hidden) {
      startAnimation();
    } else {
      window.cancelAnimationFrame(frameId);
    }
  }, { threshold: 0.01 });
  visibilityObserver.observe(canvas);

  if (typeof ResizeObserver !== 'undefined') {
    new ResizeObserver(syncSize).observe(canvas);
  } else {
    window.addEventListener('resize', syncSize);
  }

  if (typeof reducedMotion.addEventListener === 'function') {
    reducedMotion.addEventListener('change', startAnimation);
  } else {
    reducedMotion.addListener(startAnimation);
  }

  syncSize();
  startAnimation();
})();
''';
}
