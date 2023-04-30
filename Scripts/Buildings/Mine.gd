extends LockableBuilding

@export var ammoSource: AmmoSource;
@export var interactiveByCursor: InteractiveByCursor;


func _ready():
	interactiveByCursor.connect("on_interract", func(): speed_up())
	interactiveByCursor.connect("on_interract_stop", func(): slow_down())

func speed_up():
	ammoSource.increase_speed(3)

func slow_down():
	ammoSource.reset_speed()

func lock():
	super.lock()
	ammoSource.turn_off()

func unlock():
	super.unlock()
	ammoSource.turn_on()
