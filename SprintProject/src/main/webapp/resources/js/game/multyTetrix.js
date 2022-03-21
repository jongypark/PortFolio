import BLOCKS from "./blocks.js"




//DOM PLAYER1
const playground = document.querySelector(".playground > ul");
const nextblocks = document.querySelector(".nextBlocks > ul");

const scoreDisplay =  document.querySelector(".score");
const comboField = document.querySelector("#comboField");
//game div들
const gameover =  document.querySelector(".game-lose");
const gamestop =  document.querySelector(".game-stop");
const gamestart = document.querySelector(".game-start");
const gamewin =  document.querySelector(".game-win");
const gamewait =  document.querySelector(".game-wait");
const gamenow =  document.querySelector(".game-now");
const gamenowSpan =  document.querySelector(".game-now span");

//버튼
const restartButton =  document.querySelector(".game-lose button");
const stopbutton = document.querySelector(".game-stop button");
const gamestartbutton = document.querySelector(".game-start button");
const gamestop2 = document.querySelector(".stopbutton");
const gamewinbutton = document.querySelector(".game-win button");
const gamewaitbutton = document.querySelector(".game-wait button");


//DOM PLAYER2
const playground_player2 = document.querySelector(".playground2 > ul");
const nextblocks_player2 = document.querySelector(".nextBlocks2 > ul");

const scoreDisplay_player2 =  document.querySelector(".score2");
const comboField_player2 = document.querySelector("#comboField2");
//game div들
const gameover_lose_player2 =  document.querySelector(".game-lose2");
const gamestart_player2 = document.querySelector(".game-start2");
const gamestop_player2 =  document.querySelector(".game-stop2");
const gamewin_player2 =  document.querySelector(".game-win2");
const gamewait_player2 =  document.querySelector(".game-wait2");
const gamenow_player2 =  document.querySelector(".game-now2");
const gamenowSpan_player2 =  document.querySelector(".game-now2 span");

//버튼
const gamestartbutton_player2 = document.querySelector(".game-start2 button");
const stopbutton_player2 = document.querySelector(".stopbutton2");
const stop_to_start_button = document.querySelector(".game-stop2 button");
const restartButton_player2 =  document.querySelector(".game-lose2 button");
const gamewinbutton_player2 = document.querySelector(".game-win2 button");
const gamewaitbutton_player2 = document.querySelector(".game-wait2 button");


//Setting 
const GAME_ROWS = 20; // 메트릭스 row
const GAME_COLS = 10; // 메트릭스 col
const METRIX_PX = 25;  // 메트릭스의 사이즈 크기는 25*25px이다
const GAME_START = 1;
const GAME_STOP = 2;
const GAME_OVER = 3;
const GAME_WAIT = 4;

// game status variables
let gamestatus = 0;   // 현재 게임 상태
let muityon = 0;	  // 멀티 게임 상태. 
let gamestatus_player2 = 0; // 현재 게임 상태 
let firstkeyboardevent = 0; // 언제 nextblocks의 통신을 보낼지 결정하는 상태정보변수


// variables PLAYER1
let score = 0;        // 점수
let duration = 500;   // 내려가는 속도 , 인터벌 시간간격변수
let downInterval;     // 인터벌 저장 변수 ,시간간격으로 자동으로 함수반복실행
let nextBlockType;    // 다음 블록

let tempMovingItem ={
		type:"",           //모양의 종류
		direction: 0,      //입력받은 키보드값
		top:0,             // 점점 아래로 내려가는걸
		left:0,            // 좌우이동에 사용하는 
};

const movingItem = {
		
		type:"tree",           //모양의 종류
		direction: 0,      //입력받은 키보드값
		top:0,             // 점점 아래로 내려가는걸
		left:0,            // 좌우이동에 사용하는 
		
};

// variables PLAYER2
let score_player2 = 0;      // 점수
let downInterval_player2;   // 인터벌 저장변수
let nextBlockType_player2;  // 다음 블록 <- 얘는 랜덤이 아니다!!!


let tempMovingItem_player2 ={
		type:"",           //모양의 종류
		direction: 0,      //입력받은 키보드값
		top:0,             // 점점 아래로 내려가는걸
		left:0,            // 좌우이동에 사용하는 
};


const movingItem_player2 = {

    type:"tree",           //모양의 종류
    direction: 0,      //입력받은 키보드값
    top:0,             // 점점 아래로 내려가는걸
    left:0,            // 좌우이동에 사용하는 

};



// 소켓 통신... 
var socket = null;


