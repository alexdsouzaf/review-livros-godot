extends VBoxContainer

func _on_btn_adicionar_pressed() -> void:
	print("click")
	Interfaces.acao_adicionar.emit()
