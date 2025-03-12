extends RefCounted

class_name GameData

var id: int
var titulo: String
var review: String

# Construtor
func _init(id_: int, titulo_: String, review_: String):
	id = id_
	titulo = titulo_
	review = review_

# Serialização para JSON
func to_dict() -> Dictionary:
	return {
		"id": id,
		"titulo": titulo,
		"review": review
	}

# Criar objeto a partir de um dicionário
static func from_dict(data: Dictionary) -> GameData:
	return GameData.new(data.get("id", 0), data.get("titulo", ""), data.get("review", ""))
