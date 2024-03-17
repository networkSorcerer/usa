let buttonCheck = 0;
$(function(){
	$("#pwdChk").css("visibility","hidden");
	
	let btnInit = function() {
		$("#message").removeClass("text-danger");
		$("#message").addClass("text-primary");
		$("#message").text("작성시 입력한 비밀번호를 입력해 주세요");
	}
	$("#updateFormBtn").on("click", ()=>{
		/*$("#f_data").attr({
			"method":"get",
			"action":"/board/updateForm"
		});
		$("#f_data").submit();*/
		$("#pwdChk").css("visibility", "visible");
		btnInit();
		buttonCheck ="updateButton";
	});
	
	
	//삭제 버튼 클릭시 처리 이벤트
	$("#DeleteBtn").on("click", () => {
    // 사용자에게 확인 메시지 보여주기
   
	 const confirmDelete = confirm("정말로 삭제하시겠습니까?");
    // 확인이 true인 경우에만 삭제 진행
    if (confirmDelete) {
        $("#f_data").attr({
            "method": "post",
            "action": "/adoption/adoptionDelete"
        });
        $("#f_data").submit();

        $("#pwdChk").css("visibility", "visible");
        btnInit();
        buttonCheck = "deleteButton";
    }
});

	/*
	//삭제 버튼 클릭시 댓글 확인 후 처리 이벤트
	$("#DeleteBtn").on("click", ()=> {
		$.ajax({
			type : "post",
			data : "adoptionId=" + $("#adoptionId").val(),
			dataType : "text",
			error : function() {
				alert('시스템에 문제가 있어 잠시 후 다시 진행해 주세요');
			},
			success : function(resultData) {
				if(resultData==="0"){
					$("#pwdChk").css("visibility", "visible");
					btnInit();
					buttonCheck = "deleteButton";
				}else {
					alert("등록된 동물이 있을 시 삭제 할수 없습니다");
					return;
				}
			}
		});
	});*/
	
	$("#adoptionPasswd").bind("keydown", function(event){
		if(event.keyCode === 13) {
			event.preventDefault();
		}
	});
	
	$("#adoptionPasswd").on("keyup", ()=>{
		btnInit();
	});
	
	$("#passwdCancelBtn").on("click", function(){
		$("#adoptionPasswd").val("");
		$("#pwdChk").css("visibility", "hidden");
		buttonCheck = "";
	});

	
	$("#passwdBtn").on("click", function(){
		$.ajax({
			url : "/adoption/pwdConfirm",
			type : "post",
			data : $("#f_passwdCheck").serialize(),
			dataType : "text",
			error : function(){
				alert('시스템 오류입니다 . 관리자에게 문의 하세요');
			},
			beforeSend: function(){
				if(!dataCheck("#adoptionPasswd", "#message", "비밀번호를")) return false;
			},
			success : function(resultData) {
				if(resultData == "불일치") {
					$("#message").addClass("text-danger");
					$("#message").text("작성시 입력한 비밀번호가 일치하지 않습니다");
					$("#adoptionPasswd").select();
				}else if (resultData == "일치") {
					$("#message").text("");
					if(buttonCheck=="updateButton") {
						actionProcess("get", "/adoption/updateForm");
					}else if (buttonCheck=="deleteButton") {
						if(confirm("정말 삭제하시겠습니까?")) {
							actionProcess("post", "/adoption/adoptionDelete");
						}
					}
				}
			}
		});
	});
	
	$("#insertFormBtn").click(function(){
		location.href = "/adoption/writeForm";
	});
	
	$("#adoptionListBtn").click(function(){
		location.href="/adoption/adoptionList";
	});
})

function actionProcess(method, goUrl) {
	$("#f_data").attr({
		"method":method,
		"action":goUrl
	});
	$("#f_data").submit();
}