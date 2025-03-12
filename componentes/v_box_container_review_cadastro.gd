extends VBoxContainer
class_name ComponenteCadastroReview

#TODO PRECISO IMPLEMENTAR TODA A LOGICA DE CRUD

@export var inclusao : bool = false
@export var edicao : bool = false
@export var visualizacao : bool = false

@export var button_editar : Button
@export var button_gravar : Button
@export var button_cancelar : Button
@export var button_remover : Button

@export var input_titulo : LineEdit
@export var input_review : TextEdit
@export var button_titulo : Button

@export var box_container : BoxContainer

@export var enumerado_modo : modosEnum

var registro : GameData

enum modosEnum {
	inclusao=0,
	alteracao=1,
	visualizacao=2
}

func _ready() -> void:
	_atualizar_visibilidades()

func _atualizar_visibilidades():
	match enumerado_modo:
		modosEnum.inclusao:
			_modo_inclusao()
		modosEnum.alteracao:
			_modo_alteracao()
		modosEnum.visualizacao:
			_modo_visualizacao()

func _modo_inclusao():
	button_gravar.visible = true
	button_cancelar.visible = true
	button_remover.visible = false
	input_titulo.visible = true
	button_titulo.visible = false
	input_review.visible = true
	input_review.editable = true
	box_container.visible = true


func _modo_alteracao():
	button_gravar.visible = true
	button_cancelar.visible = true
	button_remover.visible = true
	input_titulo.visible = true
	button_titulo.visible = false
	input_review.visible = true
	input_review.editable = true
	box_container.visible = true


func _modo_visualizacao():
	button_gravar.visible = false
	button_cancelar.visible = false
	button_remover.visible = false
	input_titulo.visible = false
	button_titulo.visible = true
	input_review.visible = false
	input_review.editable = false
	box_container.visible = false

# Esse botao eh responsavel pelo efeito de "expandir/retrair"
# que nesse caso nao tem efeito, soh aparece e desaparece
func _on_button_pressed() -> void:
	input_review.visible = !input_review.visible
	box_container.visible = !box_container.visible
	button_editar.visible = !button_editar.visible

# a acao de cancelar deve: ou destruir o componente na inclusao, ou sair do modo de alteracao na listagem
func _on_button_cancelar_pressed() -> void:
	if inclusao:
		queue_free()
	else:
		enumerado_modo = modosEnum.visualizacao
		_atualizar_visibilidades()

# TODO: destruir o componente na listagem e remover do save
func _on_button_remover_pressed() -> void:
	saveManager.remover(0)
	
	queue_free()

# TODO: destruir o componente na inclusao e salvar
func _on_button_gravar_pressed() -> void:
	if inclusao:
		saveManager.cadastrar(0,input_titulo.text,input_review.text)
		queue_free()
	else:
		enumerado_modo = modosEnum.visualizacao
		_atualizar_visibilidades()

func _on_button_editar_pressed() -> void:
	enumerado_modo = modosEnum.alteracao
	_atualizar_visibilidades()
