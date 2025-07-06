shader_type canvas_item;

uniform float alpha : hint_range(0.0, 1.0) = 0.5;              // общая прозрачность тумана
uniform float circle_radius : hint_range(0.0, 1.0) = 0.5;      // радиус круга
uniform float fade_width : hint_range(0.001, 0.5) = 0.1;       // ширина размытия краёв
uniform float fog_scale : hint_range(1.0, 100.0) = 10.0;       // масштаб "облаков"
uniform float fog_speed : hint_range(0.0, 5.0) = 1.0;          // скорость движения тумана

// Перлиноподобный плавный noise
float noise(vec2 uv) {
    return fract(sin(dot(uv, vec2(127.1, 311.7))) * 43758.5453123);
}

float smooth_noise(vec2 uv) {
    vec2 i = floor(uv);
    vec2 f = fract(uv);

    float a = noise(i);
    float b = noise(i + vec2(1.0, 0.0));
    float c = noise(i + vec2(0.0, 1.0));
    float d = noise(i + vec2(1.0, 1.0));

    vec2 u = f * f * (3.0 - 2.0 * f); // smoothstep interpolation

    return mix(mix(a, b, u.x), mix(c, d, u.x), u.y);
}

void fragment() {
    vec2 uv = UV;

    // Центр круга
    vec2 centered_uv = uv - vec2(0.5);

    // Исправление соотношения сторон
    float aspect = TEXTURE_PIXEL_SIZE.y / TEXTURE_PIXEL_SIZE.x;
    centered_uv.y *= aspect;

    float dist = length(centered_uv); // расстояние от центра

    // Плавный градиент по краям круга
    float mask = smoothstep(circle_radius, circle_radius - fade_width, dist);
    float visibility = 1.0 - mask;

    // Анимированный "туманный" шум
    vec2 fog_uv = uv * fog_scale + vec2(TIME * fog_speed, TIME * fog_speed * 0.5);
    float fog = smooth_noise(fog_uv);

    // Чем темнее fog, тем плотнее туман (можно инвертировать для настроек)
    COLOR = vec4(vec3(fog), fog * alpha * visibility);
}