//소켓 통신.. 서버는 로직이 없고 단순히 통로역할 
function connect() {
	
	// http대신에 ws를 해야 되더라... 
	var ws = new WebSocket("ws://localhost:8081/shopMiniMallProject_chul/tetrisSocket");
	socket = ws;
	
	// 서버랑 연결 성공시.. 
	ws.onopen = function() {
		console.log("Info: connection opened.");	
	};
	
	// 서버에서 메세지 받는 부분.. 
	ws.onmessage = function(event) {
		// 서버에서 메세지 받은
		
		let data = event.data;
		// 3명 이상 접속시 접속제한하기.. 
		
		// nextbolck은 첫블럭 랜더링후 처음 키보드 조작시 전송, 키보드 조작 안하면 바닥에닿을때(seized)전송
		// 본인꺼는 랜덤. 상대방거는 상대방 랜던값이랑 맞춘다. 
		if(data.split(",")[0] == "type"){
			nextBlockType_player2 = data.split(",")[1];
		}
		
		switch (data) {
		//게임접속과 관련된..
		case "over": //지금은 3명이상 접속제한.. 
			alert("접속제한..")
			history.back();
			break;			
		case "out": // 한명이 게임을 나감
			displayAllNone();
			console.log("out player2: 게임오버")
			clearInterval(downInterval_player2);
			gamestop_player2.style.display = "none";		
			showGameoverText_player2();
			showGameWinText_player1();
			gamestatus = GAME_OVER;
			gamestatus_player2 = GAME_OVER;
			muityon =GAME_OVER;
			break;
		case "connect"://2명 게임접속 완료, 게임상태 전부리셋
			console.log("connection받음")
			resetGameStatus(); // 게임상태 전부 리셋.. 
			break;
		//게임 시작과 관련된	
		case "gamestart":
			gamestart_player2.style.display = "none";
			gamestatus_player2 = GAME_START;
			muityon =GAME_WAIT;
			//게임실행
			gamewaitfunction();
			break;
		case "gamewait":
			gamewait_player2.style.display = "none";
		    gamestatus_player2 = GAME_OVER;
		    muityon =GAME_OVER;
		    gamerestart_player2();
			break;
		//게임 일시정지와 관련된	
		case "stop":
			showGamestopText_player2();
			break;
		case "stop_to_restart":
			startGame_player2();
			break;
		//게임 조작
		case "right":
			moveBlock_player2("left",1 );
			break;
		case "left":
			moveBlock_player2("left",-1 );
			break;
		case "up":
			changeDirection_player2();
			break;
		case "down":
			moveBlock_player2("top",1 );
			break;
		case "space":
			dropBlocks_player2();
			break;
		default:
			break;
		}
		

		
	}
	
	//서버랑 연결이 끊기면.. 
	ws.onclose = function(event) {
		
		console.log("Info: connection closed.");
		
		// 다시 접속 시도하기.. 
//	 	setTimeout( function() {
//			connect();
//		},1000) 
	}
	
	ws.onerror = function(err) {
		console.log("error." , err);
	}
}









// 게임 시작하는 함수 , 플레이어 2명의 gamestatus 가 게임시작이면 시작
function gamewaitfunction(){

    if(gamestatus == GAME_START && gamestatus_player2 == GAME_START && muityon == GAME_WAIT){
        console.log("게임 시작~~")
        
        nextBlockType ="";
        nextBlockType_player2="";
        const blockObject = Object.entries(BLOCKS);
        const randomBlocksIndex = Math.floor(Math.random()*blockObject.length);
        nextBlockType = blockObject[randomBlocksIndex][0];
        socket.send("type,"+nextBlockType);

        gamewait.style.display = "none";
        gamewait_player2.style.display = "none";

        gamenowSpan.innerText = "3초후 시작"
        gamenowSpan_player2.innerText = "3초후 시작"

        gamenow.style.display = "flex";
        gamenow_player2.style.display = "flex";
        
        setTimeout(() => {
            gamenowSpan.innerText = "2초후 시작"
            gamenowSpan_player2.innerText = "2초후 시작"

        }, 1000);

        setTimeout(() => {
            gamenowSpan.innerText = "1초후 시작"
            gamenowSpan_player2.innerText = "1초후 시작"
        }, 2000);

        setTimeout(() => {
            
            gamenow.style.display = "none"
            gamenow_player2.style.display = "none"
            firstkeyboardevent =0;
            muityon =GAME_START;
            generateNewBlock()
            generateNewBlock_player2()
        }, 3000);


    }else if(gamestatus == GAME_START  ){
        console.log("player1 게임 대기중")
        gamewait.style.display = "flex";
    }else if(gamestatus_player2 == GAME_START){
        console.log("player2 게임 대기중")
        gamewait_player2.style.display = "flex";
    }else{
        console.log("로직 에러 발생")
    }


}



