<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!-- home section starts  -->

<section class="home" id="home">

    <div class="swiper home-slider">

        <div class="swiper-wrapper">

            <div class="swiper-slide">
                <div class="box" style="background: url(resources/images/main2.jpg) no-repeat;">
                    <div class="content">
                        <span>never stop</span>
                        <h3>exploring</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit unde ex molestias soluta consequatur saepe aliquam, excepturi delectus consequuntur minus!</p>
                        <a href="#" class="btn">get started</a>
                    </div>
                </div>
            </div>

            <div class="swiper-slide">
                <div class="box second" style="background: url(resources/images/main7.jpg) no-repeat;">
                    <div class="content">
                        <span>make tour</span>
                        <h3>amazing</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit unde ex molestias soluta consequatur saepe aliquam, excepturi delectus consequuntur minus!</p>
                        <a href="#" class="btn">get started</a>
                    </div>
                </div>
            </div>

            <div class="swiper-slide">
                <div class="box" style="background: url(resources/images/main6.jpg) no-repeat;">
                    <div class="content">
                        <span>explore the</span>
                        <h3>new world</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit unde ex molestias soluta consequatur saepe aliquam, excepturi delectus consequuntur minus!</p>
                        <a href="#" class="btn">get started</a>
                    </div>
                </div>
            </div>

        </div>

<!-- 사용법이다. 자동으로 화살표 버튼 만들어준다.   -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>

    </div>

</section>

<!-- home section ends -->


<!-- stasr  about -->

<section class="about" id="about">

   <div class="image">
      <img src="resources/images/about1.jpg" alt="">
   </div>

   <div class="content">
      <h3 class="title">welcome to our ShoppingMall</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi optio at, saepe accusamus dolorum, quos eos nesciunt amet exercitationem illum quis nostrum, repellat quaerat eum debitis fugit alias magnam omnis!</p>
      <a href="#" class="btn">read more</a>
     
   </div>

</section>



<!-- end  about -->




<!-- newsletter section starts -->

<section class="newsletter">

    <form action="">
        <h3>최신뉴스 구독하기</h3>
        <input type="email" name="" placeholder="enter your email" id="" class="box">
        <input type="submit" value="구독" class="btn btn-letter">
    </form>

</section>

<!-- newsletter section ends -->







<!-- stasr  fashion -->

	<section class="fashion" id="fashion">
		<h1 class="heading-title">Event Product</h1>
	    <div class="fashion-div">
	         
	        <div class="left-side">
	           
	            <div class="sm-product ">
	                <h1 class="pooduct-index">01</h1>
	                <div class="sm-product-img-container ">
	                    <img src="resources/images/fashion1.jpg" class="sm-product-img" alt="">
	                </div>
	                <p class="sm-product-des">Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor</p>
	            </div>
	           
	
	            
	        </div>
	
	        <div class="right-side">
	            <img src="resources/images/fashion1.jpg" class="backdrop-img" alt="">
	            <div class="fashion-content">
	                <div class="product-detail ">
	                    <h1 class="product-name">yellow tracksuit</h1>
	                    <p class="product-des">Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt labore, ullam quam saepe aperiam delectus. </p>
	                    <a href="#" class="btn">buy now</a>  <!-- class="buy-btn" -->
	                    <button class="nxt-btn"> <img src="resources/images/arrow.png" alt=""></button>
	                </div>
	                <div class="product-img-container ">
	                    <div class="product-img-container-div">
	                        <img src="resources/images/fashion1.jpg" class="product-img" alt="">
	                    </div>
	                </div>
	            </div>
	
	
	        </div>
	    </div>
</section>


<!-- end  fashion -->






<!-- 추가부분 collection -->

<section class="collection" id="collection">
   <h1 class="heading-title">Discover Collections</h1>
   <div class="collection-wrapper">
      <!-- Left side -->
      <div class="collection-left">
         <div class="collection-card">
            <img src="resources/images/collection2.jpg" alt="">
            <div class="collection-detail">
               <h2>Casual Outfit</h2>
               <span><i class="fas fa-long-arrow-alt-right"></i> Shop now</span>
            </div>
         </div>
      </div>


      <!-- Right side -->
      <div class="collection-right">
         <div class="collection-card">
            <img src="resources/images/collection1.jpg" alt="">
            <div class="collection-detail">
               <h2>Workout now</h2>
               <span><i class="fas fa-long-arrow-alt-right"></i> Shop now</span>
            </div>
         </div>
         <div class="collection-card">
            <img src="resources/images/collection4.jpg" alt="">
            <div class="collection-detail">
               <h2>Vacation Series</h2>
               <span><i class="fas fa-long-arrow-alt-right"></i> Shop now</span>
            </div>
         </div>
         <div class="collection-card">
            <img src="resources/images/collection6.jpg" alt="">
            <div class="collection-detail">
               <h2>Dress in Black</h2>
               <span><i class="fas fa-long-arrow-alt-right"></i> Shop now</span>
            </div>
         </div>
         <div class="collection-card">
            <img src="resources/images/collection3.jpg" alt="">
            <div class="collection-detail">
               <h2>Ready to go </h2>
               <span><i class="fas fa-long-arrow-alt-right"></i> Shop now</span>
            </div>
         </div>
      </div>



   </div>
</section>


<!-- end 추가부분 collection -->















