extends LockableBuilding

@export var ammoSource: AmmoSource;

func lock():
	super.lock()
	ammoSource.turn_off()

func unlock():
	super.unlock()
	ammoSource.turn_on()
