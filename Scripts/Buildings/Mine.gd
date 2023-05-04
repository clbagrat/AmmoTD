extends LockableBuilding

@export var inventory: Inventory;
@export var ammoSource: AmmoSource;
@export var ammoType: GlobalConfig.AmmoTypes;
@export var interactiveByCursor: InteractiveByCursor;
@export var buildingLock: BuildingLock;


func _ready():
	inventory.ammoType = ammoType;
	buildingLock.price = GameConstants.C.mineUnlockPrice;
	interactiveByCursor.connect("on_interract", func(): speed_up())
	interactiveByCursor.connect("on_interract_stop", func(): slow_down())
	

func set_initial_rotation(degree: float):
	ammoSource.set_rotation(degree)

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