// 게임 로직 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

init();
init_player2();
connect();

function init(){

	console.log("init실행")
    //초기화
    tempMovingItem.type = movingItem.type;
    tempMovingItem.direction = movingItem.direction;
    tempMovingItem.top = movingItem.top;
    tempMovingItem.left = movingItem.left;
    
 
 
    // 블럭생성1
    for (let i = 0; i < GAME_ROWS; i++) {
        prependNewLine("player1")
    }

    //블럭 생성2
    for (let k = 0; k < 3; k++) {
        prependNextBlockLine("player1")
    }

}

function init_player2(){

    //초기화
    tempMovingItem_player2.type = movingItem_player2.type;
    tempMovingItem_player2.direction = movingItem_player2.direction;
    tempMovingItem_player2.top = movingItem_player2.top;
    tempMovingItem_player2.left = movingItem_player2.left;
    
 
     // 블럭생성1
    for (let i = 0; i < GAME_ROWS; i++) {
        prependNewLine("player2")
    }

    //블럭 생성2
    for (let k = 0; k < 3; k++) {
        prependNextBlockLine("player2");
    }


}


function prependNewLine(player = "player1"){

    const li = document.createElement("li");
    const ul = document.createElement("ul");

    for (let j = 0; j < GAME_COLS; j++) {
        const metrix = document.createElement("li");
        ul.prepend(metrix);
    }

    li.prepend(ul);
    if (player == "player1"){

        playground.prepend(li);
    }else{
        playground_player2.prepend(li);
    }

}

function prependNextBlockLine(player = "player1"){
    const li = document.createElement("li")
    const ul = document.createElement("ul")

    for (let i = 0; i < 4  ; i++) {
        const metrix = document.createElement("li");
        ul.prepend(metrix);  
    }

    li.prepend(ul)
    if(player == "player1"){

        nextblocks.prepend(li)
    }else{
        nextblocks_player2.prepend(li);
    }
}

// moving중인 블럭 색깔칠하기
function RanderingBlock(){

    const { type , direction , top , left} = tempMovingItem;


    //moving 클래스 제거하기.. 
    removeMovingClass(type, "player1");

    // 색깔 칠하기.. 
    BLOCKS[type][direction].forEach(block => {
        const x = block[0] + left;
        const y = block[1] + top;
        const target = playground.childNodes[y].childNodes[0].childNodes[x];
        target.classList.add(type , "moving" );
    });
    // 예상 목적지? 보여주기
    RanderingTargetting();

    // movingItem 업데이트하기
    movingItem.type = type;
    movingItem.direction = direction;
    movingItem.top = top;
    movingItem.left = left;
    
   
	

}

// moving중인 블럭 색깔칠하기2
function RanderingBlock_player2(){

    const { type , direction , top , left} = tempMovingItem_player2;


    //moving 클래스 제거하기.. 
    removeMovingClass(type , "player2");

    // 색깔 칠하기.. 
    BLOCKS[type][direction].forEach(block => {
        const x = block[0] + left;
        const y = block[1] + top;
        const target = playground_player2.childNodes[y].childNodes[0].childNodes[x];
        target.classList.add(type , "moving" );
    });
    // 예상 목적지? 보여주기
    RanderingTargetting_player2();

    // movingItem 업데이트하기
    movingItem_player2.type = type;
    movingItem_player2.direction = direction;
    movingItem_player2.top = top;
    movingItem_player2.left = left;


}

// nextBlock 색깔칠하기
function RanderingNextBlock(){

    BLOCKS[nextBlockType][0].forEach(block => {

        let x;
        let y;

        if(nextBlockType =="bar"){
            x = block[0];
            y = block[1] +1 ;
        }else{
            x = block[0] +1 ;
            y = block[1] ;
        }

        const target = nextblocks.childNodes[y].childNodes[0].childNodes[x];
        target.classList.add(nextBlockType , "nextblock" );
    });


}

// nextBlock 색깔칠하기2
function RanderingNextBlock_player2(){

    BLOCKS[nextBlockType_player2][0].forEach(block => {

        let x;
        let y;

        if(nextBlockType_player2 =="bar"){
            x = block[0];
            y = block[1] +1 ;
        }else{
            x = block[0] +1 ;
            y = block[1] ;
        }

        const target = nextblocks_player2.childNodes[y].childNodes[0].childNodes[x];
        target.classList.add(nextBlockType_player2 , "nextblock" );
    });


}

