#
# JSH Ethereal Datapoint
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┳┓         •   
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┃┃┏┓╋┏┓┏┓┏┓┓┏┓╋
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┻┛┗┻┗┗┻┣┛┗┛┗┛┗┗
#       888 oo     .d8P  888     888                            ┛     
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Datapoint
#

extends Node3D

var main_scene_to_set : int

var data_point_name : String
var data_point_number : int
var max_things_number : int

var current_things_number : int = -1
var current_priority : int = -1

var data_point_information : Array = []
var data_point_layer_0 : Array = []
var data_point_layer_0_data : Array = []

var data_point_ : String = "datapoint_"

var datapoint_checked : Array = []


# Scenes Stuff
var Scenes_array : Array = []
var current_scene : String
var number_of_scene : int = -1


var can_it_work_now_marry : Array = []

var Interactions_array : Array = []

# Sending stuff functions :)
# In data_point.gd
var main_node: Node

var current_text: String = ""
var cursor_position: int = 0
var cursor_visible: bool = true
var cursor_model: MeshInstance3D
var char_width: float = 0.2
var char_width_new : float = 0.0
var bracket_width: float = 4.0

var bracket_current_text : Array = []

var maximum_amount_of_interaction : int = 1
var current_interaction_mode : String = "single"




@onready var thread_pool = get_node("/root/thread_pool_autoload")

var datapoint_things_dictionary = {}


# the bolean ints of truths,
var the_scenes_fiasco : int = 0
var the_new_layers_fiasco : int = 0
var third_inty_thingy : int = 0

# the newest thingy
var array_datalayer_new : Array = []

func _ready():
	thread_pool.connect("task_discarded", func(task): 
		#print("Task completed: ", task.tag)
		var finished_task = task.tag
		queue_pusher_adder(finished_task)
	)
	
	

func check_amount_of_container():
	var container = self.get_parent()
	print(" in data point : container " , container)
	#main_node.check_amount_of_children_in_branch()


func new_datapoint_layer_system(deep_state_copy_of_apples):
	#print("  the_scenes_fiasco  datapoint layer ", self.name)
	#print(" deep_state_copy_of_apples : " , deep_state_copy_of_apples)
	datapoint_things_dictionary = deep_state_copy_of_apples
	the_new_layers_fiasco +=1
	print(" newest issues arises, we must have them all three 0")
	 # 	if the_scenes_fiasco == 1 and the_new_layers_fiasco == 1:
	if the_scenes_fiasco == 1 and third_inty_thingy == 1:
		print("  the_scenes_fiasco the_new_layers_fiasco ", the_new_layers_fiasco)
		the_scenes_fiasco = 0
		the_new_layers_fiasco = 0
		move_things_around(main_scene_to_set)
	
	#newest_array_thingy_from_dictionary(deep_state_copy_of_apples)

func newest_array_thingy_from_dictionary(diction_to_parsi):
	print(" we are in newest function : " , diction_to_parsi)
	
	for thing in diction_to_parsi:
		if thing != "metadata":
			print(" thing : " , thing , " amd " , diction_to_parsi[thing]["node"])
			array_datalayer_new.append(diction_to_parsi[thing]["node"])
	
	print( " array_datalayer_new : " , array_datalayer_new)

func initialize_loading_file(file_name):
#	start_temporary_timer_settings()
	print(" file name ", file_name)
	#var file_name_splitted = file_name.split("ø")
	#print(" file_name_splitted : " , file_name_splitted)
	#print(" container just added? scene pulled? added? : " , container_called)
	#print(" container_called + container : ", container_called , "_container")
#	var parent_node = get_parent()
#	var main_node = parent_node.get_parent()
#	var new_container_path = container_called + "_container"
#	var container_new = main_node.get_node(new_container_path)
#	if !container_new:
#		print("we gotta wait a while lol")
#		#func try_get_node(path: String, parent_node_from, attempts: int = 666)
#		container_new = await try_get_node(new_container_path, main_node)
#		print("we gotta wait a while lol " , container_new)
	
#	print(" self.name ", self.name, " parent_node ", parent_node , " main_node ", main_node , " new_container_path ", new_container_path, " container_new " , container_new)
	
	
	var message = SettingsBank.check_all_settings_data()
	print("load_file message : " , message)
	print("initialize loading file settings self name " , self.name)
	#print("initialize loading file data_point_layer_0 " , data_point_layer_0)
#	var data_point_node
#	if container_new:
#		data_point_node = container_new.get_datapoint()
	
#	if !data_point_node:
#		print("we gotta wait a while again i guess ", data_point_node)
#		#func try_get_node(path: String, parent_node_from, attempts: int = 666)
#		data_point_node = await try_get_node(new_container_path, container_new)
#		print("we gotta wait a while again i guess ", data_point_node)
	
	
#	var scene_to_pull = "scene_to_pull"
#	var data_additional = [[scene_to_pull] , [file_name_splitted[1]]]
#	data_point_node.settings_page_helper(message , data_additional)

func singular_lines_added():
	print(" singular_line added")

func start_temporary_timer_settings():
	await get_tree().create_timer(1.0).timeout  # Waits 1 second
	#print("array_of_conciousness datapoint check them  Timer finished! ", data_point_layer_0.size() , " and we wanna : " , number_to_check)
	#move_things_around(main_scene_to_set)


