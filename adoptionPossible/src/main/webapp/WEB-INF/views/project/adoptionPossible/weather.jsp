<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	#banner-container {
    position: fixed;
    top: 0;
    bottom: 100px;
    left: -300px; /* ��ʰ� ������ ���� ��ġ */
    width: 300px;
    height: 100%;
    background-color: #f0f0f0;
    transition: left 0.3s ease;
    z-index: 9999;
}

#banner-content {
    padding: 20px;
}
#toggle-btn {
    position: fixed;
    top: 160px;
    left: 0;
    width: 60px; /* ��ư�� �ʺ� ���� */
    height: 90px; /* ��ư�� ���� ���� */
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
    z-index: 10000; /* �ٸ� ��� ���� ǥ�õǵ��� z-index ���� */
    padding: 10px; /* �ؽ�Ʈ ����� ��ư�� ���� ���� */
    box-sizing: border-box; /* padding�� width�� height�� ���Եǵ��� ���� */
    line-height: 1.5; /* �ؽ�Ʈ �� ���� ���� */
    border-top-right-radius: 25px;
    border-bottom-right-radius: 25px;
}

#toggle-btn:hover {
    background-color: #0056b3;
}
#banner-content img {
    max-width: 100%; /* �̹����� �ִ� �ʺ�� �θ� ����� #banner-content�� �ʺ� ���߾����ϴ�. */
    max-height: 100%; /* �̹����� �ִ� ���̵� �θ� ��ҿ� ���߾����ϴ�. */
}	
</style>
<body>

<div id="banner-container">
    <div id="banner-content">
    	</br>
    	</br>
        <button class="button" type="button">���� ������?</button>
        <img src="/resources/images/walk.jpg">
		<dl>
			<dt>���</dt>
			<dd class="temperature"></dd> <!-- ����: class �Ӽ� ���� -->
			<dt>��ġ</dt>
			<dd class="place"></dd> <!-- ����: class �Ӽ� ���� -->
			<dt>����</dt>
			<dd class="description"></dd>
		</dl>
		<img class="icon"/>
        
       
    </div>
</div>
	 <button id="toggle-btn">����<br>��å<br>����</button>
	<script src="/resources/include/js/weather/weather.js"></script>
</body>
</html>
