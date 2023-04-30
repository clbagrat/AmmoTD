extends PanelContainer

class_name InventoryUI

@export var inventory: Inventory;
@export var placeForAmmo: HFlowContainer;



func _process(_delta):
	for child in placeForAmmo.get_children():
		child.queue_free()
	
	for ammoType in inventory.get_current_charges():
		var newPic = ColorRect.new();
		newPic.custom_minimum_size = Vector2(2, 2);
		newPic.color = AmmoService.get_color(ammoType);
		placeForAmmo.add_child(newPic)
	
	set_size(Vector2(inventory.capacity * 2 + inventory.capacity - 1, 2))