func try_get_node(path: String, parent_node_from, attempts: int = 8) -> Node:
	var node = null
	for i in range(attempts):
		node = self.get_node(path)
		if node:
			return node
		await self.get_tree().process_frame
	return node


#func settings_page_helper(settings_file_content, additional):
#	var text_to_put_on_screen : Array = []
#	print(" self.name " , self.name, " settings_file_content " , settings_file_content , " additional " , additional )
#	print(data_point_layer_0)
#	for label_finder in data_point_layer_0:
#		print("label_finder " , " first : " , label_finder[0] , " second : " , label_finder[1], " third : " , label_finder[2])
#		if label_finder[2] is Label3D:
#			print(" found label!")
#			text_to_put_on_screen.append(label_finder[2])
#	for text_to_put_on in settings_file_content:
#		print(" text_to_put_on " ,settings_file_content[text_to_put_on])


# current_things_number, data_point_layer_0, data_point_layer_0_data, data_point_information
func setup_text_handling():
	add_cursor()
	setup_cursor_timer()

func add_cursor():
	cursor_model = MeshInstance3D.new()
	var cursor_mesh = BoxMesh.new()
	cursor_mesh.size = Vector3(0.05, 0.4, 0.01)
	
	var material = StandardMaterial3D.new()
	material.albedo_color = Color(1, 1, 1, 1)
	cursor_model.material_override = material
	cursor_model.mesh = cursor_mesh
	var container = get_parent()
	var text_bracket = container.get_node("thing_27")
	if text_bracket:
		text_bracket.add_child(cursor_model)
		update_cursor_position()

func setup_cursor_timer():
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.53
	timer.timeout.connect(blink_cursor)
	timer.start()

func blink_cursor():
	cursor_visible = !cursor_visible
	if cursor_model:
		cursor_model.visible = cursor_visible

func handle_key_press(key: String):
	#print(" handle key press , self.name : ", self.name , " key : " , key) # bracket_current_text
	if len(current_text) * char_width < bracket_width:
		current_text = current_text.insert(cursor_position, key)
#		print(" current_text : " , current_text , self.name)
		cursor_position += 1
		update_text_and_cursor(key)

func handle_backspace():
#	print(" current_text : " , current_text, self.name)
	if cursor_position > 0:
		current_text = current_text.erase(cursor_position - 1, 1)
#		print(" current_text : " , current_text)
		cursor_position -= 1
		var key = ""
		update_text_and_cursor(key)

func update_text_and_cursor(key):
	
	var container = get_parent()
	var text_label = container.get_node("thing_28")
	#print(" text_label : " , text_label , " , " , self)
	if text_label:
		text_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		text_label.text = current_text
		await get_tree().process_frame
		char_width_new = get_text_width(text_label)
		#var dual_action_writer : Array# = append(key)
		#dual_action_writer.append(key)
		#dual_action_writer.append(char_width_new)
		if key.is_empty():
			#print(" is this thingy workin?")
			bracket_current_text.pop_back()
		else:
			bracket_current_text.append([[key], [char_width_new]])
		#print(" bracket_current_text : " , key , " " , char_width_new, bracket_current_text)
	update_cursor_position()

func update_cursor_position():
	if cursor_model:
		var start_x = -bracket_width/2
		var x_pos = start_x + char_width_new#(cursor_position * char_width)
		cursor_model.position = Vector3(x_pos, 0, 0.01)


func get_text_width(text_label: Label3D) -> float:
	# Method 1: Using get_aabb()
	var aabb = text_label.get_aabb()
	var text_width = aabb.size.x
#	print(" text_width : " , text_width)
	return text_width

func change_numbers_letters(scene_to_pull): #
	print(" parallel reality chan num let func : " , scene_to_pull)
	#var container_left = main_node.get_node("keyboard_left_container/thing_34")
	#var container_right = main_node.get_node("keyboard_right_container/thing_53")
	#container_left.move_things_around(int(scene_to_pull))
	#container_right.move_things_around(int(scene_to_pull))
	
	
	
	
func shift_keyboard(scene_to_pull): # print(" parallel reality numbers / letters ") 
	print(" parallel reality shift keys : " , scene_to_pull)
	#var container_left = main_node.get_node("keyboard_left_container/thing_34")
	#print(" parallel reality container left? : " , container_left)
	#var container_right = main_node.get_node("keyboard_right_container/thing_53")
	#container_left.move_things_around(int(scene_to_pull))
	#container_right.move_things_around(int(scene_to_pull))
	
	
	
	
func return_string_from_keyboards():
	print(" return a string") # 
	


func undo_a_character(data):
#	print(" undo a character") # handle_backspace()
	#var container_keyboard = main_node.get_node("keyboard_container/thing_24")
	handle_backspace()
	


func setup_main_reference(main_ref: Node) -> void:
	main_node = main_ref

func check_all_things_inside_datapoint():
	var some_data = [data_point_name , 
	data_point_number , 
	max_things_number , 
	current_things_number , 
	current_priority , 
	data_point_information , 
	data_point_layer_0 , 
	datapoint_checked , 
	data_point_layer_0_data]
	return some_data

func get_datapoint_info_for_containter_connection():
	print("now we in datapoint, wanna connect with containter :)")
	return


