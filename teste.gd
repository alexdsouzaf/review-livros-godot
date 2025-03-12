extends Control

@onready var tree = $Tree

func _ready():
	tree.columns = 1  # Número de colunas

	var root = tree.create_item()  # Cria a raiz
	tree.set_hide_root(true)  # Esconde a raiz (opcional)

	var parent_item = tree.create_item(root)  # Primeiro item visível
	parent_item.set_text(0, "Categoria A")  # Texto da primeira coluna

	parent_item.set_expand_right(true)  # Permite expandir para a direita
	parent_item.collapsed = false  # Garante que começa expandido

	var child_item = tree.create_item(parent_item)  # Item filho
	child_item.set_text(0, "Subitem 1")


	var another_child = tree.create_item(parent_item)
	another_child.set_text(0, "Subitem 2")
