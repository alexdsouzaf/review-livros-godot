extends Tree

func _ready():
	var label = Label.new()
	var label2 = Label.new()
	label.text = "label item 1"
	label2.text = "label item 2"
	var child1 = create_item()
	child1.add_child(label)
	var child2 = create_item()
	child2.add_child(label2)
	#var subchild1 = create_item(child1)
	#subchild1.set_text(0, "Subchild1")

#func _ready():
	#var tree = Tree.new()
	#var root = tree.create_item()
	#tree.hide_root = true
	#var child1 = tree.create_item(root)
	#var child2 = tree.create_item(root)
	#var subchild1 = tree.create_item(child1)
	#subchild1.set_text(0, "Subchild1")
