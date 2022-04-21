
// 1. 햄버거 버튼 이 나왔을때의(브라우져 작아져서) 클릭시 이벤트 
let navbar = document.querySelector(".header .navbar");

//menu-btn클릭시 .active추가
document.querySelector("#menu-btn").onclick = function(){ 
    navbar.classList.add('active');
};

//#close-navbar 클릭시 .active 제거
document.querySelector("#close-navbar").onclick = function(){ 
    navbar.classList.remove('active');
};



// 2. account-form .active 중에 소비자 판매자 버튼 클릭시 이벤트 
//1. 로그인폼에서 소비자 판매자 
let sellerBtn = document.querySelector(".account-form .seller-btn")
let loginBtn = document.querySelector(".account-form .login-btn")

//판매자 활성화 버튼 클릭시
sellerBtn.onclick =function() {
    //1.소비자,판매자 활성화 버튼
    sellerBtn.classList.add('active');
    loginBtn.classList.remove('active');
    //2. 로그인 폼변경
    document.querySelector(".account-form .login-form").classList.remove('active');
    document.querySelector(".account-form .seller-form").classList.add('active');

};
//소비자 활성화 버튼 클릭시
loginBtn.onclick =function() {    
    loginBtn.classList.add('active');
    sellerBtn.classList.remove('active');
    document.querySelector(".account-form .login-form").classList.add('active');
    document.querySelector(".account-form .seller-form").classList.remove('active');
};



//3. 로그인 아이콘 버튼 클릭시 account-form .active 이벤트 

let accountForm = document.querySelector(".account-form");


document.querySelector("#account-btn").onclick = function(){ 
    accountForm.classList.add('active');
};


document.querySelector("#close-form").onclick = function(){ 
    accountForm.classList.remove('active');
};



//4. 현재 로그인중에 아이콘 버튼 클릭시 member-form .active 이벤트 

let memberform = document.querySelector(".member-form");


document.querySelector("#member-btn").onclick = function(){ 
    memberform.classList.add('active');
};


document.querySelector("#close-member").onclick = function(){ 
    memberform.classList.remove('active');
};