func thing_interaction(thing):
	print("thing in datapoint", thing)
	#print("data_point_layer_0 :L ", data_point_layer_0)
	#for things in data_point_layer_0:
#		print("things[2] : ", things[2])
	#	if thing == things[2]:
	#		print("thing in datapoint we found it " , thing, things[2])
			#var array_of_things = await check_possible_interactions(thing.name)
			#print("array_of_things, we getting closer :) : ", array_of_things)
			#return array_of_things
	if datapoint_things_dictionary.has(thing.name):
		#print(" new way to get things done with things ")
		var array_of_things = await check_possible_interactions(thing.name)
		return array_of_things

var lets_check_thingies_again : int = 0

func queue_pusher_adder(finished_task):
	
	
	var names_splitterr = finished_task.split("|")
	#print("array_of_conciousness datapoint finished task : " , finished_task , " , " , names_splitterr[0] , " " , self.name )
	# children tinder
	#try_check_numbers
	
	

		
		
		
#	if names_splitterr[0] == "try_check_numbers":
#		#print(" names_splitterr : " , names_splitterr[1])
#		var find_name = names_splitterr[1].split("&")
#		var clean_name = find_name[1].substr(1, find_name[1].length() -3)
#		#var cleaner_name = clean_name.substr(0, -2)
#		if clean_name == self.name:
#			#print(" names_splitterr : " , find_name[1] , " also " , clean_name)#, " and ", cleaner_name)
#			#print("array_of_conciousness datapoint check them digits : ",names_splitterr[1] , " , " ,  data_point_layer_0.size())
#			if int(names_splitterr[1]) != data_point_layer_0.size():
#				start_temporary_timer(int(names_splitterr[1]))
#				#print(" array_of_conciousness datapoint check them  timer thingy")
#			else:
#				move_things_around(main_scene_to_set)
#fifth_impact_right_now|settings_
#	if self.name == "thing_19" and names_splitterr[0] == "fifth_impact_right_now" and names_splitterr[1] == "settings_":
		#print("finished_task", finished_task, data_point_layer_0)
#		var size_of_settings_records = RecordsBank.records_map_3.size()
#		var data_layer_size = data_point_layer_0.size()
		#print(" size_of_settings_records : " , size_of_settings_records)
#		if data_layer_size != size_of_settings_records - 1:
#			start_tempo_timer(size_of_settings_records)
			
#		if data_layer_size == size_of_settings_records:
#			print(" settings now checks out")



	if names_splitterr[0] == "write_on_keyboard" and self.name == "thing_24":
		#print("array_of_conciousness datapoint finished task : write_on_keyboard from there we print " , self.name )
		handle_key_press(names_splitterr[1])

	if names_splitterr[0] == "undo_a_character" and self.name == "thing_24":
		#print("array_of_conciousness datapoint finished task : write_on_keyboard from there we print " , self.name )
		handle_backspace()
#handle_backspace()

	if names_splitterr[0] == "shift_keyboard" and self.name == "thing_34" or self.name == "thing_53":
		if names_splitterr[1].length() < 2:
			#print(" shift keyboard in queue ", self.name , " names splitter 1" , names_splitterr[1])
			var scene_to_set = int(names_splitterr[1])
			move_things_around(scene_to_set)
			
			#change_numbers_letters
	if names_splitterr[0] == "change_numbers_letters" and self.name == "thing_34" or self.name == "thing_53":
		if names_splitterr[1].length() < 2:
			#print(" shift keyboard in queue ", self.name , " names splitter 1" , names_splitterr[1])
			var scene_to_set = int(names_splitterr[1])
			move_things_around(scene_to_set)





			#create_new_task("try_check_numbers", int(names_splitterr[1]))
		#	print("array_of_conciousness datapoint != check them digits : ",names_splitterr[1] , " , " ,  data_point_layer_0.size())
		#if int(names_splitterr[1]) == data_point_layer_0.size():
		#	create_new_task("move_things_around", main_scene_to_set)
		#	print("array_of_conciousness datapoint == check them digits : ",names_splitterr[1] , " , " ,  data_point_layer_0.size())
		#lets_check_thingies_again = 1
		#create_new_task("move_things_around", main_scene_to_set)
		#move_things_around(main_scene_to_set)
	#if names_splitterr[0] == "fifth_impact_right_now":
	#	print("array_of_conciousness last job to finish")
	#	if lets_check_thingies_again == 1:
	#		lets_check_thingies_again = 0
	#		print(" array_of_conciousness here we should supposed to be after some tasks")
	#		move_things_around(main_scene_to_set)

func start_tempo_timer(size_of_records):
	var attemps_to_check : int = 10
	var data_layer_size = data_point_layer_0.size()
	print( " size_of_records: " , size_of_records ," and " , data_layer_size)
	for attem in attemps_to_check:
		print(" lol")
		await get_tree().create_timer(0.1).timeout  # Waits 1 second
		data_layer_size = data_point_layer_0.size()
		if size_of_records - 1 == data_layer_size:
			print(" after wait we got em all")
			break
		print( " size_of_records: " , size_of_records ," and " , data_layer_size)
	
	

func write_on_keyboard(data_of_key_pressed):
	print(" we clicking : " , data_of_key_pressed)