//예상 착지지점 색깔 칠하기
function  RanderingTargetting(){

    //원본 저장
	let targetItem = {
	    		type:"",           //모양의 종류
	    		direction: 0,      //입력받은 키보드값
	    		top:0,             // 점점 아래로 내려가는걸
	    		left:0,            // 좌우이동에 사용하는 
	}
    targetItem.type = tempMovingItem.type;
    targetItem.direction = tempMovingItem.direction;
    targetItem.top = tempMovingItem.top;
    targetItem.left = tempMovingItem.left;

    let top = 0;
    //1. targetting 위치 파악하기.. 
    while(1){
        tempMovingItem.top += 1;

        const testBlocks = isavailableBlock()
        if(testBlocks){
            top++;
        }else{
            break;
        }
    }
    // 2. targetting 클래스 제거하기
    removeTargettingClass(tempMovingItem.type , "player1");

    //3. 색칠하기 
    if( top >0){
        BLOCKS[tempMovingItem.type][tempMovingItem.direction].forEach(block => {
            const x = block[0] +  tempMovingItem.left;
            const y = block[1] + tempMovingItem.top -1;
            const target = playground.childNodes[y].childNodes[0].childNodes[x];
            if( !target.classList.contains("moving") ){
                
                target.classList.add(tempMovingItem.type , "targetting" );
            }
        });
   
    }
    // 랜더링 후에 원본 복구하기. 
    tempMovingItem.type = targetItem.type;
    tempMovingItem.direction = targetItem.direction;
    tempMovingItem.top = targetItem.top;
    tempMovingItem.left = targetItem.left;
}

//예상 착지지점 색깔 칠하기2
function RanderingTargetting_player2(){
  
    //원본 저장
	 let targetItem = {
	    		type:"",           //모양의 종류
	    		direction: 0,      //입력받은 키보드값
	    		top:0,             // 점점 아래로 내려가는걸
	    		left:0,            // 좌우이동에 사용하는 
	 }
    targetItem.type = tempMovingItem_player2.type;
    targetItem.direction = tempMovingItem_player2.direction;
    targetItem.top = tempMovingItem_player2.top;
    targetItem.left = tempMovingItem_player2.left;

    let top = 0;
    //1. targetting 위치 파악하기.. 
    while(1){
        tempMovingItem_player2.top += 1;

        const testBlocks = isavailableBlock_player2()
        if(testBlocks){
            top++;
        }else{
            break;
        }
    }
    // 2. targetting 클래스 제거하기
    removeTargettingClass(tempMovingItem_player2.type, "player2");

    //3. 색칠하기 
    if( top >0){
        BLOCKS[tempMovingItem_player2.type][tempMovingItem_player2.direction].forEach(block => {
            const x = block[0] +  tempMovingItem_player2.left;
            const y = block[1] + tempMovingItem_player2.top -1;
            const target = playground_player2.childNodes[y].childNodes[0].childNodes[x];
            if( !target.classList.contains("moving") ){
                
                target.classList.add(tempMovingItem_player2.type , "targetting" );
            }
        });
   
    }
    // 랜더링 후에 원본 복구하기. 
    tempMovingItem_player2.type = targetItem.type;
    tempMovingItem_player2.direction = targetItem.direction;
    tempMovingItem_player2.top = targetItem.top;
    tempMovingItem_player2.left = targetItem.left;


}


// nextBlock 보조함수
function removeNextBlockClass(player = "player1"){

	  let movingBlock;
	    if(player == "player1"){
	        movingBlock = document.querySelectorAll(".player1 .nextblock");
	    }else{
	        movingBlock = document.querySelectorAll(".player2 .nextblock");
	    }


	    movingBlock.forEach(moving => {
	        if(player == "player1"){
	            moving.classList.remove(nextBlockType ,"bar", "zee","elLeft", "elRight", "square" ,"tree", "nextblock");
	        }else{
	            moving.classList.remove(nextBlockType_player2 ,"bar", "zee","elLeft", "elRight", "square" ,"tree", "nextblock");
	        }

	    }); 

}
// 타게팅 보조함수
function removeTargettingClass(type , player="player1"){
    let movingBlock; 
    if(player == "player1"){

        movingBlock = document.querySelectorAll(".player1 .targetting");
    }else{
        movingBlock = document.querySelectorAll(".player2 .targetting");
    }


    movingBlock.forEach(moving => {
        if(moving.classList.contains("moving")){
            moving.classList.remove( "targetting");
        }else{

            moving.classList.remove(type , "targetting");
        }
    }); 
}

