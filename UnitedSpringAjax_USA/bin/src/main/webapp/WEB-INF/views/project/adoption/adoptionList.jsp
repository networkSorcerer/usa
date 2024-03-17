<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>

<body>
	<div class ="container">
		<div class="text-center"><h3>입양 공고 리스트</h3></div>
		
		<form id="detailForm">
			<input type="hidden" id="adoptionId" name="adoptionId"/>
		</form>
		
		<div id="adoptionSearch">
		    <form id="f_search" name="f_search">
		        <div class="row g-2 align-items-center">
		            <label for="search">검색조건</label>
		        </div>
		        <div class="col-auto">
		            <select id="search" name="search" class="form-select form-select-sm" >
		                <option value="all">전체 목록 조회</option>
		                <option value="adoption_id">공고 ID</option>
		                <option value="adoption_title">공고 제목</option>
		                <option value="adoption_level">공고 레벨</option>
		                <option value="adoption_temp">공고 상태</option>
		            </select>
		        </div>
		        <div class="col-auto">
		            <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control form-control-sm" />
		        </div>
		        <div class="col-auto">
		            <button type="button" id="searchData" class="btn btn-success btn-sm">검색</button>
		        </div>
		    </form>
		</div>

		
		<div id="adoptionSearch" class="text-right"></div>
		
		<div id="adoptionList">
			<table summary="게시판 리스트" class="table table-striped">
				<thead>
					<tr class="text-center">
						<th class="col-md-1">공고 ID</th>
						<th class="col-md-1">공고 제목</th>		
						<th class="col-md-1">공고 레벨</th>
						<th class="col-md-1">공고 상태</th>
						<th class="col-md-2">작성일</th>
						<th class="col-md-1">조회수</th>
					</tr>
				</thead>
				<tbody id="list">
					<c:choose>
						<c:when test="${not empty adoptionList }">
							<c:forEach var="adoption" items="${adoptionList }" varStatus="status">
								<tr class = "text-center id" data-num="${ adoption.adoptionId}">
									
									<td class="id">${adoption.adoptionId}</td>
									<%-- <td>
										<c:if test="${not empty adoption.adoptionFile }">
											<img src="/uploadStorage/adoption/${adoption.adoptionFile}"
											class="rounded w-50 h-50"/>
										</c:if>
										<c:if test="${empty adoption.adoptionFile }">
											<img src="/resources/images/common/noimage.jpg"
											class="rounded w-100 h-100"/>
										</c:if>
									</td> --%>
									<td class="goDetail text-start">
									${adoption.adoptionTitle}
									</td>
									<td class="adoptionLevel">${adoption.adoptionLevel }</td>
									<td class="aoptionStatus">${adoption.adoptionStatus }</td>
									<td class="adoptionDate">${adoption.adoptionDate}</td>
									<td class ="adoptionCnt">${adoption.adoptionCnt }</td>
									
							</c:forEach>
						</c:when>
						<c:otherwise>
						<tr>
							<td colspan="5" class ="text-center">등록된 게시물이 존재하지 않습니다</td>
						</tr>
						</c:otherwise>
					</c:choose>	
				</tbody>
			</table>
		</div>
		
		<div class = "text-end">
			<button type="button" id="insertFormBtn" class ="btn btn-success btn-sm">새로 등록 하기</button>
		</div>		
	</div>
	<script src="/resources/include/js/adoption/adoptionList.js"></script>
	<script>
		$(function(){
			/* 검색 후 검색 대상과 검색 단어 출력 */
			let word="<c:out value='${adoptionVO.keyword}' />";
			let value="";
			if(word!=""){
				$("#keyword").val("<c:out value='${adoptionVO.keyword}' />");
				$("#search").val("<c:out value='${adoptionVO.search}' />");
			
				if($("#search").val()!='adoption_date'){
					//:contains()는 특정 텍스트를 포함한 요소반환 	
					if($("#search").val()=='adoption_id') value = "#list tr td.id";
					else if($("#search").val()=='adoption_title') value="#list tr td.goDetail";
					else if($("#search").val()=='adoption_level')value="#list tr td.adoptionLevel"
					else if($("#search").val()=='adoption_status')value="#list tr td.adoptionStatus"
					console.log($(value+":contains('"+word+"')").html());
					//$("#list tr td.goDetail:contains('노력')").html()  => <span class='required'>노력</span>에 대한 명언
			    	$(value+":contains('"+word+"')").each(function () {
						let regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
			    	});
				}
			}
		});	
</script>
</body>
