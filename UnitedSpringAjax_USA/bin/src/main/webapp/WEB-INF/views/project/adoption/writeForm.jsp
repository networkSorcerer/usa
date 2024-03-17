<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<body>
    <div class="container">
        <div class="text-center">
            <h3>입양 공고 입력화면</h3>
        </div>
        <form id="f_writeForm">
            <div class="mb-3 row">
                <label for="adoptionTitle" class="col-sm-2 col-form-label">공고 제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="adoptionTitle"
                        name="adoptionTitle" placeholder="공고 제목을 입력하세요."
                        data-type="CDATA">
                </div>
            </div>
             <div class="mb-3 row">
                <label for="adoptionContent" class="col-sm-2 col-form-label">공고 내용</label>
                <div class="col-sm-10">
                    <textarea name="adoptionContent" id="adoptionContent"
                        class="form-control" rows="5"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="adoptionLevel" class="col-sm-2 col-form-label">공고 레벨</label>
                <div class="col-sm-10">
                    <select name="adoptionLevel" id="adoptionLevel"
                        class="form-control" >
                    	<option>1. 상</option>
                    	<option>2. 중</option>
                    	<option>3. 하</option>
                    </select>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="adoptionStatus" class="col-sm-2 col-form-label">공고 상태</label>
                <div class="col-sm-10">
                    <select name="adoptionStatus" id="adoptionStatus"
                        class="form-control" >
                    	<option>1. 공고 중</option>
                    	<option>2. 상담 중</option>
                    	<option>3. 입양 완료</option>
                    </select>
                </div>
            </div>
            
            <div class="mb-3 row">
                <label for="adoptionPasswd" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="adoptionPasswd"
                        name="adoptionPasswd" placeholder="비밀번호를 입력하세요." maxlength="16">
                </div>
            </div>
             <div class="mb-3 row">
                <label for="file" class="col-sm-2 col-form-label">첨부파일</label>
                <div class="col-sm-10">
                    <input type="file" class="form-control" id="file" name="file" >
                </div>
            </div>      
        </form>
        <div class="text-end">
                <button type="button" class="btn btn-primary" id="adoptionInsertBtn">저장</button>
                <button type="button" class="btn btn-secondary" id="adoptionCancelBtn">취소</button>
                <button type="button" class="btn btn-success" id="adoptionListBtn">목록</button>
        </div>
    </div>
    <script src="/resources/include/js/adoption/writeForm.js"></script>
    <script>
    $(function(){
    	let errorMsg = "${errorMsg}";
    	if(errorMsg != "") {
    		alert(errorMsg);
    		errorMsg ="";
    	}
    });
    </script>
</body>