func start_temporary_timer(number_to_check):
	await get_tree().create_timer(1.0).timeout  # Waits 1 second
	#print("array_of_conciousness datapoint check them  Timer finished! ", data_point_layer_0.size() , " and we wanna : " , number_to_check)
	
	# maybe we check again what number we wanted and what current datapoint layer 0 is currently
	
	# we could make new function in main that checks if every node in container was activated, we try again to send nodes to datapoint add things? we could also check what we already have, then we make new things?
	
	# if we dont find the node on scene tree, we try to
	
	
	move_things_around(main_scene_to_set)
	#if number_to_check > data_point_layer_0.size():
	#	print("array_of_conciousness datapoint check them  i guess now we have it?", data_point_layer_0.size() , " and we wanna : " , number_to_check)
	#if number_to_check == data_point_layer_0.size():
	#	create_new_task("move_things_around", main_scene_to_set)

# creating new tasks, also punishing mortals 
func create_new_task(function_name: String, data):
	var task_tag = function_name + "|" + str(data) + "|" + str(Time.get_ticks_msec())
	# Declare the variable first
	var completion_handler
	# Then assign the function to it
	completion_handler = func(completed_tag):
		if completed_tag == task_tag:
			#print("Task completed: ", function_name)
			thread_pool.disconnect("task_finished", completion_handler)
	# Connect with the callable
	thread_pool.connect("task_finished", completion_handler)

	thread_pool.submit_task(self, function_name, data, task_tag)

# function that is first, here we send its name, priority, max things number?
func power_up_data_point(datapoint_name, datapoint_number, array_of_data):


	var str_num = str(datapoint_number)
	data_point_name = data_point_ + str_num
	var int_num = int(array_of_data[0][0])

	data_point_information.append([data_point_name])

	data_point_information.append([datapoint_name])

	data_point_information.append([datapoint_number])

	data_point_information.append([int_num])

	return data_point_information
	
	#
func datapoint_check():
	datapoint_checked.clear()
	
	datapoint_checked.append([current_priority])
	datapoint_checked.append([current_things_number])
	
#	print(" datapoint being checked") 
	
	return datapoint_checked

func datapoint_assign_priority(send_priority_number):
	#print(" the multi tasking testing : datapoint_assign_priority : ", " , ", send_priority_number)
	current_priority = int(send_priority_number)
	
func add_thing_to_datapoint(array_from_main):
	#print("the multi tasking testing : add_thing_to_datapoint : ", node_path, " , ", thing_to_add)

	#print("current_things_number livin : ", current_things_number)
	#print(" so we are in datapoint zone! livin :", node_path, "thing_to_add : ",thing_to_add)
	#current_things_number +=1
	#var added_thing_path : Array
	#var added_thing_node : Array
	#added_thing_path.append(node_path)
	#added_thing_node.append(thing_to_add)
	#print(" added_thing_path : ", added_thing_path)
	#print(" added_thing_node : ", added_thing_node)
	data_point_layer_0.append(array_from_main)
	#print("data_point_layer_0 : ", data_point_layer_0)
	#data_point_layer_0_data.append([current_things_number])
	#print(data_point_layer_0)
func datapoint_max_things_number_setter(sended_max_number):
	max_things_number = int(sended_max_number)
	


var sad_counter : int = 0

func upload_scenes_frames(header_line, information_lines):
	#print(" upload_scenes_frames : " , upload_scenes_frames)
	#print("the multi tasking testing : upload_scenes_frames", header_line, " , ", information_lines)
	#print(" we shall find the truth, it is out there! " , self.name)
	#if self.name == "thing_53":
		#print(" we shall find the truth, it is out there! " , sad_counter)
		#sad_counter +=1
		#if sad_counter == 3:
			#print(" we shall find the truth, it is out there! ", Scenes_array)
	var array_for_present_moment : Array = []
	
	# Create a deep copy of the arrays to prevent reference issues
	var header_copy = header_line.duplicate(true)
	var info_copy = information_lines.duplicate(true)
	
	array_for_present_moment.append(header_copy)
	array_for_present_moment.append(info_copy)
	
	# If this is a new scene, append it
	var is_new_scene = true
	
	
	for existing_scene in Scenes_array:
		#print(" existing_scene[0][0][0] == header_line[0][0] " , existing_scene[0][0][0] , "  ,  " , header_line[0][0])
		if existing_scene[0][0][0] == header_line[0][0]:  # Compare scene names
			is_new_scene = false
			break
	
	if is_new_scene:
		#print(" we should been appendin them scenes :()" , header_line)
		Scenes_array.append(array_for_present_moment)
	else:
		print(" we should been appendin them scenes but somehow it exist?!", self.name, header_line)
	
	#fourth_impact_right_now
#	if names_splitterr[0] == "fourth_impact_right_now":
#		print("  the_scenes_fiasco  fourth impact " , names_splitterr)
	if the_scenes_fiasco == 0:
		the_scenes_fiasco +=1
		print(" newest issues arises, we must have them all three 1")
		#print(" the_scenes_fiasco this is scenes upload stuff? " , self.name)
	
	if the_new_layers_fiasco == 1 and the_scenes_fiasco == 1 and third_inty_thingy == 1:
		#print(" the_scenes_fiasco queue pusher adder ", the_scenes_fiasco , " ,m " , self.name)
		the_new_layers_fiasco = 0
		the_scenes_fiasco = 0
		#print(" the_scenes_fiasco i guess we already sent all data of layer with nodes ? ")
		move_things_around(main_scene_to_set)


