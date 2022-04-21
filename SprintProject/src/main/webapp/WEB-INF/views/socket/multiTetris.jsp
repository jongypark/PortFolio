<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   
    <div class="wrapper">
        <div class="player1">

            <div class="playground">
                <div class="game game-start">
                    <span>게임 시작</span>
                    <button>시작</button>
                </div> 
                <div class="game game-stop">
                    <span>일시 정지</span>
                    <button>시작</button>
                </div>
                <div class="game game-lose">
                    <span>패배..</span>
                    <button>다시시작</button>
                </div>
                <div class="game game-win">
                    <span>승리!!!</span>
                    <button>다시시작</button>
                </div>
                <div class="game game-wait">
                    <span>상대 기다리는중</span>
                    <button>취소</button>
                </div>
                <div class="game game-now">
                    <span>3초후 시작</span>
                </div>

                <div class="comboMessage" id="comboField">
                    <span id="comboFieldSpan">1233</span> 
                </div>
    
                <ul></ul> <!-- ul 테그 사이에 공백이  -->
            </div>

            <div class="scoreboard">
                <div class="score">0</div>
                <button class="stopbutton">일시 정지</button>
                <div class="nextBlocks">
                    <span>NextBlocks</span>
                    <ul></ul>
                </div>
            </div>


        </div>
        
        <div class="player2">

            <div class="scoreboard">
                <div class="score2">0</div>
                <button class="stopbutton2">일시 정지</button>
                <div class="nextBlocks2">
                    <span>NextBlocks</span>
                    <ul></ul>
                </div>
            </div>
            <div class="playground2">
                <div class="game game-lose2">
                    <span>패배.. </span>
                    <button>다시시작</button>
                </div> 
                <div class="game game-win2">
                    <span>승리!!! </span>
                    <button>다시시작</button>
                </div> 

                <div class="game game-start2">
                    <span>게임 시작</span>
                    <button>시작</button>
                </div> 
                
                <div class="game game-stop2">
                    <span>일시 정지</span>
                    <button>시작</button>
                </div>
                <div class="game game-wait2">
                    <span>상대 기다리는중</span>
                    <button>취소</button>
                </div>
                <div class="game game-now2">
                    <span>3초후 시작</span>
                </div>


                <div class="comboMessage2" id="comboField2">
                    <span id="comboFieldSpan2">1233</span> 
                </div> 
    
                <ul></ul> <!-- ul 테그 사이에 공백이  -->
            </div>
        </div>
        

    </div>
    
   <script src="resources/js/jquery-3.5.1.min.js"></script>
   <script src="resources/js/game/multyTetrix.js" type="module"></script>
   
   
   
   
   
   
   
    
    