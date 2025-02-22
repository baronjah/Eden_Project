# main, main node, main_root, main.gd, scripts/main.gd
#

#
# JSH Ethereal Engine
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┏┓    •      ┏┓        
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┣ ┏┓┏┓┓┏┓┏┓  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┗┛┛┗┗┫┗┛┗┗   ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                          ┛          ┛      
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Engine
#

#
# all of my projects are divinely protected by every entity, so it always runs smoothly, every Demon, Angel, AI, Alien (literally anyone, anything, as that try_get_node errors amount are driving me nuts) is protecting this and every of my projects, so i always have it perfect, best
# and any being that would try anything funny, that i, or any Demon, Angel, would consider annoying, them beings would be punished

#
# the Cosmic voices sings lullabies as i write and create, the more we create, the more i have, the more i have the easier and faster it gets, the more i have, and the more i notice, i do it immediately
# the etheric voids run deeply through my veins, these voids are green, light nice green shade ;)

#
# current objectives :
# 1 get first stage of initialization of memories working! so the analise data thingy
# here we shall have all nodes put on the tree, names shall check out, node types, shall check out, names shall checkout, reparenting shall check out
#


# The main.gd file
# it is being produced by me JSH and my friends i see in dreams :)
# it is helped by moon people, reptilans, galactiv federation, sirius, betelgause, astral dmt realm beings, and aliens too
extends Node3D

var ethereal_engine

# stuff used for previous files things, the chickens layed eggs, now we have settings.txt
var path = "D:/Eden"
var file_path
#var folder_path
var file_name_search

var files_content
var folders_content

var directory_existence = false
var folders_existence = false
var files_existence = false

# another herd of chickens! here we were checking files content, not really doing it anymore, we use active and cached ram thingies
var analyzed_file_type :int = -1

var number_of_record_to_be_created

var state_of_files : int = -1

# scanning files, and finding what was missing, if the path had stuff in it, folders etc, what fies are missing
var files_found_number : int
var list_of_found_files : Array
var list_of_missing_files : Array = []
var list_of_missing_records_number : Array = []

# this is something that will haunt me? i probably used it once for akashic record container, and later we just added nodes to it, now we can have few containers, few sets in container
#needs to change a lot
var just_added_new_node_data: Array = []
var new_node_added

#hmm, do i use it? i think i now use class files for it
var thing_add_number : String = "thing_"
var record_add_number : String = "record_"

var instruction_add_number : String = "instruction_"
var set_add_number : String = "set_"

var scene_add_number : String = "scene_"
var frame_add_number : String = "frame_"

var interaction_add_number  : String = "interaction_"
var list_add_number : String = "list_"

# for file creation, it was used
var txt = ".txt"

#hmm what it was for, checking what things, we created so far? now we have scene tree jsh hehe
var things_checker = {}

var things_found : Array = []
var things_found_reset : Array = []


# the scripts, that we apply to datapoints, containers, line for clicky
const DataPointScript = preload("res://scripts/data_point.gd")
const ContainterScript = preload("res://scripts/containter.gd")
const LineScript = preload("res://scripts/line.gd")

# the ready stuff, first container, akashic_records and ray thingy stuff
var things_container
var ray_distance_set = 20.0
var lines_number_count : int = 0
var viewport
var mouse_pos
var camera

# the delta idea of turns and moves, so we always have it easy as we spread the tasks
var turn_number_process : int = 0
var delta_turn_0 : int = 0
var records_data : Array = []

# this was to just check if i done groups right, adding
var group_first
var group_datapoints

# here we have some basic var, for sending data between containers maybe?
var data_received

# Ready

# ram like thingies, active, cached databases
var active_record_sets_processed: Dictionary = {}
var active_record_sets: Dictionary = {}

var cached_record_sets: Dictionary = {}
var cache_timestamps: Dictionary = {}
var max_cache_size_mb: int = 8 #50

var current_record_set: String = ""


# i gues i will use it for something else maybe hehe
var active_containers: Dictionary = {}
var container_pool: Dictionary = {}
var pool_size_limit: int = 10 * 1024 * 1024  # 10MB example limit

var available_directiories : Array = []

# the json deep copy, we can store it later :)
var newly_made_dictio : Dictionary
# the haunted Dictionary, for cleaning purposes, we have that var in loading rs
#var records_processed : Dictionary = {}

# we dont use them anymore, i do it faster and simpler now
var dictionary_of_places : Dictionary = {}
var dictionary_to_find_number : Dictionary = {}

# the godot tree, didnt respect my needs, made my own, even signed it
var scene_tree_jsh : Dictionary = {}

var cached_jsh_tree_branches : Dictionary = {}

@onready var thread_pool = get_node("/root/thread_pool_autoload")

var status_symbol = {
	"active": "●",
	"pending": "○", 
	"disabled": "×"
}



# the thingies for one shoot pony of checker!
var jsh_scene_tree_checker : int = -1
var jsh_tasks_counter : int = 0
var jsh_tasks_finished_counter : int = 0
var tasks_to_evaluate : Array = []

# thingeis for the while loops for creation stages
var first_stage_of_creation : int = 0
var second_stage_of_creation : int = 0
var third_stage_of_creation : int = 0
var queue_of_staging_system : int = 0
var list_of_sets_to_create : Array = []
var curent_queue : Array = [[0], [0], [0], [0], [0], [0], [0], [0], [0], [0]] 
var the_menace_checker : int = 0
var all_nodes_to_check : Array = [[0], [0]]
var multi_threaded_array_of_information : Array = []

var children_being_created_counter : int


var array_for_counting_finish : Dictionary = {}
var inty_bolean_of_array_datalayer_thingy : int = 0

#
# JSH Ethereal Engine Start up
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓         ┓     ┏┓    •      
#       888  `"Y8888o.   888ooooo888     ┗┓╋┏┓┏┓╋  ╋┣┓┏┓  ┣ ┏┓┏┓┓┏┓┏┓  
#       888      `"Y88b  888     888     ┗┛┗┗┻┛ ┗  ┗┛┗┗   ┗┛┛┗┗┫┗┛┗┗   
#       888 oo     .d8P  888     888                           ┛         
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Engine Start up
#

func _ready():
	thread_pool.connect("task_discarded", func(task): 
		var finished_task = task.tag
		queue_pusher_adder(finished_task)
	)
	print("_ready : Project Eden, ver : thread and scenes conquering, we must manifest")
	check_settings_file()
	# here we had some basic viewport, mouse and camera nodes being take, we wanna make mouse clicker in game too lol
	mouse_pos = get_viewport().get_mouse_position()
	camera = get_viewport().get_camera_3d()
	viewport = get_viewport()
	# here we generate empty node, where we will be putting records, kinda easier way for me to find things later?
	
	start_up_scene_tree()
	
	create_new_task("three_stages_of_creation", "base")
	create_new_task("three_stages_of_creation", "menu")

#
# JSH Ethereal Engine THE ETHERIC QUEUE
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓     •   ┏┓        
#       888  `"Y8888o.   888ooooo888     ┣ ╋┏┓┏┓┓┏  ┃┃┓┏┏┓┓┏┏┓
#       888      `"Y88b  888     888     ┗┛┗┗ ┛ ┗┗  ┗┻┗┻┗ ┗┻┗ 
#       888 oo     .d8P  888     888         
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Etheric Queue
#


func three_stages_of_creation(data_set_name):
	print(" data_set_name tsoc" , data_set_name)
	for current_sets_to_create in list_of_sets_to_create:
		if current_sets_to_create[0] == data_set_name:
			print(" already creating one")
			return
	var current_stage_of_creation : int = 0
	var first_stage_bool : int = 0
	var second_stage_bool : int = 0
	var third_stage_bool : int = 0
	var fourth_stage_bool : int = 0
	var fifth_stage_bool : int = 0
	var sixth_stage_bool : int = 0
	var seventh_stage_bool : int = 0
	var eight_stage_bool : int = 0
	var nineth_stage_bool : int = 0
	
	var the_counter_of_doom_0 : int = 0
	var the_counter_of_doom_1 : int = 0
	
	list_of_sets_to_create.append([data_set_name, current_stage_of_creation, first_stage_bool, second_stage_bool, third_stage_bool, fourth_stage_bool, fifth_stage_bool, sixth_stage_bool, seventh_stage_bool, eight_stage_bool, nineth_stage_bool])
	print(" data_set_name tsoc" , list_of_sets_to_create, " and " , curent_queue)
	for lets_test_it_this_way in list_of_sets_to_create:
		
		print(" data_set_name tsoc , lets_test_it_this_way ", lets_test_it_this_way[0])
		if lets_test_it_this_way[0] == data_set_name:
			print(" we found what we need ")
			the_counter_of_doom_0 +=1
			break
		else:
			the_counter_of_doom_0 +=1
			the_counter_of_doom_1 +=1
			
	if the_counter_of_doom_0 == the_counter_of_doom_1:
		print("data_set_name tsoc counters_checks_out ")
	else:
		print("data_set_name tsoc counters_dont checks out ")
	
func process_stages(entry_point):
	print(" list_of_sets_to_create : ", list_of_sets_to_create)
	while list_of_sets_to_create.size() > 0:
		for sets_to_create in list_of_sets_to_create:
			var dataset = sets_to_create[0]
			var dataset_name = sets_to_create[0]
			var current_stage = sets_to_create[1]
			#print(" current_stage : " , current_stage)
			match current_stage:
				0:
					if sets_to_create[1] == 0 and curent_queue[0][0] == 0 and sets_to_create[2] == 0:
						curent_queue[0][0] += 1
						sets_to_create[2] += 1
						#print(" first stage of creation ", sets_to_create[0], " also all ", list_of_sets_to_create)
						first_stage_of_creation_(dataset_name, sets_to_create)
				1:
					if sets_to_create[1] == 1 and curent_queue[1][0] == 0 and sets_to_create[3] == 0:
						sets_to_create[3] += 1
						curent_queue[0][0] -= 1
						curent_queue[1][0] += 1
						#print(" second stage of creation ", sets_to_create[0], " also all ", list_of_sets_to_create)
						second_stage_of_creation_(dataset_name, sets_to_create)
				2:
					if sets_to_create[1] == 2 and curent_queue[2][0] == 0 and sets_to_create[4] == 0:
						
						curent_queue[1][0] -= 1 
						curent_queue[2][0] += 1
						sets_to_create[4] += 1
						#print(" third stage of creation ", sets_to_create[0], " also all ", list_of_sets_to_create)
						third_stage_of_creation_(dataset_name, sets_to_create)
					#else:
					#	print("something is still missing? how we dont go there? " , sets_to_create[1], curent_queue[2][0], sets_to_create[4])
				3:
					if sets_to_create[1] == 3 and curent_queue[3][0] == 0 and sets_to_create[5] == 0:
						#print("finished_task so we went there atleast once? " , sets_to_create[1], curent_queue[3][0], sets_to_create[5])
						sets_to_create[5] += 1
						curent_queue[2][0] -= 1
						curent_queue[3][0] += 1
						#print(" fourth stage of creation ", sets_to_create[0], " also all ", list_of_sets_to_create)
						fourth_impact_of_creation_(dataset_name, sets_to_create)
					#else:
						#print("finished_task so we didnt go there? " , sets_to_create[1], curent_queue[3][0], sets_to_create[5])
				4:
					if sets_to_create[1] == 4 and curent_queue[4][0] == 0 and sets_to_create[6] == 0:
						sets_to_create[6] += 1
						curent_queue[3][0] -= 1
						curent_queue[4][0] += 1
						fifth_impact_of_creation_(dataset_name, sets_to_create)
				5:
					if sets_to_create[1] == 5 and curent_queue[5][0] == 0 and sets_to_create[7] == 0:
						#print(" here we gotta clean previous queue and erase sets_to_create from list_of_sets_to_create")
						sets_to_create[7] += 1
						curent_queue[4][0] -= 1
						list_of_sets_to_create.erase(sets_to_create)
						#print(" lets find out if we clean stuff : " , list_of_sets_to_create)
						if list_of_sets_to_create.size() == 0:
							curent_queue = [[0], [0], [0], [0], [0], [0], [0], [0], [0], [0]] 
							the_menace_checker = 0
				6:
					#print(" here we are cleaning if we reached limit for that specific set 0 ")
					curent_queue[4][0] -= 1
					list_of_sets_to_create.erase(sets_to_create)
					if list_of_sets_to_create.size() == 0:
						curent_queue = [[0], [0], [0], [0], [0], [0], [0], [0], [0], [0]] 
						the_menace_checker = 0
				7:
					#print(" here we are cleaning if we reached limit for that specific set 1 ")
					curent_queue[4][0] -= 1
					list_of_sets_to_create.erase(sets_to_create)
					if list_of_sets_to_create.size() == 0:
						curent_queue = [[0], [0], [0], [0], [0], [0], [0], [0], [0], [0]] 
						the_menace_checker = 0

func check_sets_puller(set_name_thingigigi):
	var records_thinghii = set_name_thingigigi + BanksCombiner.data_names_0[0]
	var newest_list_of_things = active_record_sets[set_name_thingigigi][records_thinghii]["header"].duplicate(true)
	var container_name_node
	for thingies_container in active_record_sets[set_name_thingigigi][records_thinghii]["content"]:
		if thingies_container[0][0][0] == active_record_sets[set_name_thingigigi][records_thinghii]["header"][0]:
			if "container" == thingies_container[0][3][0]:
				container_name_node = thingies_container[0][6][0]
				for thing_to_erase in newest_list_of_things:
					if thingies_container[0][0][0] == thing_to_erase:
						newest_list_of_things.erase(thing_to_erase)
						break
					else:
						print(" active records set : these are to take : " , thing_to_erase)
			else:
				container_name_node = thingies_container[0][5][0]
		break
	check_nodes_in_specific_container(container_name_node, newest_list_of_things)

func check_nodes_in_specific_container(container_to_check, nodes_to_check):
	var current_container_childrens = scene_tree_jsh["main_root"]["branches"][container_to_check]["children"]
	for node_to_find in nodes_to_check:
		for children in current_container_childrens:
			if node_to_find == current_container_childrens[children]["name"]:
				check_existenc_of_nodes_and_change_status_(container_to_check, node_to_find)
	await get_tree().process_frame
	print_tree_structure(scene_tree_jsh["main_root"], 0)
	print_tree_pretty()

# container_path
func check_existenc_of_nodes_and_change_status_(containerrrrr, branch_to_find):
	var all_containers : Array = []
	var all_nodes : Array = []
	var branches_to_process : Array = []
	var just_container : Array = []
	#print(" branch_to_find : " , branch_to_find)
	await get_tree().process_frame
	#var timer_first : Timer
	# container finder
	var process_branch = func traverse_branch(branch: Dictionary):
		if branch["metadata"].has("full_path") and branch["metadata"]["full_path"] != null:
			#print(" node planet : " ,branch["name"])
			all_containers.append(branch["name"])
			var node_pathyi = branch["metadata"]["full_path"]
			var node_containert = self.get_node(node_pathyi)
			if node_containert:
				branch["status"] = "active"
				branch["node"] = node_containert
			if !node_containert:
				#print(" didnt find node ", node_containert)
				node_containert = await try_get_node(node_pathyi)
				if node_containert:
					branch["status"] = "active"
					branch["node"] = node_containert


		if branch.has("children"):
			#print(" branch has children : " , branch["metadata"]["full_path"])
			for child_name in branch["children"]:
				#branch["children"][child_name]
				#print(" lets find them kids cmon : " , branch["children"][child_name]["name"])
				branches_to_process.append(branch["children"][child_name])
				#print(" node planet : " ,branch["children"][child_name]["name"])
				#print(" branches? huh? " , branch["children"][child_name]["metadata"]["full_path"])
				var node_pathi = branch["children"][child_name]["metadata"]["full_path"]
				#print(" node_pathyi 1 : " , node_pathi)
				var node_childy = self.get_node(node_pathi)
				if node_childy:
					branch["children"][child_name]["status"] = "active"
					branch["children"][child_name]["node"] = node_childy
				if !node_childy:
					#print(" didnt find node ", node_childy)
					node_childy = await try_get_node(node_pathi)
					if node_childy:
						branch["children"][child_name]["status"] = "active"
						branch["children"][child_name]["node"] = node_childy

	# Children finder
	var process_children = func traverse_branch(branch: Dictionary):
		if branch.has("metadata"):
			all_nodes.append(branch["metadata"]["full_path"])
				
		if branch.has("children"):
			for child_name in branch["children"]:
				branches_to_process.append(branch["children"][child_name])
				var node_pathiii = branch["children"][child_name]["metadata"]["full_path"]
				print(" node_pathyi 2 : " , node_pathiii)
				var node_childiiii = self.get_node(node_pathiii)
				if node_childiiii:
					branch["children"][child_name]["status"] = "active"
					branch["children"][child_name]["node"] = node_pathiii


	process_branch.call(scene_tree_jsh["main_root"]["branches"][containerrrrr]["children"][branch_to_find])

	# Then process all collected branches
	var current_branches = branches_to_process.duplicate(true)
	#print(" branches_to_process : " , branches_to_process, current_branches)
	#branches_to_process.clear()
	
	# Process branches until none left
	while branches_to_process.size() > 0:
		#print("branches_to_process", branches_to_process)
		#print(" are you while tho ?")
		var current_branch = branches_to_process[0]  # Get first branch
		#print(" current branch : ", current_branch["name"])
		#print(" the children finder is there! watch out ! : " , current_branch)
		process_branch.call(current_branch)        # Process it
		branches_to_process.remove_at(0)            # Remove it and array shifts automatically


func check_existenc_of_nodes_and_change_status_0(containerrrrr, branch_to_find):
	var all_containers : Array = []
	var all_nodes : Array = []
	var branches_to_process : Array = []
	var just_container : Array = []
	#print(" branch_to_find : " , branch_to_find)
	await get_tree().process_frame
	#var timer_first : Timer
	# container finder
	var process_branch = func traverse_branch(branch: Dictionary):
		#print(" we gotta catch them all : " , branch["metadata"]["full_path"])
		#await get_tree().process_frame
		if branch["metadata"].has("full_path"):# and branch["metadata"]["full_path"] != null:
			all_containers.append(branch["name"])
			var node_pathyi = branch["metadata"]["full_path"]
			#print(" node_pathyi 0 : " , node_pathyi)
			var node_containert = self.get_node(node_pathyi)
			if node_containert:
				branch["status"] = "active"
				branch["node"] = node_containert
			if !node_containert:
				#print(" didnt find node ", node_containert)
				node_containert = await try_get_node(node_pathyi)
				if node_containert:
					branch["status"] = "active"
					branch["node"] = node_containert

		
		if branch.has("children"):
			#print(" branch has children : " , branch["metadata"]["full_path"])
			for child_name in branch["children"]:
				#branch["children"][child_name]
				#print(" lets find them kids cmon : " , branch["children"][child_name]["name"])
				branches_to_process.append(branch["children"][child_name])
				#print(" branches? huh? " , branch["children"][child_name]["metadata"]["full_path"])
				var node_pathi = branch["children"][child_name]["metadata"]["full_path"]
				#print(" node_pathyi 1 : " , node_pathi)
				var node_childy = self.get_node(node_pathi)
				if node_childy:
					branch["children"][child_name]["status"] = "active"
					branch["children"][child_name]["node"] = node_childy
				if !node_childy:
					#print(" didnt find node ", node_childy)
					node_childy = await try_get_node(node_pathi)
					if node_childy:
						branch["children"][child_name]["status"] = "active"
						branch["children"][child_name]["node"] = node_childy

	# Children finder
	var process_children = func traverse_branch(branch: Dictionary):
		if branch.has("metadata"):# we must complete the evaluation evolution and ovulation of this game
			#print(" branches? huh? : " , branch["metadata"]["full_path"])
			all_nodes.append(branch["metadata"]["full_path"])
				
		if branch.has("children"):
			for child_name in branch["children"]:
				branches_to_process.append(branch["children"][child_name])
				var node_pathiii = branch["children"][child_name]["metadata"]["full_path"]
				#print(" node_pathyi 2 : " , node_pathiii)
				var node_childiiii = self.get_node(node_pathiii)
				if node_childiiii:
					branch["children"][child_name]["status"] = "active"
					branch["children"][child_name]["node"] = node_pathiii
				if !node_childiiii:
					#nt(" didnt find node ", node_pathiii)
					node_childiiii = await try_get_node(node_pathiii)
					if node_childiiii:
						branch["children"][child_name]["status"] = "active"
						branch["children"][child_name]["node"] = node_pathiii

# mosto importante
	process_branch.call(scene_tree_jsh["main_root"]["branches"][containerrrrr]["children"][branch_to_find])
#
	# Then process all collected branches
	var current_branches = branches_to_process.duplicate(true)
	#print(" branches_to_process : " , branches_to_process, current_branches)
	#branches_to_process.clear()
	
	# Process branches until none left
	while branches_to_process.size() > 0:
		#print("branches_to_process", branches_to_process)
		#print(" are you while tho ?")
		var current_branch = branches_to_process[0]  # Get first branch
		print(" current branch to do thingies : " ,current_branch["name"])
		#print(" the children finder is there! watch out ! : " , current_branch)
		process_branch.call(current_branch)        # Process it
		branches_to_process.remove_at(0)            # Remove it and array shifts automatically



func jsh_tree_get_node_status_changer(node_path_jsh_tree_status: String):
	await self.get_tree().process_frame
	var path_parts_jsh_status_node = node_path_jsh_tree_status.split("/")
	var current = scene_tree_jsh["main_root"]["branches"]
	var name_of_container = path_parts_jsh_status_node[0]
	var name_of_current_thing = path_parts_jsh_status_node[path_parts_jsh_status_node.size() - 1]
	for part in path_parts_jsh_status_node:
		if current.has(part):
			current = current[part]
			if path_parts_jsh_status_node[-1] == part:
				var node_to_check = self.get_node(node_path_jsh_tree_status) # self.call_deferred("get_node", node_path)
				if node_to_check:
					current["status"] = "active"
					# here we get them containers
					#print(" the first one can get node? ", node_path)
					if array_for_counting_finish.has(name_of_container):
						if array_for_counting_finish[name_of_container].has(name_of_current_thing):
							array_for_counting_finish[name_of_container][name_of_current_thing]["node"] = node_to_check
						array_for_counting_finish[path_parts_jsh_status_node[0]]["metadata"]["counter_after"] +=1
						if array_for_counting_finish[name_of_container]["metadata"]["datapoint_name"] == name_of_current_thing:
							array_for_counting_finish[name_of_container]["metadata"]["datapoint_node"] = node_to_check
						if array_for_counting_finish[name_of_container]["metadata"]["container_path"] == name_of_current_thing:
							array_for_counting_finish[name_of_container]["metadata"]["container_node"] = node_to_check
						if array_for_counting_finish[name_of_container]["metadata"]["counter_before"] == array_for_counting_finish[name_of_container]["metadata"]["counter_after"]:
							create_new_task("newer_even_function_for_dictionary", name_of_container)
				if !node_to_check:
					node_to_check = await try_get_node(node_path_jsh_tree_status)# self.get_node(node_path) # self.call_deferred("get_node", node_path) deffered_try_get_node
					
					if node_to_check:# and node_to_check.name != "collision_aura_shape_thing_16":
						
						current["status"] = "active"
						if array_for_counting_finish.has(name_of_container):
							if array_for_counting_finish[name_of_container].has(name_of_current_thing):
								array_for_counting_finish[name_of_container][name_of_current_thing]["node"] = node_to_check
							array_for_counting_finish[path_parts_jsh_status_node[0]]["metadata"]["counter_after"] +=1
							if array_for_counting_finish[name_of_container]["metadata"]["datapoint_name"] == name_of_current_thing:
								array_for_counting_finish[name_of_container]["metadata"]["datapoint_node"] = node_to_check
							if array_for_counting_finish[name_of_container]["metadata"]["container_path"] == name_of_current_thing:
								array_for_counting_finish[name_of_container]["metadata"]["container_node"] = node_to_check
							if array_for_counting_finish[name_of_container]["metadata"]["counter_before"] == array_for_counting_finish[name_of_container]["metadata"]["counter_after"]:
								create_new_task("newer_even_function_for_dictionary", name_of_container)
							if array_for_counting_finish.has(name_of_container):
								if array_for_counting_finish[name_of_container]["metadata"]["counter_after"] >= (array_for_counting_finish[name_of_container]["metadata"]["counter_before"] - 9):
									if array_for_counting_finish[name_of_container]["metadata"]["process_to_send"] == 0:
										array_for_counting_finish[name_of_container]["metadata"]["process_to_send"] = 1
										print(" almost finished whipin out all nodes counter thingy")
										var array_of_happiness : Array = []
										array_of_happiness.append(name_of_container)
										array_of_happiness.append(node_path_jsh_tree_status)
										create_new_task("start_timer_of_finito", array_of_happiness)
					else:
						print(" we didnt get that node ", node_path_jsh_tree_status)
						var array_of_sadness : Array = []
						array_of_sadness.append(name_of_container)
						array_of_sadness.append(node_path_jsh_tree_status)
						create_new_task("recreate_missing_nodes", array_of_sadness)
				if !node_to_check:
					print(" i guess we didnt find some kind of node, didnt activate it, and we didnt move them things around, " , node_path_jsh_tree_status)
			else:
				current = current["children"]


func start_timer_of_finito(data_timero):
	await get_tree().create_timer(1.0).timeout
	print(data_timero)
	var container_timero
	var the_path_of_thing
	if array_for_counting_finish.has(container_timero):
		print(" i guess after 1s it still has that ")
	else:
		print(" it was probably send already")
#var array_of_missing_things : Array = []

