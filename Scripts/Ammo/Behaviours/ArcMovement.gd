extends Node2D

class_name ArcMovement

@export var FallbackCurve: Curve;
@export var Sprite: Sprite2D;
@export var Shadow: Sprite2D;

@export var bodyToMove: Node2D
@export var maxHeight: float = 20;
@export var speed = 15;

var ogDistance: float = Vector2(0, 0).distance_to(Vector2(100, 100));
var targetPos: Vector2 = Vector2(100, 100);
var isStarted = false
var curve: Curve = FallbackCurve;
var current_on_stop: Callable;


func start(
	startPos: Vector2, 
	target: Vector2, 
	curveOverride: Curve = FallbackCurve,
	maxHeightOverride: float = maxHeight,
	speedOverride: float = speed,
	onStop: Callable = func(): pass,
	):
	ogDistance = startPos.distance_to(target)
	targetPos = target
	isStarted = true
	curve = curveOverride
	speed = speedOverride
	maxHeight = maxHeightOverride
	current_on_stop = onStop

func stop():
	isStarted = false
	current_on_stop.call()

func _physics_process(delta):
	if (!isStarted): return
	if targetPos == null:
		return;

	bodyToMove.global_position = bodyToMove.global_position + bodyToMove.global_position.direction_to(targetPos) * speed * delta;
	var curDistance = bodyToMove.global_position.distance_to(targetPos)
	var progress = 1 - curDistance / ogDistance;
	var heightSample = FallbackCurve.sample_baked(progress);
	Sprite.position = Vector2(0, -heightSample * maxHeight);
	Sprite.scale = Vector2.ONE * (1 + heightSample * 0.2);

	Shadow.scale = Vector2.ONE * max(heightSample, 0.1);
	if (curDistance < 0.5):
		print("stop")
		stop()