//moving 보조함수 랜더링하기전 class 중에 type , "moving" 제거하기.. 
function removeMovingClass(type , player="player1") {
 
    let movingBlock;
    
    if(player =="player1"){
        movingBlock= document.querySelectorAll(".player1 .moving");
    }else{
        movingBlock= document.querySelectorAll(".player2 .moving");
    }  
    movingBlock.forEach(moving => {
        moving.classList.remove(type , "moving");
    }); 
}



// 바닥에 닿으면 seized하는 함수 
function seizeBlock(player="player1"){
	
	
	if( firstkeyboardevent ==0){
		sendTypetoPlayer2();
		firstkeyboardevent++;		
	}
	firstkeyboardevent =0;

    let movingBlock;
    if( player == "player1") {
        movingBlock= document.querySelectorAll(".player1 .moving");
    }else{
        movingBlock= document.querySelectorAll(".player2 .moving");
    }

    movingBlock.forEach(moving => {
        moving.classList.remove("moving");
        moving.classList.add("seized");
    }); 

    if( player == "player1") {
        checkMatch();
    }else{
        checkMatch_player2();
    }
}

// 줄맞췄는지 검사하는 함수
function checkMatch(){

    //모든 줄 맞추면 한줄 지우고 새로 한줄 만들기.. 
    const checkBlocks = playground.childNodes;
    let combo = 0;
    let offtop;
    checkBlocks.forEach(child => {
        let textseized = true;
        child.childNodes[0].childNodes.forEach(metrix => {
            if( !metrix.classList.contains("seized") ){
                textseized = false;
            }
        });
        // 한줄 다채웠으면
        if(textseized){
            //경로 구하기
            offtop = child.offsetTop;

            child.remove();
            prependNewLine("player1");

            combo++;
            score++;
            scoreDisplay.innerHTML = score;


        }
    });

    if(combo!=0){
        // 콤보 메세지 출력함수
        displayComboMessage(offtop  , combo );
    }
    
    
    generateNewBlock();

}

// 줄맞췄는지 검사하는 함수2
function checkMatch_player2(){
    //모든 줄 맞추면 한줄 지우고 새로 한줄 만들기.. 
    const checkBlocks = playground_player2.childNodes;
    let combo = 0;
    let offtop;
    checkBlocks.forEach(child => {
        let textseized = true;
        child.childNodes[0].childNodes.forEach(metrix => {
            if( !metrix.classList.contains("seized") ){
                textseized = false;
            }
        });
        // 한줄 다채웠으면
        if(textseized){
            //경로 구하기
            offtop = child.offsetTop;

            child.remove();
            prependNewLine("player2");

            combo++;
            score_player2++;
            scoreDisplay_player2.innerHTML = score_player2;


        }
    });

    if(combo!=0){
        // 콤보 메세지 출력함수
        displayComboMessage_player2(offtop  , combo );
    }


    generateNewBlock_player2();
}


// 콤보 메세지 출력하는 함수
function  displayComboMessage(offtop  , combo ){

    const { type , direction , top , left} = tempMovingItem;
    let combostr;
    switch (combo) {
        case 1:
            combostr = combo + "Combo!!";
            break;
        case 2:
            combostr ="Nice~" + combo + "Combo!! +1점";
            score++;
            break;
        case 3:
            combostr ="Perfect!!!" + combo + "Combo!! +5점";
            score +=5;
            break;
        case 4:
            combostr ="Fantastic!!!" + combo + "Combo!! +10점";
            score +=10;
            break;                    
        default:
            break;
    }

    scoreDisplay.innerHTML = score;

    // 콤보 메세지 등장!! 
    comboField.style.display = "block";
    const comboFieldSpan = document.querySelector("#comboFieldSpan");
    comboFieldSpan.innerText = combostr;
    comboField.style.left = ((left-4) * METRIX_PX) + "px";
    comboField.style.top = offtop + "px";

    // 메서지 사라지게 하기
    setTimeout(() => {
        comboField.style.display = "none";
    }, 700);


}

// 콤보 메세지 출력하는 함수2
function  displayComboMessage_player2(offtop  , combo ){

    const { type , direction , top , left} = tempMovingItem_player2;
    let combostr;
    switch (combo) {
        case 1:
            combostr = combo + "Combo!!";
            break;
        case 2:
            combostr ="Nice~" + combo + "Combo!! +1점";
            score_player2++;
            break;
        case 3:
            combostr ="Perfect!!!" + combo + "Combo!! +5점";
            score_player2 +=5;
            break;
        case 4:
            combostr ="Fantastic!!!" + combo + "Combo!! +10점";
            score_player2 +=10;
            break;                    
        default:
            break;
    }

    scoreDisplay_player2.innerHTML = score_player2;

    // 콤보 메세지 등장!! 
    comboField_player2.style.display = "block";
    const comboFieldSpan_player2 = document.querySelector("#comboFieldSpan2");
    comboFieldSpan_player2.innerText = combostr;
    comboField_player2.style.left = ((left-4) * METRIX_PX) + "px";
    comboField_player2.style.top = offtop + "px";

    // 메서지 사라지게 하기
    setTimeout(() => {
        comboField_player2.style.display = "none";
    }, 700);


}


