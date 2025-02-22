# scripts/records_bank.gd
extends Node3D
class_name RecordsBank # RecordsBank.records_map_0 # RecordsBank.type_of_thing_0

var thing_add_number : String = "thing_"
var record_add_number : String = "record_"

const type_of_thing_0 = [
	"flat_shape", "text", "model", "button", "cursor", "connection", "screen", "datapoint", "circle", "container", "text_mesh"
]

# Dictionary containing all record definitions
const records_map_0 = {
	0: [ # container
		["thing_0|0.0,0.0,0.0|0.0,0.0,0.0|container|base|main|akashic_records|containers|instruction_set_0"],
		["akashic_records"]
	],
	1: [ # data_point
		["thing_7|0.0,0.0,0.0|0.0,0.0,0.0|datapoint|0|akashic_records|akashic_records/thing_7|datapoints|instruction_set_0"],
		["100"]
	],
	2: [ # Text
		["thing_2|0.0,0.0,0.0|0.0,0.0,0.0|text|square|akashic_records|akashic_records/thing_2|Akashic_Records|instruction_set_0"],
		["Akashic_Records|33"]
	],
	3: [ # Line
		["thing_3|0.0,0.0,0.0|0.0,0.0,0.0|connection|line|akashic_records|akashic_records/thing_3|Akashic_Records|instruction_set_0"],
		["0.0,0.0,-6.0|0.0,0.0,6.0|0.69"]
	],
	4: [ # Triangle
		["thing_5|0.0,0.0,0.0|0.0,0.0,0.0|cursor|triangle|akashic_records|akashic_records/thing_5|Akashic_Records|instruction_set_0"],
		["-1,-2,0|1,2,0|-1,3,0|0.19,0.19,0.19"],
		["0.69|1.0"]
	],
	5: [ # Screen, like with ratio
		["thing_4|0.0,0.0,0.0|0.0,0.0,0.0|text_mesh|config|akashic_records|akashic_records/thing_4|Akashic_Records|instruction_set_0"],
		["point"],
		["JSH|369|0.05|0.02|0.59|1.0"]
	],
	6: [ # Button, like with ratio
		["thing_6|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|akashic_records|akashic_records/thing_6|Akashic_Records|instruction_set_0"],
		["-2,-0.5,0|2,-0.5,0|2,0.5,0|-2,0.5,0"],
		["Start|369|0.69|1.0"]
	],
	7: [ # Flat_shape
		["thing_1|0.0,0.0,0.0|0.0,0.0,0.0|flat_shape|0|akashic_records|akashic_records/thing_1|Akashic_Records|instruction_set_0"],
		["0,3,0|3,-1,0|2,-3,0|-2,-3,0|-3,-1,0"],
		["0.69|1.0"]
	],
	8: [ # circle
		["thing_8|0.0,0.0,0.0|0.0,0.0,0.0|circle|0|akashic_records|akashic_records/thing_8|Akashic_Records|instruction_set_0"],
		["3|8"],
		["0.69|1.0"]
	],
	9: [ # Square
		["thing_9|0.0,0.0,0.0|0.0,0.0,0.0|model|square|akashic_records|akashic_records/thing_9|Akashic_Records|instruction_set_0"],
		["-1,-1,0|1,-1,0|1,1,0|-1,1,0"],
		["0.69|1.0"]
	]
}

# lets try making a button
const records_map_1 = {
	0: [ # Square
		["thing_10|0.0,0.0,0.0|0.0,0.0,0.0|model|square|akashic_records|akashic_records/thing_9|group_0"],
		["-1,-1,0|1,-1,0|1,1,0|-1,1,0"],
		["0.69|1.0"]
	],
	1: [ # Text
		["thing_18|0.0,0.0,0.0|0.0,0.0,0.0|text|square|akashic_records|akashic_records/thing_10|group_0"],
		["Akashic_Records|33"],
		["0.69|1.0"]
	]
}

