extends Label


@onready var timer = $Timer;

func _ready():
	self.visible = false
	var _connection = AlertService.connect("new_message",Callable(self,"_on_new_message"));

func _on_new_message(message):
	self.visible = true
	text = message;
	timer.stop()
	timer.start()

func _on_Timer_timeout():
	self.visible = false