func upload_interactions(header_line, information_lines, type_of_interaction, number_of_interactions):
	#print("the multi tasking testing : upload_interactions ", header_line, " , ", information_lines," , ",  type_of_interaction, " , ", number_of_interactions)
#	print(" we are in datapoint! lets see : ", header_line, information_lines, type_of_interaction, number_of_interactions)
	#Interactions_array
	var interaction_blimp : Array = [header_line, information_lines, type_of_interaction, number_of_interactions]
	Interactions_array.append(interaction_blimp.duplicate(true))


func check_possible_interactions(thing):
	var scene_things: Array = []
	var counter_of_interaction_checked : int = 0
	var counter_for_array : int = -1
	var counter = -1
	var first_interaction
	var second_interaction
	var third_interaction
	var fourth_interaction
	var fifth_interaction
	var sixth_interaction
	var interaction_to_do_now
	var scene_to_pull
	var second_scene_to_pull
	var third_scene_to_pull
	var fourth_scene_to_pull
	var array_of_things
	var number_of_possible_interactions
	var current_number_of_inter
	var current_possible_interaction = Interactions_array[number_of_scene]
	var possible_interaction = current_possible_interaction[1][0][1][0]
	for posib_inter in Interactions_array:
		if counter_of_interaction_checked == maximum_amount_of_interaction:
			break
		var inter_ar_siz = posib_inter[1][0].size()
		if inter_ar_siz > 2:
			scene_to_pull = posib_inter[1][0][2][0]
		if inter_ar_siz > 3:
			first_interaction = posib_inter[1][0][3][0]
		if inter_ar_siz > 4:
			second_interaction = posib_inter[1][0][4][0]
		if inter_ar_siz > 5:
			third_interaction = posib_inter[1][0][5][0]
		if inter_ar_siz > 6:
			fourth_interaction = posib_inter[1][0][6][0]
		if inter_ar_siz > 7:
			fifth_interaction = posib_inter[1][0][7][0]
		if inter_ar_siz > 8:
			sixth_interaction = posib_inter[1][0][8][0]
		var thing_name_to_interact = posib_inter[1][0][1][0]
		var from_that_scene_we_can_go = posib_inter[0][0]
		
		if thing == thing_name_to_interact and from_that_scene_we_can_go == current_scene:
			#print(" lets check multi tasking thingies " , thing , " , " , thing_name_to_interact , " , " , from_that_scene_we_can_go , "  ,  " , current_scene)
			counter_of_interaction_checked +=1
			number_of_possible_interactions = int(posib_inter[3])
			for interaction in number_of_possible_interactions :
				current_number_of_inter = interaction + 1
				var check_size_of_posib_inter = posib_inter[2].size()
				if counter_for_array + 1 < number_of_possible_interactions:
					counter_for_array +=1
				var name_of_interaction
				if posib_inter[2].size() > 1:
					name_of_interaction = posib_inter[2][counter_for_array][0]
				else:
					name_of_interaction = posib_inter[2][0][0]
				for i in InteractionsBank.type_of_interactions_0:
					counter +=1
					if name_of_interaction == i:
						#print(" check_possible_interactions i guess we got somewhere?")
						break
					else:
						continue
				match counter_for_array:
					0: # interaction one
						interaction_to_do_now = scene_to_pull
					1:
						interaction_to_do_now = first_interaction
					2:
						interaction_to_do_now = second_interaction
					3:
						interaction_to_do_now = third_interaction
					4:
						interaction_to_do_now = fourth_interaction
					5:
						interaction_to_do_now = fifth_interaction
					6:
						interaction_to_do_now = sixth_interaction
				match counter:
					0: 
						#print(" multi tasking, lets find out why we do rea rae 0, ", scene_things)
						var scene_to_set : int = int(posib_inter[1][0][3][0])
						#print(" move things around " , scene_to_set)
						scene_things = await move_things_around(scene_to_set)
						#print("scene_things :" , scene_things)
						array_of_things = check_things_in_scene(scene_things)
						counter = -1
					1: 
						#print(" multi tasking, lets find out why we do rea rae 1")
						var current_interaction_to_do
						match counter_for_array:
							0: 
								current_interaction_to_do = scene_to_pull
							1:
								current_interaction_to_do = first_interaction
							2:
								current_interaction_to_do = second_interaction
							3:
								current_interaction_to_do = third_interaction
							4:
								current_interaction_to_do = fourth_interaction
							5:
								current_interaction_to_do = fifth_interaction
							6:
								current_interaction_to_do = sixth_interaction
						var container = self.get_parent()
						var main_script = container.get_parent()
						main_script.create_new_task("three_stages_of_creation", current_interaction_to_do)
						counter = -1
					2: 
						#print(" multi tasking, lets find out why we do rea rae 2")
						counter = -1
					3: #
						#print(" multi tasking, lets find out why we do rea rae 3")
						counter = -1
					4: 
						#print(" multi tasking, lets find out why we do rea rae 4")
						var current_interaction_to_do
						match counter_for_array:
							0:
								current_interaction_to_do = first_interaction
							1:
								current_interaction_to_do = second_interaction
							2:
								current_interaction_to_do = third_interaction
							3:
								current_interaction_to_do = fourth_interaction
							4:
								current_interaction_to_do = fifth_interaction
							5:
								current_interaction_to_do = sixth_interaction
						var container_name = current_interaction_to_do
						var container_node = get_parent()
						var parent_node = container_node.get_parent()
						if parent_node:
							for child in parent_node.get_children():
								if child.name == container_name:
									var two_things : Array = []
									two_things.clear()
									two_things.append(name_of_interaction)
									two_things.append(current_interaction_to_do)
									array_of_things[1].append(two_things)
									break
								else:
									print(" check_possible_interactions 5 Sibling node with name does not exist: ", container_name, " also parent_node :" , parent_node)
							counter = -1
						else:
							print(" check_possible_interactions 5 Parent node does not exist!")
					5: 
						#print(" multi tasking, lets find out why we do rea rae 5")
						#print(" i think we would start writing maybe hehe " , scene_to_pull,  " , ", self.name)
						counter = -1
						#var keyboard_bracet_node = main_node.get_node("keyboard_container/thing_24")
						#if !keyboard_bracet_node:
							#keyboard_bracet_node = await try_get_node("keyboard_container/thing_24", main_node)
						#if keyboard_bracet_node:
							
							#print( " i think we would start writing maybe hehe keyboard_bracet_node :  ", keyboard_bracet_node)
							#keyboard_bracet_node.handle_key_press(scene_to_pull)
						create_new_task("write_on_keyboard", scene_to_pull)
					6: 
						#print(" multi tasking, lets find out why we do rea rae 6")
						#print(" parallel reality shift keyboard ")
						create_new_task("shift_keyboard", scene_to_pull)# shift_keyboard(scene_to_pull)
					7: 
						#print(" multi tasking, lets find out why we do rea rae 7")
						#print(" parallel reality numbers / letters ") 
						create_new_task("change_numbers_letters", scene_to_pull) #change_numbers_letters(scene_to_pull) 
					8: 
						#print(" multi tasking, lets find out why we do rea rae 8")
						#print(" return_string")
						return_string_from_keyboards()
						var return_string_from_keyboards : String = "return_string_from_keyboards"
						create_new_task("return_string_from_keyboards", return_string_from_keyboards)
					9: 
						#print(" multi tasking, lets find out why we do rea rae 9")
						#print(" undo_char")
						var undo_char : String = "undo_char"
						create_new_task("undo_a_character", undo_char)
					10: 
						print(" multi tasking, lets find out why we do rea rae 10")
						#print(" load_file ?" , interaction_to_do_now , " scene_to_pull : " , scene_to_pull)
						#initialize_loading_file(scene_to_pull, interaction_to_do_now)

	if number_of_possible_interactions == current_number_of_inter:
		#print(" check_possible_interactions we would return some array i guess")
		#print(" array_of_things check possible : ", array_of_things)
		return array_of_things