# the records for menu
const records_map_2 = {
	0: [ # Main screen
		["thing_11|0.0,0.0,0.0|0.0,0.0,0.0|screen|16:9|akashic_records|akashic_records/thing_11|Akashic_Records|instruction_set_1"],
		["-8,-4.5,0|8,-4.5,0|8,4.5,0|-8,4.5,0"],
		["0.022|1.0"]
	],
	1: [ # Things Button
		["thing_12|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|akashic_records|akashic_records/thing_12|Akashic_Records|instruction_set_1"],
		["-2,-0.5,0|2,-0.5,0|2,0.5,0|-2,0.5,0"],
		["Things|36|0.05|1.0"] 
	],
	2: [ # Scenes Button
		["thing_13|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|akashic_records|akashic_records/thing_13|Akashic_Records|instruction_set_1"],
		["-2,-0.5,0|2,-0.5,0|2,0.5,0|-2,0.5,0"],
		["Scenes|36|0.05|1.0"]
	],
	3: [ # Interactions Button
		["thing_14|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|akashic_records|akashic_records/thing_14|Akashic_Records|instruction_set_1"],
		["-2,-0.5,0|2,-0.5,0|2,0.5,0|-2,0.5,0"],
		["Interactions|36|0.05|1.0"]
	],
	4: [ # Instructions Button
		["thing_15|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|akashic_records|akashic_records/thing_15|Akashic_Records|instruction_set_1"],
		["-2,-0.5,0|2,-0.5,0|2,0.5,0|-2,0.5,0"],
		["Instructions|36|0.05|1.0"]
	],
	5: [ # Settings Button
		["thing_16|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|akashic_records|akashic_records/thing_16|Akashic_Records|instruction_set_1"],
		["-2,-0.5,0|2,-0.5,0|2,0.5,0|-2,0.5,0"],
		["Settings|36|0.05|1.0"]
	],
	6: [ # Exit Button
		["thing_17|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|akashic_records|akashic_records/thing_17|Akashic_Records|instruction_set_1"],
		["-2,-0.5,0|2,-0.5,0|2,0.5,0|-2,0.5,0"],
		["Exit|36|0.05|1.0"]
	]
}



# settings stuff
const records_map_3 = {
	0: [ # container
		["thing_18|0.0,0.0,0.0|0.0,0.0,0.0|container|settings|main|settings_container|containers|instruction_set_2"],
		["settings_container"]
	],
	1: [ # datapoint
		["thing_19|0.0,0.0,0.0|0.0,0.0,0.0|datapoint|1|settings_container|settings_container/thing_19|datapoints|instruction_set_2"],
		["100"]
	],
	2:[ # screen
		["thing_20|0.0,0.0,0.0|0.0,0.0,0.0|screen|12:9|settings_container|settings_container/thing_20|settings_container|instruction_set_2"],
		["-6,-4.5,0|6,-4.5,0|6,4.5,0|-6,4.5,0"],
		["0.033|0.69"]
	],
	3:[ # model smaller
		["thing_21|0.0,0.0,0.0|0.0,0.0,0.0|model|square|settings_container|settings_container/thing_21|settings_container|instruction_set_2"],
		["-1,-0.25,0|1,-0.25,0|1,0.25,0|-1,0.25,0"],
		["0.066|0.88"]
	],
	4:[ # model bigger
		["thing_22|0.0,0.0,0.0|0.0,0.0,0.0|model|square|settings_container|settings_container/thing_22|settings_container|instruction_set_2"],
		["-3,-0.25,0|3,-0.25,0|3,0.25,0|-3,0.25,0"],
		["0.066|0.88"]
	],
	5: [ # Text
		["thing_23|0.0,0.0,0.0|0.0,0.0,0.0|text|square|settings_container|settings_container/thing_23|settings_container|instructions_set_2"],
		["text|33"]
	],
	6: [ # Text
		["thing_24|0.0,0.0,0.0|0.0,0.0,0.0|text|square|settings_container|settings_container/thing_24|settings_container|instructions_set_2"],
		["text|33"]
	]
}

