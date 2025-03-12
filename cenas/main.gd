extends Control

var componente_cadastro = preload("res://componentes/v_box_container-review-cadastro.tscn")
@export var panel_inclusao : PanelContainer
@export var container_listagem : VBoxContainer

func _ready() -> void:
	_consultar()
	Interfaces.acao_adicionar.connect(self._adicionar)
	Interfaces.acao_consultar.connect(self._consultar)


func _consultar():
	print("consultar")
	var resultados = saveManager.load_data()
	
	for item in resultados:
		var instancia = componente_cadastro.instantiate() as ComponenteCadastroReview
		instancia.registro = item
		instancia.enumerado_modo = 2
		container_listagem.add_child(instancia)

func _adicionar():
	var instancia = componente_cadastro.instantiate() as ComponenteCadastroReview
	instancia.custom_minimum_size.x = 650
	instancia.enumerado_modo = 0
	panel_inclusao.add_child(instancia)