// 새로운 블럭꺼내는 함수
function generateNewBlock(){

    //인터벌 주기
	if(gamestatus ==  GAME_START  && muityon == GAME_START){
	    clearInterval(downInterval);
	    downInterval = setInterval(() => {
	        moveBlock("top",1)
	    }, duration);
	}

    // 초기화하기 
    movingItem.type = nextBlockType;
    movingItem.direction = 0;
    movingItem.top = 0;
    movingItem.left = 3;
   // console.log("player1 블럭꺼내오기", nextBlockType)
    
    tempMovingItem.type = movingItem.type;
    tempMovingItem.direction = movingItem.direction;
    tempMovingItem.top = movingItem.top;
    tempMovingItem.left = movingItem.left;
    
	const blockObject = Object.entries(BLOCKS);
	const randomBlocksIndex = Math.floor(Math.random()*blockObject.length);
	nextBlockType = blockObject[randomBlocksIndex][0];

    //nextBlockType 바꾸기. 
    // 기존에 색칠한거 랜더링 지우고
    removeNextBlockClass("player1");
    
    
    // nextBlockType 보여주기
    //색칠하기.. 
    RanderingNextBlock();


    //게임오버 검사   
    const isgameover = isavailableBlock();

    if(!isgameover){
        //게임오버
        RanderingBlock();
        console.log("player1: 게임오버")
        clearInterval(downInterval);
        showGameoverText();
        showGameWinText_player2();

    }else{  
        RanderingBlock();
    }


}

// 새로운 블럭꺼내는 함수2
function generateNewBlock_player2(){
    //인터벌 주기
	if(gamestatus_player2 ==  GAME_START  && muityon == GAME_START){
	    clearInterval(downInterval_player2);
	    downInterval_player2 = setInterval(() => {
	        moveBlock_player2("top",1)
	    }, duration);
	}

    // 초기화하기 
    movingItem_player2.type = nextBlockType_player2;
    movingItem_player2.direction = 0;
    movingItem_player2.top = 0;
    movingItem_player2.left = 3;
 //   console.log("player2 블럭꺼내오기", nextBlockType_player2)
    
    
    tempMovingItem_player2.type = movingItem_player2.type;
    tempMovingItem_player2.direction = movingItem_player2.direction;
    tempMovingItem_player2.top = movingItem_player2.top;
    tempMovingItem_player2.left = movingItem_player2.left;

    //nextBlockType 바꾸기. 
    // 기존에 색칠한거 랜더링 지우고
    removeNextBlockClass("player2");
    
 
    // nextBlockType 보여주기
    //색칠하기.. 
    RanderingNextBlock_player2();


    //게임오버 검사   
    const isgameover = isavailableBlock_player2();

    if(!isgameover){
        //게임오버
        RanderingBlock_player2();
        console.log("player2: 게임오버")
        clearInterval(downInterval_player2);
        showGameoverText_player2();
        showGameWinText_player1();

    }else{
        RanderingBlock_player2();
    }

}



//player1 이 게임 이겼을때 
function showGameWinText_player1(){

    clearInterval(downInterval);

    // 모든 화면 none으로 하기
    gameover.style.display = "none";
    gamestart.style.display = "none";
    gamestop.style.display = "none";


    gamewin.style.display = "flex"
    gamestatus = GAME_OVER;
}




//player2 이 게임 이겼을때 
function showGameWinText_player2(){

    clearInterval(downInterval_player2);

    // 모든 화면 none으로 하기
    gameover_lose_player2.style.display = "none";
    gamestart_player2.style.display = "none";
    gamestop_player2.style.display = "none";


    gamewin_player2.style.display = "flex"
    gamestatus_player2 = GAME_OVER;
}

//중요 함수 .. 블럭이동함수
function moveBlock(moveType , amount){
    // 게임 실행중일때만 움직인다. 
    if( gamestatus == GAME_START){
        tempMovingItem[moveType] += amount;
    
        const testBlocks = isavailableBlock()
     
        if(testBlocks){
            RanderingBlock()
        }else{
            // moveType이 top이면? 시즈함수.. 
            if(moveType == "top"){
                seizeBlock("player1");
            }else{
	          	tempMovingItem.type = movingItem.type;
	          	tempMovingItem.direction = movingItem.direction;
	          	tempMovingItem.top = movingItem.top;
	          	tempMovingItem.left = movingItem.left;
                RanderingBlock()
            }
        }
    }
}