func move_things_around(scene_number: int):
	await self.get_tree().process_frame
	#print(" move_things_around scene_number : ", scene_number)
	#print("  move things around  : " , datapoint_things_dictionary)
	var counter_of_what_to_move : int = 0
	var counter_of_what_we_moved : int = 0
	#var layer_size = data_point_layer_0.size()
	#print(" multi tasking testing stuff : Scenes_array " , Scenes_array.size())
	var scene_things: Array = []
	var scen_siz = Scenes_array.size()
	var scene_to_set
	#print(" move_things_around Scenes_array : ", Scenes_array)
	for available_scenes in Scenes_array:
		#print("available_scenes : " , available_scenes[0][0][0])
		var scene_number_to_find = available_scenes[0][0][0].split("_")
		#print("available_scenes scene_number_to_find : ", scene_number_to_find[1])
		if scene_number == int(scene_number_to_find[1][0]):
			#print(" available_scenes : ", available_scenes)
			scene_to_set = available_scenes
	for scene_test in scene_to_set[1]:
		counter_of_what_to_move +=1
		#var node_to_move = datapoint_things_dictionary[scene_test[1][0]]["node"].duplicate(true)
		#print("  move things around  ", datapoint_things_dictionary)
		if scene_test.size() < 3 or scene_test[0].is_empty():
			continue
		var lets_get_path = str(self.get_path())
		var splitter_path = lets_get_path.split("/")
		var new_name_scene = splitter_path[3] + "/" + scene_test[1][0]
		
#		for thing_to_move in data_point_layer_0:
#			if thing_to_move[1] == new_name_scene:
		scene_things.append(scene_test)
#				counter_of_what_we_moved +=1
		var new_position = Vector3(
			float(scene_test[2][0]),
			float(scene_test[2][1]),
			float(scene_test[2][2])
		)
		#await self.get_tree().process_frame
		#print(" move_things_around datapoint_things_dictionary : ", datapoint_things_dictionary[scene_test[1][0]])
		#if datapoint_things_dictionary[scene_test[1][0]]["node"]
		if is_instance_valid(datapoint_things_dictionary[scene_test[1][0]]["node"]):
			datapoint_things_dictionary[scene_test[1][0]]["node"].position = new_position
			
		else:
			print(" we must add another node to the tree ")
