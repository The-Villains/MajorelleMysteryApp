extends AnimatedSprite

func _ready():
	pass # Replace with function body.

func set_arturo_scale(factor):
	apply_scale(Vector2(1 / get_scale().x, 1 / get_scale().y))
	apply_scale(Vector2(factor, factor))