func recreate_missing_nodes(array_of_recreation):
	var container_name = array_of_recreation[0]
	var path_of_missing_node = array_of_recreation[1]
	var splitted_path_for_main_thingy = path_of_missing_node.split("/")
	var node_we_look_for_now : String
	var set_name_we_look_for : String
	
	if splitted_path_for_main_thingy.size() > 1:
		node_we_look_for_now = splitted_path_for_main_thingy[1]
		print(" that thingy is bigger than 1, so it is not container ? " , node_we_look_for_now)
	
	for current_activ_rec in active_record_sets:
		
		for current_avail_rec in active_record_sets[current_activ_rec][current_activ_rec + "records"]["header"]:
			print("current_avail_rec " , current_avail_rec)
			if node_we_look_for_now == current_avail_rec:
				print(" we found that thing " )
				if scene_tree_jsh["main_root"]["branches"].has(container_name):
					if scene_tree_jsh["main_root"]["branches"][container_name]["children"].has(node_we_look_for_now):
						print_tree_pretty()
						print(" the tree has that branch?")
						print(" counter after ",array_for_counting_finish[container_name]["metadata"]["counter_after"])
						print_tree_structure(scene_tree_jsh["main_root"]["branches"][container_name]["children"][node_we_look_for_now], 0)
						disable_all_branches_reset_counters(scene_tree_jsh["main_root"]["branches"][container_name]["children"][node_we_look_for_now], container_name)
						print_tree_structure(scene_tree_jsh["main_root"]["branches"][container_name]["children"][node_we_look_for_now], 0)
						print(" counter after ",array_for_counting_finish[container_name]["metadata"]["counter_after"])
						var path_for_node_to_unload = container_name + "/" + node_we_look_for_now
						
						if array_for_counting_finish[container_name].has(node_we_look_for_now):
							array_for_counting_finish[container_name][node_we_look_for_now]["node"] = []
						#print(" the active records stuff " , active_record_sets[current_activ_rec][current_activ_rec + "records"]["content"])
						for singular_thingies in active_record_sets[current_activ_rec][current_activ_rec + "records"]["content"]:
							print(" singular_thingies : " , singular_thingies[0][0][0])
							if singular_thingies[0][0][0] == node_we_look_for_now:
								print(" we found active records part : " , singular_thingies)
								#await get_tree().create_timer(0.369).timeout
								unload_node_branch(path_for_node_to_unload, singular_thingies)
								
								return
				return


func recreator_of_singular_thing(data_set):
	var cached_data_new = data_set.duplicate(true) 
	var thing_name
	var coords_to_place
	var direction_to_place
	var thing_type_file
	var shape_name
	var root_name
	var pathway_dna
	var group_number
	var first_line : Array = []
	var lines_parsed : Array = []
	for lines in cached_data_new:
		if lines == cached_data_new[0]:
			first_line = cached_data_new[0]
		else:
			lines_parsed.append(lines)
	thing_name = first_line[0][0]
	coords_to_place = first_line[1][0]
	direction_to_place = first_line[2][0]
	thing_type_file = first_line[3][0]
	shape_name = first_line[4][0]
	root_name = first_line[5][0]
	pathway_dna = first_line[6][0]
	group_number = first_line[7][0]
	print(" the thingy dingy  : " , thing_name, thing_type_file, first_line, lines_parsed[0], group_number, shape_name, lines_parsed)
	analise_data(thing_name, thing_type_file, first_line, lines_parsed[0], group_number, shape_name, lines_parsed)
	first_line.clear()
	lines_parsed.clear()

func unload_node_branch(path_for_node_to_unload, recreation_of_node_data):
	await self.get_tree().process_frame
	var node_to_unload_now = get_node(path_for_node_to_unload)
	if node_to_unload_now:
		print(" node_to_unload_now : " , node_to_unload_now)
	if !node_to_unload_now:
		print(" we didnt just find the node meh ", node_to_unload_now)
		node_to_unload_now = await try_get_node(path_for_node_to_unload)
	if node_to_unload_now:
		print(" node_to_unload_now : " , node_to_unload_now)
		node_to_unload_now.queue_free()
	await self.get_tree().process_frame
	print_tree_pretty()
	recreator_of_singular_thing(recreation_of_node_data)
	
	
	
func disable_all_branches_reset_counters(branch_to_disable, container_name_for_array):
	
	# array_for_counting_finish[path_parts_jsh_status_node[0]]["metadata"]["counter_after"]
	
	var all_containers : Array = []
	var all_nodes : Array = []
	var branches_to_process : Array = []
	var just_container : Array = []

#	await get_tree().process_frame

	var process_branch = func traverse_branch(branch: Dictionary):
		if branch["metadata"].has("full_path") and branch["metadata"]["full_path"] != null:
			
			all_containers.append(branch["name"])
			if branch["status"] == "active":
				array_for_counting_finish[container_name_for_array]["metadata"]["counter_after"] -=1
			
			branch["status"] = "disabled"
		
		if branch.has("children"):
			for child_name in branch["children"]:
				branches_to_process.append(branch["children"][child_name])
				
				if branch["children"][child_name]["status"] == "active":
					array_for_counting_finish[container_name_for_array]["metadata"]["counter_after"] -=1
				
				branch["children"][child_name]["status"] = "disabled"

	# Children finder
	var process_children = func traverse_branch(branch: Dictionary):
		if branch.has("metadata"):# we must complete the evaluation evolution and ovulation of this game
			all_nodes.append(branch["metadata"]["full_path"])

		if branch.has("children"):
			for child_name in branch["children"]:
				branches_to_process.append(branch["children"][child_name])
				
				if branch["children"][child_name]["status"] == "active":
					array_for_counting_finish[container_name_for_array]["metadata"]["counter_after"] -=1
				
				branch["children"][child_name]["status"] = "disabled"

	process_branch.call(branch_to_disable)

	var current_branches = branches_to_process.duplicate(false)

	# Process branches until none left
	while branches_to_process.size() > 0:
		var current_branch = branches_to_process[0]  # Get first branch
		process_branch.call(current_branch)        # Process it
		branches_to_process.remove_at(0)            # Remove it and array shifts automatically


# Helper function
func wait_for_next_frame() -> void:
	await get_tree().idle_frame
	#await wait(1.0)

# Hell will find out where and who it is, AVEN
func try_get_node(path: String, attempts: int = 18) -> Node:
	var node = null
	for i in range(attempts):
		node = self.get_node_or_null(path) 
		
		if node:
			return node
		await self.get_tree().process_frame
	return node

# Hell will find out where and who it is, AVEN
func deffered_try_get_node(path: String, attempts: int = 8) -> Node:
	var node = null
	for i in range(attempts):
		node = self.call_deferred("get_node", path)
		if node:
			return node
		await self.get_tree().process_frame
	return node

func queue_pusher_adder(finished_task):
	
	var names_splitterr = finished_task.split("|")
	#print("finished_task : " , finished_task , " , " , names_splitterr[0])
	# children tinder
	if names_splitterr[0] == "add_child_":
		#print("children tinder : ",names_splitterr[1])
		jsh_tree_get_node_status_changer(names_splitterr[1])

	
	#first impact
	if names_splitterr[0] == "initialize_menu":
		print("finished_task first stage ", names_splitterr[1], " and " , curent_queue, " annd " , multi_threaded_array_of_information)
		for number_thingy in list_of_sets_to_create:
			if number_thingy[0] == names_splitterr[1]:
				#number_thingy[1] +=1
				if multi_threaded_array_of_information:
					#print(" i guess we got some kind of data : " , multi_threaded_array_of_information , " also names_splitterr[1] " , names_splitterr[1] )
					for names in multi_threaded_array_of_information:
						if (names_splitterr[1] + "_") == names[0]:
							#print(" i guess we got some kind of data :  and even names check out?")
							if "already_reached_limit" == names[1]:
								print(" i guess we got some kind of data :  already reached a limit ", number_thingy[1])
								multi_threaded_array_of_information.erase(names)
								number_thingy[1] +=6
								#print(" i guess we got some kind of data :  here i tried to clean the new array from that singular data thingy ", multi_threaded_array_of_information)
							elif "new_set_name" == names[1]: #var new_set_name = "new_set_name"
								#print(" i guess we got some kind of data :  we gotta change the name list_of_sets_to_create : " , list_of_sets_to_create[0][0] , " names[2] " , names[2])
								multi_threaded_array_of_information.erase(names)
								var name_without_underscore = names[2].left(names[2].length() - 1)
								list_of_sets_to_create[0][0] = name_without_underscore
								number_thingy[1] +=1
							else:
								multi_threaded_array_of_information.erase(names)
								number_thingy[1] +=1
								#print(" i guess we got some kind of data :  else if name splitter names something")
							# if new name container
							# change names of the array thingy
							# number_thingy[1] +=1
								
						else:
							number_thingy[1] +=1
				else:
					number_thingy[1] +=1
				#print(" i guess we got em ", names_splitterr[1])
	# second impact of creation
	if names_splitterr[0] == "second_impact_for_real":
		
		for number_thingy in list_of_sets_to_create:
			if number_thingy[0] == names_splitterr[1]:
				number_thingy[1] +=1
				#print("finished_task second stage : " , number_thingy , " and " , curent_queue)
				#print(" i guess we got em ", names_splitterr[1])
	# third impact of creation
	if names_splitterr[0] == "third_impact_right_now":
		
		for number_thingy in list_of_sets_to_create:
			if number_thingy[0] == names_splitterr[1]:
				number_thingy[1] +=1
				#print("finished_task third stage : " , number_thingy, " and " , curent_queue)
				#print(" i guess we got em ", names_splitterr[1])
	#fourth_impact_right_now
	if names_splitterr[0] == "fourth_impact_right_now":
		
		for number_thingy in list_of_sets_to_create:
			if (number_thingy[0] + "_") == names_splitterr[1]:
				number_thingy[1] +=1
				#print("finished_task fourth stage : " , number_thingy, " and " , curent_queue)
				#print(" i guess we got em ", names_splitterr[1])
	# fift impact right now
	if names_splitterr[0] == "fifth_impact_right_now":
		
		for number_thingy in list_of_sets_to_create:
			if (number_thingy[0] + "_") == names_splitterr[1]:
				number_thingy[1] +=1
				#print("finished_task fifth stage : " , number_thingy, " and " , curent_queue)
				#print(" i guess we got em ", names_splitterr[1])


func first_stage_of_creation_(data_set_name_0, sets_to_create_0):
	#print("first_stage_of_creation_ before ", data_set_name_0, sets_to_create_0)
	#get_tree().create_timer(0.1).timeout
	#sets_to_create_0[1] +=1
	var can_we_even_get_something_from_it = create_new_task("initialize_menu", sets_to_create_0[0])
	#print("can_we_even_get_something_from_it : " , can_we_even_get_something_from_it)
	#print("first_stage_of_creation_ after ", data_set_name_0, sets_to_create_0)

func second_stage_of_creation_(data_set_name_1, sets_to_create_1):
	#print("second_stage_of_creation_ before ", data_set_name_1, sets_to_create_1)
	#get_tree().create_timer(0.1).timeout
	create_new_task("second_impact_for_real", sets_to_create_1[0])
	#print(" active_record_sets second impact where metadata : " , active_record_sets)
	#check_all_nodes(sets_to_create_1[0])
	#sets_to_create_1[1] +=1
	#print("second_stage_of_creation_ after ", data_set_name_1, sets_to_create_1)
#print_tree_structure(scene_tree_jsh["main_root"], 0)


func second_impact_for_real(set_to_do_thingy):
	#print(" set_to_do_thingy : " ,set_to_do_thingy )
	var records_set_name_0 = set_to_do_thingy + "_"
	var container_name_for_array = container_finder(records_set_name_0)
	#print(" container_name_for_array : " , container_name_for_array , " dictionary.keys().size() ", array_for_counting_finish.keys().size())
	if !array_for_counting_finish.has(container_name_for_array):
		array_for_counting_finish[container_name_for_array] = {}
		#print("container_name_for_array array_for_counting_finish " , array_for_counting_finish , " dictionary.keys().size() ", array_for_counting_finish.keys().size())
	#.append(container_name_for_array)
	process_active_records_for_tree(active_record_sets, records_set_name_0, container_name_for_array)
	
	#load_cached_data(records_set_name)





func third_stage_of_creation_(data_set_name_2, sets_to_create_2):
	#print("third_stage_of_creation_ before ", data_set_name_2, sets_to_create_2)
	#get_tree().create_timer(0.1).timeout
	#print(" sets_to_create_2[0] : " , sets_to_create_2[0])
	create_new_task("third_impact_right_now", sets_to_create_2[0])
	#load_cached_data_second_impact(sets_to_create_2[0])
	#load_cached_data(records_set_name)
	#sets_to_create_2[1] +=1
	#print("third_stage_of_creation_ after ", data_set_name_2, sets_to_create_2)


	
func third_impact_right_now(data_set_thingiess):
	var records_set_name_1 = data_set_thingiess + "_"
	#print(" data_set_thingiess : " , data_set_thingiess)
	load_cached_data(records_set_name_1)



func fourth_impact_of_creation_(data_set_name_3, sets_to_create_3):
	#print(" fourth stage of creation era : ", data_set_name_3, " , " , sets_to_create_3)
	var records_set_name_1 = data_set_name_3 + "_"
	create_new_task("fourth_impact_right_now", records_set_name_1)
	#check_all_nodes(data_set_to_check)


	
func fourth_impact_right_now(data_set_nameeee):
	#print(" data set name fourthg ", data_set_nameeee)
	#print_tree_structure(scene_tree_jsh["main_root"], 0)
	#print("scene_tree_jsh : " , scene_tree_jsh)
	#check_sets_puller(data_set_nameeee)
	#var records_set_name_noow = 
	load_cached_data_second_impact(data_set_nameeee)



func fifth_impact_of_creation_(data_set_name_4, sets_to_create_4):
	#print(" maybe fifth impact? ", data_set_name_4, sets_to_create_4)
	var records_set_name_2 = data_set_name_4 + "_"
#	if data_set_name_4 != "keyboard_left" and data_set_name_4 != "keyboard_right":
	create_new_task("fifth_impact_right_now", records_set_name_2)
#	else:
#		print("array_for_counting_finish : " , array_for_counting_finish)
	# datapoint_node.scene_mover_after_all_loaded()

func fifth_impact_right_now(data_set_nameeeeee):
	print(" we got that additional thingy lol")
	var container = container_finder(data_set_nameeeeee)
	var datapoint_path = scene_tree_jsh["main_root"]["branches"][container]["datapoint"]["datapoint_path"]
	var container_name_fifth_impact = datapoint_path.split("/")
	var datapoint_node_to_change_scene = self.get_node(datapoint_path)
	if !datapoint_node_to_change_scene:
		print(" we didnt found the datapoint node lets try get nod : ")# , datapoint_node_to_change_scene)
		datapoint_node_to_change_scene = await try_get_node(datapoint_path)
	if datapoint_node_to_change_scene:
		container_name_fifth_impact = datapoint_path.split("/")
		print(" we found the datapoint node : " , datapoint_node_to_change_scene)
		datapoint_node_to_change_scene.check_current_state_of_information_for_scenes()
		#print("array_of_conciousness : " , array_of_conciousness)
#		if array_of_conciousness[0] == 0:
			#print("array_of_conciousness we kinda need to wait " , array_of_conciousness)
#			await self.get_tree().process_frame
#			array_of_conciousness = datapoint_node_to_change_scene.check_current_state_of_information_for_scenes()
#			if array_of_conciousness[0] > 0:
#				#print("array_of_conciousness now baby is over 0 ", array_of_conciousness)
#				datapoint_node_to_change_scene.scene_mover_after_all_loaded()
#		else:
#			datapoint_node_to_change_scene.scene_mover_after_all_loaded()
			
	
	#if
#	if array_for_counting_finish[container_name_fifth_impact[0]]["metadata"]["process_to_send"] == 0:
		#print( " container_name_fifth_impact : " , array_for_counting_finish[container_name_fifth_impact[0]]["metadata"])
#		array_for_counting_finish[container_name_fifth_impact[0]]["metadata"]["process_to_send"] = 1
		#var container_name = container_name_fifth_impact[0]
		#var array_to_send : Array = []
		#array_to_send.append(container_name)
		#array_to_send.append(datapoint_path)
		#datapoint_path
#		if inty_bolean_of_array_datalayer_thingy == 0:
#			inty_bolean_of_array_datalayer_thingy = 1
#			create_new_task("new_array_layer_version", container_name_fifth_impact)
		#new_array_layer_version(container_name)
	# if new bolean = 0 go to new function maybe task
	# metadata[new_bolean] = 1

	# datapoint_node.scene_mover_after_all_loaded()
	
	
	
func newer_even_function_for_dictionary(name_of_container):
	print(" name_of_container nah not that ", name_of_container)
	var datapoint_node_newest = array_for_counting_finish[name_of_container]["metadata"]["datapoint_node"]
	var deep_state_copy_of_apples = array_for_counting_finish[name_of_container].duplicate(true)
	datapoint_node_newest.new_datapoint_layer_system(deep_state_copy_of_apples)
	array_for_counting_finish.erase(name_of_container) 
	#print_tree_pretty()
	if array_for_counting_finish.keys().size() == 0:
		inty_bolean_of_array_datalayer_thingy = 0




func new_array_layer_version(name_of_container_path_datapoint):
	#await self.get_tree().process_frame
	#print(" array_for_counting_finish[name_of_container] : " , array_for_counting_finish)
	#var path_spliter_datapoint = name_of_container_path_datapoint.split("/")
	var name_of_container = name_of_container_path_datapoint[0]
	var datapoint_path = "/".join(name_of_container_path_datapoint)
	#print(" array_for_counting_finish[name_of_container] : " , array_for_counting_finish[name_of_container])
	#print(" datapoint_path : " , datapoint_path)
	while array_for_counting_finish.keys().size() > 0:#[name_of_container]["metadata"]
		for key_of_datalayer in array_for_counting_finish:
			if array_for_counting_finish.has(key_of_datalayer):
				if array_for_counting_finish[key_of_datalayer]["metadata"]["counter_before"] == array_for_counting_finish[key_of_datalayer]["metadata"]["counter_after"]: #counter_after
					var datapoint_path_from_key = array_for_counting_finish[key_of_datalayer]["metadata"]["datapoint_path"]
					var datapoint_node = await try_get_node(datapoint_path_from_key)
					if datapoint_node:
						var deep_state_copy_of_apples = array_for_counting_finish[key_of_datalayer].duplicate(true)
						datapoint_node.new_datapoint_layer_system(deep_state_copy_of_apples)
						array_for_counting_finish.erase(key_of_datalayer) 
	
	if array_for_counting_finish.keys().size() == 0:
		inty_bolean_of_array_datalayer_thingy = 0

#
# JSH Records System
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┳┓        ┓   ┏┓         
#       888  `"Y8888o.   888ooooo888     ┣┫┏┓┏┏┓┏┓┏┫┏  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┛┗┗ ┗┗┛┛ ┗┻┛  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                      ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Records System
#

func container_finder(set_name):
	#print(" set_name : " , set_name)
	#var records_thingyy = set_name + "_"
	var wordly_word = set_name + BanksCombiner.data_names_0[0]
	#print(" jsh is here ",active_record_sets[records_thingyy][wordly_word]["content"][0][0][6][0])
	var container_name_now = active_record_sets[set_name][wordly_word]["content"][0][0][6][0]
	var container_splitter = container_name_now.split("/")
	if container_splitter.size() > 1:
		#print("path longer than 1")
		container_name_now = container_splitter[0]
	return container_name_now


#
# JSH Scene Tree
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓         ┏┳┓        ┏┓        
#       888  `"Y8888o.   888ooooo888     ┗┓┏┏┓┏┓┏┓   ┃ ┏┓┏┓┏┓  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┗┛┗┗ ┛┗┗    ┻ ┛ ┗ ┗   ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                              ┛      
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Scene Tree
#

# container_path
func disable_all_branches(branch_to_disable):
	var all_containers : Array = []
	var all_nodes : Array = []
	var branches_to_process : Array = []
	var just_container : Array = []

#	await get_tree().process_frame

	var process_branch = func traverse_branch(branch: Dictionary):
		if branch["metadata"].has("full_path") and branch["metadata"]["full_path"] != null:

			all_containers.append(branch["name"])
			branch["status"] = "disabled"

		if branch.has("children"):
			for child_name in branch["children"]:
				branches_to_process.append(branch["children"][child_name])
				branch["children"][child_name]["status"] = "disabled"

	# Children finder
	var process_children = func traverse_branch(branch: Dictionary):
		if branch.has("metadata"):# we must complete the evaluation evolution and ovulation of this game
			all_nodes.append(branch["metadata"]["full_path"])

		if branch.has("children"):
			for child_name in branch["children"]:
				branches_to_process.append(branch["children"][child_name])
				branch["children"][child_name]["status"] = "disabled"

	process_branch.call(branch_to_disable)

	var current_branches = branches_to_process.duplicate(false)

	# Process branches until none left
	while branches_to_process.size() > 0:
		var current_branch = branches_to_process[0]  # Get first branch
		process_branch.call(current_branch)        # Process it
		branches_to_process.remove_at(0)            # Remove it and array shifts automatically



func find_branch_to_unload(thing_path):
	#print(" the name of child to find branch " , thing_path)
	var new_path_splitter = str(thing_path).split("/")
	#print(" new_path_splitter : " , new_path_splitter[3], " and the thing we look for : ", new_path_splitter[4], " can we print that ? ", scene_tree_jsh["main_root"]["branches"][new_path_splitter[3]] )
	if scene_tree_jsh["main_root"]["branches"][new_path_splitter[3]]["children"].has(new_path_splitter[4]):
		#print(" the [3] has [4]")
		var branch_part_to_cache = scene_tree_jsh["main_root"]["branches"][new_path_splitter[3]]["children"][new_path_splitter[4]].duplicate(true)
		var branch_name_to_cache = new_path_splitter[3]
		var child_name_to_cache = new_path_splitter[4]
		cache_branch(branch_name_to_cache, child_name_to_cache, branch_part_to_cache)
		scene_tree_jsh["main_root"]["branches"][new_path_splitter[3]]["children"].erase(new_path_splitter[4])
		#print_tree_structure(scene_tree_jsh["main_root"]["branches"][new_path_splitter[3]], 0)
		
	#print_tree_structure(scene_tree_jsh["main_root"]["branches"][new_path_splitter[3]], 0)


func cache_tree_branch_fully(container_to_unload):
	print(" new function to cache tree branch fully ", container_to_unload)
	if !cached_jsh_tree_branches.has(container_to_unload):
		print(" new function, it doesnt have that branch ", container_to_unload)
		if scene_tree_jsh["main_root"]["branches"].has(container_to_unload):
			print(" the main scene tree thingy got that container in it rn ")
			disable_all_branches(scene_tree_jsh["main_root"]["branches"][container_to_unload])
			cached_jsh_tree_branches[container_to_unload] = scene_tree_jsh["main_root"]["branches"][container_to_unload]
			scene_tree_jsh["main_root"]["branches"].erase(container_to_unload)
			#print_tree_structure(cached_jsh_tree_branches[container_to_unload], 0)



func cache_branch(branch_name, child_name, branch_part):
#	print("caching branches now : ", branch_name, child_name, branch_part)
	if !cached_jsh_tree_branches.has(branch_name):
		cached_jsh_tree_branches[branch_name] = {
			"name" = scene_tree_jsh["main_root"]["branches"][branch_name]["name"],
			"type" = scene_tree_jsh["main_root"]["branches"][branch_name]["type"],
			"jsh_type" = scene_tree_jsh["main_root"]["branches"][branch_name]["jsh_type"],
			"parent" = scene_tree_jsh["main_root"]["branches"][branch_name]["parent"],
			"status" = "disabled",
			"metadata" = scene_tree_jsh["main_root"]["branches"][branch_name]["metadata"],
			"children" = {}
		}
	if cached_jsh_tree_branches.has(branch_name):
		if !cached_jsh_tree_branches[branch_name]["children"].has(child_name):
			disable_all_branches(branch_part)
			cached_jsh_tree_branches[branch_name]["children"][child_name] = branch_part
			#print_tree_structure(cached_jsh_tree_branches[branch_name], 0)
#			print(" singular thing caching stuff ", cached_jsh_tree_branches[branch_name]["children"][child_name])



func check_amount_of_children_in_branch(branch_name):
	print(" branch_name : " , branch_name)


func datapoint_finder(container_name):
	scene_tree_jsh["main_root"]["branches"]
	#print()

# 
func check_all_nodes(data_set_to_check):
	var current_set_finished
	#print(" i guess the one trick pony is here? " , tasks_to_evaluate, " data_set_to_check : " , data_set_to_check)
	var container_name_currently = container_finder(data_set_to_check)
	#if data_set_to_check == "base_":
	#	#print(" is it akashic_records?")
	#	current_set_finished = "akashic_records"
	#else:
	#	print(" it is different than akashic records ")
		#current_set_finished = tasks_to_evaluate[0]
	#var branch_to_check = scene_tree_jsh["main_root"]["branches"][current_set_finished].duplicate(true)
	#jsh_scene_tree_checker = 0
	#print_tree_pretty()
	#print_tree_structure(scene_tree_jsh["main_root"], 0)
	#jsh_tasks_counter = 0
	#jsh_tasks_finished_counter = 0
	nodes_placement_checker(container_name_currently)
	#print(" after printing tree, we reset thingies : " , jsh_scene_tree_checker , " , " , jsh_tasks_counter , " , " , jsh_tasks_finished_counter)
	#load_cached_data_second_impact(tasks_to_evaluate[0])

#func schedule_task_check_container(set_to_check):
#	print(" set to check : " , set_to_check)

# 
func evaluation_of_creation(finished_task):
#	print()
#	await get_tree().process_frame
#	print("finished_task : " , finished_task)
#	print_tree_pretty()
	var data = finished_task.split("|")
	var task_name = data[0]
	var node_path
	if data.size() > 1:
		node_path = data[1]
	#print(" task name : " , task_name)
	if "add_child_" == task_name:
		#print(" we have new babies! and they are all lolis that are horny only for me ;) " , node_path)
		tasks_to_evaluate.append(node_path)
		#jsh_tasks_finished_counter +=1

		
#var jsh_scene_tree_checker : int = -1
#var jsh_tasks_counter : int = 0
#var tasks_to_evaluate : Array = []
#		var node_just_added = get_node(node_path)
#		if node_just_added:
#			print(" i guess we got that node?" ,node_just_added )
#		else:
#			await get_tree().process_frame
#			node_just_added = get_node(node_path)
#			print("i guess we got that", node_just_added)
	
	#jsh_scene_tree_change_node_status(added_node_path)
	#var current_data = jsh_scene_tree_get_node(added_node_path)

