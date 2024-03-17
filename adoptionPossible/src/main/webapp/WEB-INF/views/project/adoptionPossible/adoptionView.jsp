<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
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
				
												<td class="id">${animal.animalId}</td>
                                        	<tr >
                                        		<td class="goDetail">
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
                                        	<tr>
                                        		<td> <p class="card-text temp0">${animal.animalTemp}</p></td>
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
    </div>
   <script src="/resources/include/js/ap/apList.js"></script>
</body>

