extends Node

class_name SaveManager

const SAVE_PATH := "user://save_data.json"
var data_list: Array[GameData] = []

# Método para salvar os dados no arquivo JSON
#TODO ta replicando registros na alteracao
func save_data():
	var json_array: Array = []
	for item in data_list:
		json_array.append(item.to_dict())

	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(json_array, "\t"))
	file.close()

# Método para carregar os dados do arquivo JSON
func load_data(pFiltroTexto:String) -> Array[GameData]:
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
	
	if pFiltroTexto == "":
		return data_list
	
	var retorno = data_list.filter(func(item): 
		return pFiltroTexto.to_lower() in item.titulo.to_lower()
	)
	
	#conversao da constante Array para um Array com tipo
	var array_of_game_data: Array[GameData]
	array_of_game_data.assign(retorno)
	
	return array_of_game_data

# Criar um novo item e adicioná-lo à lista
func cadastrar(titulo: String, review: String):
	var primary_key = data_list.size() + 1 if data_list.size() != 0 else 1 
	data_list.append(GameData.new(primary_key, titulo, review))
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