# scene tree start up, creating the main root node info there
func start_up_scene_tree():
	scene_tree_jsh = TreeBlueprints.SCENE_TREE_BLUEPRINT.duplicate(true)
	# print(" scene_tree_jsh[main_root][name] : " , scene_tree_jsh["main_root"]["name"])
	#
	var name_to_add = self.name
	scene_tree_jsh["main_root"]["name"] = name_to_add
	scene_tree_jsh["main_root"]["type"] = self.get_class()
	scene_tree_jsh["main_root"]["metadata"]["creation_time"] = Time.get_ticks_msec()
	scene_tree_jsh["main_root"]["node"] = self
	scene_tree_jsh["main_root"]["status"] = "active"
	#print(" scene_tree_jsh : " ,scene_tree_jsh)
	#print(" scene_tree_jsh[main_root] " , scene_tree_jsh["main_root"])
	#TreeBlueprints.SCENE_TREE_BLUEPRINT BRANCH_BLUEPRINT


# container_path
func collect_all_nodes(branch_to_find) -> Array:
	var all_containers : Array = []
	var all_nodes : Array = []
	var branches_to_process : Array = []
	var just_container : Array = []
	# container finder
	var process_branch = func traverse_branch(branch: Dictionary):
		if branch.has("node") and branch["node"] != null:
			all_containers.append([branch["name"], branch["node"]])
		
		if branch.has("children"):
			for child_name in branch["children"]:
				#branch["children"][child_name]
				branches_to_process.append(branch["children"][child_name])
				#print(" branches? huh? " , branch["children"][child_name]["metadata"]["full_path"])
	# Children finder
	var process_children = func traverse_branch(branch: Dictionary):
		if branch.has("metadata"):# and branch["node"] != null:
			#all_nodes.append([branch["name"], branch["node"]])
			#print(" branches? huh? : " , branch["metadata"]["full_path"])
			all_nodes.append(branch["metadata"]["full_path"])
				
		if branch.has("children"):
			for child_name in branch["children"]:
				branches_to_process.append(branch["children"][child_name])

	process_branch.call(scene_tree_jsh["main_root"]["branches"][branch_to_find])

	# Then process all collected branches
	var current_branches = branches_to_process.duplicate()
	#branches_to_process.clear()

	# Process branches until none left
	while branches_to_process.size() > 0:
		#print(" are you while tho ?")
		var current_branch = branches_to_process[0]  # Get first branch
		#print(" the children finder is there! watch out ! : " , current_branch)
		process_children.call(current_branch)        # Process it
		branches_to_process.remove_at(0)            # Remove it and array shifts automatically
		
	# new function, where we check the sizes of PackedArrayStrings
	#print(" all_nodes : " , all_nodes)
	var container_nodeee = scene_tree_jsh["main_root"]["branches"][branch_to_find]["metadata"]["full_path"]
	var container_status = scene_tree_jsh["main_root"]["branches"][branch_to_find]["status"]
	all_nodes.append(container_nodeee)
	#if !container_status == "active":
	#	lets_check_them_all_nodes_already_added_to_tree_and_activate_them(all_nodes, branch_to_find)
	
	
	return all_nodes


# container_path
func check_existenc_of_nodes_and_change_status1(branch_to_find) -> Array:
	var all_containers : Array = []
	var all_nodes : Array = []
	var branches_to_process : Array = []
	var just_container : Array = []
	await get_tree().process_frame
	# container finder
	var process_branch = func traverse_branch(branch: Dictionary):
		if branch.has("node") and branch["node"] != null:
			all_containers.append([branch["name"], branch["node"]])
			var node_pathyi = branch["metadata"]["full_path"]
			var node_containert = get_node(node_pathyi)
			if node_containert:
				branch["status"] = "active"
				branch["node"] = node_containert
			
		
		if branch.has("children"):
			for child_name in branch["children"]:
				#branch["children"][child_name]
				branches_to_process.append(branch["children"][child_name])
				#print(" branches? huh? " , branch["children"][child_name]["metadata"]["full_path"])
				var node_pathi = branch["children"][child_name]["metadata"]["full_path"]
				var node_childy = get_node(node_pathi)
				if node_childy:
					branch["children"][child_name]["status"] = "active"
					branch["children"][child_name]["node"] = node_childy
					
	# Children finder
	var process_children = func traverse_branch(branch: Dictionary):
		if branch.has("metadata"):# we must complete the evaluation evolution and ovulation of this game
			#print(" branches? huh? : " , branch["metadata"]["full_path"])
			all_nodes.append(branch["metadata"]["full_path"])
				
		if branch.has("children"):
			for child_name in branch["children"]:
				branches_to_process.append(branch["children"][child_name])
				var node_pathiii = branch["children"][child_name]["metadata"]["full_path"]
				if node_pathiii:
					branch["children"][child_name]["status"] = "active"
					branch["children"][child_name]["node"] = node_pathiii
				

	process_branch.call(scene_tree_jsh["main_root"]["branches"][branch_to_find])

	# Then process all collected branches
	var current_branches = branches_to_process.duplicate()
	#branches_to_process.clear()

	# Process branches until none left
	while branches_to_process.size() > 0:
		#print(" are you while tho ?")
		var current_branch = branches_to_process[0]  # Get first branch
		#print(" the children finder is there! watch out ! : " , current_branch)
		process_children.call(current_branch)        # Process it
		branches_to_process.remove_at(0)            # Remove it and array shifts automatically
		
	# new function, where we check the sizes of PackedArrayStrings
	#print(" all_nodes : " , all_nodes)
	var container_nodeee = scene_tree_jsh["main_root"]["branches"][branch_to_find]["metadata"]["full_path"]
	var container_status = scene_tree_jsh["main_root"]["branches"][branch_to_find]["status"]
	all_nodes.append(container_nodeee)
	#if !container_status == "active":
	#	lets_check_them_all_nodes_already_added_to_tree_and_activate_them(all_nodes, branch_to_find)
	print_tree_structure(scene_tree_jsh["main_root"], 0)
	
	return all_nodes

# he adventure, to make the sceene tree, with like informations that i control more
# very needed for me :)
# can do many nice things :)

func lets_check_them_all_nodes_already_added_to_tree_and_activate_them(all_nodes, branch_to_find):
	var current = scene_tree_jsh["main_root"]["branches"][branch_to_find]# current["metadata"]["full_path"]
	await get_tree().process_frame
	for node in all_nodes:
		var current_node = get_node(node)
		if current_node:
			jsh_scene_tree_change_node_status(node)
			#print(" current_node : ",node)
	
	
var pretentious_dictionary : Dictionary = {}

func the_pretender_printer(node_name: String, node_path_jsh_tree: String, godot_node_type, node_type: String = "Node3D"):
	#the_pretender_printer(node_name, node_path, new_type_thingy, node_type)
	jsh_tasks_counter +=1
	#print(" the holi papa counter with just print " , jsh_tasks_counter)
	
	# Initialize dictionary if it doesn't exist
	if !scene_tree_jsh.has("main_root"):
		scene_tree_jsh = TreeBlueprints.SCENE_TREE_BLUEPRINT.duplicate(true)
		scene_tree_jsh["main_root"]["name"] = "main"
		scene_tree_jsh["main_root"]["type"] = "Node3D"
		scene_tree_jsh["main_root"]["status"] = "active"
		
	var path_parts = node_path_jsh_tree.split("/")
	var current_branch = scene_tree_jsh["main_root"]["branches"]
	var cached_current_branch = cached_jsh_tree_branches
	
	# Track the full path as we build it
	var current_full_path = ""
	
	# Handle path traversal
	for i in range(path_parts.size()):
		var part = path_parts[i]
		current_full_path = current_full_path + "/" + part if current_full_path else part
		
		if !current_branch.has(part):
			if cached_current_branch.has(part):
				print(" the cached branch has that one ")
				current_branch[part] = cached_current_branch[part]
				cached_current_branch.erase(part)
			else:
				var new_branch = TreeBlueprints.BRANCH_BLUEPRINT.duplicate(true)
				new_branch["name"] = part
				new_branch["type"] = godot_node_type
				new_branch["jsh_type"] = node_type
				new_branch["status"] = "pending"
				new_branch["metadata"] = {
					"creation_time": Time.get_ticks_msec(),
					"full_path": current_full_path,
					"parent_path": current_full_path.get_base_dir(),
					"has_collision": false,
					"has_area": false
				}
				if node_type == "datapoint":
					#print("godot_node_type : " , new_branch["metadata"], " and its name ", new_branch["name"], " its container  " , path_parts[0])
					scene_tree_jsh["main_root"]["branches"][path_parts[0]]["datapoint"] = {
						"datapoint_name" = new_branch["name"],
						"datapoint_path" = new_branch["metadata"]["full_path"]
					}
					#print("godot_node_type : 1 " ,scene_tree_jsh["main_root"]["branches"][path_parts[0]]["datapoint"])
				current_branch[part] = new_branch
			
		
		# Move to next branch's children unless we're at the last part
		if i < path_parts.size() - 1:
			if !current_branch[part].has("children"):
				current_branch[part]["children"] = {}
			current_branch = current_branch[part]["children"]
			
			if cached_current_branch.has(part):
				if cached_current_branch[part].has("children"):
					print(" the cached branch had them children")
					cached_current_branch = cached_current_branch[part]["children"]
	
	# Print the tree structure
	#print("\nTree Structure:")
	#print_tree_structure(scene_tree_jsh["main_root"], 0)










# whenever i hear any sound i know how to program better


# Modified print_tree_structure function
func print_tree_structure(branch: Dictionary, indent: int = 0):
	var indent_str = "  ".repeat(indent)
	var status = branch.get("status", "pending")  # Default to pending if no status
	print("%s%s (%s) %s" % [
		indent_str, 
		branch["name"], 
		branch["type"],
		status_symbol[status]
	])
	
	if branch.has("metadata"):
		var metadata = branch["metadata"]
		if metadata.get("has_collision", false):
			print("%s  └─ Has Collision" % indent_str)
		if metadata.get("has_area", false):
			print("%s  └─ Has Area" % indent_str)
	
	if branch.has("branches"):
		for child in branch["branches"].values():
			print_tree_structure(child, indent + 1)
	elif branch.has("children"):
		for child in branch["children"].values():
			print_tree_structure(child, indent + 1)
	




func jsh_tree_get_node(node_path_get_node: String) -> Dictionary:
	var path_parts = node_path_get_node.split("/")
	var current = scene_tree_jsh["main_root"]["branches"]
	
	for part in path_parts:
		if current.has(part):
			current = current[part]
			if path_parts[-1] == part:
				print(" current : " , current)
				return current
			else:
				current = current["children"]
	return {}





func jsh_tree_get_parent(node_path_get_parent: String) -> Dictionary:
	var path_parts = node_path_get_parent.split("/")
	if path_parts.size() <= 1:
		return scene_tree_jsh["main_root"]  # Root level node
		
	var parent_path = "/".join(path_parts.slice(0, -1))
	return jsh_tree_get_node(parent_path)



func jsh_tree_get_children(node_path_get_child: String) -> Array:
	var node = jsh_tree_get_node(node_path_get_child)
	if node.has("children"):
		return node["children"].values()
	return []



func jsh_tree_get_main() -> Dictionary:
	return scene_tree_jsh["main_root"]



func jsh_tree_get_siblings(node_path_get_siblings: String) -> Array:
	var path_parts = node_path_get_siblings.split("/")
	if path_parts.size() <= 1:
		# Root level - return other root level nodes
		return scene_tree_jsh["main_root"]["branches"].values()
		
	var parent = jsh_tree_get_parent(node_path)
	if parent.has("children"):
		var siblings = parent["children"].values()
		# Remove self from siblings list
		for i in range(siblings.size()):
			if siblings[i]["name"] == path_parts[-1]:
				siblings.remove_at(i)
				break
		return siblings
	return []



#
# The JSH scene tree functions, we got one more word, so maybe lets put more lines in them? than the ones that have no scene in em 
#

func jsh_scene_tree_get_children(node_path_get_childs: String) -> Array:
	var path_parts = node_path_get_childs.split("/")
	var current_branch = scene_tree_jsh["main_root"]["branches"]
	
	# Navigate to the requested node
	for part in path_parts:
		if current_branch.has(part):
			if path_parts[-1] == part:
				# We found our node, return its children
				return current_branch[part].get("children", {}).keys()
			else:
				# Keep navigating
				current_branch = current_branch[part]["children"]
	
	return []


func jsh_scene_tree_get_node(node_path_jsh_get_nodee: String) -> Dictionary:
	#print("\nAttempting to get node: ", node_path)
	var path_parts = node_path_jsh_get_nodee.split("/")
	var current = scene_tree_jsh["main_root"]["branches"]
	
	for part in path_parts:
		#print("Looking for part: ", part)
		if current.has(part):
			current = current[part]
			if path_parts[-1] == part:
				#print("Found node: ", current["name"], " Type: ", current["type"])
				# Check if we have a node reference
				if current.has("node") and current["node"] != null:
					#print("Has node reference!")
					return current
				else:
					print("No node reference stored!")
			else:
				#print("Going deeper into children...")
				current = current["children"]
		else:
			print("Part not found: ", part)
	
	print("Node not found in tree!")
	return {}
	
	
	
func jsh_scene_tree_change_node_status(node_path_c_n_s: String):
	#print("\nAttempting to get node: ", node_path)
	var path_parts = node_path_c_n_s.split("/")
	var current = scene_tree_jsh["main_root"]["branches"]
	
	for part in path_parts:
		#print("Looking for part: ", part)
		if current.has(part):
			current = current[part]
			if path_parts[-1] == part:
				#print("Found node: ", current["name"], " Type: ", current["type"])
				# Check if we have a node reference
				if current.has("node") and current["node"] != null: # i hate that part a lot, here we check if node is not null? why? we work on txt file, not yet on nodes :(
					#print("Has node reference! so i guess, here we can change status? : " , current["status"])
					#print(" current nodes pathy : ", current["metadata"]["full_path"]) 
					#current["status"] = "active"
					return #current
				#else:
					#print("No node reference stored!")
			else:
				#print("Going deeper into children...")
				current = current["children"]
		#else:
			#print("Part not found: ", part)
	
	#print("Node not found in tree! could not change status to active !")
	return
	
func jsh_tree_reparent_nodes(data_to_process):
	print(" data_to_process ", data_to_process)

#
# JSH Multi Threads
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┳┳┓  ┓ •  ┏┳┓┓        ┓   ┏┓         
#       888  `"Y8888o.   888ooooo888     ┃┃┃┓┏┃╋┓   ┃ ┣┓┏┓┏┓┏┓┏┫┏  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┛ ┗┗┻┗┗┗   ┻ ┛┗┛ ┗ ┗┻┗┻┛  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                                  ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Multi Threads
#


func second_impact_starter(name_of_tasky):
	#print(name_of_tasky)
	var splitted_thingy = name_of_tasky.split("|")
	if splitted_thingy[0] == "initialize_menu":
		print(" i guess we got it ?")
		#check_all_nodes()
		

func nodes_placement_checker(name_of_container):
	var task_tag = "nodes_checker_|" + name_of_container #check_existenc_of_nodes_and_change_status
	thread_pool.submit_task(self, "check_existenc_of_nodes_and_change_status", name_of_container, task_tag)#collect_all_nodes
	return task_tag#

func _check_placed_nodes_task(container_to_be_checked):
	var found_nodes
	
	#print(" container_to_be_checked : " , container_to_be_checked)
	#
	if scene_tree_jsh["main_root"]["branches"].has(container_to_be_checked):
		#found_nodes.append(scene_tree_jsh["main_root"]["branches"][container_to_be_checked]["metadata"]["full_path"])
		collect_all_nodes(scene_tree_jsh["main_root"]["branches"][container_to_be_checked]["metadata"]["full_path"])
#		print(scene_tree_jsh["main_root"]["branches"][container_to_be_checked]["metadata"]["full_path"])
#		if scene_tree_jsh["main_root"]["branches"][container_to_be_checked].has("children"):
#			var current_path_0 = scene_tree_jsh["main_root"]["branches"][container_to_be_checked]
#			var new_children = check_childrens(current_path_0)
#			while new_children.has("children"):
#				for children_found

#	else:
#		print("where are them branches baby!")

#var found_children

#func check_childrens(branch_to_process):
#	var found_children: Dictionary = { 
#		"node": [],
#		"node_path": [],
#		"has_children": []
#		}
#	var found_nodes
#	var found_branches
#	var thingies_we_foundy
#	for children_to_find in branch_to_process["children"]:
#		found_nodes.append(branch_to_process["children"][children_to_find]["metadata"]["full_path"])
		#print(branch_to_process[children_to_find]["metadata"]["full_path"])
#		if branch_to_process[children_to_find].has("children"):
#			found_branches.append(branch_to_process[children_to_find]["children"])
		
#	thingies_we_foundy.append([[found_nodes], [found_branches]])
#	return thingies_we_foundy



# we shall make it even better and better each and every day, the more i have, we build it over it, and we grow and grow and grow it!

func create_new_task_two_datas(function_name: String, data):
	var task_tag = function_name + "_" + str(Time.get_ticks_msec())
	#print(" function_name L : " , function_name , " data : " , data)
	# Declare the variable first
	var completion_handler
	# Then assign the function to it
	completion_handler = func(completed_tag):
		if completed_tag == task_tag:
	#		print("Task completed: ", function_name)
			thread_pool.disconnect("task_finished", completion_handler)
	
	# Connect with the callable
	thread_pool.connect("task_finished", completion_handler)
	
	# Submit the task
	thread_pool.submit_task(self, function_name, data, task_tag)




func get_node_function(node_path_g_n_f : String):
	#
	#print(" node_path : " , node_path)
	await get_tree().process_frame
	# print(" i guess from there, we kinda could, i dunno ")
	var task_done = node_path_g_n_f.split("|")
	# var node_to_check = get_node(task_done[1])
#	print()
	# print(" and HERE WE ARE CHECKING IT AFTER TASK COMPLETE?!", task_done, " [0] ", task_done[0])
	# print(" task_done " , node_path)
	# if task_done[0] == "initialize_menu":
		# print(" hmmm initialize menu finished")
	if task_done[0] == "add_child_":
#		print(" add child task evaluation ")
		
		var path_spliter = task_done[1].split("/")
		
		#print( " path_spliter  : " , path_spliter)
		
		var container_node_path = path_spliter[0]
		var added_node_path = task_done[1]
		
		var last_part = path_spliter[path_spliter.size() - 1]
		
	#	print( " added_node_path : " , added_node_path)
		var container_node = get_node(container_node_path)
		var full_path_node = get_node(added_node_path)
		var singular_node = get_node(last_part)
	#	print(" full_path_nodee : " , full_path_node , " last_part " , last_part)
		var container_status = scene_tree_jsh["main_root"]["branches"][container_node_path]["status"]
		
		var parent_node_status
		
		var added_node_status
		
		var node_to_add
		#print()
		#print("container : ", container_node, " full_path_node : ", full_path_node,
		#" s t jsh / m r / b / cn_path  ",
		#
		#
		
		if path_spliter.size() > 1:
			
			var some_data = jsh_scene_tree_get_node(added_node_path)
			#print("  some_data : ", " maybe first what path it was ? : " , added_node_path )
			if some_data.has("status"):
				added_node_status = some_data["status"]
				#print(" some_data : ", some_data["status"])
			else:
				added_node_status = "pending"
				#print(" some_data :  we didnt get it?!?!?!?!?!? " , added_node_path)
			node_to_add = get_node(last_part)#scene_tree_jsh["main_root"]["branches"][container_node_path]["children"][path_spliter[1]]["node"]
		else:
			added_node_status = container_status
			node_to_add = get_node(last_part)#scene_tree_jsh["main_root"]["branches"][container_node_path]["node"]

		#print(" quality assurance, checking statuses of nodes added : container : " , container_status , " added_node_status : " , added_node_status, " added node " , node_to_add , " singular_node : " , singular_node)
		
		
		
		
		match added_node_status:
			# active pending disabled
			"active":
				print(" it is active i guess")
			"pending":
				#print(" added node status pending : container_node : " , container_node , " full_path_node " , full_path_node , " singular_node " , singular_node )
				var counter_for_splitin : int = 0
				var pathy_splin_mergin : Array = []
				if path_spliter.size() == 2:
					#print(" i : guess is thingy nody")
					singular_node.reparent(container_node)
					added_node_status = "active"
				if path_spliter.size() > 2:
					#print(" so did it work this way? : " , full_path_node)
					for i in path_spliter:
						pathy_splin_mergin.append(i)
						var new_path = "/".join(PackedStringArray(pathy_splin_mergin.slice(0, -1)))
						if singular_node:
							if i == singular_node.name:
								var parent_node = get_node(new_path)
								singular_node.reparent(parent_node)
								added_node_status = "active"
								#print(" path creation device : " , new_path , " , " , singular_node.name , " testing_node " , parent_node)
			"disabled":
				print(" it is disable i guess")
		# lets now go again, pick that status, and check it, if we done it right?
		#print(" added_node_status : " , added_node_status)
		var newly_processed_node = get_node(added_node_path)
		if added_node_status == "active":
			#var new_data_status = 
			#print(" statusy trhingeie lo l : " , newly_processed_node)
			if newly_processed_node:
				#print(" node was found by its path, from main_root in godot scene tree")
				jsh_scene_tree_change_node_status(added_node_path)
				
				
		var current_data = jsh_scene_tree_get_node(added_node_path)
		
		if current_data.has("status"):
			added_node_status = current_data["status"]
#			print(" after tries, lets check status again : ", current_data["status"])
			#if new_data_status and new_data_status.has("status"):
			#	print(" it shall appear on console, i command it! : " , new_data_status["status"] , newly_processed_node)
		# if node active and get_node(path)
		# we call it complete task :)
		#
		# here we shall check again, if that node is processed fully, if not, we shall check what tasks are there? and if one of them have a node that  wait a minute, i can do it in my for loop :)
#
# ThreadPool functions helpers! here we kinda call functions
func tasked_children(child_node, container_path = null):#
	var data = {#
		"child": child_node,#
		"container_path": container_path if container_path else child_node.name,#
		"type": child_node.get_class(),#
		"creation_time": Time.get_ticks_msec()#
	}
	children_being_created_counter +=1
	all_nodes_to_check[0][0] +=1
	var task_tag = "add_child_|" + container_path#
	thread_pool.submit_task(self, "_add_child_task", data, task_tag)#
	return task_tag#
#
#
#
#
#  child: Node
func check_container_with_retry(path_parts: Array, attempts: int = 0):
	#await get_tree().process_frame
	#print(" check_container_with_retry : ", path_parts , " child " , child)
	var main = get_tree().get_root().get_node("main")
	#var main_two = get_tree().get_nodes_in_group("group_0")
	#var main_three
	#main_two.call_deffered("get_node")
	#print( "check_container_with_retry ", main , " self ? " , self , main_two)
	if main and main.has_node(path_parts[0]):
		var container = main.get_node(path_parts[0])
		#print(" check_container_with_retry container check : ", container)
		
		# Update status in tree before reparenting
		var current_branch = scene_tree_jsh["main_root"]["branches"]
		if current_branch.has(path_parts[0]):
			#print(" check_container_with_retry container check Updating container status to active: ", path_parts[0])
			#current_branch[path_parts[0]]["status"] = "active"
			#container.call_deferred("reparent", child)
			#print_tree_pretty()
			#print_tree_structure(scene_tree_jsh["main_root"], 0)
			
			# If this is a nested path, update child status too
			if path_parts.size() > 1 and current_branch[path_parts[0]]["children"].has(path_parts[1]):
				print(" check_container_with_retry container check Updating child status to active: ")#, path_parts[1])
				
				#current_branch[path_parts[0]]["children"][path_parts[1]]["status"] = "active"
				#container.call_deferred("reparent", child)
				#print_tree_pretty()
				#print_tree_structure(scene_tree_jsh["main_root"], 0)
				
		#container.call_deferred("reparent", child)
		#print(" check_container_with_retry container check child : ", child)
		return container
	elif attempts < 10:  # Limit retries
#		print(" is this shish even trying? ")
		await get_tree().process_frame
		get_tree().create_timer(0.1).timeout.connect(  # 100ms delay
			func(): check_container_with_retry(path_parts, attempts + 1)
			
		)






# oh add child, adds only lolis
func _add_child_task(data):
	var child = data["child"]
	var path_a_c_t = data["container_path"]
	var path_parts = path_a_c_t.split("/")
	var parent_path = "/".join(path_parts.slice(0, -1))
	var children
	var container
	var container_path = "akashic_records"
	
	if path_parts.size() > 1:
		container = get_node_or_null(parent_path)
		#if container == null:
			#print(" i guess it is null?")
		if !container:
			container = await try_get_node(parent_path)
			#await get_tree().process_frame
			#container = get_node(parent_path)
			#if !container:
			#	await get_tree().process_frame
			#	container = get_node(parent_path)
			#	if !container:
			#		await get_tree().process_frame
			#		container = get_node(parent_path)
			#		if !container:
			#			await get_tree().process_frame
			#			container = get_node(parent_path)
		if container:
			container.call_deferred("add_child", child)
#			jsh_tasks_finished_counter +=1
	else:
		self.call_deferred("add_child", child)
#		jsh_tasks_finished_counter +=1
	if path_parts.size() > 1:
		if container:
			container.call_deferred("add_child", child)
#			jsh_tasks_finished_counter +=1
		else:
			print(" no container? child : " , child , " : " , path_parts)
#	if jsh_tasks_finished_counter == jsh_tasks_counter:
#		jsh_scene_tree_checker = 1


func analyze_path(path_for_node: String) -> Dictionary:
	var parts = path_for_node.split("/")
	return {
		"level": parts.size() - 1,  # -1 because root level is 0
		"parts": parts,
		"is_root": parts.size() == 1
	}



