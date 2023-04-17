extends Control
@export var progressBar: ProgressBar

func _process(_delta):
	progressBar.max_value = VictoryService.maxStreak
	progressBar.value = VictoryService.currentStreak
