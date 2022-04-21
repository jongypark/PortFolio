/**
 * 
 */


import BLOCKS from "./blocks.js"




//DOM PLAYER1
const playground = document.querySelector(".playground > ul");
const nextblocks = document.querySelector(".nextBlocks > ul");
const scoreDisplay =  document.querySelector(".score");
const gameover =  document.querySelector(".game-text");
const gamestop =  document.querySelector(".game-stop");
const restartButton =  document.querySelector(".game-text button");
const stopbutton = document.querySelector(".game-stop button");
const comboField = document.querySelector("#comboField");
const gamestart = document.querySelector(".game-start");
const gamestartbutton = document.querySelector(".game-start button");
const gamestop2 = document.querySelector(".stopbutton");



//Setting 
const GAME_ROWS = 20;
const GAME_COLS = 10;
const GAME_OVER = 3;
const GAME_START = 1;
const GAME_STOP = 2;
const METRIX_PX = 25;  // 메트릭스의 사이즈 크기는 25*25px이다


// variables PLAYER1
let score = 0;        // 점수
let duration = 500;   // 내려가는 속도 , 인터벌 시간간격변수
let downInterval;     // 인터벌 저장 변수 ,시간간격으로 자동으로 함수반복실행
let nextBlockType;
let gamestatus = 0; 


let tempMovingItem ={
	type:"",           //모양의 종류
	direction: 0,      //입력받은 키보드값
	top:0,             // 점점 아래로 내려가는걸
	left:0,            // 좌우이동에 사용하는 
}

const movingItem = {

    type:"tree",           //모양의 종류
    direction: 0,      //입력받은 키보드값
    top:0,             // 점점 아래로 내려가는걸
    left:0,            // 좌우이동에 사용하는 

};



init();

function init(){

    //초기화
    tempMovingItem.type = movingItem.type;
    tempMovingItem.direction = movingItem.direction;
    tempMovingItem.top = movingItem.top;
    tempMovingItem.left = movingItem.left;
    
    console.log(tempMovingItem);
    
    const blockObject = Object.entries(BLOCKS);
    const randomBlocksIndex = Math.floor(Math.random()*blockObject.length);
    nextBlockType = blockObject[randomBlocksIndex][0];
 
    // 블럭생성1
    for (let i = 0; i < GAME_ROWS; i++) {
        prependNewLine()
    }

    //블럭 생성2
    for (let k = 0; k < 3; k++) {
        prependNextBlockLine()
    }

}



function prependNewLine(){

    const li = document.createElement("li");
    const ul = document.createElement("ul");

    for (let j = 0; j < GAME_COLS; j++) {
        const metrix = document.createElement("li");
        ul.prepend(metrix);
    }

    li.prepend(ul);
   
    playground.prepend(li);
 

}

function prependNextBlockLine(){
    const li = document.createElement("li")
    const ul = document.createElement("ul")

    for (let i = 0; i < 4  ; i++) {
        const metrix = document.createElement("li");
        ul.prepend(metrix);  
    }

    li.prepend(ul)
   
    nextblocks.prepend(li)
  
}


function RanderingBlock(){

    const { type , direction , top , left} = tempMovingItem;


    //moving 클래스 제거하기.. 
    removeMovingClass(type);

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


function removeNextBlockClass(){
    const movingBlock  = document.querySelectorAll(".nextblock");
   


    movingBlock.forEach(moving => {
      
         moving.classList.remove(nextBlockType , "nextblock");
      
    }); 
}

function removeTargettingClass(type ){
	
    const movingBlock = document.querySelectorAll(".targetting");
 


    movingBlock.forEach(moving => {
        if(moving.classList.contains("moving")){
            moving.classList.remove( "targetting");
        }else{

            moving.classList.remove(type , "targetting");
        }
    }); 
}


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
    removeTargettingClass(tempMovingItem.type );

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

// 랜더링하기전 class 중에 type , "moving" 제거하기.. 
function removeMovingClass(type ) {
 
    const movingBlock = document.querySelectorAll(".moving");
   
    movingBlock.forEach(moving => {
        moving.classList.remove(type , "moving");
    }); 
}


function seizeBlock(){

    const movingBlock = document.querySelectorAll(".moving");
 

    movingBlock.forEach(moving => {
        moving.classList.remove("moving");
        moving.classList.add("seized");
    }); 

  
    checkMatch();
  
}



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
            prependNewLine();

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



function generateNewBlock(){

    //인터벌 주기

    clearInterval(downInterval);
    downInterval = setInterval(() => {
        moveBlock("top",1)
    }, duration);


    // 초기화하기 
    movingItem.type = nextBlockType;
    movingItem.direction = 0;
    movingItem.top = 0;
    movingItem.left = 3;
    
 
    tempMovingItem.type = movingItem.type;
    tempMovingItem.direction = movingItem.direction;
    tempMovingItem.top = movingItem.top;
    tempMovingItem.left = movingItem.left;

    //nextBlockType 바꾸기. 
    // 기존에 색칠한거 랜더링 지우고
    removeNextBlockClass();
    const blockObject = Object.entries(BLOCKS);
    const randomBlocksIndex = Math.floor(Math.random()*blockObject.length);
    nextBlockType = blockObject[randomBlocksIndex][0];

    // nextBlockType 보여주기
    //색칠하기.. 
    RanderingNextBlock();


    //게임오버 검사   
    const isgameover = isavailableBlock();

    if(!isgameover){
        //게임오버
        RanderingBlock();
        console.log("게임오버")
        clearInterval(downInterval);
        showGameoverText();

    }else{
        RanderingBlock();
    }


}

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
                seizeBlock();
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








function dropBlocks(){
    clearInterval(downInterval);
    downInterval = setInterval(() => {
        moveBlock("top",1)
    }, 10);
}


function showGamestopText(){
    if(gamestatus ==  GAME_START){
        clearInterval(downInterval);
        gamestatus = GAME_STOP;
        gamestop.style.display = "flex";
    }
}

function showGameoverText(){
    if(gamestatus == GAME_START){
        gameover.style.display = "flex";
        gamestatus = GAME_OVER;
    }
} 


function startGame(){
    downInterval = setInterval(() => {
        moveBlock("top",1)
    }, duration);
    gamestatus = GAME_START;
    gamestop.style.display = "none";
}

// player2 부분만 제거하면 된다. 
document.addEventListener("keydown", (e)=>{

    // 게임중일때만 키보드 이벤트?
    if( gamestatus == GAME_START){

        switch (e.keyCode) {
            case 39: // 오른쪽 키
                moveBlock("left",1);
              
                break;
            case 37: // 왼쪽 키
                moveBlock("left",-1);
                
                break;
            case 40: // 아래쪽 키
                moveBlock("top",1);
                
                break;  
            case 38: // 위 키
                changeDirection();
                
                break;   
            case 32: // 스페이스
                dropBlocks();
               
                break;        
            case 80: // p키
                showGamestopText();
                break;                                 
            default:
                break;
        }
    }


})

restartButton.addEventListener("click", ()=>{
    gameover.style.display = "none";
    playground.innerHTML = ""
    nextblocks.innerHTML = ""
    score = 0;
    scoreDisplay.innerHTML = 0;
    gamestart.style.display = "flex";
    init();
})

stopbutton.addEventListener("click", startGame)


gamestop2.addEventListener("click",showGamestopText)

gamestartbutton.addEventListener("click", function () {
    gamestart.style.display = "none";
  
    gamestatus = GAME_START;
    //게임실행
    generateNewBlock()
});










