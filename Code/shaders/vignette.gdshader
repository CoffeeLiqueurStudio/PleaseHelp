shader_type canvas_item;

uniform float alpha : hint_range(0.0, 1.0) = 1.0;               // Прозрачность затемнения
uniform float circle_radius : hint_range(0.0, 1.0) = 0.4;       // Радиус светлого круга
uniform float fade_width : hint_range(0.001, 0.5) = 0.1;        // Ширина размытия
uniform float darkness : hint_range(0.0, 1.0) = 1.0;            // Насколько тёмно вне круга

void fragment() {
    vec2 uv = UV;

    // Центр экрана
    vec2 centered_uv = uv - vec2(0.5);

    // Исправление искажения пропорций: делаем круг правильным
    float aspect = TEXTURE_PIXEL_SIZE.x / TEXTURE_PIXEL_SIZE.y;
    centered_uv.x *= aspect;

    float dist = length(centered_uv); // расстояние до центра с учётом пропорций

    // Плавная маска от центра к краю
    float vignette = smoothstep(circle_radius, circle_radius + fade_width, dist);

    // Чем дальше — тем темнее (чёрный цвет)
    float darkness_amount = vignette * alpha * darkness;

    COLOR = vec4(vec3(0.0), darkness_amount);
}