# keyboard for writing
const records_map_4 = {
	0: [ # container  #0.0,0.0,0.0 # 0.0,-4.5,0.41
		["thing_23|0.0,0.0,0.0|0.0,0.0,0.0|container|keyboard|main|keyboard_container|containers|instruction_set_3"],
		["keyboard_container"]
	],
	1: [ # datapoint
		["thing_24|0.0,0.0,0.0|0.0,0.0,0.0|datapoint|1|keyboard_container|keyboard_container/thing_24|datapoints|instruction_set_3"],
		["100"]
	],
	2:[ # connecting mechanism?
		["thing_25|0.0,0.0,0.0|0.0,0.0,0.0|model|square|keyboard_container|keyboard_container/thing_25|keyboard_container|instruction_set_3"],
		["-0.25,-0.25,0|0.25,-0.25,0|0.25,0.25,0|-0.25,0.25,0"],
		["0.33|1.0"]
	],
	3:[ # another button?
		["thing_26|0.0,0.0,0.0|0.0,0.0,0.0|model|square|keyboard_container|keyboard_container/thing_26|keyboard_container|instruction_set_3"],
		["-0.25,-0.25,0|0.25,-0.25,0|0.25,0.25,0|-0.25,0.25,0"],
		["0.66|1.0"]
	],
	4:[ # text bracket
		["thing_27|0.0,0.0,0.0|0.0,0.0,0.0|model|square|keyboard_container|keyboard_container/thing_27|keyboard_container|instruction_set_3"],
		["-2,-0.25,0|2,-0.25,0|2,0.25,0|-2,0.25,0"],
		["0.89|1.0"]
	],
	5: [ # Text for bracet
		["thing_28|0.0,0.0,0.0|0.0,0.0,0.0|text|square|keyboard_container|keyboard_container/thing_28|keyboard_container|instruction_set_3"],
		["|33"]
	],
	6: [ # button to close
		["thing_29|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_container|keyboard_container/thing_29|keyboard_container|instruction_set_3"],
		["-0.25,-0.25,0|0.25,-0.25,0|0.25,0.25,0|-0.25,0.25,0"],
		["x|36|0.11|1.0"]
	],
	7: [ # shape to hold it all together hehe
		["thing_30|0.0,0.0,0.0|0.0,0.0,0.0|model|square|keyboard_container|keyboard_container/thing_30|keyboard_container|instruction_set_3"],
		["-2.66,-0.62,0|2.66,-0.62,0|2.66,0.62,0|-2.66,0.62,0"],
		["0.11|1.0"]
	]
	
}