//중요 함수 .. 블럭이동함수2
function moveBlock_player2(moveType , amount){

    if( gamestatus_player2 == GAME_START){

        tempMovingItem_player2[moveType] += amount;
        const testBlocks = isavailableBlock_player2()

        if(testBlocks){
            RanderingBlock_player2()
        }else{
            // moveType이 top이면? 시즈함수.. 
            if(moveType == "top"){
                seizeBlock("player2");
            }else{
                tempMovingItem_player2.type = movingItem_player2.type;
                tempMovingItem_player2.direction = movingItem_player2.direction;
                tempMovingItem_player2.top = movingItem_player2.top;
                tempMovingItem_player2.left = movingItem_player2.left;
                RanderingBlock_player2()
            }
        }
    }
}


//중요 함수 .. 블럭 방향전환 함수
function changeDirection(){
    if( gamestatus == GAME_START){
        const direction = tempMovingItem.direction;
        direction == 3 ? tempMovingItem.direction = 0 : tempMovingItem.direction +=1;
    
        const testBlocks = isavailableBlock()
        if(testBlocks){
            RanderingBlock()
        }else{
                // moveType이 retry면? 게임오버. 
              	tempMovingItem.type = movingItem.type;
           	    tempMovingItem.direction = movingItem.direction;
           	    tempMovingItem.top = movingItem.top;
           	    tempMovingItem.left = movingItem.left;
                RanderingBlock()
            
        }
    }
}

//중요 함수 .. 블럭 방향전환 함수2
function changeDirection_player2(){

    if( gamestatus_player2 == GAME_START){
        const direction = tempMovingItem_player2.direction;
        direction == 3 ? tempMovingItem_player2.direction = 0 : tempMovingItem_player2.direction +=1;
    
        const testBlocks = isavailableBlock_player2()
        if(testBlocks){
            RanderingBlock_player2()
        }else{
                // moveType이 retry면? 게임오버. 
                tempMovingItem_player2.type = movingItem_player2.type;
                tempMovingItem_player2.direction = movingItem_player2.direction;
                tempMovingItem_player2.top = movingItem_player2.top;
                tempMovingItem_player2.left = movingItem_player2.left;
                RanderingBlock_player2()
            
        }
    }
}

// 블록 이동이나 방향전환이 가능한지 검사하는 함수
function isavailableBlock() {
    const { type , direction , top , left} = tempMovingItem;

    let test = true;
    BLOCKS[type][direction].forEach(block => {
        const x = block[0] + left;
        const y = block[1] + top;
        const target = playground.childNodes[y] ? playground.childNodes[y].childNodes[0].childNodes[x] : null;
       
        if (!target || target.classList.contains("seized")){ 
            test = false;
        }
    });
 
    return test;
}


// 블록 이동이나 방향전환이 가능한지 검사하는 함수2
function isavailableBlock_player2() {
    const { type , direction , top , left} = tempMovingItem_player2;

    let test = true;
    BLOCKS[type][direction].forEach(block => {
        const x = block[0] + left;
        const y = block[1] + top;
        const target = playground_player2.childNodes[y] ? playground_player2.childNodes[y].childNodes[0].childNodes[x] : null;
       
        if (!target || target.classList.contains("seized")){ 
            test = false;
        }
    });

    return test;
}

// 스페이스누르면 빨라지는
function dropBlocks(){
    if(gamestatus ==  GAME_START  && muityon == GAME_START){
        clearInterval(downInterval);
        downInterval = setInterval(() => {
            moveBlock("top",1)
        }, 10);
    }
}

// 스페이스누르면 빨라지는2
function dropBlocks_player2(){
    if(gamestatus_player2 ==  GAME_START  && muityon == GAME_START){
        clearInterval(downInterval_player2);
        downInterval_player2 = setInterval(() => {
            moveBlock_player2("top",1)
        }, 10);
    }
}

//게임 지면 보여주는 함수
function showGameoverText(){
    if(gamestatus == GAME_START  && muityon == GAME_START){
        gameover.style.display = "flex";
        gamestatus = GAME_OVER;
    }
} 

//게임 지면 보여주는 함수2
function showGameoverText_player2(){
	  if(gamestatus_player2 ==  GAME_START  && muityon == GAME_START){
	       gameover_lose_player2.style.display = "flex";
	       gamestatus_player2 = GAME_OVER;
	  }
} 