<%
	MemberDTO login_member = (MemberDTO )session.getAttribute("login_member");
	String sess = "x";
	if( login_member != null){
		sess = login_member.getMid();
};%>


<!-- 채팅 -->
<a href="#" class="btn chatting" id="chatting" data-sess="<%=sess%>" >
	<span>채팅</span>
	<ion-icon name="chatbubble-ellipses-outline"></ion-icon>
</a>

<%if( login_member != null){ %>

<script>
document.querySelector('.chatting').style.display = "block";
</script>

<%}; %>



 <!-- Back to Top -->
 <a href="#" class="btn back-to-top"><i class="fa fa-angle-double-up"></i></a>
 









<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script>

// 스크롤 내리면 바로 header가 나온다. 
document.querySelector('.header').classList.add('hidden');
document.querySelector('.back-to-top').classList.add('hidden');
	window.onscroll = function() {
		// 네비바 나오게 하기 
		if(window.scrollY > 0){
		      document.querySelector('.header').classList.remove('hidden');
		   }else{
		      document.querySelector('.header').classList.add('hidden');
		   };
		   
		   // 왼쪽 이미지 나오게 하기
		   if(window.scrollY > 240){
			      document.querySelector('.about .image').classList.add('active');
			      
		   }else{
				document.querySelector('.about .image').classList.remove('active');
		   }
		   // 오른쪽 컨텐츠 나오게 하기 
		   if(window.scrollY > 360){
			      document.querySelector('.about .content').classList.add('active');
			      document.querySelector('.back-to-top').classList.remove('hidden');
		   }else{
				document.querySelector('.about .content').classList.remove('active');
				document.querySelector('.back-to-top').classList.add('hidden');
		   }
		   
		   
	}
	
	
// home의 이미지 슬라이스 형식.. 
	var swiper = new Swiper(".home-slider", {
	    loop:true, 
	    grabCursor:true,
	    navigation: {
	      nextEl: ".swiper-button-next",
	      prevEl: ".swiper-button-prev",
	    },
	});
	
	
	
// event product~~~~~~~~~~~~~~~~~~~~~~~~~~~ 	
	
	// 상품 이름 이미지 설명 부분 여기만 고치면 된다. ~~~~
	const productData = [
    {
        index: '01',
        name: 'yellow tracksuit',
        image: 'fashion1.jpg',
        des: 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Dolorem possimus dolore illum, eveniet voluptatem libero soluta laboriosam adipisci optio culpa!'
    },
    {
        index: '02',
        name: 'designer outfit',
        image: 'fashion2.jpg',
        des: 'possimus dolore illum, eveniet voluptatem libero soluta laboriosam adipisci optio culpa! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Dolorem'
    },
    {
        index: '03',
        name: 'chilling mood',
        image: 'fashion3.jpg',
        des: 'libero soluta laboriosam adipisci optio culpa! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Dolorem possimus dolore illum, eveniet voluptatem '
    }
]



const nxtBtn = document.querySelector('.nxt-btn');

let smImgContainer = document.querySelector('.sm-product-img-container');
let smImg = document.querySelector('.sm-product-img');
let productIndex = document.querySelector('.pooduct-index');
let smProductDes = document.querySelector('.sm-product-des');

let productImgContainer = document.querySelector('.product-img-container-div');
let productImg = document.querySelector('.product-img');
let backdropImg = document.querySelector('.backdrop-img');

let productDetail = document.querySelector('.product-detail');
let productName = document.querySelector('.product-name');
let productDes = document.querySelector('.product-des');

let currentPrduct = 0;

nxtBtn.addEventListener('click', function () {
   
    if(currentPrduct >= productData.length -1 ){
        currentPrduct = 0;
    }else{
        currentPrduct++;
    }


    productIndex.innerHTML = productData[currentPrduct].index;
    smProductDes.innerHTML = productData[currentPrduct].des.slice(0,80);
    smImgContainer.classList.add('slide');
    productImgContainer.classList.add('slide');
    backdropImg.classList.add('fade');
    productDetail.classList.add('fade');
    
    setTimeout(function() {
        productName.innerHTML = productData[currentPrduct].name;
        productDes.innerHTML = productData[currentPrduct].des;
        smImg.src = 'resources/images/' + productData[currentPrduct].image;
        productImg.src = 'resources/images/' + productData[currentPrduct].image;
        backdropImg.src = 'resources/images/' + productData[currentPrduct].image;


    }, 500);


    setTimeout(function() {
        smImgContainer.classList.remove('slide');
        productImgContainer.classList.remove('slide');
        backdropImg.classList.remove('fade');
        productDetail.classList.remove('fade');
    }, 1000);


});


// end event product~~~~~~~~~~~~~~~~~~~~~~~~~~~ 	






// 채팅버튼

document.querySelector("#chatting").addEventListener("click", function(event) {
	event.preventDefault();
	
	// 만들어 놓은 사용자 속성에서 data-sess 값 가져오기. 
	const sess = this.dataset.sess;
	var no = <%= sess %>;
	console.log("스크립트에서 접근하기. "+no)
	
	

	let popUrl = "chat?mid="+sess;
	let popOption = "width = 450px, height=700px, top=100px, left=100px ";
	
	window.open(popUrl,"배송조회",popOption);

});











</script>