# keyboard for writing i mean first left side
const records_map_5 = {
	0: [ # container for keyboard left 0.0,-4.5,0.41 positiopn dude relax 0|1 so it is 1 lol
		["thing_33|0.0,0.0,0.0|0.0,0.0,0.0|container|keyboard_left|main|keyboard_left_container|containers|instruction_set_4"],
		["keyboard_left_container"]
	],
	1: [ # datapoint for keyboard left
		["thing_34|0.0,0.0,0.0|0.0,0.0,0.0|datapoint|1|keyboard_left_container|keyboard_left_container/thing_34|datapoints|instruction_set_4"],
		["100"]
	],
	2:[ # screen, to hold them keys here
		["thing_35|0.0,0.0,0.0|0.0,0.0,0.0|screen|1:1|keyboard_left_container|keyboard_left_container/thing_35|keyboard_left_container|instruction_set_4"],
		["-5,-5,0|0,-5,0|0,0,0|-5,0,0"],
		["0.033|0.69"]
	],
	3: [ # q button
		["thing_36|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_36|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["q|36|0.11|1.0"]
	],
	4: [ # w button
		["thing_37|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_37|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["w|36|0.11|1.0"]
	],
	5: [ # e button
		["thing_38|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_38|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["e|36|0.11|1.0"]
	],
	6: [ # r button
		["thing_39|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_39|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["r|36|0.11|1.0"]
	],
	7: [ # t button
		["thing_40|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_40|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["t|36|0.11|1.0"]
	],
	8: [ # a button
		["thing_41|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_41|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["a|36|0.11|1.0"]
	],
	9: [ # s button
		["thing_42|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_42|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["s|36|0.11|1.0"]
	],
	10: [ # d button
		["thing_43|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_43|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["d|36|0.11|1.0"]
	],
	11: [ # f button
		["thing_44|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_44|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["f|36|0.11|1.0"]
	],
	12: [ # shift button △▲
		["thing_45|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_45|keyboard_left_container|instruction_set_4"],
		["-0.69,-0.58,0|0.69,-0.58,0|0.69,0.58,0|-0.69,0.58,0"],
		["△|36|0.11|1.0"]
	],
	13: [ # z button 
		["thing_46|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_46|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["z|36|0.11|1.0"]
	],
	14: [ # x button 
		["thing_47|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_47|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["x|36|0.11|1.0"]
	],
	15: [ # c button 
		["thing_48|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_48|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["c|36|0.11|1.0"]
	],
	16: [ # v button 
		["thing_49|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_49|keyboard_left_container|instruction_set_4"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["v|36|0.11|1.0"]
	],
	17: [ # numbers button 
		["thing_50|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_50|keyboard_left_container|instruction_set_4"],
		["-0.69,-0.58,0|0.69,-0.58,0|0.69,0.58,0|-0.69,0.58,0"],
		["0010110|36|0.11|1.0"]
	],
	18: [ # space button 
		["thing_51|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_left_container|keyboard_left_container/thing_51|keyboard_left_container|instruction_set_4"],
		["-1.73,-0.58,0|1.73,-0.58,0|1.73,0.58,0|-1.73,0.58,0"],
		["space|36|0.11|1.0"]
	]
}

# keyboard for writing right side
const records_map_6 = {
	0: [ # container for keyboard right 0.0,-4.5,0.41
		["thing_52|0.0,0.0,0.0|0.0,0.0,0.0|container|keyboard_right|main|keyboard_right_container|containers|instruction_set_5"],
		["keyboard_right_container"]
	],
	1: [ # datapoint for keyboard right
		["thing_53|0.0,0.0,0.0|0.0,0.0,0.0|datapoint|1|keyboard_right_container|keyboard_right_container/thing_53|datapoints|instruction_set_5"],
		["100"]
	],
	2:[ # screen, to hold them keys here
		["thing_54|0.0,0.0,0.0|0.0,0.0,0.0|screen|1:1|keyboard_right_container|keyboard_right_container/thing_54|keyboard_right_container|instruction_set_5"],
		["0,-5,0|5,-5,0|5,0,0|0,0,0"],
		["0.033|0.69"]
	],
	3: [ # p button
		["thing_55|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_55|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["p|36|0.11|1.0"]
	],
	4: [ # o button
		["thing_56|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_56|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["o|36|0.11|1.0"]
	],
	5: [ # i button
		["thing_57|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_57|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["i|36|0.11|1.0"]
	],
	6: [ # u button
		["thing_58|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_58|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["u|36|0.11|1.0"]
	],
	7: [ # y button
		["thing_59|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_59|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["y|36|0.11|1.0"]
	],
	8: [ # l button
		["thing_60|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_60|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["l|36|0.11|1.0"]
	],
	9: [ # k button
		["thing_61|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_61|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["k|36|0.11|1.0"]
	],
	10: [ # j button
		["thing_62|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_62|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["j|36|0.11|1.0"]
	],
	11: [ # h button
		["thing_63|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_63|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["h|36|0.11|1.0"]
	],
	12: [ # undo button
		["thing_64|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_64|keyboard_right_container|instruction_set_5"],
		["-0.69,-0.58,0|0.69,-0.58,0|0.69,0.58,0|-0.69,0.58,0"],
		["undo|36|0.11|1.0"]
	],
	13: [ # m button 
		["thing_65|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_65|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["m|36|0.11|1.0"]
	],
	14: [ # n button 
		["thing_66|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_66|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["n|36|0.11|1.0"]
	],
	15: [ # b button 
		["thing_67|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_67|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["b|36|0.11|1.0"]
	],
	16: [ # g button 
		["thing_68|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_68|keyboard_right_container|instruction_set_5"],
		["-0.44,-0.58,0|0.44,-0.58,0|0.44,0.58,0|-0.44,0.58,0"],
		["g|36|0.11|1.0"]
	],
	17: [ # return button 
		["thing_69|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_69|keyboard_right_container|instruction_set_5"],
		["-0.69,-0.58,0|0.69,-0.58,0|0.69,0.58,0|-0.69,0.58,0"],
		["return|36|0.11|1.0"]
	],
	18: [ # return button 
		["thing_70|0.0,0.0,0.0|0.0,0.0,0.0|button|menu|keyboard_right_container|keyboard_right_container/thing_70|keyboard_right_container|instruction_set_5"],
		["-1.73,-0.58,0|1.73,-0.58,0|1.73,0.58,0|-1.73,0.58,0"],
		["bar     |36|0.11|1.0"]
	]
}



# things creation stuff
const records_map_7 = {
	0: [ # container
		["thing_71|0.0,0.0,0.0|0.0,0.0,0.0|container|things_creation|main|things_creation_container|containers|instruction_set_6"],
		["things_creation_container"]
	],
	1: [ # datapoint
		["thing_72|0.0,0.0,0.0|0.0,0.0,0.0|datapoint|1|things_creation_container|things_creation_container/thing_72|datapoints|instruction_set_6"],
		["100"]
	],
	2:[ # screen
		["thing_73|0.0,0.0,0.0|0.0,0.0,0.0|screen|12:9|things_creation_container|things_creation_container/thing_73|things_creation_container|instruction_set_6"],
		["-6,-4.5,0|6,-4.5,0|6,4.5,0|-6,4.5,0"],
		["0.033|0.69"]
	],
	3:[ # model smaller
		["thing_74|0.0,0.0,0.0|0.0,0.0,0.0|model|square|things_creation_container|things_creation_container/thing_74|things_creation_container|instruction_set_6"],
		["-1,-0.25,0|1,-0.25,0|1,0.25,0|-1,0.25,0"],
		["0.066|0.88"]
	],
	4:[ # model bigger
		["thing_75|0.0,0.0,0.0|0.0,0.0,0.0|model|square|things_creation_container|things_creation_container/thing_75|things_creation_container|instruction_set_6"],
		["-3,-0.25,0|3,-0.25,0|3,0.25,0|-3,0.25,0"],
		["0.066|0.88"]
	]
}


const records_map_8 = {
	0:[ # container
		["thing_0|0.0,0.0,0.0|0.0,0.0,0.0|container|singular_lines|main|singular_lines_container|containers|instructions_set_7"],
		["singular_lines_container"]
	],
	1: [ # data_point
		["thing_1|0.0,0.0,0.0|0.0,0.0,0.0|datapoint|0|singular_lines_container|singular_lines_container/thing_1|datapoints|instructions_set_7"],
		["100"]
	],
	2:[ # model smaller
		["thing_2|0.0,0.0,0.0|0.0,0.0,0.0|model|square|singular_lines_container|singular_lines_container/thing_2|singular_lines_container|instructions_set_7"],
		["-1,-0.25,0|1,-0.25,0|1,0.25,0|-1,0.25,0"],
		["0.066|0.88"]
	],
	3:[ # model bigger
		["thing_3|0.0,0.0,0.0|0.0,0.0,0.0|model|square|singular_lines_container|singular_lines_container/thing_3|singular_lines_container|instructions_set_7"],
		["-3,-0.25,0|3,-0.25,0|3,0.25,0|-3,0.25,0"],
		["0.066|0.88"]
	],
	4: [ # Text
		["thing_4|0.0,0.0,0.0|0.0,0.0,0.0|text|square|singular_lines_container|singular_lines_container/thing_4|singular_lines_container|instructions_set_7"],
		["text|33"]
	],
	5: [ # Text
		["thing_5|0.0,0.0,0.0|0.0,0.0,0.0|text|square|singular_lines_container|singular_lines_container/thing_5|singular_lines_container|instructions_set_7"],
		["text|33"]
	]
}