// 돔 이벤트 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



// 키보드 조작시 블럭 이동하게하는 조작이벤트  
document.addEventListener("keydown", (e)=>{

	if( firstkeyboardevent ==0){
		sendTypetoPlayer2();
		firstkeyboardevent++;		
	}
	
    // 게임중일때만 키보드 이벤트?
    if( gamestatus == GAME_START   && muityon == GAME_START){

        switch (e.keyCode) {
            case 39: // 오른쪽 키
                moveBlock("left",1);
                socket.send("right");
                break;
            case 37: // 왼쪽 키
                moveBlock("left",-1);
                socket.send("left");
                break;
            case 40: // 아래쪽 키
                moveBlock("top",1);
                socket.send("down");
                break;  
            case 38: // 위 키
                changeDirection();
                socket.send("up");
                break;   
            case 32: // 스페이스
                dropBlocks();
                socket.send("space");
                break;        
            case 80: // p키
                showGamestopText();
                break;                                 
            default:
                break;
        }
      }


})

function sendTypetoPlayer2(){
	socket.send("type,"+nextBlockType);
}



// player1 button event ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//게임 패배시 game-lose button
restartButton.addEventListener("click", sendConnect);

//게임 승리시 game-win button
gamewinbutton.addEventListener("click", sendConnect);

//일시정지와 관련된
stopbutton.addEventListener("click", startGame)
//일시정지와 관련된
gamestop2.addEventListener("click",showGamestopText)




// 맨처음나오는 게임시작버튼
gamestartbutton.addEventListener("click", function () {
    gamestart.style.display = "none";
    gamestatus = GAME_START;
    
    socket.send("gamestart");
//    //게임실행
    gamewaitfunction();

});

//맨처음나오는 게임시작버튼 취소하기
gamewaitbutton.addEventListener("click", function () {
    gamewait.style.display = "none";
    gamestatus = GAME_OVER;
    muityon =GAME_OVER;
    gamerestart_player1();
    socket.send("gamewait");
})









// 이벤트에 쓰이는 보조 함수들... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function startGame(){
	if(gamestatus == GAME_STOP && muityon == GAME_START){
	    downInterval = setInterval(() => {
	        moveBlock("top",1)
	    }, duration);
	    gamestatus = GAME_START;
	    gamestop.style.display = "none";
	    socket.send("stop_to_restart");
	}
}

function startGame_player2(){
	if(gamestatus_player2 == GAME_STOP && muityon == GAME_START){
	    downInterval_player2 = setInterval(() => {
	        moveBlock_player2("top",1)
	    }, duration);
	    gamestatus_player2 = GAME_START;
	    gamestop_player2.style.display = "none";
	}
}

function showGamestopText(){
    if(gamestatus ==  GAME_START && muityon == GAME_START ){
        clearInterval(downInterval);
        gamestatus = GAME_STOP;
        gamestop.style.display = "flex";
        socket.send("stop");
    }
}


function showGamestopText_player2(){
    if(gamestatus_player2 ==  GAME_START && muityon == GAME_START){
        clearInterval(downInterval_player2);
        gamestatus_player2 = GAME_STOP;
        gamestop_player2.style.display = "flex";
    }
}



function gamerestart_player2(){
    playground_player2.innerHTML = ""
    nextblocks_player2.innerHTML = ""
    score_player2 = 0;
    scoreDisplay_player2.innerHTML = 0;
    gamestart_player2.style.display = "flex";
    init_player2();
}

function gamerestart_player1(){
    playground.innerHTML = ""
    nextblocks.innerHTML = ""
    score = 0;
    scoreDisplay.innerHTML = 0;
    gamestart.style.display = "flex";
    init();
}


function sendConnect(){
	resetGameStatus();
    socket.send("connect");
}

function resetGameStatus(){
	displayAllNone();
	gamerestart_player1();
	gamerestart_player2();
	gamestatus = GAME_OVER;
	gamestatus_player2 = GAME_OVER;
	muityon =GAME_WAIT;
}



//보조함수.. 모든 게임상태 디스플레이 none
function displayAllNone(){
	
gamewait.style.display = "none";
	gameover.style.display = "none";
	gamestop.style.display = "none";
	gamewin.style.display = "none";
	gamestart.style.display = "none";
	
	gamewait_player2.style.display = "none";
	gameover_lose_player2.style.display = "none";
	gamestop_player2.style.display = "none";
	gamewin_player2.style.display = "none";
	gamestart_player2.style.display ="none";
}