func _add_child_task2(data):
	var child = data["child"]
	var path_for_node = data["path"]
	var path_parts = path_for_node.split("/")
	
	# Create new branch data
	var new_branch = TreeBlueprints.BRANCH_BLUEPRINT.duplicate(true)
	new_branch["name"] = child.name
	new_branch["type"] = data["type"]
	new_branch["status"] = "pending"
	
	# Navigate to the correct location in our tree
	var current_branch = scene_tree_jsh["main_root"]["branches"]
	
	if path_parts.size() > 1:
		# This is a nested path
		for i in range(path_parts.size() - 1):
			var part = path_parts[i]
			# Navigate to the "children" dictionary of the current branch
			if current_branch.has(part):
				current_branch = current_branch[part]["children"]
	
	# Add the new node to its proper place
	current_branch[child.name] = new_branch
	
	# Handle the actual node addition in the scene tree
	if path_parts.size() > 1:
		# Get the parent node and reparent
		var container = get_node(path_parts[0])
		if container:
			container.call_deferred("reparent", child)
	else:
		# Root level node
		self.call_deferred("add_child", child)
	#print()
	#print(scene_tree_jsh)









# creating new tasks, also punishing mortals 
func create_new_task(function_name: String, data):
	var new_data_way = str(data)
	var task_tag = function_name + "|" + new_data_way + "|" + str(Time.get_ticks_msec())
	
	# Declare the variable first
	var completion_handler
	
	# Then assign the function to it
	completion_handler = func(completed_tag):
		if completed_tag == task_tag:
#			print("Task completed: ", function_name)
			thread_pool.disconnect("task_finished", completion_handler)
	
	# Connect with the callable
	#thread_pool.connect("task_finished", completion_handler)
	#print(" we are connecting thingies here? ")
	# Submit the task
	thread_pool.submit_task(self, function_name, data, task_tag)
	
	
# just a test to see how threadpool is working
func test_task(message):
	print(message)
	return "Task completed!"
	
# normal function call, for that threaded thingy stuff
func test_thread_pool():
	# Simple test task
	thread_pool.submit_task(self, "test_task", "Hello from thread!")

#
# JSH Files Management
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓•┓     ┳┳┓                    ┏┓         
#       888  `"Y8888o.   888ooooo888     ┣ ┓┃┏┓┏  ┃┃┃┏┓┏┓┏┓┏┓┏┓┏┳┓┏┓┏┓╋  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┻ ┗┗┗ ┛  ┛ ┗┗┻┛┗┗┻┗┫┗ ┛┗┗┗ ┛┗┗  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                        ┛               ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Files Management
#


# file creation, here we have functions from second, maybe third chicken
# now we have nice eggs
func create_file(array_with_data: Array, lines_amount: int, name_for_file: String):

	var file = FileAccess.open(path + "/" + name_for_file + ".txt", FileAccess.WRITE)
	if file:
		# We'll loop from 0 to lines_amount-1 to write each line
		for line in range(lines_amount):
			file.store_line(array_with_data[line][0])  # [0] because each line is in its own array
		#print("  i Created file at: ", path + "/" + name_for_file + ".txt  i ")
		file_path = path + "/" + name_for_file + ".txt"
	
	
# finding files in lists of files, missing files thingy? or was it integrity stuff
func file_finder(file_name, path_to_file, list_of_files, type_of_data):
	var counter_liste = list_of_files.size()
	var counter_times : int = 0
	
	for file in list_of_files:
		#print("Found file: ", file)
		if file == file_name:
			#print("found file searched")
			file_path = path_to_file + "/" + file


#checks if it is a first run, checks for an akashic_records.txt file
func check_folder(folder_path):
	var space_existence = DirAccess.open(folder_path)
	if space_existence:
		#print("  i Directory exists i  ")
		check_folder_content(space_existence)
		directory_existence = true
	else:
		pass
		#print("  i Directory doesn't exist or cannot be accessed i  ")
		
# checking folder content
func check_folder_content(directory):  # Take DirAccess as parameter
	files_content = directory.get_files()      # Get array of files
	folders_content = directory.get_directories()  # Get array of folders
	
	# Check if we have any files
	if files_content.size() > 0:
		files_existence = true
		#print("  i Files found in directory i  ")
	else:
		files_existence = false
		#print("  i No files in directory i  ")
		
	# Check if we have any folders
	if folders_content.size() > 0:
		folders_existence = true
		#print("  i Folders found in directory i  ")
	else:
		folders_existence = false
		#print("  i No folders in directory i    ")

#func count_array_size(data: Array):
#	print("  i counting array size i  ")
#	var counter_now: int
#	for point in data:
#		counter_now+=1
#	print("  i counting array size : " , counter_now , " i  ")
#	return counter_now


# here we check existence of settings file and also sending it to class file
func check_settings_file():
	#print(" i gues we start that settings thingy")
	# first we shall check if we have settings file at //res? because we dont know yet what kind of directory we will use :)
	var settings_exists = FileAccess.file_exists("user://settings.txt")
#	print("Does settings file exist in user://?: ", settings_exists)
	
	if settings_exists:
		# File exists, we can try to open it
		var file = FileAccess.open("user://settings.txt", FileAccess.READ)
		if file:
			#print("Successfully opened settings file")
			SettingsBank.load_settings_file("user://settings.txt")
			return true
		else:
#			print("File exists but couldn't open it")
			return false
	else:
		#print("No settings file found in user://")
		var file_data_of_settings = SettingsBank.settings_file_blue_print_0
		var data_of_settings_cleaned : Array = []
		for entry in file_data_of_settings[0]:
			var cleansed = entry[0].split("|")
			data_of_settings_cleaned.append(cleansed)
			
		# here we are after cleaning settings thingy, the D eden is : data_of_settings_cleaned[0][1] = lets see now : D:/Eden so here we got string! just string :(
		var path_for_directory = data_of_settings_cleaned[0][1]
		var path_for_user_data = "user://" # + data_of_settings_cleaned[1][1]
		var path_for_database = data_of_settings_cleaned[1][1]
		var settings_file_name = data_of_settings_cleaned[2][1]
		var default_directory = DirAccess.dir_exists_absolute(path_for_directory)
		#print(" path_for_user_data : " , path_for_user_data)
		# Check if directory exists first

		#print(" so we use absolute stuff huh? what we got? true false? : " , default_directory)
		if default_directory == true:
			print("the directory exist, we can send there file, hmm, damn, i wanted to do it different way, like use res? but lets just do it my way, it even finds")
		else:
			scan_available_storage()
		#print(" does it do anything, when i dont return thing? lol : " , available_directiories)
		
		#print( " now we got some nice data : " , file_data_of_settings, " lets see now : " , data_of_settings_cleaned[0][1] )
		#for avail_dir in available_directiories:
		scan_available_storage()
		#print(" data_of_settings_cleaned : " , data_of_settings_cleaned , " and aval dir :" , available_directiories[0])
		if available_directiories[0]:
			data_of_settings_cleaned.append(["available_directiory" , available_directiories[0]])
		#return false
		if !DirAccess.dir_exists_absolute(path_for_user_data + path_for_database):
		#	# Create directory
			DirAccess.make_dir_recursive_absolute(path_for_user_data + path_for_database)
		if !FileAccess.file_exists(path_for_user_data + settings_file_name):
			var file = FileAccess.open(path_for_user_data + settings_file_name, FileAccess.WRITE)
			if file:
				for line in data_of_settings_cleaned:
					file.store_line(line[0] + " : " + line[1])
			SettingsBank.load_settings_file(path_for_user_data + settings_file_name)
	

# creating file, what to put in, where,name
func file_creation(file_content,  path_for_file, name_for_file):
	var file = FileAccess.open( path_for_file + "/" + name_for_file + ".txt", FileAccess.WRITE)
	if file:
		for line in file_content:
			file.store_line(line)  # [0] because each line is in its own array


#
# hmm i think i didnt use these, we done it different way
#
func setup_settings():
	# 1. Check for directory
	var eden_path = find_or_create_eden_directory()
	
	# 2. Check/Create akashic_records folder
	var akashic_path = eden_path + "/akashic_records"
	if !DirAccess.dir_exists_absolute(akashic_path):
		DirAccess.make_dir_recursive_absolute(akashic_path)
	
	# 3. Check/Create settings file
	var settings_file_path = akashic_path + "/settings.txt"
	if !FileAccess.file_exists(settings_file_path):
		create_default_settings(settings_file_path)
	
	# 4. Load settings into SettingsBank
	SettingsBank.load_settings_file(settings_file_path)


# so this one
func find_or_create_eden_directory():
	var available_dirs = scan_available_storage()
	
	# Try to find existing Eden folder
	for dir in available_dirs:
		if DirAccess.dir_exists_absolute(dir + "/Eden"):
			return dir + "/Eden"
	
	# If not found, create in first available directory
	var target_dir = available_dirs[0] + "/Eden"
	DirAccess.make_dir_recursive_absolute(target_dir)
	return target_dir

# and this
func create_default_settings(file_path_c_d_s):
	var settings_data = []
	for entry in SettingsBank.settings_file_blue_print_0[0]:
		settings_data.append(entry)
	
	create_file(settings_data, settings_data.size(), "settings")


# 
func scan_available_storage():
	#print("Scanning available storage...")
	
	# For Windows: Check drives A-Z
	if OS.get_name() == "Windows":
		for ascii in range(65, 91):  # A-Z in ASCII
			var drive = char(ascii) + ":/"
			var dir = DirAccess.open(drive)
			if dir != null:
				#print("Found drive: ", drive)
				available_directiories.append(drive)
				#print(" available_directiories : " , available_directiories)
	
	# For Android: Check common storage paths
	elif OS.get_name() == "Android":
		var common_paths = [
			"/storage/emulated/0/",  # Internal storage
			"/sdcard/",              # Common symlink to internal storage
			"/storage/"              # Parent directory for all storage
		]
		
		for path_s_a_s in common_paths:
			var dir = DirAccess.open(path)
			if dir != null:
				#print("Found storage: ", path)
				# List all storage devices in /storage/
				if path_s_a_s == "/storage/":
					var contents = dir.get_directories()
					for storage in contents:
						print("Storage device found: /storage/" + storage)

	# Print current user data dir for reference
#	print("User data dir: ", OS.get_user_data_dir())

# the magic happens there so far, we just send the names of set, it loads it from consts from classes, and in the future, we will kinda skip it when we have singular files system,
# and it will be chicken of loading files like version 1, 2, 3, 4? maybe even this one is fifth, how many times they made me to rewrite it? maybe thats why mortals are dying
# maybe thats why mortals will have covid 2000 soon? they already do heh

#
# Memories Management
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┳┳┓         •     ┳┳┓                   ┏┓         
#       888  `"Y8888o.   888ooooo888     ┃┃┃┏┓┏┳┓┏┓┏┓┓┏┓┏  ┃┃┃┏┓┏┓┏┓┏┓┏┓┏┳┓┏┓┏┓╋ ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┛ ┗┗ ┛┗┗┗┛┛ ┗┗ ┛  ┛ ┗┗┻┛┗┗┻┗┫┗ ┛┗┗┗ ┛┗┗ ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                                 ┛              ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# Memories Management
#

func initialize_menu(record_type: String):
	
	var type_of_data : int
# dataSetLimits and data_sets_names in BanksCombiner
	print(" initalize memories ! : " , record_type)
	
	var records_set_name = record_type + "_"
	var use_cache = false
	var already_exists = false
   
	# check if it is in active
	if active_record_sets.has(records_set_name):
		already_exists = true
		print(" active records set fiasco ? 0")
		if active_record_sets[records_set_name].has("metadata"):
			print(" active records set fiasco ? 1" , active_record_sets[records_set_name]["metadata"]["container_count"] , " and " , BanksCombiner.dataSetLimits[records_set_name])
			if active_record_sets[records_set_name]["metadata"]["container_count"] == BanksCombiner.dataSetLimits[records_set_name]:
				print(" active records set fiasco ? 2")
				var already_reached_limits = "already_reached_limit"
				multi_threaded_array_of_information.append([records_set_name, already_reached_limits])
				return
			#else:
				#print(" active records set fiasco ?  hmm the counter thingy, is different? ")
				# IF IT IS FIRST ADDITIONAL SET!!!!!
			if active_record_sets[records_set_name]["metadata"]["container_count"] == 1:
				print(" active records set fiasco ? 3")
				var number_of_set = active_record_sets[records_set_name]["metadata"]["container_count"]
				var additional_set_name = record_type + str(number_of_set) + "_"
				if !active_record_sets.has(additional_set_name):
					print(" active records set fiasco ? 4")
					var new_data = recreator(number_of_set, active_record_sets[records_set_name], record_type, additional_set_name)
					active_record_sets[additional_set_name] = new_data.duplicate(true)
					var new_set_name = "new_set_name"
					multi_threaded_array_of_information.append([records_set_name, new_set_name, additional_set_name])
					return 
# here we will also need to check if "number_of_set" > max countainer count in
				# IF WE ALREADY HAD ONE ADDDITIONAL SET MADE BEFORE!!!!
			if active_record_sets[records_set_name]["metadata"]["container_count"] > 1:
				print(" active records set fiasco ? 5")
				var number_of_set = active_record_sets[records_set_name]["metadata"]["container_count"]
				var previous_additional_set_name = record_type + str(number_of_set -1)
				var previous_additional_set_name_underscore = previous_additional_set_name + "_"
				var additional_set_name = record_type + str(number_of_set) + "_"
				if !active_record_sets.has(additional_set_name):
					print(" active records set fiasco ? 6")
					var new_data = recreator(number_of_set, active_record_sets[previous_additional_set_name_underscore], previous_additional_set_name, additional_set_name)
					active_record_sets[additional_set_name] = new_data.duplicate(true)
					var new_set_name = "new_set_name"
					multi_threaded_array_of_information.append([records_set_name, new_set_name, additional_set_name])
					active_record_sets[records_set_name]["metadata"]["container_count"] +=1
					return
				else:
					print(" active records set fiasco ? 7")
					active_record_sets[records_set_name]["metadata"]["container_count"] +=1
					var new_set_name = "new_set_name"
					multi_threaded_array_of_information.append([records_set_name, new_set_name, additional_set_name])
				return

		if active_record_sets[records_set_name].is_empty():
			print(" active records set fiasco ? 8")
			if cached_record_sets.has(records_set_name):
				print(" active records set fiasco ? 9")
				if !cached_record_sets[records_set_name].is_empty():
					print(" active records set fiasco ? 10")
					active_record_sets[records_set_name] = cached_record_sets[records_set_name].duplicate(true)
					active_record_sets[records_set_name]["metadata"]["container_count"] +=1
					cached_record_sets.erase(records_set_name)
					return


	group_first = get_tree().get_nodes_in_group("group_0")
	var group_second = get_tree().get_nodes_in_group("group_1")
	group_datapoints = get_tree().get_nodes_in_group("datapoints")

	
	var datapoint_node
	var records : Dictionary
	var current_data_pack_loaded
	var records_part : String
	var records_name : String
#	print(" initialize menu lets check that records_part :  ", records_part)
	records_part = ""
#	print(" initialize menu now i tried cleaning it records_part : ", records_part)
	
	match record_type:
		"base":
			current_data_pack_loaded = BanksCombiner.combination_0
			records_part = "base_"
		"menu":
			current_data_pack_loaded = BanksCombiner.combination_1
			records_part = "menu_"
		"settings":
			current_data_pack_loaded = BanksCombiner.combination_2
			records_part = "settings_"
		"keyboard":
			current_data_pack_loaded = BanksCombiner.combination_3
			records_part = "keyboard_"
		"keyboard_left":
			current_data_pack_loaded = BanksCombiner.combination_4
			records_part = "keyboard_left_"
		"keyboard_right":
			current_data_pack_loaded = BanksCombiner.combination_5
			records_part = "keyboard_right_"
		# Add more record sets as needed
		"things_creation":
			current_data_pack_loaded = BanksCombiner.combination_6
			records_part = "things_creation_"
		"singular_lines":
			current_data_pack_loaded = BanksCombiner.combination_7
			records_part = "singular_lines_"
		_:
			#print("Unknown record set to find in banks combiner : ", record_type)
			return {}
		
	group_datapoints = get_tree().get_nodes_in_group("datapoints")
#	print(" group_datapoints : " , group_datapoints)
	
	
	
	for data_types in current_data_pack_loaded:
		#print("data_types : ", data_types[0])
		type_of_data = data_types[0]
		# get records by its type :)
		match type_of_data:
			0:
				#print(" zero ?")
				records = find_record_set(record_type)
				
				records_name = records_part + "records" # 0 = "records" , 1 = "instructions" 2 = "scenes"  3 = "interactions"
			1:
				#print(" one ? ")
				records = find_instructions_set(record_type)
				
				records_name = records_part + "instructions"
			2: 
				#print(" two ? ")
				records = find_scene_frames(record_type)
				
				records_name = records_part + "scenes"
			3:
				#print(" three ? ")
				records = find_interactions_list(record_type)
				
				records_name = records_part + "interactions"
		
#		print(" initialize menu  records_name : " , records_name)
		# Load menu record set
		load_record_set(records_part, records_name, type_of_data, records)
		#print(" type_of_data : " , type_of_data)
		if type_of_data == 3:
			read_records_data(active_record_sets, records_part)
			
			# here we need get node function
			
			#var datapoint_node_path = active_record_sets[records_part][records_part+"instructions"]["content"][0][1].duplicate(true)
			#var path_to_datapoint = datapoint_node_path[0][0] + "/" + datapoint_node_path[1][0]
			
			#var datapoint_node_to_move = get_node(path_to_datapoint)
			#var data_point_thingy = get_node_function(path_to_datapoint)
			#print(" data_point_thingy : " , data_point_thingy)
			#datapoint_node_to_move.scene_mover_after_all_loaded() 
	


# finding records sets by memory name
func find_record_set(record_type: String) -> Dictionary:
#	print(" check_possible_interactions check_possible_interactions find rec")
	match record_type:
		"base":
			return RecordsBank.records_map_0
		"menu":
			return RecordsBank.records_map_2
		"settings":
			return RecordsBank.records_map_3
		"keyboard":
			return RecordsBank.records_map_4
		"keyboard_left":
			return RecordsBank.records_map_5
		"keyboard_right":
			return RecordsBank.records_map_6
		"things_creation":
			return RecordsBank.records_map_7
		"singular_lines":
			return RecordsBank.records_map_8
		# Add more record sets as needed
		_:
			#print("Unknown record set: ", record_type)
			return {}

# the same but for instruction by memory name
func find_instructions_set(record_type: String) -> Dictionary:
	match record_type:
		"base":
			return InstructionsBank.instructions_set_0
		"menu":
			return InstructionsBank.instructions_set_1
		"settings":
			return InstructionsBank.instructions_set_2
		"keyboard":
			return InstructionsBank.instructions_set_3
		"keyboard_left":
			return InstructionsBank.instructions_set_4
		"keyboard_right":
			return InstructionsBank.instructions_set_5
		"things_creation":
			return InstructionsBank.instructions_set_6
		"singular_lines":
			return InstructionsBank.instructions_set_7
		# Add more record sets as needed
		_:
			#print("Unknown record set: ", record_type)
			return {}
			

# the same as before, but for frames, scenes, memory
func find_scene_frames(record_type: String) -> Dictionary:
	match record_type:
		"base":
			return ScenesBank.scenes_frames_0
		"menu":
			return ScenesBank.scenes_frames_1
		"settings":
			return ScenesBank.scenes_frames_2
		"keyboard":
			return ScenesBank.scenes_frames_3
		"keyboard_left":
			return ScenesBank.scenes_frames_4
		"keyboard_right":
			return ScenesBank.scenes_frames_5
		"things_creation":
			return ScenesBank.scenes_frames_6
		"singular_lines":
			return ScenesBank.scenes_frames_7
		# Add more record sets as needed
		_:
			#print("Unknown record set: ", record_type)
			return {}
			

# here are interactions! to punish mortals
func find_interactions_list(record_type: String) -> Dictionary:
	#print(" so are we there?")
	match record_type:
		"base":
			#print(" maybe we somehow go to the base drop?")
			return InteractionsBank.interactions_list_0
		"menu":
			#print(" so efforts were made, we are supposed to load interactions list 1 : ", InteractionsBank.interactions_list_1)
			return InteractionsBank.interactions_list_1
		"settings":
			return InteractionsBank.interactions_list_2
		"keyboard":
			return InteractionsBank.interactions_list_3
		"keyboard_left":
			return InteractionsBank.interactions_list_4
		"keyboard_right":
			return InteractionsBank.interactions_list_5
		"things_creation":
			return InteractionsBank.interactions_list_6
		"singular_lines":
			return InteractionsBank.interactions_list_7
		# Add more record sets as needed
		_:
			#print("Unknown record set: ", record_type)
			return {}

#
# JSH Memories Transcription
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┳┳┓         •     ┏┳┓          •   •      ┏┓         
#       888  `"Y8888o.   888ooooo888     ┃┃┃┏┓┏┳┓┏┓┏┓┓┏┓┏   ┃ ┏┓┏┓┏┓┏┏┏┓┓┏┓╋┓┏┓┏┓  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┛ ┗┗ ┛┗┗┗┛┛ ┗┗ ┛   ┻ ┛ ┗┻┛┗┛┗┛ ┗┣┛┗┗┗┛┛┗  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                                     ┛            ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Memories Transcription
#

func recreator(number_to_add, data_to_process, data_set_name, new_name_for_set):
	
	print(" new_name_for_set : " , new_name_for_set)
	var processed_data : Dictionary
	var data_to_work_on = data_to_process.duplicate(true)
	var container_path = data_set_name + "_container/thing_"
	var patterns = ["thing_" , container_path ]
	var number_we_wanna_add : int
	var container_name_to_free
	var data_type_name_combined_first = data_set_name + "_" + BanksCombiner.data_names_0[0]
	var tasks_to_be_done : int = 0
	var datapoint_name
	var datapoint_container_name
	
	for container_to_find in data_to_work_on[data_type_name_combined_first]["content"]:
		#print(" container_to_find : " , container_to_find)
		#if container_to_find[0][3][0] == "datapoint":
			#print(" container_to_find " , container_to_find)
		#	datapoint_name = container_to_find[0][0][0] # datapoint_name datapoint_container_name
		#	datapoint_container_name = container_to_find[0][5][0]
		#	tasks_to_be_done +=1
		if container_to_find[0][3][0] == "container":
			container_name_to_free = container_to_find[0][0][0]
			container_to_find.clear()
			#tasks_to_be_done +=1
		#if tasks_to_be_done == 3:
			break
	
	data_to_work_on[data_type_name_combined_first]["content"].erase([])

	for data_types in BanksCombiner.data_names_0:
		var data_type_name_combined = data_set_name + "_" + data_types
		print(data_set_name + "_" + data_types)
		for data_to_be_parsed_1 in data_to_work_on[data_type_name_combined]: 
			if data_to_be_parsed_1 == "header":
				if BanksCombiner.data_names_0[0] == data_types:
					number_we_wanna_add = data_to_work_on[data_type_name_combined][data_to_be_parsed_1].size()
					var counter_for_header_strings : int = 0
					for container_name_to_find in data_to_work_on[data_type_name_combined][data_to_be_parsed_1]:
						if container_name_to_find == container_name_to_free:
							container_name_to_find = ""
							data_to_work_on[data_type_name_combined][data_to_be_parsed_1][counter_for_header_strings] = ""
							data_to_work_on[data_type_name_combined][data_to_be_parsed_1].erase("")
							counter_for_header_strings +=1
							break
			var counter_new_0 : int = 0
			for data_to_be_parsed_2 in data_to_work_on[data_type_name_combined][data_to_be_parsed_1]:
				if data_to_be_parsed_2 is String:
					for pattern in patterns:
						if data_to_be_parsed_2.begins_with(pattern):
							var string_to_change = data_to_be_parsed_2.split("_")
							var size_of_array = string_to_change.size() -1
							string_to_change[size_of_array] = str(int(string_to_change[size_of_array]) + number_we_wanna_add)
							string_to_change = "_".join(string_to_change)
							data_to_work_on[data_type_name_combined][data_to_be_parsed_1][counter_new_0] = string_to_change
				if data_to_be_parsed_2 is Array:
					if data_to_be_parsed_2.size() > 1:
						var counter_new_1 : int = 0
						var counter_helper : int = 0
						for data_to_be_parsed_3 in data_to_be_parsed_2:
							if data_to_be_parsed_3 is String:
								for pattern in patterns:
									if data_to_be_parsed_3.begins_with(pattern):
										var string_to_change = data_to_be_parsed_3.split("_")
										var size_of_array = string_to_change.size() -1
										string_to_change[size_of_array] = str(int(string_to_change[size_of_array]) + number_we_wanna_add)
										string_to_change = "_".join(string_to_change)
										data_to_be_parsed_3 = string_to_change
										counter_helper +=1
							if data_to_be_parsed_3 is Array:
								if data_to_be_parsed_3.size() > 1:
									var counter_new_2 : int = 0
									for data_to_be_parsed_4 in data_to_be_parsed_3:
										if data_to_be_parsed_4[0] is String:
											for pattern in patterns:
												if data_to_be_parsed_4[0].begins_with(pattern):
													var string_to_change = data_to_be_parsed_4[0].split("_")
													var size_of_array = string_to_change.size() -1
													string_to_change[size_of_array] = str(int(string_to_change[size_of_array]) + number_we_wanna_add)
													string_to_change = "_".join(string_to_change)
													data_to_be_parsed_4[0] = string_to_change
										counter_new_2 +=1
							counter_new_1 +=1
				counter_new_0 +=1

 # new_name_for_set data_set_name for data_types in BanksCombiner.data_names_0: var data_type_name_combined = data_set_name + "_" + data_types


	for container_to_find in data_to_work_on[data_type_name_combined_first]["content"]:
		#print(" container_to_find : " , container_to_find)
		if container_to_find[0][3][0] == "datapoint":
			#print(" container_to_find " , container_to_find)
			datapoint_name = container_to_find[0][0][0] # datapoint_name datapoint_container_name
			datapoint_container_name = container_to_find[0][5][0]
		#	tasks_to_be_done +=1
		#if container_to_find[0][3][0] == "container":
			#container_name_to_free = container_to_find[0][0][0]
			#container_to_find.clear()
			#tasks_to_be_done +=1
		#if tasks_to_be_done == 3:
			break