#				var new_way_for_path = thing_to_move[1].split("/")
#				var thing_to_move_new_way = self.get_node(new_way_for_path[1])
#				print("new_way_for_path[1] : " , new_way_for_path[1] , " also thing_to_move " , thing_to_move)
#				if !thing_to_move_new_way:
#					thing_to_move_new_way = await try_get_node_singular(new_way_for_path[1])
#				if thing_to_move_new_way:
#					thing_to_move_new_way.position = new_position
				#print(" multi tasking stuff thing_to_move[2] : ", thing_to_move[1])
		if scene_test.size() > 3:
			if is_instance_valid(datapoint_things_dictionary[scene_test[1][0]]["node"]):
				for child in datapoint_things_dictionary[scene_test[1][0]]["node"].get_children():
					if child is Label3D:
						child.text = scene_test[3][0]
						break
			else:
				print(" we must add another node to the tree ")
#					break
	current_scene = "scene_" + str(scene_number)
	number_of_scene = scene_number
	#print(" scene_things 0 : " , scene_things, " i guess also scene_number " , scene_number)
	#print("array_of_conciousness in move things around" , counter_of_what_to_move , " and " , counter_of_what_we_moved, " and size of layer : " , layer_size)
#	if counter_of_what_to_move != counter_of_what_we_moved:
#		var move_things_array : Array = []
		#print("array_of_conciousness if != thingy ", data_point_layer_0)
#		var number_we_wanna = layer_size + counter_of_what_to_move - counter_of_what_we_moved
#		move_things_array.append(number_we_wanna)
		#print("array_of_conciousness we wanna that number ", number_we_wanna)
		#create_new_task("try_check_numbers", number_we_wanna)
		#print("array_of_conciousness after await function ", number_we_now_got)
		#layer_size
#		var datapoint_name = self.name
#		move_things_array.append(datapoint_name)
		
#		create_new_task("try_check_numbers", move_things_array)
	return scene_things

# Hell will find out where and who it is, AVEN
#func try_get_node_singular(path: String, attempts: int = 8) -> Node:
#	var node = null
#	var parent = null
#	for i in range(attempts):
#		parent = get_parent()
#		node = parent.get_node(path)
#		if node:
#			return node
#		await self.get_tree().process_frame
#	return node

func try_check_numbers(array_of_truth, attempts: int = 666) -> int:
	
	var number_we_wanna = array_of_truth[0]
	print( " try_check_numbers : ", number_we_wanna)
	var new_number = data_point_layer_0.size()
	var layer_0_number = data_point_layer_0.size()
	for i in range(attempts):
		layer_0_number = data_point_layer_0.size()
		if layer_0_number == number_we_wanna:
			new_number = layer_0_number
			return new_number
		await self.get_tree().process_frame
	#new_number 
	return new_number

func check_things_in_scene(scene_we_wanna) -> Array:
	#print("new function lol : ", scene_we_wanna)
	#print("self.name : ", self.name)
	var data_point_name_thingy : String = self.name
	var data_point_path = self.get_parent()
#	print(" sooo lets try data_point_path : ", data_point_path)
	var list_of_things_that_shall_remain : Array = []
	list_of_things_that_shall_remain.clear
	list_of_things_that_shall_remain.append([data_point_path])# data_point_path
	list_of_things_that_shall_remain.append([data_point_name_thingy])
	list_of_things_that_shall_remain.append(["thing_3"])
	list_of_things_that_shall_remain.append(["thing_4"])
	
	
	for thing_to_leave in scene_we_wanna:
		#print(" scenes we wanna : " , thing_to_leave[1])
		var thing_that_is_in_scene = thing_to_leave[1]
		list_of_things_that_shall_remain.append(thing_that_is_in_scene)
#	print("list_of_things_that_shall_remain : ", list_of_things_that_shall_remain)
	return [[list_of_things_that_shall_remain], []]
#	print("data_point_layer_0 : ", data_point_layer_0)
	#print("scene_we_wanna : ", scene_we_wanna)
	#print("scene_we_wanna[1] : ", scene_we_wanna[1])
	#for thing_in_scene in scene_we_wanna:
	#print("scene_we_wanna : ", scene_we_wanna)
	
func update_layer_0_after_freeing():
	var nodes_to_remain : Array = []
	var node_to_be_added_back
#	print("hmmm")
#	print("current_things_number, data_point_layer_0, data_point_layer_0_data, data_point_information")
#	print("data_point_layer_0 : " , data_point_layer_0)
#	print("data_point_layer_0_data : " , data_point_layer_0_data)
#	print("data_point_information : " , data_point_information)
#	print("current_things_number : " , current_things_number)
	for nodes_to_process in data_point_layer_0:
		node_to_be_added_back = nodes_to_process
#		print("for nodes_to_process in data_point_layer_0:")
#		print(nodes_to_process)
#		print(nodes_to_process[2])
		var node = nodes_to_process[2]  # Assuming the node is the third element in your array
		if not is_instance_valid(node):
			print("Node is freed:")
			# Handle the freed node case (e.g., regenerate, log, skip, etc.)
		else:
#			print("Node is valid:", node.name)
			nodes_to_remain.append([[node_to_be_added_back[1]],[node_to_be_added_back[2]]])
			# Process the valid node as usual
#	print("we shall finish, taking back what shall remain :) : ", nodes_to_remain)
	current_things_number = -1
	data_point_layer_0.clear()
	data_point_layer_0_data.clear()
	#for nodes_to_add_back in nodes_to_remain:
#		print("hmm, for nodes_to_add_back in nodes_to_remain:")
#		print("nodes_to_add_back [0], [1]", nodes_to_add_back[0] , nodes_to_add_back[1])
		#add_thing_to_datapoint(nodes_to_add_back[0][0] , nodes_to_add_back[1][0])

func scene_to_set_number_later(number_int_eh):
	main_scene_to_set = number_int_eh
	
func scene_mover_after_all_loaded():
	if number_of_scene == main_scene_to_set:
		print("array_of_conciousness i guess we got that scene already set up? ")
	else:
		#print("array_of_conciousness else in datapoint")
		if !main_scene_to_set:
			await self.get_tree().process_frame
			wait_for_scenes()
		if main_scene_to_set:
			#print(" array_of_conciousness the settings thingy lets figure it out", self.name)
			if Scenes_array.size() - 1 >= main_scene_to_set:
				#print("array_of_conciousness we gotta move em thingies ", main_scene_to_set , " , " , number_of_scene, " data point layer 0 system ", data_point_layer_0)
				move_things_around(main_scene_to_set)
			else:
				print(" array_of_conciousness the settings thingy lets figure it out 1", self.name)
		else:
			#print(" array_of_conciousness the settings thingy lets figure it out 2", self.name, " main_scene_to_set ", main_scene_to_set , " data_point_layer_0. sioze", data_point_layer_0.size() , " Scenes_array" , Scenes_array.size())
			move_things_around(main_scene_to_set)

func set_maximum_interaction_number(mode : String, amount : int):
	#print("the multi tasking testing : so we are setting thingies! mode : " , mode , " amount : " , amount)
	maximum_amount_of_interaction = amount
	current_interaction_mode = mode


func wait_for_scenes(attempts: int = 666) -> Node:
	#var node = null
	for i in range(attempts):
		#node = self.get_node(path)
		if main_scene_to_set:
			if Scenes_array.size() - 1 >= main_scene_to_set:
				return 
		await self.get_tree().process_frame
	return 

func check_current_state_of_information_for_scenes():
	if third_inty_thingy == 0:
		third_inty_thingy +=1
		print(" newest issues arises, we must have them all three 2")
	if the_scenes_fiasco == 1 and the_new_layers_fiasco == 1:
		move_things_around(main_scene_to_set)

# the bolean ints of truths,
#var the_scenes_fiasco : int = 0
#var the_new_layers_fiasco : int = 0
#var third_inty_thingy : int = 0






# not used:

# Function to get all things in a scene
#func get_scene_things123(scene_number: int) -> Array:
#	if scene_number < Scenes_array.size():
#		return Scenes_array[scene_number][1][0]
#	return []



# Function to get all differences between scenes
#func get_scene_differences123(from_scene: int, to_scene: int) -> Dictionary:
#	var from_things# = get_scene_things(from_scene)
#	var to_things #= get_scene_things(to_scene)
#	
#	var differences = {
#		"moved": [],  # Things that exist in both scenes but changed position
#		"removed": [], # Things that exist in from_scene but not in to_scene
#		"added": []   # Things that exist in to_scene but not in from_scene
#	}
#	
#	# Find moved and removed things
#	for from_thing in from_things:
#		var thing_name = from_thing[1][0]
#		var found = false
#		
#		for to_thing in to_things:
#			if to_thing[1][0] == thing_name:
#				found = true
#				# Check if position changed
#				if to_thing[2] != from_thing[2]:
#					differences["moved"].append({
#						"name": thing_name,
#						"from_pos": from_thing[2],
#						"to_pos": to_thing[2]
#					})
#				break
#		
#		if not found:
#			differences["removed"].append(thing_name)
	
	# Find added things
#	for to_thing in to_things:
#		var thing_name = to_thing[1][0]
#		var found = false
#		
#		for from_thing in from_things:
#			if from_thing[1][0] == thing_name:
#				found = true
#				break
		
#		if not found:
#			differences["added"].append(thing_name)
	
#	return differences

# Function to check if a thing exists in a scene
#func thing_exists_in_scene123(scene_number: int, thing_name: String) -> bool:
#	var scene_content# = get_scene_things(scene_number)
#	for thing in scene_content:
#		if thing[1][0] == thing_name:
#			return true
#	return false
	
	
	# Load scene definition from array format you're using
#func load_scene_definition123(scene_data: Array) -> void:
	# Format: [[[["scene_0"]], [array_of_things]]]
#	for scene in scene_data:
#		var scene_header = scene[0][0][0] # Gets "scene_0"
#		var scene_content = scene[1][0]    # Gets array of things
#		Scenes_array.append([[scene_header], [scene_content]])

# Function to get thing's data from scene
#func get_thing_data132(scene_number: int, thing_name: String) -> Array:
#	var scene = Scenes_array[scene_number]
#	for thing in scene[1][0]:
#		if thing[1][0] == thing_name:
#			return thing
#	return []
