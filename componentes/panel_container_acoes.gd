extends VBoxContainer

func _on_btn_adicionar_pressed() -> void:
	Interfaces.acao_adicionar.emit()


func _on_btn_pesquisar_pressed() -> void:
	Interfaces.acao_consultar.emit()
