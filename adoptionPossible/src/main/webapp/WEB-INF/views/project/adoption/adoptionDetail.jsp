<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<body>
	<div class="container">
		<div class="text-center"><h3>입양 공고 상세 목록</h3></div>
		
		<div class="row text-center mb_2">
			<div id="pwdChk" class="col-md-9 text-start">	
				<form name="f_passwdCheck" id="f_passwdCheck" class="row g-3">
					<input type="hidden" name="adoptionId" value="${detail.adoptionId }"/>
					<div class="col-auto">
						<label for="adoptionPasswd" class="visually-hidden">비밀번호</label>
						<input type="password" class="form-control" name="adoptionPasswd" id="adoptionPasswd" placeholder="비밀번호 입력" />
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-secondary btn-sm" id="passwdBtn">확인</button>
						<button type="button" class="btn btn-secondary btn-sm" id="passwdCancelBtn">취소</button>
					</div>
					<div class="col-auto">
						<span id="message" class="align-middle"></span>
					</div>
				</form>				
			</div> 
			

			<div class="col-md-10 text-end">
				<button type="button" id="updateFormBtn" class="btn btn-success btn-sm">글수정</button>
				<button type="button" id="DeleteBtn" class="btn btn-success btn-sm">글삭제</button>
				<button type="button" id="insertFormBtn" class="btn btn-success btn-sm">글쓰기</button>
				<button type="button" id="adoptionListBtn" class="btn btn-success btn-sm">목록</button>
			</div>
		</div>
		
		<form name="f_data" id="f_data">
			<input type="hidden" name="animalId" value="${detail.animalId }"/>
			<input type="hidden" name="animalFile" id="animalFile" value="${detail.animalFile}"/>
		</form>
		
		
		<div class="text-center">
			<table class="table table-bordered">
				<thead>
					<tr>
						
						<td class="col_3">동물 ID</td>
						<td>${detail.animalId }</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">
							<table class="table mb-0">
								
								<tr>
									<c:if test="${not empty detail.animalFile }">		
										<td class="text-start" rowspan="9">
											<img src="/uploadStorage/animal/${detail.animalFile }" class="rounded" width="300px"/>
										</td>		
									</c:if>
									<td class="col-3">이름</td>
									<td class="text-start">${detail.animalName }</td>
								</tr>
								<tr>
									<td>분류</td>
									<td class="text-start">${detail.animalSpecies }</td>
								</tr>
								<tr>
									<td>성별</td>
									<td class="text-start">${detail.animalGender }</td>
								</tr>
								<tr>
									<td>무게</td>
									<td class="text-start">${detail.animalKg }</td>
								</tr>
								<tr>
									<td>나이</td>
									<td class="text-start">${detail.animalAge }</td>
								</tr>
								<tr>
									<td>색깔</td>
									<td class="text-start">${detail.animalColor }</td>
								</tr>
								<tr>
									<td>중성화 유무</td>
									<td class="text-start">${detail.animalStatus }</td>
								</tr>
								<tr>
									<td>특이사항</td>
									<td class="text-start">${detail.animalMemo }</td>
								</tr>
								<tr>
									<td>임시보호 유무</td>
									<td class="text-start">${detail.animalTemp }</td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			
		<form name="f_data" id="f_data">
			<input type="hidden" name="adoptionId" value="${detail.adoptionId }"/>
			<input type="hidden" name="adoptionFile" id="adoptionFile" value="${detail.adoptionFile}"/>
		</form>
		
		<div class="text-center">
			<table class="table table-bordered">			
					<tr>
						<td colspan="4">
							<table class="table mb-0">		
								<tr>
									<td class="col-3">공고 제목</td>
									<td class="text-start">${detail.adoptionTitle }</td>
								</tr>
								<tr>
									<td>공고 내용</td>
									<td class="text-start">${detail.adoptionContent }</td>
								</tr>
								<tr>
									<td>공고 레벨</td>
									<td class="text-start">${detail.adoptionLevel }</td>
								</tr>
								<tr>
									<td>공고 상태</td>
									<td class="text-start">${detail.adoptionStatus }</td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<jsp:include page="../map/mapList.jsp" />	
	</div>	
	</div>
	<script src="/resources/include/js/adoption/adoptionDetail.js"></script>		
</body>
</html>