extends VBoxContainer
#TODO tem que fazer a consulta funcionar

@export var input : LineEdit

func _on_btn_adicionar_pressed() -> void:
	Interfaces.acao_adicionar.emit()


func _on_btn_pesquisar_pressed() -> void:
	Interfaces.acao_consultar.emit(input.text)


func _on_btn_limpar_campo_pressed() -> void:
	input.text = ""
