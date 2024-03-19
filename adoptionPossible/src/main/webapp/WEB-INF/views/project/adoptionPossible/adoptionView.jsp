<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<style>
	.card {
    border: 1px solid #ddd;
    border-radius: 8px; /* 카드의 모서리를 둥글게 만듭니다 */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과를 추가합니다 */
    background-color: #fff; /* 카드의 배경색을 설정합니다 */
    margin-bottom: 20px; /* 카드 사이에 여백을 추가합니다 */
    transition: all 0.3s ease;
}

.card:hover {
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2); /* 마우스 호버 시 그림자 효과를 더 크게 만듭니다 */
    transform: translateY(-2px); /* 마우스 호버 시 약간 떠오르는 효과를 추가합니다 */
}

.card img {
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
}

.card-body {
    padding: 20px;
}

.card-title {
    font-weight: bold;
    font-size: 1.2rem;
    margin-bottom: 10px;
}

.card-text {
    font-size: 1rem;
    margin-bottom: 5px;
}

.species,
.kg,
.gender {
    margin-bottom: 0;
}
	
</style>
<body>
    <div class="container">
        <div class="text-center">
            <h3>입양 가능 동물 리스트</h3>
        </div>
        <div id="animalSearch" class="text-right"></div>

        <div id="apList">
            <div class="row">
                <c:choose>
                    <c:when test="${not empty apList}">
                        <c:forEach var="animal" items="${apList}" varStatus="status">
                            <div class="col-md-4 mb-4 ">
                                <div class="card">
                                    <img src="<c:if test='${not empty animal.animalFile}'>/uploadStorage/animal/${animal.animalFile}</c:if>
                                         <c:if test='${empty animal.animalFile}'>/resources/images/common/noanimal11.png</c:if>"
                                       class="card-img-top l"  alt="Animal Image">
                                    <div class="card-body">
                                        <table>
                                        	<tr class = "text-center id" data-num="${animal.animalId}">
				
											
                                        	<tr >
                                        		 <td class="goDetail">
    												<a href="/ap/apDetail?animalId=${animal.animalId}">${animal.animalName}</a>
												</td>
                                        	</tr>
                                        	<tr >
                                        		<td> <p class="card-text species">${animal.animalSpecies}</p></td>
                                        	</tr>
                                        	<tr>
                                        		<td> <p class="card-text kg">${animal.animalKg}</p></td>
                                        	</tr>
                                        	<tr>
                                        		<td><p class="card-text gender">${animal.animalGender}</p></td>
                                        	</tr>
                                        	
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col-md-12 text-center">
                            <p>등록된 게시물이 존재하지 않습니다.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <jsp:include page="weather.jsp" />
    </div>
   <script src="/resources/include/js/ap/apList.js"></script>
</body>

