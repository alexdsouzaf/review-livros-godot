extends VBoxContainer

@export var panel_inclusao : PanelContainer

var componente_cadastro = preload("res://componentes/v_box_container-review-cadastro.tscn")

func _on_btn_adicionar_pressed() -> void:
	var instancia = componente_cadastro.instantiate() as ComponenteCadastroReview
	instancia.inclusao = true
	instancia.custom_minimum_size.x = 650
	instancia.enumerado_modo = 0
	panel_inclusao.add_child(instancia)
