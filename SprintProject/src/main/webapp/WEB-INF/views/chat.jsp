<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String userid = (String) request.getParameter("mid");
    	System.out.print("chat.jsp" + userid);
    
    %>
    
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단한 채팅 프로그램</title>

</head>
<body>
<link rel="stylesheet" href="resources/css/chatting.css">

	<div class="wrapper">
		<div class="user-container">
			<label for="nickname">대화명</label>
			<input type="text" id="nickname">
			<span id="userid">유저 아이디: <%=userid %></span>
		</div>
		<div class="display-container">
			<ul class="chatting-list">
			</ul>
		</div>
		<div class="input-container">
			 <span>
				<input type="text" class="chatting-input">
				<button class="send-button">전송</button>
			 </span>
		</div>
	</div>

<!-- 
<input type="text" id="msg" value="1212">
<button id="btnSend">test</button> -->






<script src="resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">


	$(function() {
		
		// onload 후에 접속 시도하기.. 
		connect();
		
		const sendButton = document.querySelector(".send-button");
		const nickname = document.querySelector("#nickname");
		const chatList = document.querySelector(".chatting-list");
		const chatInput = document.querySelector(".chatting-input");
		
		
		// 전송하는 함수. 대화명과 chartinput이 안비어있이면 서버로 전송
		function send() {			
			if(nickname.value !="" && chatInput.value !="" ){	
				//
				const param = {
						name: nickname.value,
						msg: chatInput.value
				}
				var data = JSON.stringify(param);
				
				socket.send(data);
				chatInput.value = "";
			}
		}
		
		// 엔터치면 
		chatInput.addEventListener("keypress", function(event) {
			if(event.keyCode === 13) send();		
		});
		
		// 전송버튼 누르면 전송
		sendButton.addEventListener("click", send);
		
	});

	
</script>


<!-- 소켓 세팅? -->
<script>

// li 만들고 화면에 뿌려주는 함수 
function  LiModel(name ,msg ,time) {
	this.name = name;
	this.msg = msg;
	this.time = time;
	
	// 클래스 안에 함수.. 
	this.makeLi = function () {
		//li 생성하고.. 
		const li = document.createElement("li");	
		// 내가보낸건 sent , 남이 보낸건 receive로 클래스 넣는다. 
		// 그 구별법은 현재 nickname과 서버에서온 name이 일치하면 내가쓴거다. 
		li.classList.add(nickname.value === this.name ? "sent":"receive");
		
		// 돔 생성 
		const dom = '<span class="profile"><span class="user">' + this.name +
		'</span><img src="https://placeimg.com/50/50/any" alt="any" > </span><span class="message">' + this.msg+ 
		'</span><span class="time">' +this.time + '</span>';
		
		// 생성한 li에 dom 넣고
		li.innerHTML = dom;
		// chatlist에 apped방식으로(뒤에) li추가하기.. 
		chatList.appendChild(li);
	}	
}

const nickname = document.querySelector("#nickname");
const chatList = document.querySelector(".chatting-list");
const chatInput = document.querySelector(".chatting-input");
const displayContainer = document.querySelector(".display-container");




// var타입으로 전역변수로 둬야 다른 스크립트에서 읽을수 있다. .. 
var socket = null;

// 소켓 함수.. 형식은 정해져 있다. 
function connect() {
	
	// http대신에 ws를 해야 되더라... 
	var ws = new WebSocket("ws://localhost:8081/shopMiniMallProject_chul/websocket");
	socket = ws;
	
	// 서버랑 연결 성공시.. 
	ws.onopen = function() {
		console.log("Info: connection opened.");	
	};
	
	// 서버에서 메세지 받는 부분.. 
	ws.onmessage = function(event) {
		// 서버에서 메세지 받은
		console.log("서버 <-"+ event.data + "\n");
			
	 	// 서버에서 보낸 json형식 str -> json객체로 받기
	 	const json = JSON.parse(event.data);

	 	// 지금 현재 시간 뽑기
	 	let today = new Date();   
	 	let hours = ('0' + today.getHours()).slice(-2); 
	 	let minutes = ('0' + today.getMinutes()).slice(-2);
	 	let seconds = ('0' + today.getSeconds()).slice(-2); 
	 	const time = hours + ':' + minutes;

	 	
	 	// 닉네임,메세지 시간을 새로 만들어서  초기화 하기
	 	const item = new LiModel(json.name , json.msg , time);
	 	
	 	// 초기화 한 값을 가지고 내부함수를 이용해 li만들고 뿌리기. 
	 	item.makeLi(); 
	 	
	 	// 메세지가쌓여서 스크롤 생기면 제일 아래로 이동하게 하기..  
	 	displayContainer.scrollTo(0, displayContainer.scrollHeight);
	 	
		
	}
	
	//서버랑 연결이 끊기면.. 
	ws.onclose = function(event) {
		console.log("Info: connection closed.");
		// 다시 접속 시도하기.. 
	 	setTimeout( function() {
			connect();
		},1000) 
	}
	
	ws.onerror = function(err) {
		console.log("error." , err);
	}
}



</script>


</body>
</html>