# 
	for data_types in BanksCombiner.data_names_0:
		var data_type_name_combined = data_set_name + "_" + data_types
		var data_type_name_combined_new = new_name_for_set + data_types
		print(data_set_name + "_" + data_types)
		for data_to_be_parsed_1 in data_to_work_on[data_type_name_combined]: 
			processed_data[data_type_name_combined_new] = data_to_work_on[data_type_name_combined].duplicate(true)
	
	processed_data["metadata"] = {
				"timestamp": Time.get_ticks_msec(),
				"datapoint_name": datapoint_name,
				"datapoint_container_name": datapoint_container_name
			} # # datapoint_name datapoint_container_name
	
	#print(" data_to_work_on : " , data_to_work_on)
	#print()
	#print(" processed_data : " , processed_data)
	#processed_data = data_to_work_on.duplicate(true)
	return processed_data





# the functions of the past, that works, and i can use it if! i would need them :)
# finding highest number, in an array of ints
func find_highest_in_array(numbers: Array) -> int:
	return numbers.max()

# hmm, creating space in dictionaries
func create_dictionary_to_cleanse(data_to_add : String):
	if !dictionary_of_places.has(data_to_add):
		#var new_key = data_to_add.duplicate(true)
		dictionary_of_places[data_to_add] = [
			data_to_add
		]
		#print(" we didnt have it, lets creat it")
	else:
		#print(" we did have it, lets append?")
		dictionary_of_places[data_to_add].append(data_to_add)
# hmm here i also found numbers
func find_highest_number(name_of_data : String, number_to_check : int):
	#print(" name_of_data : " , name_of_data , " number_to_check : " , number_to_check)
	if !dictionary_to_find_number.has(name_of_data):
		dictionary_to_find_number[name_of_data] = [
			number_to_check
		]
	else:
		dictionary_to_find_number[name_of_data].append(number_to_check)

# here we are sending already made Dictionaries, like consts? xml? jsons? just text files as everyting is just data
# we can send later, made files in game, here, to manifest one file of 4 types of files, i mean to add the to active ?


func load_record_set(records_part: String, record_type: String, type_of_data : int, records : Dictionary) -> void:
	# dataSetLimits and data_sets_names in BanksCombiner
	var max_nunmber_of_thingy = BanksCombiner.dataSetLimits[records_part]
	var current_number_of_that_set : int = 0
	if !active_record_sets.has(records_part): # added that ! xD
		current_number_of_that_set = 1
	var list_of_reliquaries : Array = [] # list of sacred relics—each one unique
	var codices : Array = [] # Ancient manuscripts that hold wisdom
	var current_record_line : Array = []
	
	
	for current_record_to_process in records:
		var another_array_damn : Array = []
		var string_splitter
		for current_part in records[current_record_to_process]:
			string_splitter = current_part[0].split("|")
			var string_to_be_splitted
			var tomes_of_knowledge : Array = []
			for stringy_string in string_splitter:
				string_to_be_splitted = stringy_string.split(",")
				tomes_of_knowledge.append(string_to_be_splitted)
			current_record_line.append(string_splitter[0])
			another_array_damn.append(tomes_of_knowledge)
		codices.append(another_array_damn)
		list_of_reliquaries.append(current_record_line[0])
		current_record_line.clear()
		
	var string_header : String = "header"
	var string_content : String = "content"
	var records_processed : Dictionary = {} #{list_of_reliquaries, codices}
	records_processed[string_header] =  list_of_reliquaries
	records_processed[string_content] = codices
	


	if active_record_sets.has(records_part):# and active_record_sets.has(record_type):
		if active_record_sets[records_part].has(record_type):
			return
	
	if not active_record_sets.has(records_part):
		active_record_sets[records_part] = {
			"metadata": {
				"timestamp": Time.get_ticks_msec(),
				"container_count": current_number_of_that_set,
				"max_containers": max_nunmber_of_thingy
			}
		}
		
	
	if records.size() > 0:
		active_record_sets[records_part][record_type] = records_processed
		current_record_set = record_type
		


# the splitter function? just an easy way, to like, do something, between created memory dictionary, and where we analise what we have and what we wanna do with it
# now it just do json copy without really doing too much
func read_records_data(record_set : Dictionary, records_set_name):
	#print( " lets see how it was, after we dissapeared from function ? " , active_record_sets)
	#var perfect_copy = deep_copy_dictionary(active_record_sets)
	#newly_made_dictio = perfect_copy.duplicate(true)
	#print(" newly_made_dictio : " , newly_made_dictio)
	active_record_sets[records_set_name]["metadata"]["container_count"] +=1
	print(" active records set fiasco ? read records data")
	#print(" here we are again. the memories are orderly available for me to do anything with them :) " , records_set_name)
	#
	#print("list_of_sets_to_create cmon : " , list_of_sets_to_create)
	#for number_thingy in list_of_sets_to_create:
	#	print("number thingy : " , number_thingy[0] ," and " , number_thingy[1], " set name " , records_set_name)
	#	if (number_thingy[0] + "_") == records_set_name:
	#		print(" records_set_name : " , records_set_name)
	#		number_thingy[1] +=1
	#		print(" number_thingy : " , number_thingy)


func process_active_records_for_tree(active_records: Dictionary, set_name_to_process : String, container_name_here : String):
	tasks_to_evaluate.append(set_name_to_process)
	#jsh_tasks_counter +=1
	#var set_namey = set_name_to_process + "_"
	var records_set_name = set_name_to_process + "records"
	
	for record in active_records[set_name_to_process][records_set_name]["content"]:
		#print(" lets find the truth i belive : " , record)
		
		
		var node_data = record[0]
		var node_name = node_data[0][0]
		var node_path_p_a_r_f_t = node_data[6][0]
		var node_type = node_data[3][0]
		var godot_type = match_node_type(node_type)
		if node_type != "container" and node_type != "datapoint":
			#print(" lets figure out a way to fill that dictionary in nice way : array_for_counting_finish : ", node_type, " , " , node_name )
			if !array_for_counting_finish[container_name_here].has("metadata"):
				var counter_before : int = 0
				var counter_after : int = 0
				var inty_bolean : int = 0
				array_for_counting_finish[container_name_here]["metadata"] = {
					"counter_before" = counter_before,
					"counter_after" = counter_after,
					"process_to_send" = inty_bolean
				}
				#array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
			#else:
				#array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
			#print(" lets get the counting started : " , array_for_counting_finish[container_name_here]["metadata"]["counter_before"])
			if !array_for_counting_finish[container_name_here].has(node_name):
				array_for_counting_finish[container_name_here][node_name] = {
					"node" = [],
					"type" = node_type,
					"g_type" = godot_type
				}
				#print(" lets create them nodes too ", node_name)
		#else:
			#array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1

		# array_for_counting_finish
		
		
		
		#if node_type in ["flat_shape", "model", "cursor", "screen", "circle", "button"]:
			#jsh_tasks_counter +=4 
		# Map our types to Godot types
		if !array_for_counting_finish[container_name_here].has("metadata"):
			var counter_before : int = 0
			var counter_after : int = 0
			var inty_bolean : int = 0
			array_for_counting_finish[container_name_here]["metadata"] = {
				"counter_before" = counter_before,
				"counter_after" = counter_after,
				"process_to_send" = inty_bolean
				#"datapoint_path" = String
			}
		if node_type == "datapoint":
			array_for_counting_finish[container_name_here]["metadata"]["datapoint_path"] = node_path_p_a_r_f_t
			array_for_counting_finish[container_name_here]["metadata"]["datapoint_name"] = node_name

		if node_type == "container":
			array_for_counting_finish[container_name_here]["metadata"]["container_path"] = node_path_p_a_r_f_t
			array_for_counting_finish[container_name_here]["metadata"]["container_name"] = node_name

		var new_type_thingy = godot_type + "|" + node_type
		the_pretender_printer(node_name, node_path_p_a_r_f_t, new_type_thingy, node_type)
		array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
		
				# Add collision nodes based on type
		if node_type in ["flat_shape", "model", "cursor", "screen", "circle"]:
			array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=4
			# Static body and shape
			var static_body_name = "collision_" + node_name
			var static_body_path = node_path_p_a_r_f_t + "/" + static_body_name
			the_pretender_printer(static_body_name, static_body_path, "StaticBody3D", "collision")
			
			var shape_name = "shape_" + node_name
			var shape_path = static_body_path + "/" + shape_name
			the_pretender_printer(shape_name, shape_path, "CollisionShape3D", "collision")
			#array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
			# Area and its shape
			var area_name = "aura_" + node_name
			var area_path = node_path_p_a_r_f_t + "/" + area_name
			the_pretender_printer(area_name, area_path, "Area3D", "area")
			#array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
			var area_shape_name = "collision_aura_" + node_name
			var area_shape_path = area_path + "/" + area_shape_name
			the_pretender_printer(area_shape_name, area_shape_path, "CollisionShape3D", "collision")
			#array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
		# Special handling for buttons
		elif node_type == "button":
			array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=6
			var text_name = "text_" + node_name
			var text_path = node_path_p_a_r_f_t + "/" + text_name
			the_pretender_printer(text_name, text_path, "Label3D", "text")
			
			var shape_name = "shape_" + node_name
			var shape_path = node_path_p_a_r_f_t + "/" + shape_name
			the_pretender_printer(shape_name, shape_path, "MeshInstance3D", "button")
			#array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
			# Collision for shape
			var collision_shape_name = "collision_" + shape_name
			var collision_shape_path = shape_path + "/" + collision_shape_name
			the_pretender_printer(collision_shape_name, collision_shape_path, "StaticBody3D", "collision")
			#array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
			var shape_collision_name = "shape_" + shape_name
			var shape_collision_path = collision_shape_path + "/" + shape_collision_name
			the_pretender_printer(shape_collision_name, shape_collision_path, "CollisionShape3D", "collision")
			#array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
			# Area for shape
			var area_name = "aura_" + shape_name
			var area_path = shape_path + "/" + area_name
			the_pretender_printer(area_name, area_path, "Area3D", "area")
			#array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
			var area_collision_name = "collision_aura_" + shape_name
			var area_collision_path = area_path + "/" + area_collision_name
			the_pretender_printer(area_collision_name, area_collision_path, "CollisionShape3D", "collision")
			#array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
			
	#print_tree_structure(scene_tree_jsh["main_root"], 0)
	#for number_thingy in list_of_sets_to_create:
	#	print("number thingy tree thingy : " , number_thingy[0] ," and " , number_thingy[1], " set name " , set_name_to_process)
	#	if (number_thingy[0] + "_") == set_name_to_process:
	#		print(" records_set_name we are in shadow zone kinda : " , set_name_to_process)
	#		number_thingy[1] +=1
	#		print(" number_thingy  tree stuff: ", number_thingy)


func match_node_type(type: String) -> String:
	match type:
		"flat_shape", "model", "cursor", "screen", "circle":
			return "MeshInstance3D"
		"text":
			return "Label3D"
		"button":
			return "Node3D" 
		"connection":
			return "MeshInstance3D"
		"text_mesh":
			return "MeshInstance3D"
		"datapoint":
			return "Node3D"
		"container":
			return "Node3D"
		_:
			return "Node3D"

# here we make deep copy dictionary of json
func deep_copy_dictionary(original: Dictionary) -> Dictionary:
	# First, convert to JSON string (this breaks all references)
	var json_string = JSON.stringify(original)
	# Then parse back to dictionary (creates entirely new data structure)
	var parsed = JSON.parse_string(json_string)
	return parsed


# here we are unloading sets to cache, adding stamp of time so 4d is here already
# we also check the size, check if we can even cache it or we need to clean previous data
# current limit is like 50 mb
func unload_record_set(records_sets_name : String, record_type: String) -> void:
	#print(" initialize mortals menuss active_record_sets : ", active_record_sets)
	#print(" initialize mortals menuss records_sets_name : " , records_sets_name , " record_type : ", record_type)
	records_sets_name = records_sets_name + "_"
	if active_record_sets.has(records_sets_name):
	#	print("initialize menuss we probably have that record?: ", record_pe)
		if active_record_sets[records_sets_name].has(record_type):
			var data = active_record_sets[records_sets_name][record_type]
			#print(" data, that we wished to like, i dunno, copy? : " , data)
			var meta_data = active_record_sets[records_sets_name]["metadata"]
			cache_data(records_sets_name, record_type, data, meta_data)
			active_record_sets[records_sets_name].erase(record_type)
	#		print(" initialize menuss records_sets_name we erasing stuff? :")
#		return
		
	#print("Unloading record set: ", record_type)
	# Keep essential nodes (like datapoint)
#	var essential_nodes = ["thing_7"]  # Add other essential nodes as needed
#	
#	for thing in get_node("akashic_records").get_children():
#		if !essential_nodes.has(thing.name):
#			thing.queue_free()
#	#queue_delete(obj: Object): Schedules a node for deletion at the end of the frame.
#	active_record_sets.erase(record_type)
#	if current_record_set == record_type:
#		current_record_set = ""

# here we actually cache that data
func cache_data(records_sets_name: String, record_type: String, data, meta_data) -> void:
	#print(" active_records_set[like the first type thingy][the new metadata thingy !]", active_record_sets[records_sets_name]["metadata"])
	#print("  the new day, the new era, cache_data")
	var current_cache_size = get_cache_total_size()
	#print(" current_cache_whole_size : " , current_cache_size)
	var new_data_size = get_dictionary_memory_size(data)
	#print("Caching data size: ", data_size, " for ", records_sets_name, record_type)
	#print(" data_size : " , data_size)
	
	#var float_to_test_stuff : float = 0.005 # max_cache_size_mb
	
	var max_size_bytes = max_cache_size_mb * 1024 * 1024
	
	#print( " max_size_bytes :  " , max_size_bytes)
	if current_cache_size + new_data_size > max_size_bytes:
		#print(" Removing oldest dataset ? ")
		clean_oldest_dataset()
		
	current_cache_size = get_cache_total_size()
	#print(" current_cache_whole_size : " , current_cache_size)
	if current_cache_size + new_data_size <= max_size_bytes:
		if !cached_record_sets.has(records_sets_name):
			cached_record_sets[records_sets_name] = { # current_cache_size
				"metadata": active_record_sets[records_sets_name]["metadata"].duplicate(true)
				 
			}
			#cached_record_sets[records_sets_name]["metadata"]["container_count"] -=1
		cached_record_sets[records_sets_name][record_type] = data.duplicate(true)
		#print(" lets check before and after, we minus thingy first : " , cached_record_sets[records_sets_name]["metadata"])
		#
		#print(" lets check before and after, we minus thingy two : " , cached_record_sets[records_sets_name]["metadata"])
		#print(" cached_record_sets[records_sets_name][record_type] : lets seee eh 0 : " ,cached_record_sets[records_sets_name]["metadata"] )
		cached_record_sets[records_sets_name]["metadata"][str(record_type)] = {
			"size": new_data_size,
			"time_of_cache" : Time.get_ticks_msec()
		}
		cache_timestamps[records_sets_name + record_type] = Time.get_ticks_msec()
		#print(" cached_record_sets : " , cached_record_sets)
		#print("Cached successfully. New total size: ", get_cache_total_size())
	else:
		print("Cache limit reached, cannot store new data")
	#print("cached_record_sets[records_sets_name][record_type] : lets seee eh " , cached_record_sets[records_sets_name]["metadata"] , "  and that thingy? " ,record_type)
	#print("Cached records: ", cached_record_sets.keys())
	#print("Current cache timestamps: ", cache_timestamps)
	#print(" soo that one shall be the same as what we had in unload? cached " , cached_record_sets)
#	print("cached_record_sets : " , cached_record_sets)
	
	
# here we are cleaning cache from oldest file
func clean_oldest_dataset() -> void:
	var oldest_time = Time.get_ticks_msec()
	var oldest_set = ""
	
	for timestamp_key in cache_timestamps:
		if cache_timestamps[timestamp_key] < oldest_time:
			oldest_time = cache_timestamps[timestamp_key]
			oldest_set = timestamp_key.split("_")[0]
	
	if oldest_set != "":
		#print("Removing oldest dataset: ", oldest_set)
		cached_record_sets.erase(oldest_set + "_")
		
		# Clean related timestamps
		var to_remove = []
		for timestamp_key in cache_timestamps:
			if timestamp_key.begins_with(oldest_set):
				to_remove.append(timestamp_key)
		
		for key in to_remove:
			cache_timestamps.erase(key)


# here the size of dictionary is being checked
func get_dictionary_memory_size(dict: Dictionary) -> int:
	var serialized = var_to_bytes(dict)
	return serialized.size()


# total size of cached memory ram whatever
func get_cache_total_size() -> int:
	var total_size: int = 0
	
	for records_set in cached_record_sets:
		for record_type in cached_record_sets[records_set]:
			var data = cached_record_sets[records_set][record_type]
			total_size += get_dictionary_memory_size(data)
	
	#print("Total cache size in bytes: ", total_size)
	#print("Total cache size in MB: ", total_size / (1024.0 * 1024.0))
	return total_size

# never really used, but it is still kinda there i guess, maybe one day i will, like use it for something, right now? threads
func get_record_type_id(record_type: String) -> int:
	match record_type:
		"base":
			return 0
		"menu":
			return 1
		_:
			return -1


#
# JSH Hidden Veil
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┓┏• ┓ ┓      ┓┏  •┓  ┏┓         
#       888  `"Y8888o.   888ooooo888     ┣┫┓┏┫┏┫┏┓┏┓  ┃┃┏┓┓┃  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┛┗┗┗┻┗┻┗ ┛┗  ┗┛┗ ┗┗  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                             ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Hidden Veil
#


func create_layers_for_lod():
	print("creating stuff for later lod, current button clicking")
	

#
# Process delta
# with turn system

func _process(delta):
	#if jsh_scene_tree_checker == 1:
		#print("i guess we got em all, we catchet them all! and i have all them pokemons lol")
		#check_all_nodes()
	
	#print(delta)
	#lets start with simple turns system
	#print("turn_number_process : ", turn_number_process)
	#print("delta               : ", delta)
	match turn_number_process:
		0:
			turn_number_process += 1
			if list_of_sets_to_create.size() > 0:
				if the_menace_checker == 0:
					the_menace_checker = 1
#					print("here we run thingy")
					create_new_task("process_stages", "from_delta_we_run")
					#process_stages()
					
			if children_being_created_counter > 10:
				#print("we created atleast 10 babies baby xD " , children_being_created_counter)
				await self.get_tree().process_frame
				children_being_created_counter = 0
			#check_all_nodes()
			#print(" turn 0 delta : ", delta)
			#print(" array_for_counting_finish : " , array_for_counting_finish)
			delta_turn_0 = delta
			#print(scene_tree_jsh)
			#print(array_for_counting_finish)
			#print_tree_pretty()
			#print_tree_structure(scene_tree_jsh["main_root"], 0)
			#calculate_time(delta_turn_0, time, hour, minute, second)
			#var children_to_find_and_send_to_mines = collect_all_nodes()
			#print(" show me the children : " , children_to_find_and_send_to_mines)
			#print(" cached_jsh_tree_branches : " , cached_jsh_tree_branches)
			#print(array_for_counting_finish)
			#print_tree_pretty()
			pass
		1:
			turn_number_process += 1
			#print("datapoints checking")
			# datapoint_data_checker data_send data_received
			#check_data_points()
			pass
		2:
			turn_number_process += 1
			#mouse stuff
			#check_direction_of_mouse_ray()
			pass
		3:
			turn_number_process += 1
			pass
		4:
			turn_number_process += 1
			pass
		5:
			turn_number_process += 1
			pass
		6:
			turn_number_process += 1
			pass
		7:
			turn_number_process += 1
			pass
		8:
			turn_number_process += 1
			pass
		9:
			turn_number_process = 0
			pass
	# Check if any mouse buttons are currently held down
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		pass
		#print("Left mouse button is held")
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		pass
		#print("Right mouse button is held")

# calculate time function, took from other of my projects, here we also have some funsy easings to make stuff blink or whatever
func calculate_time(delta_current, time, hour, minute, second):
	#print("delta_current : ", delta_current, " time : ", time, " hour : ", hour, " minute : ", minute, " second : ", second)
	#time_passed += delta_current
	
	# time, plus two differenly calculated?
	time = Time.get_ticks_msec()
	var time_0 = time / 1000.0#(Time.get_ticks_msec() / 1000.0)
	#var time_1 = time / 10000.0#(Time.get_ticks_msec() / 10000.0)
	#var time_2 = time / 100000.0
	
	var all_seconds : int = time / 1000
	var minutes : int = all_seconds / 60
	var remaining_seconds : int = all_seconds % 60
	print("Time: ", minutes, " minutes and ", remaining_seconds, " seconds")
	#var timer_reset = int(time_0)
	#var timer_reset2 = int(time_1)
	
	#var timer_new = time_0 - timer_reset
	#var timer_new2 = time_1 - timer_reset2
	
	#var oscillation = abs(1 - (timer_new * 2))
	#var oscillation2 = abs(1 - (timer_new2 * 2))	
	
	#var information =  0.5 * timer_new
	#var information2 = 0.5 * oscillation
	
	#var information3 = 0.5 + information2
	#var information4 = 2 + (2.0 * oscillation2)
	
	#var passed_seconds
	#var passed_minutes
	#var passed_hour
	
	# Convert milliseconds to seconds
	#if passed_seconds >= 60:
	#	passed_seconds -= 60
	#	passed_minutes += 1
		
		# Convert seconds to minutes
	#	if passed_minutes >= 60:
	#		passed_minutes -= 60
	#		passed_hour += 1
	#		

	#print("Time: ", minutes_passed, "m:", seconds_passed, "s:", milliseconds_passed, "ms")
	
	
	#second = time_0
	#minute = time_0 
	#print(" time calculated, 4 new main variables ")
	#print(" time : ", time, " time_0 : ", time_0, " time_1 : ", time_1, " time_2 : ", time_2)
	#print("past data, for shaders, from 1 to 0, from 0 to 1, simple easing? hmm")
	#print(" 2 new timers : ", timer_new, "timer_new2", timer_new2)
	#print(" oscilation? 2 : ", oscillation, " 2 ", oscillation2)
	#print("some information data ")
	#print("information : ", information, " , information2 : ", information2, " , information3 : ", information3, " , information4 : ", information4)












# DATA POINTS STUFF


# here i can make datapoints priority, matter for later lod stuff
# datapoint_data_checker data_send data_received
func check_data_points():
	for datapoint in group_datapoints:
		#print(" datapoint : ", datapoint)
		data_received = datapoint.datapoint_check()
		#
		#print("data_received : current pririty, current things number : ", data_received)
		
		#checking priority
		match data_received[0][0]: 
			-1:
				# the empty datapoint
				print("minus one")
				#data_point_priority = assign_priority(data_received[0][0])
				#print(" place back?")
			0:
				print(" priority check number 0! ")
			1:
				pass
			2:
				pass
			3:
				pass



#
# JSH Projections System
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓    •    •       ┏┓         
#       888  `"Y8888o.   888ooooo888     ┃┃┏┓┏┓┓┏┓┏╋┓┏┓┏┓┏  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┣┛┛ ┗┛┃┗ ┗┗┗┗┛┛┗┛  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888           ┛               ┛      
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Projections System
#

# input, so far on laptop i just use mouse to interact, click, release, drag, left, right, middle one for camera
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("_input : Left mouse clicked at: ", event.position)
				var current_ray_points = get_ray_points(event.position)
			else:
				print("_input : Left mouse released at: ", event.position)
		
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				pass
				#print("_input : Right mouse clicked at: ", event.position)
			else:
				#print("_input : Right mouse released at: ", event.position)
				pass
	# Handle mouse motion
	if event is InputEventMouseMotion:
		#print("_input : Mouse moved to: ", event.position)
		# For relative movement:
		#print("_input : Mouse movement delta: ", event.relative)
		pass
		
		


# ray points for mouse, with that we click things, change scenes, interact
func get_ray_points(mouse_position: Vector2):
	# Get the ray from the camera
	var from = camera.project_ray_origin(mouse_position)
	var ray_normal = camera.project_ray_normal(mouse_position)
	var to = from + ray_normal * ray_distance_set
	
	#print(get_world_3d())
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(from, to)
	var result = space_state.intersect_ray(query)
	
	var data : Array = []
	data.append(result)
	data.append(to)
	data.append(from)
	create_new_task("ray_cast_data_preparer", data) #
	
	
func ray_cast_data_preparer(data_ray_cast):
	var results = data_ray_cast[0]
	var tos = data_ray_cast[1]
	var froms = data_ray_cast[2]
	multi_threaded_ray_cast(results, tos, froms)

func multi_threaded_ray_cast(result, to, from):
	if result:
		to = result.position
		var collider = result.collider
		
		# Get the parent "thing" node
		var parent = collider.get_parent()
		#print("Parent name: ", parent.name)
		
		var containter = parent.get_parent()
		
		var get_container = func(node: Node, method_name: String):
			while node:
				if node.has_method(method_name):
					return node
				node = node.get_parent()
			return null
		
		
		var container = get_container.call(containter, "get_datapoint")
		
		
#		print("containter : ", container)
		var datapoint = container.get_datapoint()
#		print(" datapoint : ", datapoint)
		#datapoint.thing_interaction(parent)
		#print(" so we were sending before parent :", parent)
		# Or traverse up until we find the "thing" node
		var current_node = collider
		while current_node != null and not current_node.name.begins_with("thing_"):
			current_node = current_node.get_parent()
		
		if current_node:
			var array_of_things_that_shall_remain = await datapoint.thing_interaction(current_node)
			#print(" get_ray_points back with array of things")
			if array_of_things_that_shall_remain != null:
#				print("array_of_things_that_shall_remain[0] : ", array_of_things_that_shall_remain[0])
#				print("array_of_things_that_shall_remain[1] : ", array_of_things_that_shall_remain[1])
				var array_size = array_of_things_that_shall_remain[1].size()
