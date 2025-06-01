extends Control


func _on_save_pressed() -> void:
	print('Saving')
	var img: Image = $SubViewportContainer/SubViewport.get_texture().get_image()
	if OS.get_name() == "Web":
		var buf = img.save_jpg_to_buffer(0.8)
		JavaScriptBridge.download_buffer(buf,"Grid_" + Time.get_date_string_from_system() + "_" + Time.get_time_string_from_system().replace(":", "-") + ".jpg")
	else:
		img.save_jpg(OS.get_system_dir(OS.SYSTEM_DIR_PICTURES) + "/Grid_" + Time.get_date_string_from_system() + "_" + Time.get_time_string_from_system().replace(":", "-") + ".jpg", 0.75)
	$Save.text = "Saved"
	await get_tree().create_timer(3).timeout
	$Save.text = "Save Image"
