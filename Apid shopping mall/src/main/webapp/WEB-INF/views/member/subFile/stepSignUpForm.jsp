<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
      <div class="wrapper">
            <form class="form-m" id="Form-M" action="memberAdd" method="post">
                <!-- 3개의 div 모두 absolute이다. 숨어있다가 버튼 누르면 제위치에 온다.  -->
                <div class="form1" id="Form1">
                    <h3>소비자 회원가입</h3>
                    <div class="col-1">
                        <input type="text" name="mid" id="useridM" placeholder="아이디 Ajax중복검사" required>
                        <input type="text" placeholder="공백" readonly value="" id="useridMR">
                    </div>
                    <div class="col-1">
                        <input type="password" name="mpw" id="passwdM" placeholder="비번 8글자 이상" required>
                        <input type="text" readonly value="8글자이상" id="passwd1MR" >
                    </div>
                    <div class="col-1"> 
                        <input type="password"  id="passwd2M" placeholder="비번확인" required>
                        <input type="text" readonly value="확인 X" id="passwd2MR">
                    </div>
                    <div class="btn-box">
                        <button type="button" id="Next1">Next</button>
                    </div>
                </div>
    
                <div class="form2" id="Form2">
                    <h3>PERSONAL INFO</h3>
    
                    <input type="text" placeholder="이름" required name="mname">
                    <div class="col-3">
                        <div class="custom_select1">
                            <select name="mphone1">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="02">02</option>
                            </select>
                        </div>
                            <span>-</span> 
                            <input type="text" name="mphone2" required>
                            <span>-</span>
                            <input type="text"  name="mphone3" required>
                    </div>
                    <div class="col-3">
                        <input type="text" name="memail1" placeholder="이메일" required><span>@</span> 
                        <input type="text"  name="memail2" id="email2M"  placeholder="직접입력" required>
                        <div class="custom_select1">
                            <select id="memail3">
                                <option value="">직접입력</option>
                                <option value="daum.net">daum.net</option>
                                <option value="naver.com">naver.com</option>
                                <option value="google.com">google.com</option>
                            </select>
                        </div>
                    </div>
    
                    <div class="btn-box">
                        <button type="button" id="Back1">Back</button>
                        <button type="button" id="Next2">Next</button>
                    </div>
                </div>
    
                <div class="form3" id="Form3">
                    <h3>Address & BirthDay</h3>
                    <div class="col-2">
                        <input type="text"  name="mpost" id="sample4_postcode" placeholder="우편번호" required> 
                        <input type="button" class="btn-sign" value="우편번호 찾기" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                    </div>
                    <div class="col-2">
                        <input type="text" name="maddress1" id="sample4_roadAddress" placeholder="도로명주소" required> 
                        <input type="text"  name="maddress2" id="sample4_jibunAddress" placeholder="지번주소" required>
                    </div>
                    <input type="date" name="mbirth"  value="생일" required>
                    
    
                    <div class="btn-box">
                        <button type="button" id="Back2">Back</button>
                        <button type="Submit">Submit</button>
                    </div>
                </div>
                <!-- 위의 폼3개 모두 absolute이기에 이부분이 처음이라고 생각하면된다.  -->
                <div class="step-row">
                    <!-- 단계마다 색깔을 나타낸다 -->
                    <div id="progress"></div>
                    <div class="step-col"><small>Step 1</small></div>
                    <div class="step-col"><small>Step 2</small></div>
                    <div class="step-col"><small>Step 3</small></div>
                </div>
    
            </form>
    
    <!-- 판매자 회원가입 폼~~~~~~~~~~~ -->
            <form class="form-s" id="Form-S" action="sellerAdd" method="post">
                <!-- 3개의 div 모두 absolute이다. 숨어있다가 버튼 누르면 제위치에 온다.  -->
                <div class="form1" id="Form4">
                    <h3>판매자 회원가입</h3>
                    <div class="col-1">
                        <input type="text" name="sid" id="useridS" placeholder="아이디 Ajax중복검사" required>
                        <input type="text" placeholder="공백" readonly value="" id="useridSR">
                    </div>
                    <div class="col-1">
                        <input type="password" name="spw" id="passwdS" placeholder="비번 8글자 이상" required>
                        <input type="text" readonly value="8글자이상" id="passwd1SR">
                    </div>
                    <div class="col-1"> 
                        <input type="password"  id="passwd2S" placeholder="비번확인" required>
                        <input type="text" readonly value="확인 X" id="passwd2SR">
                    </div>
                    <div class="btn-box">
                        <button type="button" id="Next3">Next</button>
                    </div>
                </div>
    
                <div class="form2" id="Form5">
                    <h3>PERSONAL INFO</h3>
    
                    <input type="text" placeholder="이름" required name="sname">
                    <div class="col-3">
                        <div class="custom_select1">
                            <select name="sphone1">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="02">02</option>
                            </select>
                        </div>
                            <span>-</span> 
                            <input type="text"  name="sphone2" required>
                            <span>-</span>
                            <input type="text"  name="sphone3" required>
                    </div>
                    <div class="col-3">
                        <input type="text"  name="semail1" placeholder="이메일" required><span>@</span> 
                        <input type="text"  name="semail2" id="email2S"  placeholder="직접입력" required>
                        <div class="custom_select1">
                            <select id="semail3">
                                <option value="">직접입력</option>
                                <option value="daum.net">daum.net</option>
                                <option value="naver.com">naver.com</option>
                                <option value="google.com">google.com</option>
                            </select>
                        </div>
                    </div>
    
                    <div class="btn-box">
                        <button type="button" id="Back3">Back</button>
                        <button type="button" id="Next4">Next</button>
                    </div>
                </div>
    
                <div class="form3" id="Form6">
                    <h3>Address & BirthDay</h3>
                    <div class="col-2">
                        <input type="text"  name="spost" id="sample4_postcode1" placeholder="우편번호" required> 
                        <input type="button" class="btn-sign" value="우편번호 찾기" onclick="sample4_execDaumPostcode1()" value="우편번호 찾기">
                    </div>
                    <div class="col-2">
                        <input type="text" name="saddress1" id="sample4_roadAddress1" placeholder="도로명주소" required> 
                        <input type="text"  name="saddress2" id="sample4_jibunAddress1" placeholder="지번주소" required>
                    </div>
                    <input type="date" name="sbirth"  value="생일" required>
                    
    
                    <div class="btn-box">
                        <button type="button" id="Back4">Back</button>
                        <button type="Submit">Submit</button>
                    </div>
                </div>
                <!-- 위의 폼3개 모두 absolute이기에 이부분이 처음이라고 생각하면된다.  -->
                <div class="step-row">
                    <!-- 단계마다 색깔을 나타낸다 -->
                    <div id="progress2" ></div>
                    <div class="step-col"><small>Step 1</small></div>
                    <div class="step-col"><small>Step 2</small></div>
                    <div class="step-col"><small>Step 3</small></div>
                </div>
    
            </form>
    
        </div>
    