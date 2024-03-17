$(function(){
	$("#adoptionUpdateBtn").on("click", function(){
		if(!chkData("#adoptionTitle","공고 제목을")) return;
		else if (!chkData("#adoptionContent", "공고 내용을")) return;
		else if (!chkData("#adoptionLevel", "공고 레벨을")) return;
		else if (!chkData("#adoptionStatus", "공고 상태를")) return;
		else if (!chkData("#adoptionPasswd", "비밀번호를")) return;
		else {
			if($("#file").val()!=""){
				if(!chkFile($("#file")))return;
			}
			$("#f_updateForm").attr({
				"method":"post",
				"enctype":"multipart/form-data",
				"action":"/adoption/adoptionUpdate"
			});
			$("#f_updateForm").submit();
		}
	});
	
	$("#adoptionCancelBtn").on("click", function(){
		$("#f_updateForm").each(function(){
			this.reset();
		});
	});
	
	$("#adoptionListBtn").on("click", function(){
		location.href="/adoption/adoptionList";
	});
});