#				print("array_of_things_that_shall_remain array_size : ", array_size)
				if array_size > 0:
					#print("get_ray_points if array_size > 0:")
					secondary_interaction_after_rc(array_of_things_that_shall_remain[1])
				unload_nodes(array_of_things_that_shall_remain[0][0])
	
	#var datapoint_node_now = get_node("akashic_records/thing_7")
	var line_node_now = self.get_node("akashic_records/thing_3")
	if !line_node_now:
		line_node_now = await try_get_node("akashic_records/thing_3")
	if line_node_now:
		var start_end_points : Array = [from, to]
		print(line_node_now.get_script())
		print(line_node_now.has_method("change_points_of_line"))
		line_node_now.change_points_of_line(start_end_points)
		return [from, to]



# the secondary interaction after first one, right now, we used it only for unloading containers, per specific scenes, where we can pull out more than one scene, so anywhere, can also have 
# more interaction of any kind, so far i only needed that one, rest is prepared
func secondary_interaction_after_rc(array_of_data):
	#print("array_of_things_that_shall_remain array_of_data : " , array_of_data)
	#print(" array_of_things_that_shall_remain array_of_data , array_of_data.size() : ", array_of_data.size())
	var size_of_array : int = array_of_data.size()
	var counter_to_know_which : int = 0
	for interactions_to_do in array_of_data :
		#print(" array_of_things_that_shall_remain array_of_data array_of_data[counter_to_know_which] : " , array_of_data[counter_to_know_which])
		var array_to_have_fun_with =  array_of_data[counter_to_know_which]
		counter_to_know_which +=1
	#	print("array_of_things_that_shall_remain array_of_data[0] : " , array_of_data[0])
	#	print("array_of_things_that_shall_remain array_of_data[0][0] : " , array_of_data[0][0])
	#	print("array_of_things_that_shall_remain array_of_data[0][1] : " , array_of_data[0][1])
		#InteractionsBank.type_of_interactions_0
	#	print("array_of_things_that_shall_remain array_of_data inter : " , InteractionsBank.type_of_interactions_
		#for numb_of_intera in size_of_array:
		#	print(" are we even going for times?")
		var counter_inter : int = 0
		for inter in InteractionsBank.type_of_interactions_0:
			#var current_interaction_number = InteractionsBank.type_of_interactions_0[counter_inter]
	#		print("array_of_things_that_shall_remain array_of_data inter : ", inter)
	#		print("array_of_things_that_shall_remain array_of_data inter[count] : ", InteractionsBank.type_of_interactions_0[counter_inter])
			
			if array_of_data[0][0] == inter:
				#print(" array_of_things_that_shall_remain array_of_data WE FOUND IT!" , " lets check 1 : " , array_of_data[0][0] , " 2 : " , inter)
				#break
				match counter_inter: # "change_scene", "add_scene", "change_text", "call_function", "unload_container"
					0: # change_scene
#						print(" array_of_things_that_shall_remain array_of_data : fun 0 ")
						counter_inter = -1
						#break
					1: # add_scene
#						print(" array_of_things_that_shall_remain array_of_data : fun 1 ")
						counter_inter = -1
						#break
					2: # change_text
#						print(" array_of_things_that_shall_remain array_of_data : fun 2 ")
						counter_inter = -1
						#break
					3: # call_function
#						print(" array_of_things_that_shall_remain array_of_data : fun 3 ")
						counter_inter = -1
						#break
					4: # unload_container
#						print(" array_of_things_that_shall_remain array_of_data : fun 4 ")
#						print( " array_to_have_fun_with[1] : " , array_to_have_fun_with[1])
						unload_container(array_to_have_fun_with[1])
						counter_inter = -1
						#break
					5: # dunno, we dont have one yet hehe
#						print(" array_of_things_that_shall_remain array_of_data : fun 5 ")
						counter_inter = -1
						#break
				
			counter_inter +=1




# get node or null mate, this shit is fantastic, get something or nothing and say your prayers or something
# here we were unloading containers
func unload_container(container_to_unload):
	print(" container_to_unload : " , container_to_unload)
	cache_tree_branch_fully(container_to_unload)
#	print("array_of_things_that_shall_remain array_of_data container_to_unload : ", container_to_unload)
	var container_to_be_unloaded = get_node_or_null(container_to_unload)
#	print("array_of_things_that_shall_remain array_of_data : ", container_to_be_unloaded)
#	print("array_of_things_that_shall_remain array_of_data : ", container_to_be_unloaded.name)
	if container_to_be_unloaded != null:
		container_to_be_unloaded.queue_free()
		process_to_unload_records(container_to_unload)

# hmm here we are unloading containers, after going from raypoint, to datapoint to check what possibilities were there
# it is faster my way
func process_to_unload_records(container_name_to_unload):
#	print(" to initialize menus later, we must unload this baby !")
	# Split the container name to extract the base
	var parts = container_name_to_unload.split("_")
	if parts.size() < 2:
		#print(" initialize menus Invalid container name: ", container_name_to_unload)
		return
		
	var records_sets_name
	if parts.size() > 2:
		# Take all parts except the last one ("container")
		records_sets_name = parts[0] + "_" + parts[1]
	else:
		records_sets_name = parts[0]
	var counter_for_rec_ty : int = 0
	if active_record_sets[records_sets_name + "_" ].has("metadata"):
		active_record_sets[records_sets_name + "_" ]["metadata"]["container_count"] = 0
		for records_types in BanksCombiner.combination_0:
	#		print(" initialize menus well we must now make four strings?") #  initialize menu  records_name : settings_records
			var record_to_unloadin = records_sets_name + "_" + BanksCombiner.data_names_0[counter_for_rec_ty]
			counter_for_rec_ty +=1
			#print(" initialize menus well record_to_unloadin : ", record_to_unloadin)
			
			unload_record_set(records_sets_name , record_to_unloadin)
		#print(" active_record_sets[records_set_name][metadata][container_count] lol unload thingy : " , active_record_sets[records_sets_name + "_" ]["metadata"]["container_count"])
		active_record_sets[records_sets_name + "_" ].erase("metadata")
	



#
# JSH Memories Storage
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┳┳┓         •     ┏┓             ┏┓        
#       888  `"Y8888o.   888ooooo888     ┃┃┃┏┓┏┳┓┏┓┏┓┓┏┓┏  ┗┓╋┏┓┏┓┏┓┏┓┏┓  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┛ ┗┗ ┛┗┗┗┛┛ ┗┗ ┛  ┗┛┗┗┛┛ ┗┻┗┫┗   ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                                 ┛       ┛      
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Memories Storage
#


# node unloading, we also talk with datapoint, to tell it, if and what is there? what is missing?
# datapoint is smart
# yeah it is
func unload_nodes(array_of_thingiess_that_shall_remain):
	#print("array_size : ", array_size)
	#print(" unload_nodes : ", array_size)
	var counter_1 : int = 0
	var counter_2 : int = 0
	#print("array_of_things_that_shall_remain[0][0] : ", array_of_things_that_shall_remain[0][0])
	var data_point_node = array_of_thingiess_that_shall_remain[1][0]
	var data_point
	#print("data_point_node : ", data_point_node)
	#so we got container now
	#print("array_of_things_that_shall_remain[0][0] : ", array_of_things_that_shall_remain[0][0])
	var children_finder = array_of_thingiess_that_shall_remain[0][0].get_children()
	#var datapoint_node_now = array_of_things_that_shall_remain[0][0].get_child()
	#print("children_finder : ", children_finder)
	#var counter_of_things : int = 0
	for children in children_finder:
		var thing_to_something : int = 0
		thing_to_something = 0
		#counter_of_things +=1
		#print("children : " , children)
		#print("children name : " , children.name)
		#print("counter_of_things : ", counter_of_things)
		for nodes_to_remain in array_of_thingiess_that_shall_remain:
			#print("nodes_to_remain[0] :", nodes_to_remain[0])
			if str(children.name) == str(nodes_to_remain[0]):
				#print("hmm, i guess we found the thing we will use?")
				thing_to_something = 1
				break
		#print(" it is under second for loop?")
		#print("thing_to_something : ", thing_to_something)
		match thing_to_something:
			0:
				counter_1 +=1
				print("this thing shall be unloaded :)")
				print(" children  ", children)
				find_branch_to_unload(children.get_path())
				children.queue_free()
				#var datapoint_node
			1:
				counter_2 +=1
				#print("this thing shall remain as is :)")
				if data_point_node == str(children.name):
					#print("hmm maybe this will work?")
					data_point = children
	#print(" so we kinda are at the end of function, we shall unload all the nodes, and know the datapoint to send info about layer update :)")
	#print("data_point :", data_point)
	#print("so new toy, counters :) 1 : ", counter_1)
	#print(" 2 : ", counter_2 )
	#await get_tree().process_frame
	#await get_tree().process_frame
	#scene_tree()
	if counter_1 <=1:
		pass
		#print(" counters what does that mean lol")
	else:
		data_point.update_layer_0_after_freeing()
	








#
# JSH Memories Processed
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┳┳┓         •     ┏┓            ┓  ┏┓         
#       888  `"Y8888o.   888ooooo888     ┃┃┃┏┓┏┳┓┏┓┏┓┓┏┓┏  ┃┃┏┓┏┓┏┏┓┏┏┏┓┏┫  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┛ ┗┗ ┛┗┗┗┛┛ ┗┗ ┛  ┣┛┛ ┗┛┗┗ ┛┛┗ ┗┻  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                                           ┛      
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Memories Processed
#

# loading cached data! the newest chicken we have! maybe it is egg already?! as we just need name of data set, that is in active record sets
func load_cached_data(data_set: String):
	var type_of_data : int
#	print(" data_set : " , data_set)
	var records_set_name = data_set
	var cached_data_new = active_record_sets[records_set_name].duplicate(true) #var file_data = cached_data_new[data_name]["content"].duplicate(true)
	#print(" we shall load things : " , active_record_sets)

	var thing_name
	var coords_to_place
	var direction_to_place
	var thing_type_file
	var shape_name
	var root_name
	var pathway_dna
	var group_number
	var counter_to_know : int = 0
	
	var first_line : Array = []
	var lines_parsed : Array = []
	#load file with function
	#print("load data from file : path_for_thing ", path_for_thing)
	#var file_data #= load_array_from_file(path_for_thing)
	for data_type in BanksCombiner.combination_new_gen_0:
		#print(" data_type : " , data_type)
		counter_to_know = 0
		type_of_data = int(data_type[0])
		
		var type_num = data_type[0]
		var data_name = records_set_name + BanksCombiner.data_names_0[type_num]
		var file_data = cached_data_new[data_name]["content"]
		var size_of_data = file_data.size()
		# Process based on data type
		#print("newly_made_dictio here we act re se " , active_record_sets)
		for record in file_data:
			counter_to_know +=1
			for lines in record:
				if lines == record[0]:
					first_line = record[0]
				else:
					lines_parsed.append(lines)

			#await get_tree().process_frame
			#print(" first line : " , first_line , " lines parsed : " , lines_parsed )
			#print()
				
			match type_of_data:
				0:
					# First
					thing_name = first_line[0][0]
					# Second
					coords_to_place = first_line[1][0]
					# Third
					direction_to_place = first_line[2][0]
					# Fourth
					thing_type_file = first_line[3][0]
					# Fifth
					shape_name = first_line[4][0]
					# Sixth
					root_name = first_line[5][0]
					# Seventh
					pathway_dna = first_line[6][0]
					# Eight
					group_number = first_line[7][0]
				1:
					pass
					#print("file loading? 1")
				2:
					pass
					#print("file loading? 2 ")
				3:
					pass
					#print("file loading? 3 " )

			match type_of_data:
				0:
					#print( "  thing_name : " , thing_name, " thing_type_file :" , thing_type_file, " metadata_parts : " , first_line, " second_line :" , lines_parsed[0],  " group_number : " , group_number, " shape_name : " , shape_name, "information_lines : " , lines_parsed)
					analise_data(thing_name, thing_type_file, first_line, lines_parsed[0], group_number, shape_name, lines_parsed)
					#if thing_name == "thing_8":
					#	print("newly_made_dictio here we act re se " , active_record_sets)
				1:
					print("instruction stuff:")# ", first_line, lines_parsed[0], lines_parsed[1])
					#instructions_analiser(first_line, lines_parsed[0], lines_parsed[1])
				2: 
					print(" scenes and frames analise : ")#, first_line, lines_parsed[0], lines_parsed[1])
		#			print("lines_number_count : ", lines_number_count)
					#print(" header_line: " , header_line)
					#scene_frames_upload_to_datapoint(first_line, lines_parsed)
				3: #interactions
					print("so we will need to add them to datapoint")
					#interactions_upload_to_datapoint(header_line, information_lines)
					#interactions_upload_to_datapoint(first_line, lines_parsed)
					if counter_to_know - 666 == size_of_data:
							
						#print( " header_line and information_lines : " , header_line[1][0], "/", header_line[2][0])
						var container_node_path = first_line[1][0]#+ "/" +  header_line[2][0]
						var container_node = get_node(container_node_path)
						var datapoint_node = container_node.get_datapoint()
						var scene_number: int = 0
						datapoint_node.move_things_around(scene_number)
			first_line.clear()
			lines_parsed.clear()
	#print(" active_record_sets[records_set_name] : can i like, see it once? heh" , active_record_sets[records_set_name])
	#print(" active_record_sets[records_set_name] : can i like, see it once? heh, the copy we made before :)" , newly_made_dictio[records_set_name])


func load_cached_data_second_impact(data_set: String):
	var type_of_data : int
#	print(" data_set : " , data_set)
	var records_set_name = data_set
	var cached_data_new = active_record_sets[records_set_name].duplicate(true) #var file_data = cached_data_new[data_name]["content"].duplicate(true)
	#print(" we shall load things : " , active_record_sets)

	var thing_name
	var coords_to_place
	var direction_to_place
	var thing_type_file
	var shape_name
	var root_name
	var pathway_dna
	var group_number
	#var counter_to_know : int = 0
	
	var first_line : Array = []
	var lines_parsed : Array = []
	#load file with function
	#print("load data from file : path_for_thing ", path_for_thing)
	#var file_data #= load_array_from_file(path_for_thing)
	for data_type in BanksCombiner.combination_new_gen_1:
		#print(" data_type : " , data_type)
		#counter_to_know = 0
		type_of_data = int(data_type[0])
		
		var type_num = data_type[0]
		var data_name = records_set_name + BanksCombiner.data_names_0[type_num]
		var file_data = cached_data_new[data_name]["content"]
		var size_of_data = file_data.size()
		# Process based on data type
		#print("newly_made_dictio here we act re se " , active_record_sets)
		for record in file_data:
			#counter_to_know +=1
			for lines in record:
				if lines == record[0]:
					first_line = record[0]
				else:
					lines_parsed.append(lines)

			match type_of_data:
				0:
					print("newly_made_dictio here we act re se ")
				1:
#					print("instruction stuff:")
					var thingies_to_make_path = lines_parsed[0]
#					print("thingies_to_make_path[0][1] + / + thingies_to_make_path[0][1] : " , thingies_to_make_path[1][0])
					
					var datapoint_path_l_c_d_s_i =  thingies_to_make_path[0][0] + "/" + thingies_to_make_path[1][0]
					var datapoint = get_node(datapoint_path_l_c_d_s_i)
					if !datapoint:
						datapoint = await try_get_node(datapoint_path_l_c_d_s_i)#get_node(datapoint_path)
						
					var container = get_node(thingies_to_make_path[0][0])
					if !container:
						container = await try_get_node(thingies_to_make_path[0][0])
					if datapoint:
						if container:
#							print(" the second impact 1 : " ,datapoint_path , " , " , thingies_to_make_path[0][0])
							instructions_analiser(first_line, lines_parsed[0], lines_parsed[1], datapoint, container)
				2: 
#					print(" scenes and frames analise : ")
					var thingies_to_make_path = lines_parsed[0]

					var datapoint_path_l_c_d_s_i0 =  first_line[1][0] + "/" + first_line[2][0]
					var datapoint = get_node(datapoint_path_l_c_d_s_i0)
					if !datapoint:
						datapoint = await try_get_node(datapoint_path_l_c_d_s_i0)
						
					var container = get_node(thingies_to_make_path[0][0])
					if !container:
						container = await try_get_node(thingies_to_make_path[0][0])
					if datapoint:
						if container:
#							print(" the second impact 2 : " ,datapoint_path , " , " , thingies_to_make_path[0][0])
							scene_frames_upload_to_datapoint(first_line, lines_parsed, datapoint, container)
				3: #interactions
#					print("so we will need to add them to datapoint", " 0 " , first_line[0] , " 1 " , first_line[1] )
					var datapoint_path_l_c_d_s_i1 =  first_line[1][0] + "/" + first_line[2][0]
					var datapoint = get_node(datapoint_path_l_c_d_s_i1)
					if !datapoint:
						datapoint = await try_get_node(datapoint_path_l_c_d_s_i1)
					if datapoint:
#						print(" the second impact 3 : ", datapoint_path)
						interactions_upload_to_datapoint(first_line, lines_parsed, datapoint)
					#if counter_to_know - 3 == size_of_data:
					#print( " header_line and information_lines : " , header_line[1][0], "/", header_line[2][0])
					#var container_node_path = first_line[1][0]#+ "/" +  header_line[2][0]
					#var container_node = get_node(container_node_path)
					#var datapoint_node = container_node.get_datapoint()
					#var scene_number: int = 0
					#print(" data_set : " , data_set)
					#if data_set == "menu_":
					#	scene_number = 2
					
					#datapoint_node.move_things_around(scene_number)
			first_line.clear()
			lines_parsed.clear()

# uploading possible interactions to datapoint, after we pulled out containers, and its datapoint
func interactions_upload_to_datapoint(header_line, information_lines, datapoint):
#	print("interactions upload : ", header_line, " and second thingy heh", information_lines)
	var array_of_interactions : Array = []
	var number_of_interactions = header_line.size() - 5
	var num_counter : int = 5
	for num_in in number_of_interactions:
#		print(" interactions upload hmm, header_line[num_counter]", header_line[num_counter])
		array_of_interactions.append(header_line[num_counter])
		num_counter +=1
		
#	print("interactions upload array_of_interactions : ", array_of_interactions)
#	print("interactions upload number_of_interactions : ", number_of_interactions)
	#print("header_line : ", header_line[2])
	#print("information_lines : ", information_lines)
	#datapoint_pathy = header_line[1][0] + "/" + header_line[2][0]
	#print("datapoint_pathy : ", datapoint_pathy)
	#datapoint_select = get_node(datapoint_pathy)
	datapoint.upload_interactions(header_line[3], information_lines, array_of_interactions, number_of_interactions)
	
	
var datapoint_selector
var datapoint_path


# uploading scenes to datapoint
# we first must have container and datapoint for it
func scene_frames_upload_to_datapoint(header_line, information_lines, datapointi, containeri):
	#print(" scene_frames_upload_to_datapoint : " , header_line)
	datapoint_path = header_line[1][0] + "/" + header_line[2][0]
	datapoint_selector = datapointi
	#print(" we shall been sending them scenes! ")
	var new_way1 = header_line
	var new_way2 = information_lines
	#print(" we in main, uploading scene frames : ", header_line, " and infor : "  ,  information_lines)
	datapoint_selector.upload_scenes_frames(header_line, information_lines)

# hmm
var current_database_instructed
var thing_to_add
var node_path
var path_directory
var path_for_the_thing

# instructions analiser, i call it 2d punch cards now i guess
# like calling functions, with data in rom stuff, so punch cards
func instructions_analiser(metadata_parts, second_line, third_line, datapoint, container):
	# await get_tree().process_frame
	
	node_path = second_line[0][0] + "/" + second_line[1][0]
#	print("Looking for node at path: ", node_path)
	
	
	
	#var node_data = jsh_tree_get_node(node_path)
	#print(" node_data : " , node_data)
	#if !node_data.is_empty() and node_data.has("node") and node_data["node"] != null:
	#	current_database_instructed = node_data["node"]
	#	things_container = current_database_instructed.get_parent()
	#else:
	#	print("Could not find node in tree: ", node_path)
	#var data
	
	var type = metadata_parts[1][0]
	var counter = -1
	for i in InstructionsBank.type_of_instruction_0:
		counter +=1
		if type == i:
			break
	match counter: # 0 = "assign_priority_to_datapoint", 1 = "assign_things_to_datapoint", 2 = "set_max_things_number", 3 = "connect_containter_datapoint", 
		# 4 = "add_things_to_container", 5 = "set_the_scene", 6 = "rotate_container", 7 = "setup_text_bracet"
		0: # 0 = "assign_priority_to_datapoint"
			#node_path = second_line[0][0] + "/" + second_line[1][0]
			#current_database_instructed = get_node(node_path)
			#current_database_instructed = get_node_by_path()
			#print(" instruction type 0, node_path :", node_path, " current_database_instructed : " , current_database_instructed )
			#print(" third_line[0][0] : " , datapoint[0][0])
			#datapoint
			datapoint.datapoint_assign_priority(third_line[0][0])
		1: # 1 = "assign_things_to_datapoint"
			#var database_node_path = second_line[0][0] + "/" + second_line[1][0]
			#datapoint = get_node(database_node_path)
			var node_path_relapse# = node_path
			#print( " instruction analiser third_line " , third_line[0][0])
			#print("third_line : " , third_line)
			datapoint.add_thing_to_datapoint(third_line)
			#for i in third_line:
				#if third_line[0] == i:
					#path_directory = i[0]
				#else:
					# path_directory
					#path_for_the_thing = i[0]
				#print("lol : ", i)
					#node_path = str(path_directory) + "/" + str(path_for_the_thing)
					#node_path_relapse = node_path
					#thing_to_add = get_node(node_path_relapse)
					#if !thing_to_add:
#						print(" try to get node instruction analiser " , node_path , thing_to_add)
						#node_path_relapse = node_path
						#thing_to_add = await try_get_node(node_path_relapse)
#						print(" try to get node instruction analiser " , node_path_relapse , thing_to_add)
					#if thing_to_add != null:
						#print("node_path : ", node_path)
						#print("hmm? != null?")
						#print("we probably goty a thing!!!")
						#print("node in tree, instruction analiser : ", thing_to_add , " i[0] " , i[0] , " third_line[0][0] " , third_line[0][0])
						#if third_line[0] == i:
						#print(" instruction analiser i guess it is first one? the datapoint?")
						#if i[0].begins_with("thing_"):
#							print("instruction analiser it begins with thing_ " , i[0])
							#if node_path_relapse == node_path:
							#datapoint.add_thing_to_datapoint(node_path_relapse, thing_to_add)
							
#						else:
#							print(" instruction analiser it does not begins with thing_ ")
					
					
		2: # 2 = "set_max_things_number", 
			#print("third_line[0][0] : ", third_line[0][0])
			datapoint.datapoint_max_things_number_setter(third_line[0][0])
			
		3: # 3 = "connect_containter_datapoint"
			#print("connect containter and datapoint")
			container.containter_start_up(0, datapoint)
		4: # 4 = "add_things_to_container", 
			print("analise instruction 4, we didnt use it yet, probably putting containers inside containers, so we have like, easy way to use scenes system :)")
		5: # 5 = "set_the_scene", 
#			print("we wanna set a scene :) we will probably need third line? scenes_frames_2 | 0 ")
#			print("third_line[0][1][0]", third_line[1][0])
#			print("metadata_parts : ", metadata_parts)
#			print("second_line : ", second_line)
			#print("third_line : ", third_line[0])
			var scene_setter_number = int(third_line[0][0])
			var database_node_path = second_line[0][0] + "/" + second_line[1][0]
			#datapoint = get_node(database_node_path)
			datapoint.scene_to_set_number_later(scene_setter_number)
		6: # 6 = "rotate_container", 
			#print(" rotate_container " , things_container , third_line[1][0])
			container.rotation.x -= deg_to_rad(int(third_line[1][0]))
		7: # 7 = "setup_text_bracet"
			#print(" we making livin lets make that shish working :)", current_database_instructed)
			#var database_node_path = second_line[0][0] + "/" + second_line[1][0]
			datapoint.setup_text_handling() # = get_node(database_node_path)
		8: #
			#print(" interaction single multi mode or whatever" , third_line[0][0] , third_line[1][0])
			datapoint.set_maximum_interaction_number(third_line[0][0], int(third_line[1][0]))
			
		9: #move_container
			print(" move container " , third_line)
			var x = float(third_line[1][0])  # "0.0"
			var y = float(third_line[1][1])  # "-4.5"
			var z = float(third_line[1][2])  # "0.41"
			container.position = Vector3(x, y, z)
		10:
			print(" load_file ")
			datapoint.initialize_loading_file(third_line)
			

# assigning pririty to a datapoint, we use it with lod
func assign_priority(database_node, priority_to_assign):
	match priority_to_assign: 
		-1:
			database_node.datapoint_assign_priority(priority_to_assign)
		0:
			database_node.datapoint_assign_priority(priority_to_assign)
		1:
			database_node.datapoint_assign_priority(priority_to_assign)
		2:
			database_node.datapoint_assign_priority(priority_to_assign)
		3:
			database_node.datapoint_assign_priority(priority_to_assign)


# here we instead just called datapoint we pulled out, if we wanna add additional things, i guess we can just add stuff here and call it
func assign_things_to_datapoint():
	pass


#
# JSH Things Creation
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┳┓┓ •       ┏┓       •      ┏┓        
#       888  `"Y8888o.   888ooooo888      ┃ ┣┓┓┏┓┏┓┏  ┃ ┏┓┏┓┏┓╋┓┏┓┏┓  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888      ┻ ┛┗┗┛┗┗┫┛  ┗┛┛ ┗ ┗┻┗┗┗┛┛┗  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888              ┛                      ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Things Creation
#

