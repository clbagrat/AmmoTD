extends Resource

class_name AmmoResource;

@export var type: GlobalConfig.AmmoTypes;
@export var damage = 10;
@export var explosionDamage = 20;
@export var rawSprite: Texture2D;
@export var bulletSprite: Texture2D;
@export var bombSprite: Texture2D;
@export var explosionSprite: Texture2D;
@export var buff: PackedScene;
