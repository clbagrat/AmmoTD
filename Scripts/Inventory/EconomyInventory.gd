extends Inventory

func can_receive(amount: int, type: int) -> bool:
	if type == GlobalConfig.AmmoTypes.Gold:
		return true
	else:
		return super.can_receive(amount, type)

func receive(amount: int, type: int) -> void:
	if type == GlobalConfig.AmmoTypes.Gold:
		EconomyService.receive(amount);
	else:
		super.receive(amount, type)
