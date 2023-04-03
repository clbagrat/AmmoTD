extends Node2D;


class_name Pullable

@onready var particles = $Particles;

var _currentPuller = null;
var _time_in_progress = 0;

func isPullInProgress() -> bool:
	return !!_currentPuller;

func isBeingPulledBy(puller: Node2D) -> bool:
	return isPullInProgress() && _currentPuller == puller

func startPull(puller: Node2D):
	_currentPuller = puller;	
	_time_in_progress = 0;
	particles.emitting = true;

func stopPull(puller: Node2D):
	if _currentPuller != puller:
		return
	_currentPuller = null;
	particles.emitting = false;

func getTimeBeingPulled():
	if !isPullInProgress():
		return null
	return _time_in_progress;

func _process(delta):
	if !_currentPuller:
		return;
	_time_in_progress += delta
	self.look_at(_currentPuller.global_position)
