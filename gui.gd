extends CanvasLayer


func update_ActivityLabel(new_text):
	$CenterContainer/ActivityLabel.text = str(new_text)


func update_MissionLabel(new_text):
	$MissionLabel.text = str(new_text)


func update_StaminaBar(stamina):
	$StaminaBar.value = stamina
