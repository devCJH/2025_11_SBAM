const submitFormChk = function(form) {
	form.title.value = form.title.value.trim();
	form.content.value = form.content.value.trim();
	
	if (form.title.value.length == 0) {
		alert('제목을 입력해주세요');
		form.title.focus();
		return false;
	}
	
	if (form.content.value.length == 0) {
		alert('내용을 입력해주세요');
		form.content.focus();
		return false;
	}
	
	return true;
}
