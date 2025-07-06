shader_type canvas_item;

uniform float alpha : hint_range(0.0, 1.0) = 1.0;               // общая прозрачность
uniform float circle_radius : hint_range(0.0, 1.0) = 0.4;       // радиус круга (0.0–1.0, в относительных UV-координатах)
uniform float fade_width : hint_range(0.001, 0.5) = 0.05;       // ширина размытия границ круга

float random(vec2 uv) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
    vec2 uv = UV; // UV — локальные координаты от 0 до 1 внутри объекта

    // Центрированные UV-координаты (от -0.5 до 0.5)
    vec2 centered_uv = uv - vec2(0.5);

    // Исправляем искажения: подгоняем по соотношению сторон объекта
    float aspect = TEXTURE_PIXEL_SIZE.y / TEXTURE_PIXEL_SIZE.x;
    centered_uv.y *= aspect;

    float dist = length(centered_uv); // расстояние до центра (теперь идеально круговое)

    // Мягкий переход прозрачности на границе круга
    float mask = smoothstep(circle_radius, circle_radius - fade_width, dist);
    float visibility = 1.0 - mask;

    float noise = random(uv * TIME * 10.0);

    COLOR = vec4(vec3(noise), alpha * visibility);
}
