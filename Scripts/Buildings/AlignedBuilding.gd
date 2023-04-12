extends Node2D

class_name AlignedBuilding;

@export var LeftDetector: Area2D;
@export var RightDetector: Area2D;
@export var FrontDetector: Area2D;
@export var BuildingToAlign: Node2D;
@export var AnimatedSpriteToAdjust: Sprite2D;
@export var HorizontalSpriteSheet: Texture2D;
@export var BendLeftSpriteSheet: Texture2D;
@export var BendRightSpriteSheet: Texture2D;


var prevConnected: AlignedBuilding;
var nextConnected: AlignedBuilding;

func align():
	var leftDetected = LeftDetector.get_overlapping_areas();
	assert(leftDetected.size() < 2)

	var rightDetected = RightDetector.get_overlapping_areas();
	assert(rightDetected.size() < 2)

	if LeftDetector.has_overlapping_areas() and RightDetector.has_overlapping_areas():
		AnimatedSpriteToAdjust.set_texture(HorizontalSpriteSheet)	
		return;
	if !LeftDetector.has_overlapping_areas() and !RightDetector.has_overlapping_areas():
		AnimatedSpriteToAdjust.set_texture(HorizontalSpriteSheet)	
		return
	
	var other: AlignedBuilding;
	var texture: Texture2D;

	if LeftDetector.has_overlapping_areas():
		other = leftDetected[0].get_parent(); 
		texture = BendLeftSpriteSheet;

	if RightDetector.has_overlapping_areas():
		other = rightDetected[0].get_parent(); 
		texture = BendRightSpriteSheet

	if !other.can_I_connect(self): # belts are looking in opposite directions
		return;

	other.nextConnected = self;
	prevConnected = other;
	AnimatedSpriteToAdjust.set_texture(texture)

func can_I_connect(building: AlignedBuilding) -> bool:
	if is_instance_valid(nextConnected):
		return false;
	if !FrontDetector.has_overlapping_areas():
		return false;
	var frontDetected = FrontDetector.get_overlapping_areas();
	var b: AlignedBuilding = frontDetected[0].get_parent();
	return b == building
	

func _exit_tree():
	if is_instance_valid(prevConnected):
		prevConnected.nextConnected = null
	if is_instance_valid(nextConnected):
		nextConnected.prevConnected = null

func _physics_process(_delta):
	if (is_instance_valid(prevConnected)):
		return;

	align()


