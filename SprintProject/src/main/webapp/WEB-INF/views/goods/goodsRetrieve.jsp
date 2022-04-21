<%@page import="org.apache.ibatis.io.ResolverUtil.Test"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.StockDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
//GoodsController.goodsRetrieve에서 넘어온 데이터이다. 앞으로 바뀔부분.. 1. 리뷰보기  2. select바꾸기 3. 추천상품 나열하기 4. qna 보고쓰기  
	MemberDTO login_member = (MemberDTO)session.getAttribute("login_member");
	GoodsDTO dto = (GoodsDTO) request.getAttribute("goodsRetrieve");
	String gid = dto.getGid();
	List<String> sizelist = (List<String>) request.getAttribute("sizelist");
	List<String> colorlist = (List<String>) request.getAttribute("colorlist");
	List<StockDTO> sDTO = (List<StockDTO>) request.getAttribute("sdto");
	// 넘어오는 데이터:    [large: { "red","25"} ,{"blue","10"}] ,[small: { "red","20"} ,{"white","10"}] ... 
	// 즉 데이터 형식은 :  Map<"String" , Map<"String", "int">> 
	// 첫번째 select 에서 뭘 선택하냐에 따라서 두번째 select값이 바껴야 한다. 예를들어 첫번째select에서 large를 선택하면 두번째 color select에서 large에 맞는 색깔과 제고정보가
	// 나와야 한다. 다시 첫번째 select에서 small로 바꾸면 small에 맞는 색깔과 제고량이 나오게 하기 .. 이를 해결하려면 제이쿼리를 써야한다. 
	
	// 모든 상품에 stock을 이용해서 스마트한 제고정보를 제공하기는 힘드니 stock이 없는 상품은 기존에 했던거처럼 사이즈는 sml / 색깔은 레드불루화이트로 나오게 한다. 
	// 그려려면? 
	
	String check = null;
	if ( login_member != null){
		check = login_member.getMid();
	}
			
%>


 <body>
 <div class="single-product">
   <div class="row">
   		<div class="col-2">
   			 <img src="resources/images/items/<%=dto.getGimage1() %>" alt="" width="100%" id="ProductImg">
   			
   			 
   			 <!-- 서브이미지들  -->
   			   <div class="small-img-row">
                        <div class="small-img-col">
                            <img src="resources/images/items/<%=dto.getGimage1() %>" alt="" width="100%" class="small-img" id="cloneImg1">
                        	 <span id="clone" class="clone"></span>
                        </div>
                        <div class="small-img-col">
                            <img src="resources/images/subImages/gallery-2.jpg" alt="" width="100%" class="small-img">
                        </div>
                        <div class="small-img-col">
                            <img src="resources/images/subImages/gallery-3.jpg" alt="" width="100%" class="small-img">
                        </div>
                        <div class="small-img-col">
                            <img src="resources/images/subImages/gallery-4.jpg" alt="" width="100%" class="small-img">
                        </div>
               </div>
   		</div>
   		
   		<div class="col-2 single-product-contents">
   	      <div class="title">
   			  <h3>Home / <%=dto.getGcategory() %></h3>
   		  </div>
              <h3><%=dto.getGname() %></h3>
              <h4><%=dto.getGprice() %>원</h4>
              <!-- 추가할 부분~~~~~~ stock에 저장된 사이즈 종류가 나오게 바꾸기~~~~~~~~~~~~~~~~~~~~~~`` success-->
              <select name="gsize" id="gsize" class="stockcheck">
                        <option  value="Select Size">Select Size</option>
                      	<% 
                      	for(String size : sizelist){
                      	%> 
                        <option><%=size %></option> <!--  여기에서 S인지 , M인지,L인지 데이터를 가져와야해요-->
                       	<% } %> 
              </select>
                <!-- 추가할 부분~~~~~~ stock에 저장된 색깔 종류가 나오게 바꾸기~~~~~~~~~~~~~~~~~~~~~~`` success-->
              <select name="gcolor" id="gcolor" class="stockcheck">
	                    <option id="Select Color" >Select Color</option>
	                    <option>사이즈를 먼저 선택해주세요!</option>
	              </select><br>
	          	 <p id="stock"></p>
              <input type="number" value="1" name="gamount" id="cqty">
              <button id="cart" class="btn" data-id="<%=dto.getGid() %>" data-login="<%=check %>" >Add To Cart</button>
              <h3>Product Details</h3><br>
              <p><%=dto.getGdetail() %></p>
   		</div>
   </div>	<!--end row  -->
 </div>     <!-- end single-product  -->  


    <section class="section">
      <div class="title">
        <h2>Review Board</h2>
        <p>
       		구매자들의 구매 리뷰 게시판
        </p>
      </div>

      <div class="about-center section-center">
        <article class="about-img">
          <img src="resources/images/background-main2.gif" alt="" />
        </article>
        <article class="about">
          <!-- btn container -->
          <div class="btn-container">
            <button class="tab-btn active" data-id="history">Review</button>
            <button class="tab-btn" data-id="vision">Photo Review</button>
            <button class="tab-btn" data-id="goals">1:1 Q&A</button>
          </div>
          <div class="about-content">
            <!-- single item -->
            <div class="content active" id="history">
              <h4>Review</h4>
             <!--  <p> -->
             <!-- 일반리뷰 -->
			
				<!-- 일반리뷰 -->
              <!-- </p> -->
            </div>
            <!-- end of single item -->
            <!-- single item -->
            <div class="content" id="vision">
              <h4>Photo Review</h4>
               <!-- 포토리뷰 -->
               <div class="photo_board_wrap">
               </div>
              <ul>
                <li>list item</li>
                <li>list item</li>
                <li>list item</li>
              </ul>
            </div>
            <!-- end of single item -->
            <!-- single item -->
            <div class="content" id="goals">
              <h4>1:1 문의</h4>
       			  <div class="qa_board_wrap">
             	  </div>
            </div>
            <!-- end of single item -->
          </div>
        </article>
      </div>
    </section>
    <!-- javascript -->
    <script src="app.js"></script>
  </body>
 
 
 

 
 
 
 
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script src="resources/js/memberPage/goodsRetrieve.js"></script>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 