
-- bunny by ExeterDad

mobs:register_mob("mobs:bunny", {
	type = "animal",
	hp_min = 1,
	hp_max = 4, 
	collisionbox = {-0.268, -0.5, -0.268,  0.268, 0.167, 0.268},
	visual = "mesh",
	mesh = "mobs_bunny.b3d",
	available_textures = {
		total = 5,
		texture_1 = {"mobs_bunny_grey.png"},
		texture_2 = {"mobs_bunny_brown.png"},
		texture_3 = {"mobs_bunny_white_blue_eyes.png"},
		texture_4 = {"mobs_bunny_white_brown_eyes.png"},
		texture_5 = {"mobs_bunny_white_brown_spots.png"},
	},
	makes_footstep_sound = false,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 1,
		max = 3,},
	},
	drawtype = "front",
	animation = {
		speed_normal = 15,
		stand_start = 1,
		stand_end = 15,
		walk_start = 16,
		walk_end = 24,
	},
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
jump = true,
step = 1,
passive = true,
	sounds = {
		random = "mobs_bunny",
	},


	follow = "farming_plus:carrot_item",
	view_range = 5,	
		on_rightclick = function(self, clicker)

		local item = clicker:get_wielded_item()
		if item:get_name() == "farming_plus:carrot_item" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()  -- Can put in inventory
				clicker:set_wielded_item(item)
			end
			self.food = (self.food or 0) + 1
			if self.food >= 4 then
				self.food = 0
				self.tamed = true -- Can tame with four carrots
			end
		return
		end
		if clicker:is_player() and clicker:get_inventory() then
			clicker:get_inventory():add_item("main", "mobs:bunny")
			self.object:remove()
		end
	end, 
})

mobs:register_spawn("mobs:bunny", {"default:dirt_with_grass", "ethereal:green_dirt_top"}, 20, 8, 9000, 1, 31000)
mobs:register_egg("mobs:bunny", "bunny", "mobs_bunny_inv.png", 0)
	

