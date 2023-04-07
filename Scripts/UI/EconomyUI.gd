extends Label

func _ready():
	var _connection = EconomyService.connect("amount_change",Callable(self,"_update"));
	_update(EconomyService.get_current_gold())

func _update(amount: int):
	text = str(amount)
