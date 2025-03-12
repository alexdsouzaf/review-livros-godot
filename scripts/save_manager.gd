extends Node
# TODO: VALIDAR SE FUNCIONA PQ FOI O GPT QUE FEZ
class_name SaveManager

const SAVE_PATH := "user://save_data.json"
var data_list: Array[GameData] = []

# Método para salvar os dados no arquivo JSON
func save_data():
	var json_array: Array = []
	for item in data_list:
		json_array.append(item.to_dict())

	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(json_array, "\t"))
	file.close()

# Método para carregar os dados do arquivo JSON
func load_data():
	if not FileAccess.file_exists(SAVE_PATH):
		save_data() #inicializa se nao existe

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var content := file.get_as_text()
	file.close()

	var json = JSON.new()
	var error = json.parse(content)
	if error == OK:
		var data_array = json.data
		if data_array is Array:
			data_list.clear()
			for entry in data_array:
				data_list.append(GameData.from_dict(entry))

# Criar um novo item e adicioná-lo à lista
func cadastrar(id: int, titulo: String, review: String):
	#TODO tem que fazer o controle da numeracao do id
	data_list.append(GameData.new(id, titulo, review))
	save_data()

# Ler um item pelo ID
func get_by_id(id: int) -> GameData:
	for item in data_list:
		if item.id == id:
			return item
	return null

# Atualizar um item pelo ID
func alterar(id: int, new_titulo: String, new_review: String) -> bool:
	for item in data_list:
		if item.id == id:
			item.titulo = new_titulo
			item.review = new_review
			save_data()
			return true
	return false

# Deletar um item pelo ID
func remover(id: int) -> bool:
	for i in range(data_list.size()):
		if data_list[i].id == id:
			data_list.remove_at(i)
			save_data()
			return true
	return false