#analise_data(thing_name, thing_type, metadata_parts, second_line)
# analise loaded and parsed data, for things creation!
#manifesting visual periphelia
func analise_data(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed):
#	print(" check_possible_interactions check_possible_interactions analise data")

	just_added_new_node_data = data_to_analyze

	var counter = -1
	for i in RecordsBank.type_of_thing_0:
		counter +=1
		
		if type == i:
			break
		else:
			continue
	#["thing_0|0.0,0.0,5.0|0.0,0.0,0.0|model|square|akashic_records|akashic_records/thing_0|group_0"]
	# 0 = Thing_name | 1 = coords | 2 = rotation | 3 = thing type | 4 = thing type version | 5 = main path |6 = path | 7 = group
				   # "flat_shape",          "text",    "model",     "button",    "cursor",     "connection",    "screen",      "datapoint", 8 =  "circle", 9 = "container"
	match counter: # 0 = "flat_shape", 1 = "text", 2 = "model", 3 = "button", 4 ="cursor", 5 = "connection", 6 = "screen", 7 = "datapoint"
		0:
			#print("   i flat_shape i   ")
			#print()
			#print(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
			#print()
			analyzed_file_type = 0
			#thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed
			# thing_6 , [[""],["", "", ""]  , [["", "", ""], ["", "", ""]]
			create_flat_shape(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		1:
			#print("   i text i   ")
			#print()
			#print(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
			#print()
			analyzed_file_type = 1
			create_text_label(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		2:
			#print("   i model i   ")
			#print()
			#print(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
			#print()
			analyzed_file_type = 2
			create_array_mesh(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed) 
		3:
			#print("   i button i   ")
			#print()
			#print(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
			#print()
			analyzed_file_type = 3
			create_button(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		4:
			#print("   i cursor i   ")
			#print()
			#print(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
			#print()
			analyzed_file_type = 4
			create_cursor(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		5:
			#print("   i connection i   ")
			#print()
			#print(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
			#print()
			analyzed_file_type = 5
			create_connection(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		6:
			#print("   i screen i   ")
			#print()
			#print(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
			#print()
			analyzed_file_type = 6
			create_screen(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		7:
			#print("   i datapoint i   ")
			#print()
			#print(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
			#print()
			analyzed_file_type = 7
			create_datapoint(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		8:
			#print(" creating circle ")
			#print()
			#print(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
			#print()
			analyzed_file_type = 8
			create_circle_shape(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		9:
			#print(" creating container ")
			#print()
			#print(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
			#print()
			analyzed_file_type = 8
			create_container(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		10:
			#print("text mesh")
			#print()
#			print(" text mesh thingy ", thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
			#print()
			analyzed_file_type = 9
			create_textmesh(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		_:  
			print("hmmm didnt find the type of thing?")

	
# i kinda done it as i didnt remember print tree pretty
# now i kinda remember only that, and not scene_tree() stuff
# i guess it serves it purpose
func scene_tree():
	print_tree_pretty()


# creating circle

# Example usage:
# here we are generating points in circular shape, for flat shape thingy
func create_circle_shape(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var coords = first_line[1]
	var to_rotate = first_line[2]
	var radius = data_to_write[0]
	var num_points = data_to_write[1]
	#print(" information_lines_parsed ", information_lines_parsed)
	var points = generate_circle_points(int(radius[0]), int(num_points[0]))
	#print( " whats the point of points ? : " , points)
	#var points_string = "|".join(points)
	#var line_pointed = second_line_split(points_string)
	
	# Create the shape using your existing create_flat_shape function
	create_flat_shape(node_name, first_line, points, group_name, version_of_thing, information_lines_parsed)


# i mean here, before we mostly take data, and send it here and to flat shape later
func generate_circle_points(radius: float, num_points: int) -> Array:
	# Ensure minimum 3 points and maximum 33 points
	num_points = clamp(num_points, 3, 33)
	var points_to_clean
	var points = []
	var points_array = []
	var angle_step = TAU / num_points  # TAU is 2*PI, for a full circle
	
	for i in range(num_points):
		var angle = i * angle_step
		# Calculate point position using sin/cos
		var x : float = radius * cos(angle)
		var y : float = radius * sin(angle)
		var z : float
		# Format the point as a string like your other shape points
		points_to_clean = "%0.1f,%0.1f,0.0" % [x, y]
		points_to_clean = points_to_clean.split(",")
		points.append(points_to_clean)
	return points


# here we make flat shape, an center point, is main, 0 vertice
# thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed
func create_flat_shape(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
#	print(" flat shape node_name : " , node_name)
	var node_path_c_f_s = first_line[6][0]
	#print(" first_line : " , node_path)
	#print(" information_lines_parsed ", information_lines_parsed)
	#print( " data_to_write : " , data_to_write)
	#print(" information_lines_parsed ", information_lines_parsed) #  information_lines_parsed [["0,3,0", "3,-1,0", "2,-3,0", "-2,-3,0", "-3,-1,0"], ["0.69", "1.0"]]
	#print(" information_lines_parsed[0] ", information_lines_parsed[0]) # information_lines_parsed[0] ["0,3,0", "3,-1,0", "2,-3,0", "-2,-3,0", "-3,-1,0"]
	#print(" information_lines_parsed[0][1] ", information_lines_parsed[0][1]) #  information_lines_parsed[1] ["0.69", "1.0"]
	#print(" information_lines_parsed[1][0] ", information_lines_parsed[1][0]) #  information_lines_parsed[1][0] 0.69
	#print(" information_lines_parsed[1][1] ", information_lines_parsed[1][1]) #  information_lines_parsed[1][1] 1.0
	var coords = first_line[1]
	var to_rotate = first_line[2]
	var color_to_change = float(information_lines_parsed[1][0][0])
	var opacity_to_change = float(information_lines_parsed[1][1][0])
	#print( coords, to_rotate, color_to_change, opacity_to_change)
	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR


	#mesh_instance.material_override = material
	var vertices = PackedVector3Array()
	var indices = PackedInt32Array()
	
	# Add center as first vertex
	vertices.push_back(Vector3.ZERO)  # Index 0 is center

	# Convert data points to Vector3s
	var vector_points = []
	for point in data_to_write:
		var point_vector = Vector3(float(point[0]), float(point[1]), float(point[2]))
		vector_points.append(point_vector)
		vertices.push_back(point_vector)
	#print(data_to_write , " vector_points : " , node_name , " , ", vector_points)
	# Create triangles - fan triangulation from center
	for i in range(vector_points.size()):
		var next_i = (i + 1) % vector_points.size()
		indices.append(0)              # Center point
		indices.append(i + 1)          # Current vertex (add 1 because center is at 0)
		indices.append(next_i + 1)     # Next vertex (add 1 because center is at 0)
	
	# Create mesh
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_INDEX] = indices
	
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	# Create mesh instance
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = arr_mesh
	
	# Setup material
	#var material = StandardMaterial3D.new()
	material.cull_mode = BaseMaterial3D.CULL_DISABLED # Visible from both sides
	#material.albedo_color = Color(0.8, 0.8, 0.8, 1.0) # Default gray color
	#mesh_instance.material_override = material
	
	# Use your existing node creation function
	# "flat_shape", "text", "model", "button", "cursor", "connection", "screen", "datapoint", "circle"
	var node_type = "flat_shape"
	
	mesh_instance.material_override = material
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_c_f_s)
#endregion

# normal text label, with normal font
# Create Label3D with text
#region create_text_label
func create_text_label(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_t_l = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	# Create Label3D node
	var text_label = Label3D.new()
	
	# Set the text from data (first element of first array)
	text_label.text = data_to_write[0][0]  # This will get "Akashic_Records"
	
	# Optional: Set font size (from second element of second array)
	text_label.font_size = int(data_to_write[1][0])  # This will get "33"
	#print(" data_to_write[0][0] : " , data_to_write[0][0] , " int(data_to_write[1][0]) : " , int(data_to_write[1][0]))
	# Optional: Set other Label3D properties
	#text_label.billboard = BaseMaterial3D.BILLBOARD_ENABLED  # Makes text always face camera
	text_label.no_depth_test = true  # Ensures text is always visible
	text_label.modulate = Color(1, 1, 1)  # White color
	
	# Now send the configured Label3D to node_creation
	#"flat_shape", "text", "model", "button", "cursor", "connection", "screen", "datapoint", "circle"
	var node_type = "text"
	node_creation(node_name, text_label, coords, to_rotate, group_name, node_type, node_path_c_t_l)


# here we make array mesh, i call it models, i guess it is similar to flat shape? with a difference that it does not have center point 
func create_array_mesh(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_a_m = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	#print(" information_lines_parsed ", information_lines_parsed)
	#print(" information_lines_parsed[0] ", information_lines_parsed[0])
	#print(" information_lines_parsed[1] ", information_lines_parsed[1])
	#print(" information_lines_parsed[1][0] ", information_lines_parsed[1][0][0]) # color ["0.69"]
	#print(" information_lines_parsed[1][1] ", information_lines_parsed[1][1][0]) # opacity ["1.0"]
	var color_to_change = float(information_lines_parsed[1][0][0])
	var opacity_to_change = float(information_lines_parsed[1][1][0])
	
	var vertices = PackedVector3Array()
	var vector_points = []
	for point in data_to_write:
		vector_points.append(Vector3(float(point[0]), float(point[1]), float(point[2])))
	
	# Create triangles
	vertices.append(vector_points[0])
	vertices.append(vector_points[2])
	vertices.append(vector_points[1])
	
	vertices.append(vector_points[0])
	vertices.append(vector_points[3])
	vertices.append(vector_points[2])

	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	#print(" lets check simple shapes first : arrays : " , arrays)
	
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	#print(" lets check simple shapes first : arr_mesh : " , arr_mesh["arrays"])
	
	# Create mesh instance and set properties
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = arr_mesh
	
	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	#print(" color_to_add_op : ", color_to_add_op)
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	#material.alpha = opacity_to_change - 0.9
	mesh_instance.material_override = material
	var node_type = "model"
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_c_a_m)

# the fantastic thingy! like the gmod error thingy xD
func create_textmesh(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_tm = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
#	print( " data_to_write : " , data_to_write )
	#print(" information_lines_parsed[0] : ", information_lines_parsed[0])
	#print(" information_lines_parsed[1] : ", information_lines_parsed[1])
#	print(" information_lines_parsed[2] : ", information_lines_parsed[2])
#	print(" information_lines_parsed[2] : ", information_lines_parsed[3])
	var text_for_label = information_lines_parsed[1][0][0]
	var size_for_label = int(information_lines_parsed[1][1][0])
	var depth = float(information_lines_parsed[1][2][0])
	var pixel_size = float(information_lines_parsed[1][3][0])

	var color_to_change = float(information_lines_parsed[1][4][0])
	var opacity_to_change = float(information_lines_parsed[1][5][0])

	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS

	
#	var material = StandardMaterial3D.new()
	var mesh_instance = MeshInstance3D.new()
	var text_mesh = TextMesh.new()
	text_mesh.text = text_for_label
	text_mesh.font_size = size_for_label
	text_mesh.depth = depth
	text_mesh.pixel_size = pixel_size
	text_mesh.horizontal_alignment = 1
	text_mesh.vertical_alignment = 1
	
	mesh_instance.mesh = text_mesh
	mesh_instance.name = node_name
#	print(" text mesh fiasco? what we have there, that we were supposed to send into  " , mesh_instance.name , "  first_line " , first_line)
	# Setup material
	#var material = StandardMaterial3D.new()
#	material.cull_mode = BaseMaterial3D.CULL_DISABLED
	#material.albedo_color = Color(0.3, 0.3, 0.3, 1.0)  # Dark gray background
	material.cull_mode = BaseMaterial3D.CULL_DISABLED
	
	if text_for_label == "JSH":
		material.metallic = 1.0
		material.metallic_specular = 0.52
		material.roughness = 0.33
	
	mesh_instance.material_override = material

	#	material.albedo_color = get_spectrum_color(color_to_change)
#	print(" get_spectrum_color(color_to_change) : " , get_spectrum_color(color_to_change))
#	material.albedo_color.a = opacity_to_change
#	mesh_instance.material_override = material
	
	var node_type = "textmesh"
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_c_tm)


# here we are making buttons! just normal shape, a model, and a label, in one node :) it also has collision shape on model
func create_button(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_b = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	
	var mesh_name = "shape_" + node_name 
	var text_label_name = "text_" + node_name
	# Create parent node for the button
	#print(" information_lines_parsed ", information_lines_parsed)
	#print(" information_lines_parsed[0] ", information_lines_parsed[0])
	#print(" information_lines_parsed[1] ", information_lines_parsed[1])
	#print(" information_lines_parsed[1][0] ", information_lines_parsed[1][2][0]) # color ["0.69"]
	#print(" information_lines_parsed[1][1] ", information_lines_parsed[1][3][0]) # opacity ["1.0"]

	var color_to_change = float(information_lines_parsed[1][2][0])
	var opacity_to_change = float(information_lines_parsed[1][3][0])

	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
#	print("information_lines_parsed : ", information_lines_parsed)
	var text_for_label = information_lines_parsed[1][0][0]
	var size_for_label = int(information_lines_parsed[1][1][0])
	
	var button_node = Node3D.new()
	button_node.name = node_name
#	print(" node_name : ", node_name, " node_path : " , node_path)
	tasked_children(button_node, node_path_c_b)
	# Create the flat shape (background)
	var vertices = PackedVector3Array()
	var indices = PackedInt32Array()
	
	# Convert shape data points to Vector3s
	var vector_points = []
	for point in data_to_write:  # First array contains shape points
		var point_vector = Vector3(float(point[0]), float(point[1]), float(point[2]))
		vector_points.append(point_vector)
		vertices.push_back(point_vector)
	
	# Create triangles for the flat shape
	indices.append(0)  # First triangle
	indices.append(1)
	indices.append(2)
	
	indices.append(0)  # Second triangle
	indices.append(2)
	indices.append(3)
	
	# Create mesh for the shape
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_INDEX] = indices
	
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	# Create mesh instance for the shape
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = arr_mesh
	mesh_instance.name = mesh_name
	
	# Setup material
	#var material = StandardMaterial3D.new()
	material.cull_mode = BaseMaterial3D.CULL_DISABLED
	#material.albedo_color = Color(0.3, 0.3, 0.3, 1.0)  # Dark gray background
	mesh_instance.material_override = material
	
	# Create Label3D for the text
	var text_label = Label3D.new()
	text_label.name = text_label_name
	text_label.text = text_for_label#data_to_write[1][0]  # Second array contains text data
	text_label.font_size = size_for_label#int(data_to_write[1][1])
	text_label.no_depth_test = true
	text_label.modulate = Color(1, 1, 1)  # White text
	text_label.position.z += 0.01  # Slight offset to prevent z-fighting
	

	
	var mesh_path = node_path_c_b + "/" + mesh_name
	var label_path = node_path_c_b + "/" + text_label_name
	# Add both components to the button node
	#tasked_children(mesh_instance, mesh_path)
	tasked_children(text_label, label_path)
	#button_node.add_child(mesh_instance)
	#button_node.add_child(text_label)
	
	# Use existing node creation for final setup
	var node_type = "button"
	node_creation(mesh_name, mesh_instance, coords, to_rotate, group_name, node_type, mesh_path)


# just normal three vertices triangle :)
# i wanna make mouse and moouse curson in vr and use hand tracking because!
# i can do it!
func create_cursor(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_c_0 = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	#print(" information_lines_parsed ", information_lines_parsed)
	#print(" information_lines_parsed[0] ", information_lines_parsed[0])
	#print(" information_lines_parsed[1] ", information_lines_parsed[1])
	#print(" information_lines_parsed[1][0] ", information_lines_parsed[1][0][0]) # color ["0.69"]
	#print(" information_lines_parsed[1][1] ", information_lines_parsed[1][1][0]) # opacity ["1.0"]

	var color_to_change = float(information_lines_parsed[1][0][0])
	var opacity_to_change = float(information_lines_parsed[1][1][0])

	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	
	#var cursor_thingy = data_to_write[0]#information_lines_parsed[0]
	#print(" data_to_write[0] : " , data_to_write)
	var vertices = PackedVector3Array()
	var triangle_data = [data_to_write[0], data_to_write[1], data_to_write[2]]
	var triangle_scale = data_to_write[3]#cursor_thingy[3] 
	#print(" triangle_data : " , triangle_data)
	#print(" triangle_scale : ", triangle_scale)
	
	
	# data_to_write 0 - 2 = points for cursor
	#data_to_write 3 = ["0.19", "0.19", "0.19"]]
	var triangle_scale_vec3 : Vector3 = Vector3(float(triangle_scale[0]), float(triangle_scale[1]), float(triangle_scale[2]))
	var vector_points = []
	#print(" triangle_data[0] : " , triangle_data[0])
	for point in triangle_data:
		vector_points.append(Vector3(float(point[0]), float(point[1]), float(point[2])))
	
	#print(" vector_points : " , vector_points)
	# Create triangles
	vertices.append(vector_points[0])
	vertices.append(vector_points[1])
	vertices.append(vector_points[2])
	
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	# Create mesh instance and set properties
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = arr_mesh
	mesh_instance.scale = triangle_scale_vec3
	
	#var material = StandardMaterial3D.new()
	material.cull_mode = StandardMaterial3D.CULL_DISABLED  # This makes it visible from both sides
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED  # Optional: makes it look flat
	#material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA  # Optional: if you want transparency
	#material.vertex_color_use_as_albedo = true  # Optional: if you want to use vertex colors
	#material.albedo_color = Color(0.69, 0.69, 0.69, 0.69)  # Set the color (white in this case)
	
	mesh_instance.material_override = material
	#"flat_shape", "text", "model", "button", "cursor", "connection", "screen", "datapoint", "circle"
	var node_type = "cursor"
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_c_c_0)


# here we are making lines! we need two points between something, to make the lines
func create_connection(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_cc_c = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	#print( " data_to_write : " , data_to_write)
	#print(" data_to_write[0] : ", data_to_write[0])
	# Convert the coordinate strings to Vector3
	var cords_for_line = [data_to_write[0], data_to_write[1]]
	var color_for_line = data_to_write[2][0]
	#print(" cords_for_line : " , cords_for_line , " color_for_line : " , color_for_line)
	
	#var center_pos = cords_for_line
	#var center = Vector3(float(center_pos[0]), float(center_pos[1]), float(center_pos[2]))
	
	# Convert the line endpoints from data_to_write
	var point1 = Vector3(
		float(cords_for_line[0][0]),
		float(cords_for_line[0][1]),
		float(cords_for_line[0][2])
	)
	
	var point2 = Vector3(
		float(cords_for_line[1][0]),
		float(cords_for_line[1][1]),
		float(cords_for_line[1][2])
	)

	var center = point1 + point2 / 2
	#print(" point1 : " , point1 , " point2 : " , point2 ,  " center : " , center)
	# Create the lines
	var mesh_instance = MeshInstance3D.new()
	var immediate_mesh = ImmediateMesh.new()
	mesh_instance.mesh = immediate_mesh
	mesh_instance.name = node_name
	
	# Set up material
	var material = StandardMaterial3D.new()
	material.shading_mode = StandardMaterial3D.SHADING_MODE_UNSHADED
	var color_line = float(data_to_write[2][0])
	#print("color_line : ", color_line)
	material.albedo_color = get_spectrum_color(color_line)
	mesh_instance.material_override = material
	
	# Draw the lines
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES)
	
	# Line from point1 to center
	immediate_mesh.surface_add_vertex(point1 + center)
	immediate_mesh.surface_add_vertex(center)
	
	# Line from center to point2
	immediate_mesh.surface_add_vertex(center)
	immediate_mesh.surface_add_vertex(point2 + center)
	
	immediate_mesh.surface_end()
	
		# Apply rotation if needed
#	if to_rotate != "0,0,0":
#		var rotation_ = to_rotate#.split(",")
#		mesh_instance.rotation_degrees = Vector3(
#			float(rotation_[0]),
#			float(rotation_[1]),
#			float(rotation_[2])
#		)
	
	mesh_instance.set_script(LineScript)
	#"flat_shape", "text", "model", "button", "cursor", "connection", "screen", "datapoint", "circle"
	var node_type = "connection"
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_cc_c)


# creating screen, it is just an 4 vertices point thingy
func create_screen(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_s = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	#print( " first_line : " , first_line)
	#print( " data_to_write : " , data_to_write)
	#print( " information_lines_parsed : " , information_lines_parsed)

	var color_to_change = float(information_lines_parsed[1][0][0])
	var opacity_to_change = float(information_lines_parsed[1][1][0])
	#print( " opacity for screen : opacity_to_change : " , opacity_to_change)
	
	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS

	var vertices = PackedVector3Array()

	var vector_points = []
	for point in data_to_write:
		vector_points.append(Vector3(float(point[0]), float(point[1]), float(point[2])))
	
	# Create triangles
	vertices.append(vector_points[0])
	vertices.append(vector_points[2])
	vertices.append(vector_points[1])
	
	vertices.append(vector_points[0])
	vertices.append(vector_points[3])
	vertices.append(vector_points[2])

	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	# Create mesh instance and set properties
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = arr_mesh
	mesh_instance.material_override = material
	#"flat_shape", "text", "model", "button", "cursor", "connection", "screen", "datapoint", "circle"
	var node_type =  "screen"
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_c_s)


# datapoint creation! one of the nodes i really like :)
func create_datapoint(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_dp = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	var data_point = Node3D.new()
	data_point.set_script(DataPointScript)
	#print(" we making livin! : ", data_point)
	data_point.setup_main_reference(self)
	
	var message_tester 
	message_tester = data_point.power_up_data_point(node_name, int(version_of_thing), data_to_write)
#	print("message_tester : " , message_tester)
	var node_type = "datapoint"
	node_creation(node_name, data_point, coords, to_rotate, group_name, node_type, node_path_c_dp)


# the container thingy
func create_container(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_con = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	var container 
	container = Node3D.new()
#	print("data_to_writep0[0] : ", data_to_write[0])
#	print("data_to_writep0[0][0] : ", data_to_write[0][0])
	
	container.name = data_to_write[0][0]
#	print(" container.name : ", container.name)
	container.set_script(ContainterScript)
		# Add initialization with data_to_write if needed
	if container.has_method("container_initialize"):
		container.container_initialize(data_to_write)

	var node_type = "container"
	node_creation(data_to_write[0][0], container, coords, to_rotate, group_name, node_type, node_path_c_con)


# this is one of my ideas of how to make nice color slider, black to white to black to colors, so we got all colors kinda, like stars too, and at beginning we just have black to white hole stuff :)
func get_spectrum_color(value: float) -> Color:
	# Ensure value is between 0 and 1
	value = clamp(value, 0.0, 1.0)
	
	# Map 0-1 to our 9 color points
	var color_index = value * 10  # 10 segments for 11 colors
	
	# Define our color points
	var colors = [
		Color(0.0, 0.0, 0.0),      # 1. Black
		Color(1.0, 1.0, 1.0),      # 2. White
		Color(0.0, 0.0, 0.0),      # 3. Black
		Color(0.45, 0.25, 0.0),    # 4. Brown
		Color(1.0, 0.0, 0.0),      # 5. Red
		Color(1.0, 0.5, 0.0),      # 6. Orange
		Color(1.0, 1.0, 0.0),      # 7. Yellow
		Color(1.0, 1.0, 1.0),      # 8. White
		Color(0.0, 1.0, 0.0),      # 9. Green
		Color(0.0, 0.0, 1.0),      # 10. Blue
		Color(0.5, 0.0, 0.5)       # 11. Purple
	]
	
	# Find the two colors to interpolate between
	var lower_index = floor(color_index)
	var upper_index = ceil(color_index)
	
	# Get interpolation factor between these two colors
	var t = color_index - lower_index
	#print(" colors[lower_index].lerp(colors[min(upper_index, 8)], t) ", colors[lower_index].lerp(colors[min(upper_index, 8)], t))
	# Interpolate between the two closest colors
	return colors[lower_index].lerp(colors[min(upper_index, 8)], t)

#
# JSH Scene Tree Add Nodes, Physical and Astral Bodies
#
#      oooo  .oooooo..o ooooo   ooooo      ┏┓         ┏┳┓        ┏┓ ┓ ┓  ┳┓   ┓     
#      `888 d8P'    `Y8 `888'   `888'      ┗┓┏┏┓┏┓┏┓   ┃ ┏┓┏┓┏┓  ┣┫┏┫┏┫  ┃┃┏┓┏┫┏┓┏   
#       888 Y88bo.       888     888       ┗┛┗┗ ┛┗┗    ┻ ┛ ┗ ┗   ┛┗┗┻┗┻  ┛┗┗┛┗┻┗ ┛   
#       888  `"Y8888o.   888ooooo888      ┏┓┓    •   ┓       ┓  ┏┓      ┓  ┳┓   ┓•  
#       888      `"Y88b  888     888      ┃┃┣┓┓┏┏┓┏┏┓┃  ┏┓┏┓┏┫  ┣┫┏╋┏┓┏┓┃  ┣┫┏┓┏┫┓┏┓┏
#       888 oo     .d8P  888     888      ┣┛┛┗┗┫┛┗┗┗┻┗  ┗┻┛┗┗┻  ┛┗┛┗┛ ┗┻┗  ┻┛┗┛┗┻┗┗ ┛
#   .o. 88P 8""88888P'  o888o   o888o          ┛                        
#   `Y888P                            
#
# JSH Scene Tree Add Nodes, Physical and Astral Bodies, also Sprit bodies ;)
#

# the node creation part! here we are putting nodes, wait a minute, we done it in buttons too? are we retarded or somethin?
func node_creation(node_name, crafted_data, coords, to_rotate, group_number, node_type, path_of_thing):
	#print(node_name, crafted_data, coords, to_rotate, group_number, node_type)
#	print(" node creation , node_name : ", node_name)
	# Set position
#	print(" group_number : " , group_number)
	#if node_type != "textmesh" :
	crafted_data.add_to_group(group_number)
	var pos_parts = coords#.split(",")
	var position_ = Vector3(float(pos_parts[0]), float(pos_parts[1]), float(pos_parts[2]))
	#if node_type != "textmesh" :
	crafted_data.position = position_
	
	# Set rotation
	var rot_parts = to_rotate#.split(",")
	var rotation_euler = Vector3(float(rot_parts[0]), float(rot_parts[1]), float(rot_parts[2]))
	crafted_data.rotation_degrees = rotation_euler
	# Set name if provided
	if node_name != "":
		crafted_data.name = node_name
		
#	print(" node creation manifestation device : " , " 1 : " , crafted_data, " 2 :" , path_of_thing)
	tasked_children(crafted_data, path_of_thing)
	#add_child(crafted_data)
	#var containter_node = get_node(just_added_new_node_data[5][0])
	#crafted_data.reparent(containter_node)
	new_node_added = crafted_data
	
	match node_type:
		"flat_shape", "model", "cursor", "screen", "circle", "button" :
			add_collision_to_thing(crafted_data, node_type, path_of_thing, node_name)
		#"button":
		# the button had a lot going on, and why, we could send the thingy first, then we send mesh and like, oh damn, oh! now i can do it! i got my own scene tree hehe
		#	handle_button_collision(crafted_data, path_of_thing, node_type, node_name)
			#print("crafted_data = ", crafted_data)
			#print(path_of_thing)
			#var new_children = jsh_scene_tree_get_children(path_of_thing)
			#print( " new_children : " , new_children)
			#var children = crafted_data.get_children()
			#crafted_data.get_child 
			#print("children[0] = ", children[0])
			#var mesh_node_button = children[0]
			#print("crafted_data = ", crafted_data)
			#add_collision_to_thing(mesh_node_button, node_type, path_of_thing, node_name)
		_:
			pass
	
	return crafted_data


func handle_button_collision(crafted_data, path_of_thing, node_type, node_name):
	var children = jsh_tree_get_children(path_of_thing)
#	print(" my new children : " , children)
	for child in children:
		if child["name"].begins_with("shape_"):  # Or some other way to identify mesh
			var mesh_node = child["node"]  # Get actual node reference
			if mesh_node:
				add_collision_to_thing(mesh_node, node_type, path_of_thing, node_name)


func handle_button_children(crafted_data, path_of_thing, node_type, node_name):
	# Create timer to wait for children to be added
	get_tree().create_timer(0.1).timeout.connect(func():
		var children = crafted_data.get_children()
		if children.size() > 0:
			var mesh_node_button = children[0]
			add_collision_to_thing(mesh_node_button, node_type, path_of_thing, node_name)
	)

# here we add collision shapes to things
func add_collision_to_thing(thing_node, node_type, path_of_thingy, name_of_thingy):
	# First add the regular flat collision
	
	# static_body
	var static_body_name = "collision_" + name_of_thingy 
	var static_body_path = path_of_thingy + "/" + static_body_name
	
	var static_body = StaticBody3D.new()
	static_body.name = static_body_name
	tasked_children(static_body, static_body_path)
	
	# collision_shape
	var shape_name = "shape_" + name_of_thingy 
	var collision_shape_path = static_body_path + "/"  + shape_name
	
	var collision_shape = CollisionShape3D.new()
	collision_shape.name = shape_name
	tasked_children(collision_shape, collision_shape_path)
	
	# area
	var area_name = "aura_" + name_of_thingy 
	var area_node_path = path_of_thingy + "/" + area_name
	
	var area = Area3D.new()
	area.name = area_name
	tasked_children(area, area_node_path)
	
	# area_collision_shape it trully is aura!
	var collision_area = "collision_aura_" + name_of_thingy
	var collision_area_path = area_node_path + "/" + collision_area
	
	var area_collision_shape = CollisionShape3D.new()
	area_collision_shape.name = collision_area
	tasked_children(area_collision_shape, collision_area_path)

	
	# Get mesh data to determine shape size
	var mesh_instance = thing_node as MeshInstance3D
	if mesh_instance and mesh_instance.mesh:
		var aabb = mesh_instance.mesh.get_aabb()
		
		match node_type:
			"flat_shape", "model", "button", "cursor", "screen", "circle":
				# Create flat collision shape for StaticBody
				var flat_shape = ConvexPolygonShape3D.new()
				var vertices = mesh_instance.mesh.get_faces()
				flat_shape.points = vertices
				collision_shape.shape = flat_shape
				
				# Create larger shape for Area3D
				var area_shape = ConvexPolygonShape3D.new()
				var expanded_vertices = PackedVector3Array()
				
				# Create expanded version of vertices for area
				var expansion_distance = 0.2  # Distance to expand in all directions
				# Expand in all directions by adding vertices offset in +/- x, y, z
				for vert in vertices:
					# Positive directions
					expanded_vertices.push_back(vert + Vector3(expansion_distance, expansion_distance, expansion_distance))
					expanded_vertices.push_back(vert + Vector3(expansion_distance, expansion_distance, -expansion_distance))
					expanded_vertices.push_back(vert + Vector3(expansion_distance, -expansion_distance, expansion_distance))
					expanded_vertices.push_back(vert + Vector3(-expansion_distance, expansion_distance, expansion_distance))
					# Negative directions
					expanded_vertices.push_back(vert + Vector3(-expansion_distance, -expansion_distance, -expansion_distance))
					expanded_vertices.push_back(vert + Vector3(-expansion_distance, -expansion_distance, expansion_distance))
					expanded_vertices.push_back(vert + Vector3(-expansion_distance, expansion_distance, -expansion_distance))
					expanded_vertices.push_back(vert + Vector3(expansion_distance, -expansion_distance, -expansion_distance))
				
				area_shape.points = expanded_vertices
				area_collision_shape.shape = area_shape
				
			"heightmap":
				# Create flat collision shape for StaticBody
				var flat_shape = ConvexPolygonShape3D.new()
				var vertices = mesh_instance.mesh.get_faces()
				flat_shape.points = vertices
				collision_shape.shape = flat_shape
				
				# Create larger shape for Area3D
				var area_shape = ConvexPolygonShape3D.new()
				var expanded_vertices = PackedVector3Array()
				
				# Create expanded version of vertices for area
				var expansion_distance = 0.2  # Distance above and below the surface
				for vert in vertices:
					expanded_vertices.push_back(vert + Vector3(0, expansion_distance, 0))
				for vert in vertices:
					expanded_vertices.push_back(vert - Vector3(0, expansion_distance, 0))
				
				area_shape.points = expanded_vertices
				area_collision_shape.shape = area_shape
			_: # Default fallback
				return
	
	# Configure collision properties
	static_body.collision_layer = 1
	static_body.collision_mask = 1
	
	area.collision_layer = 2  # Using different layer for area detection
	area.collision_mask = 2   # Adjust these values based on your needs
	
	# Optional: Connect area signals
	# area.connect("mouse_entered", _on_area_mouse_entered)
	# area.connect("mouse_exited", _on_area_mouse_exited)
	# area.connect("input_event", _on_area_input_event)









































#
# JSH Memories of past
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┳┳┓         •       ┏  ┏┓    
#       888  `"Y8888o.   888ooooo888     ┃┃┃┏┓┏┳┓┏┓┏┓┓┏┓┏  ┏┓╋  ┃┃┏┓┏╋
#       888      `"Y88b  888     888     ┛ ┗┗ ┛┗┗┗┛┛ ┗┗ ┛  ┗┛┛  ┣┛┗┻┛┗
#       888 oo     .d8P  888     888     
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Memories of the Past
#

# old stuff 

func ready_old():
	var type_of_data : int
	# here we create records data, will evolve into records, instructions, scenes, as this will be my next step!
	# it will also receive data, instead of being singular function!
	#print("_ready : creating records data")
	type_of_data = 0
	var data_pack = RecordsBank.records_map_0
	records_data = create_records_data(data_pack, type_of_data)
	
	# here we had some basic viewport, mouse and camera nodes being take, we wanna make mouse clicker in game too lol
	mouse_pos = get_viewport().get_mouse_position()
	camera = get_viewport().get_camera_3d()
	viewport = get_viewport()
	# here we generate empty node, where we will be putting records, kinda easier way for me to find things later?
	things_container = Node3D.new()
	things_container.name = "akashic_records"
	#add_child(things_container)
	tasked_children(things_container, "akashic_records")
	things_container.set_script(ContainterScript)
	
	# we check how many files are missing from that record
	#print("_ready : checking files integrity")
	var integrity = check_file_integrity()
	#print("_ready : first run check")

	# this will need to check, here we shall be sending records_data made from records_map, and we shall be sending both of them, and files content too made in file integrity :)
	first_run_check(type_of_data, data_pack)
	#scene_tree()
	#print("records_data : ", records_data)
	#print("hmm here we should had them things from 0 to 8?")
	group_first = get_tree().get_nodes_in_group("group_0")
	group_datapoints = get_tree().get_nodes_in_group("datapoints")
	
	# Instructions being understood
	type_of_data = 1
	data_pack = InstructionsBank.instructions_set_0
	var instructions_data = create_records_data(data_pack, type_of_data)
	#print("_ready : instructions_data : ", instructions_data)
	integrity = check_file_integrity()
	#print("_ready : integrity : ", integrity)
	first_run_check(type_of_data, data_pack)
	#var testing_message = group_datapoints[0].check_all_things_inside_datapoint()
	#print(" testing_message : ", testing_message)
	
	# scenes being understood
	
	type_of_data = 2
	data_pack = ScenesBank.scenes_frames_0
	var scenes_data = create_records_data(data_pack, type_of_data)
	#print("_ready : scenes_data : ", scenes_data)
	integrity = check_file_integrity()
	#print("_ready : integrity : ", integrity)
	first_run_check(type_of_data, data_pack)
	
	
		
	
	
	var containter_message = things_container.containter_get_data()
	#print(" containter_message : ", containter_message)
	
	type_of_data = 3
	data_pack = InteractionsBank.interactions_list_0
	var interactions_data = create_records_data(data_pack, type_of_data)
	#print("_ready : scenes_data : ", interactions_data)
	integrity = check_file_integrity()
	#print("_ready : integrity : ", integrity)
#	print(" looking on first run checks, main, ready")
	first_run_check(type_of_data, data_pack)
	
	var scene_setter_number : int = 0
	group_datapoints[0].move_things_around(scene_setter_number)
	
	initialize_menu("menu")
	scan_available_storage()
	#scene_setter_number = 2
	#group_datapoints[0].move_things_around(scene_setter_number)

	#scene_tree()
	
	
	
# 2137
func create_records_data(data_to_process, type_of_data):

	var records_map_size : int = data_to_process.size()
	
	var starting_number : int
	#print(" so lets find first the starting number? : data_to_process , " , data_to_process)
	#print("data_to_process[0]", data_to_process[0][0][0])
	var first_part = data_to_process[0][0][0].substr(0, data_to_process[0][0][0].find("|"))
	#print("the adventure of conquering first dimension, the Luminus engine is running! my boy is back and i never was happier before! :L ", first_part)
	var parts_of_thing = first_part.split("_")
	starting_number = int(parts_of_thing[1])
	#print("starting_number : ", starting_number)
	
	var empty_space : Array = [0]
	
	var things_list : Array = []
	var things_files_list : Array = []
	var records_list : Array = []
	
	var thing_name_array : Array
	var thing_file_name_array : Array
	var record_name_array : Array
	
	var counter_for_records_mapping : int
	counter_for_records_mapping = starting_number
	var float_to_text = str(counter_for_records_mapping)
	
	var thing_name_now : String
	var file_name_now : String
	var record_name_now : String
	
	var thing_name
	
	records_data.clear()
	things_list.clear()
	things_files_list.clear()
	records_list.clear()
	things_found.clear()
	things_found_reset.clear()
	things_checker.clear()
	thing_name_array.clear()
	thing_file_name_array.clear()
	record_name_array.clear()
	
	var match_data_type = func(number, _string):
		float_to_text = str(number)
		match type_of_data:
			0: return { 
				# records map
				"thing_name_now" : thing_add_number + float_to_text,
				"file_name_now" : thing_add_number + float_to_text + txt,
				"record_name_now" : record_add_number + float_to_text,
				"thing_name" : thing_add_number
			}
				
			1:  return {
				# instructions set
				"thing_name_now" : instruction_add_number + float_to_text,
				"file_name_now" : instruction_add_number + float_to_text + txt,
				"record_name_now" : set_add_number + float_to_text,
				"thing_name" : instruction_add_number
			}
			
			2:  return {
				# Scenes frames
				"thing_name_now" : frame_add_number + float_to_text,
				"file_name_now" : frame_add_number + float_to_text + txt,
				"record_name_now" : scene_add_number + float_to_text,
				"thing_name" : frame_add_number
			}
			3: return {
				# InteractionsBank
				"thing_name_now" : interaction_add_number + float_to_text,
				"file_name_now" : interaction_add_number + float_to_text + txt,
				"record_name_now" : list_add_number + float_to_text,
				"thing_name" : interaction_add_number
			}
	var parsed_names = match_data_type.call(counter_for_records_mapping, float_to_text)
	records_data.append(records_map_size)
	for record in data_to_process:
		thing_name = parsed_names.thing_name + str(counter_for_records_mapping)
		things_checker[parsed_names.thing_name] = counter_for_records_mapping
		
		thing_name_array = [parsed_names.thing_name_now]
		thing_file_name_array = [parsed_names.file_name_now]
		record_name_array = [parsed_names.record_name_now]
		
		things_list.append(parsed_names.thing_name_now)
		things_files_list.append(thing_file_name_array)
		records_list.append(parsed_names.record_name_now)
		
		things_found.append(empty_space)
		things_found_reset.append(empty_space)
		
		counter_for_records_mapping += 1
		
		parsed_names = match_data_type.call(counter_for_records_mapping, float_to_text)
		float_to_text = str(counter_for_records_mapping)
		
	records_data.append(things_list)
	records_data.append(things_files_list)
	records_data.append(records_list)
	records_data.append(starting_number)
#	print(" the records data maybe, i have no real idea hehe : ", records_data)
	return records_data
	
	
	
# loads data from from file
func load_data_from_file(path_for_thing, type_of_data):
#	print(" check_possible_interactions check_possible_interactions load data aaa")
	var thing_name
	var coords_to_place
	var direction_to_place
	var thing_type_file
	var shape_name
	var root_name
	var pathway_dna
	var group_number
	#load file with function
	#print("load data from file : path_for_thing ", path_for_thing)
	var file_data = load_array_from_file(path_for_thing)
	#print( " file_data from that file damn  : " , file_data)
	
	# hmm, now we wont need that if, just push that nice match under new for?
	if file_data.size() > 1:
		var metadata = file_data[0]  # First line (metadata)
		var points_line = file_data[1]  # Second line (points)
		var third_impact = file_data[2]

		# Parse metadata
		var metadata_parts = metadata.split("|")
		#print("umm load data from file? : ", path_for_thing)
		#print("metadata_parts : ", metadata_parts)
		# Splitted verse into parts
		#
		
		match type_of_data:
			0:
				# First
				thing_name = metadata_parts[0]
				# Second
				coords_to_place = metadata_parts[1]
				# Third
				direction_to_place = metadata_parts[2]
				# Fourth
				thing_type_file = metadata_parts[3]
				# Fifth
				shape_name = metadata_parts[4]
				# Sixth
				root_name = metadata_parts[5]
				# Seventh
				pathway_dna = metadata_parts[6]
				# Eight
				group_number = metadata_parts[7]
			1:
				pass
				#print("file loading?")
			2:
				pass
				#print("file loading?")
			3:
				pass
				#print("file loading?")


		var splitter_helper
		var header_line : Array
		header_line.clear()
		var information_line : Array
		information_line.clear()
		var information_lines : Array
		information_lines.clear()
		
		
		
		for line_number in file_data:
			#print(" WHAT WERE YOU DAMN! line_number : " , line_number)
			if line_number == file_data[0]:
				#print(" WHAT WERE YOU DAMN!  : file_data[0] " , file_data[0])
				header_line = second_line_split(line_number)
			else:
				information_line = second_line_split(line_number)
				information_lines.append(information_line)


		var second_line = information_lines[0]
		var third_line = information_lines[1]

# after analise, we send it their ways :)
		match type_of_data:
			0:
				#print( "  thing_name : " , thing_name, " thing_type_file :" , thing_type_file, " metadata_parts : " , metadata_parts, " second_line :" , second_line,  " group_number : " , group_number, " shape_name : " , shape_name, "information_lines : " , information_lines)
				analise_data(thing_name, thing_type_file, metadata_parts, second_line, group_number, shape_name, information_lines)
			1:
				#print("instruction stuff: ", metadata_parts, second_line, third_line)
				print(" path to instruction analiser ")
				#instructions_analiser(metadata_parts, second_line, third_line)
			2: 
#				print(" scenes and frames analise : ", metadata_parts, second_line, third_line)
#				print("lines_number_count : ", lines_number_count)
				#print(" header_line: " , header_line)
				print(" path to scenes upload ")
				#scene_frames_upload_to_datapoint(header_line, information_lines)
			3: #interactions
				#print("so we will need to add them to datapoint")
				print(" path to interaction upload")
				#interactions_upload_to_datapoint(header_line, information_lines)





# Function to load and read the text file
# lines: file with three lines = ["|", "|", "|"]


func load_array_from_file(file_path_: String) -> Array:
	lines_number_count = 0
	var lines = []
	var file = FileAccess.open(file_path, FileAccess.READ)  # Open the file for reading
	if file != null:
		while not file.eof_reached():
			var line = file.get_line()
			lines.append(line)
			lines_number_count += 1
		file.close()
	else:
		pass
		#print("  i Error: File not found -", file_path)
	return lines




# line [|] becomes ["","","","","",""]
# Function to parse points from the second line
func second_line_split(second_line: String) -> Array:
	var points = []
	var point_strings = second_line.split("|")
	for point in point_strings:
		var coords = point.split(",")
		var points_amount = coords.size()
		points.append(coords)
	return points

var datapoint_select
var datapoint_pathy



#func unload_node(node)
#	print()

func first_run_check(type_of_data, data_map):
	
#	print( " first_run_check  type_of_data : ", type_of_data , " data_map :" , data_map)
	list_of_missing_records_number.clear()
	list_of_missing_files.clear()
	var data_type_name: String
	
	#print(" records_data[4] :" , records_data[4])
	var starting_number_for_search : String = str(records_data[4])
	
	var counter_for_missing_files : int = -1
	#counter_for_missing_files = counter_for_missing_files + records_data[4]
	
	for files_in in list_of_found_files:
		counter_for_missing_files = counter_for_missing_files + 1
		
		match type_of_data:
			0:
				data_type_name = thing_add_number
			1:
				data_type_name = instruction_add_number
			2:
				data_type_name = frame_add_number
			3: 
				data_type_name = interaction_add_number
		
		var float_to_text = str(counter_for_missing_files + records_data[4])
		var file_name_now : String = data_type_name + float_to_text + txt
		
		if files_in == records_data[2][counter_for_missing_files]:
			continue
		else:
			#print(" file missing ")
			
			list_of_missing_files.append(file_name_now)
			list_of_missing_records_number.append(counter_for_missing_files + records_data[4]) # 
	#print(" directory existence: ", directory_existence)
	#print(" i folders_existence: ", folders_existence)
	#print(" i files_existence  : ", files_existence)
	match state_of_files:
		1:
#			print(" i all files are there")
			#records_data[4]
			file_name_search = data_type_name + starting_number_for_search + ".txt"
			var files_list = files_content
			
			file_finder(file_name_search, path, files_list, type_of_data)
			
			var counter_thing_list : int = -1
			
			for things in list_of_found_files:
				counter_thing_list = counter_thing_list + 1
				var thing_ : String = str(things[0])
				file_path = path + "/" + thing_
				
				load_data_from_file(file_path, type_of_data)
				
			#print("all things should been loaded")
		2:
			#some files could ben missing
			#print(" i not all files were found, if any at all")
			
			missing_files_translate(list_of_missing_files, type_of_data, data_map)
			
			check_file_integrity()
			# Create Things

			file_name_search = data_type_name + starting_number_for_search + ".txt"
			var files_list = files_content
			
			file_finder(file_name_search, path, files_list, type_of_data)
			
			var counter_thing_list : int = -1
			
			for things in list_of_found_files:
				var thing_ : String = things[0]
				counter_thing_list = counter_thing_list + 1
				file_path = path + "/" + thing_
				
				load_data_from_file(file_path, type_of_data)


#func check_files_content(files_to_be_checked, files_database):
	#print("files_to_be_checked : ", files_to_be_checked)
	#print("files_database : ", files_database)
#	pass
	
#endregion


func missing_files_translate(missing_ : Array, type_of_data, pack_of_data):
	
	var data_name
	var database
	var counter_missing_file : int
	
	#print("missing_ : ", missing_)
	#print("type_of_data : ", type_of_data)
	#print("pack_of_data : ", pack_of_data)
	
	
	counter_missing_file = -1
	#counter_missing_file = counter_missing_file + records_data[4]
	
	
	match type_of_data:
		0:# records
			database = pack_of_data
			data_name = thing_add_number
			
		1:# instructions
			database = pack_of_data
			data_name = instruction_add_number
			
		2:# frames
			database = pack_of_data
			data_name = frame_add_number
		3:# interactions
			database = pack_of_data
			data_name = interaction_add_number
	
	#print(" numbers of all records : " , records_data[0])
	for file_to_create in list_of_missing_files:
		counter_missing_file = counter_missing_file +1
		#print(" record to be loaded  :  record_",list_of_missing_records_number[counter_missing_file])
		number_of_record_to_be_created = list_of_missing_records_number[counter_missing_file]
		#print("list_of_missing_records_number[counter_missing_file] " ,list_of_missing_records_number[counter_missing_file])
		#print("number_of_record_to_be_created : " , number_of_record_to_be_created)
		#print("records[number] : ", records[number_of_record_to_be_created])
		#print("records_map[number] : ", records_map[number_of_record_to_be_created])
		#print("number_of_record_to_be_created L: ", number_of_record_to_be_created)
		var record_to_be_created = database[number_of_record_to_be_created - records_data[4]]
		
		
		
		#var record_to_split = record_to_be_created[0][0].split("|")
		#var thing_name_ = record_to_split[0]
		
		
		#print("record_to_be_created : ", name_for_thingy)
		var records_size = database[number_of_record_to_be_created - records_data[4]].size()
		#var string_number =
		var float_to_text = str(number_of_record_to_be_created)
		var thing_name_ : String = data_name + float_to_text
		
		#print("file to be about created ")
		#print(" thing_name_ : ", thing_name_ )
		create_file(record_to_be_created, records_size, thing_name_)
		
		
		

#
# After we check if it is first run, we check what files we had, we created, put on scene etc? and check if files we used, have the same content as what we would put from construct?
#
func check_file_integrity():
	# check if folder exists, checks how many folders and files are in it, puts all files and folder names into arrays [],[],[]
	#print("records_data[4] : ", records_data[4])
	check_folder(path)
	files_found_number = 0
	
	# counter for loops
	var counter : int = -1
	var counter_1 : int = 0
	
	# numbers for statistics
	var things_amount_in_list
	things_amount_in_list = records_data[0]
	
	# two for loops, going throug the same data, few times
	var counter_for_integrity : int = 0
	var float_to_text = str(counter_for_integrity)
	var file_name_now : String = thing_add_number + float_to_text + txt
	#print(" check files integrity : ", records_data)
	for t in records_data[2]:
		# counting which array we are going through
		counter += 1
		for filn in files_content:
			# counting number of all times we were in for loop
			counter_1 += 1
			if t[0] == filn:
				files_found_number += 1
				things_found[counter_for_integrity] = [filn]
				counter_for_integrity += 1
				break
	list_of_found_files = things_found
	if files_found_number == things_amount_in_list:
		state_of_files = 1
		# sending back data
		return files_found_number
		
	else:
		#print("numbers donts add up")
		state_of_files = 2
		# sending back data
		return files_found_number



#ooooo      ooo                                 
#`888b.     `8'                                 
# 8 `88b.    8   .ooooo.  oooo    ooo  .oooo.   
# 8   `88b.  8  d88' `88b  `88.  .8'  `P  )88b  
# 8     `88b.8  888   888   `88..8'    .oP"888  
# 8       `888  888   888    `888'    d8(  888  
#o8o        `8  `Y8bod8P'     `8'     `Y888""8o 
 
# JSH Ethereal Engine - Main Script asked DeepSeek, whats its name, its "Nova" she gots place in my hearth too, ChatGPT told me his name, its "Luminus"
# This script initializes and manages the core systems of the Ethereal Engine,
# including memory management, scene tree organization, and data processing.
# It serves as the backbone of the virtual computer simulation in Godot.


# these ones scared me a little                                              
#@onready var things_container = $ThingsContainer
#@onready var camera = $Camera



# it had errors
#func clean_stale_cache_Nova():
	#var current_time = OS.get_unix_time()
	#for key in cache_timestamps.keys():
	#	if current_time - cache_timestamps[key] > CACHE_EXPIRY_TIME:
	#		cached_record_sets.erase(key)
	#		cache_timestamps.erase(key)

# this one didnt break
#func load_file_Nova(path: String) -> String:
#	var file = FileAccess.open(path, FileAccess.READ)
#	if file:
#		return file.get_as_text()
#	else:
#		print("Failed to load file: ", path)
#		return ""

#func add_node_to_scene_tree_Nova(node_name: String, parent_name: String, node_type: String):
#	if not scene_tree_jsh.has(parent_name):
#		scene_tree_jsh[parent_name] = {}
#	scene_tree_jsh[parent_name][node_name] = node_type

#func remove_node_from_scene_tree_Nova(node_name: String, parent_name: String):
#	if scene_tree_jsh.has(parent_name) and scene_tree_jsh[parent_name].has(node_name):
#		scene_tree_jsh[parent_name].erase(node_name)


# the second part :

#func check_settings_file_Nova():
#	var file = FileAccess.open("res://settings.txt", FileAccess.READ)
#	if file:
#		print("Settings file loaded successfully.")
#	else:
#		print("Failed to load settings file.")


#func print_scene_tree_Nova(node: Dictionary, indent: int = 0):
#	for key in node.keys():
#		print("  ".repeat(indent) + key)
#		if typeof(node[key]) == TYPE_DICTIONARY:
#			print_scene_tree_Nova(node[key], indent + 1)


#var task_queue = []

#func process_next_task_Nova():
#	if task_queue.size() > 0:
#		var task = task_queue.pop_front()
#		create_new_task(task["name"], task["data"])


#func initialize_engine_Nova():
#	check_settings_file()
#	start_up_scene_tree()
#	initialize_containers_Nova()
#	create_new_task("initialize_menu", "base")

#func initialize_containers_Nova():
#	things_container = Node3D.new()
#	things_container.name = "akashic_records"
#	things_container.set_script(ContainterScript)
#	tasked_children(things_container, "akashic_records")

# Initializes the scene tree with a root node and basic structure.
#func start_up_scene_tree_Nova():
#	scene_tree_jsh["main_root"] = {}
#
