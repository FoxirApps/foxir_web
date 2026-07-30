import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

enum FoxirShaderVariant { liquid, ember }

/// Reusable, dependency-free WebGL atmosphere for key Foxir surfaces.
class FoxirShader extends StatelessComponent {
  const FoxirShader({
    required this.id,
    required this.classes,
    this.variant = FoxirShaderVariant.liquid,
    super.key,
  });

  final String id;
  final String classes;
  final FoxirShaderVariant variant;

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Component.element(
        tag: 'canvas',
        id: id,
        classes: classes,
        attributes: {
          'aria-hidden': 'true',
          'data-shader-variant': switch (variant) {
            FoxirShaderVariant.liquid => 'liquid',
            FoxirShaderVariant.ember => 'ember',
          },
        },
      ),
      const script(content: _shaderScript),
    ]);
  }

  static const _shaderScript = r'''
(function () {
  const scriptElement = document.currentScript;
  const canvas = scriptElement && scriptElement.previousElementSibling;
  if (!(canvas instanceof HTMLCanvasElement)) return;
  if (canvas.dataset.shaderReady === 'true') return;
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
uniform float u_variant;

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

vec3 liquidShader(vec2 uv, vec2 mouse_norm, float t) {
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

  return mix(highlights, color_accent * 0.4, glass * 0.1);
}

vec3 emberShader(vec2 uv, vec2 mouse_norm, float t) {
  vec2 p = uv - 0.5;
  p.x *= u_resolution.x / max(u_resolution.y, 1.0);
  p += (mouse_norm - 0.5) * 0.025;

  float broadFlow = snoise(
    p * 1.35 + vec2(t * 0.18, -t * 0.11)
  );
  float fineFlow = snoise(
    p * 3.15 +
    vec2(broadFlow * 1.4, -broadFlow * 0.8) -
    vec2(t * 0.09, t * 0.05)
  );
  float ridge = pow(max(0.0, 1.0 - abs(fineFlow)), 9.0);
  float halo = 1.0 - smoothstep(
    0.12,
    1.18,
    length(p - vec2(0.34, 0.02))
  );
  float ember = ridge * halo * 0.16;
  ember += pow(max(0.0, broadFlow * 0.5 + 0.5), 7.0) * halo * 0.08;

  vec3 warmSurface = vec3(0.095, 0.064, 0.058);
  vec3 base = mix(
    color_bg,
    warmSurface,
    (broadFlow * 0.5 + 0.5) * 0.38
  );
  return base + color_accent * ember;
}

void main() {
  vec2 uv = v_texCoord;
  vec2 mouse_norm = u_mouse / u_resolution;
  float t = u_time * 0.2;
  vec3 final_color;

  if (u_variant > 0.5) {
    final_color = emberShader(uv, mouse_norm, t);
  } else {
    final_color = liquidShader(uv, mouse_norm, t);
  }

  float grain = fract(
    sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453
  ) * 0.016;
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
  const variantLocation = gl.getUniformLocation(program, 'u_variant');
  const isEmber = canvas.dataset.shaderVariant === 'ember';
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
    if (variantLocation) gl.uniform1f(variantLocation, isEmber ? 1.0 : 0.0);
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
