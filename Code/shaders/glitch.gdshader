shader_type canvas_item;

uniform float shake_power = 0.03;
uniform float shake_rate : hint_range(0.0, 1.0) = 0.2;
uniform float shake_speed = 5.0;
uniform float shake_block_size = 30.5;
uniform float shake_color_rate : hint_range(0.0, 1.0) = 0.01;

float random(float seed) {
	return fract(543.2543 * sin(dot(vec2(seed, seed), vec2(3525.46, -54.3415))));
}

void fragment() {
	// Enable or disable shift per frame
	float enable_shift = float(
		random(trunc(TIME * shake_speed)) < shake_rate
	);

	vec2 uv = UV;

	// Разбиваем на блоки по вертикали и добавляем смещение по X
	uv.x += (
		random(
			trunc(UV.y * shake_block_size) / shake_block_size + TIME
		) - 0.5
	) * shake_power * enable_shift;

	// Основной цвет
	vec4 base = texture(TEXTURE, uv);

	// Цветовое смещение RGB-каналов
	float r = mix(
		base.r,
		texture(TEXTURE, uv + vec2(shake_color_rate, 0.0)).r,
		enable_shift
	);

	float b = mix(
		base.b,
		texture(TEXTURE, uv - vec2(shake_color_rate, 0.0)).b,
		enable_shift
	);

	COLOR = vec4(r, base.g, b, base.a);
}
