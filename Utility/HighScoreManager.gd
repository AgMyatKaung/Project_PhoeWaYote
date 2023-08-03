#extends Node
#
#const HIGH_SCORE_FILE = "data.txt"
#var highScores = []
#var scoreManager
#
#func _ready():
#	scoreManager = get_node("/root/Score") # Replace with the path to your autoloaded ScoreManager
#	load_high_scores()
#
#	# Example: Update score
#	var newScore = scoreManager.getScore()
#	if is_high_score(newScore):
#		var playerName = "Player"
#		save_high_score(newScore, playerName)
#		save_high_scores()
#		print("New high score saved!")
#	display_high_scores()
#
#func load_high_scores():
#	if FileAccess.file_exists(HIGH_SCORE_FILE):
#		var file = FileAccess
#		file.open(HIGH_SCORE_FILE, FileAccess.READ)
#		while not file:
#			var line = file
#			var scoreData = line.split(":")
#			var score = scoreData[0].to_int()
#			var playerName = scoreData[1]
#			highScores.append({"score": score, "playerName": playerName})
#		file
#
#func save_high_scores():
#	var file = FileAccess
#	file.open(HIGH_SCORE_FILE, FileAccess.WRITE)
#	for scoreData in highScores:
#		file.file_exists(scoreData["score"] + ":" + scoreData["playerName"] + "\n")
#	file
#
#func is_high_score(score):
#	if highScores.is_empty():
#		return true
#
#	var lowestScore = highScores[highScores.size() - 1]["score"]
#	return score > lowestScore
#
#func save_high_score(score, playerName):
#	highScores.append({"score": score, "playerName": playerName})
#	highScores.sort(lambda(a, b) -> int:
#		return b["score"] - a["score"])
#
#
#	if highScores.size() > 10: # Limit to top 10 scores
#		highScores.resize(10)
#	display_high_scores()
#
#func _sort_scores(a, b):
#	return b["score"] - a["score"]
#
#func display_high_scores():
#	for scoreData in highScores:
#		print(scoreData["score"], scoreData["playerName"])
#
#
