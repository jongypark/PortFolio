<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="wrapper">
 
            <div class="game-text">
                <span>패배..</span>
                <button>다시시작</button>
            </div>
            <div class="score">0</div>
            <div class="stop">
                <button class="stopbutton">일시 정지: p 키</button>
                <div class="nextBlocks">
                    <span>NextBlocks</span>
                    <ul></ul>
                </div>     
            </div>
            <div class="playground">
                <div class="game-start">
                    <span>게임 시작</span>
                    <button>시작</button>
                </div> 
                <div class="game-stop">
                    <span>일시 정지</span>
                    <button>시작</button>
                </div>
                <div class="comboMessage" id="comboField">
                    <span id="comboFieldSpan">1233</span> 
                </div>
    
                <ul></ul> <!-- ul 테그 사이에 공백이  -->
            </div>

    </div>
    
 <script src="resources/js/game/metrix.js" type="module"></script>
 <script src="resources/js/game/metrixapp.js"></script>
 
 
 
 
