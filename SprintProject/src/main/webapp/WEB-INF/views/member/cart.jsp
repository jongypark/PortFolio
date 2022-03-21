<%@page import="com.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	List<CartDTO> list = (List<CartDTO>)request.getAttribute("cartlist");
    	String delevertDay = (String)request.getAttribute("delevertDay");
    	int totalCart =0;
	    if ( list != null){
	    	System.out.println("cart.jsp: 총 카트수 " + list.size());
	    	totalCart = list.size();
	    }
    %>
    
    
    
    
    

<!--부트스트랩 시작은 container 혹은  container-fluid<-이게 마진없이 전체화면 차지 -->
<div class="container-fluid">
	 <div class="row"><!-- 첫번째 row는 컨테이너 역할을 한다. md 사이즈 이상은 10칸 그아래는 11칸 차지한다. -->
     	<div class="col-md-10 col-11 mx-auto mb-5">	
     		<!-- 본격시작, row안에 2개 박스 존재, cart박스와 amount박스. lg사이즈 이상은8/4 md사이즈이상은 12/12 그이하는 11/11칸씩 차지한다 -->
            <!-- 마진탑: 5 , 두박스의 갭(gx): 3 ,flex 의 align-item의 자식박스의 높이를 맞추는 stretch 기능 없애기  -->
     		<div class="row mt-5 gx-3 d-flex align-items-start">
     		
	     		<!-- 1. left Cart 박스 
	     		lg사이즈 이상은 8칸 , md칸 이상은 12칸 , 그이하는 11칸 / lg사이즈 이상은 마진 바텀0 그이하는 마진바텀5 /좌우마진은 auto / 배경그림자 존재 -->
	     		<div class="col-md-12 col-lg-8 col-11 mx-auto main_cart mb-lg-0 mb-5 shadow ">
	     		
		     		<!-- 1.1 총 cart수 cart스타일 , 패딩왼:4-->
		            <div class="card pl-4">
		            	<!-- 패딩탑:4 , 폰트두껍게bold -->
		            	<h2 class="pt-4 font-weight-bold">Cart (<span id="totalCart"><%=totalCart %></span> items)</h2>
		            </div>     	
		            	
<!-- 여기부터 반복문시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!! -->     

<% 
for(int i=0 ; i <list.size() ; i++){ 
	CartDTO dto = list.get(i);


%>		
					<div id="removeDiv1<%=dto.getCid() %>">
     				<!-- 1.2 cart 개별정보들 -->
     				<div class="card p-4">
     					 <!-- 세번째 row는 md사이즈 이상은 5/7 , 그이하는 11/11 , 2개박스 존재 img박스와 상품디테일 박스  -->
                         <div class="row">	
     					 	<!--1.1 cart images 박스 -->
                            <!-- 이미지는 md사이즈 이상은5칸 , 그이하는11칸 / 마진 왼&오는 auto / 배경화면light/ flex로 이미지 가운데 / 그림자 -->
                            <div class="col-md-5 col-11 mx-auto bg-light d-flex justify-content-center align-items-center shadow product_img">
                            	<!-- 클래스 img-fluid: 이것은 max-width: 100%; height: auto; 부모 너비에 맞게 크기가 조정되도록 이미지에 추가 -->
                            	<img src="resources/images/items/<%=dto.getGimage() %>" class="img-fluid" alt="cart img">
                           	</div><!-- end 1.1  cart images 박스 -->
     					 	
     					 	<!--1.2 cart product details 박스-->
                            <!-- 상세정보는 md사이즈 이상은7칸 그이하는 11칸 /  마진 왼&오는 auto 탑은2 / 패딩 왼오는 4 -->
                            <div class="col-md-7 col-11 mx-auto px-4 mt-2">
   								<!-- 네번째 row cart 상세정보 / 6/6비율  -->
                                <div class="row">
   									<!--1.2.1.1 상품정보  -->
                                    <div class="col-6 card-title">
                                        <h1 class="mb-4 product_name"><%=dto.getGname() %></h1>
                                        <p class="mb-2 text-uppercase"><%=dto.getGcategory() %>- <%=dto.getGid() %></p>
                                        <p class="mb-2">SIZE: <%=dto.getCsize() %></p>
                                        <p class="mb-3">COLOR: <%=dto.getGcolor() %></p>
                                    </div>
                                  
   									<!--1.2.1.2 +-버튼.  -->
                                    <div class="col-6">
                                    <!-- ul의 클래스를 pagination, li의 클래스를 page-item, a의 클래스를 page-link로 정하면 
                                                                             가로로 배열된 페이지네이션이 만들어집니다. -->
                                        <ul class="pagination justify-content-end set_quantity" data-stock="(재고량: <%=dto.getStock() %>개)" >
                                            <li class="page-item">
                                                    <!--  -->
                                                <button class="page-link minus" id="minus<%=dto.getCid() %>" data-stock="<%=dto.getStock() %>" 
                                                data-this="<%=dto.getCid() %>" data-price="<%=dto.getGprice() %>">
                                                    <i class="fas fa-minus"></i> 
                                                </button>
                                            </li>
                                            <li class="page-item">
                                                <input type="text" data-this="<%=dto.getCid() %>" class="page-link ordervalue" value="<%=dto.getCqty()%>" id="textbox1<%=dto.getCid() %>" readonly>
                                            </li>
                                            <li class="page-item">
                                                <button class="page-link plus" id="plus<%=dto.getCid() %>" data-price="<%=dto.getGprice() %>" 
                                                data-stock="<%=dto.getStock() %>"  data-this="<%=dto.getCid() %>"> 
                                                    <i class="fas fa-plus"></i>
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- 1.2.2 remover move and price -->
                                    <!-- 다섯번째 row 8칸/4칸 비율 / flex space between  -->
                                    <div class="row"> 
   										<!-- 1.2.2.1 remove와 wishlist -->
                                        <!-- 8칸 차지 , 좌우배치  -->
                                        <div class="col-8 d-flex justify-content-between remove_wish">
                                            <p class="remove" data-this="<%=dto.getCid() %>"><i class="fas fa-trash-alt" ></i> REMOVE </p>
                                           <!--  <p><i class="fas fa-heart"></i> WISH ITEM</p> -->
                                        </div>
                                        <!-- 1.2.2.2 제품 가격-->
                                        <!-- 4칸차지  -->
                                        <div class="col-4 d-flex justify-content-end price_money">
                                            <h3><span class="itemval" id="itemval1<%=dto.getCid() %>"><%=dto.getGprice() * dto.getCqty() %></span> 원</h3>
                                        </div>
   									
   									</div><!-- end 5nd row  -->
   								</div><!--end 4nd row -->		                         
                            </div><!-- end 1.2 cart product details 박스 -->
                            
     					 </div><!-- end 3nd row  -->
     				</div><!-- 1-cycle end  -->
     				<hr/>
     				</div>
  <%}; %>   				
<!-- 여기까지 반복문~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!! -->     	
     			</div><!-- end 1. left Cart 박스 -->
     			
     			<!-- 2. right amount 박스 -->
                <!-- lg사이즈 이상은 4칸 , md칸 이상은 12칸 , 그이하는 11칸 / lg사이즈 이상은 마진 탑0 그이하는 마진바텀&탑 5 /좌우마진은 auto -->
                <div class="col-md-12 col-lg-4 col-11 mx-auto mt-lg-0 mt-md-5 " >
     				<!-- lg사이즈 이상은 position-fixed 되게 하기위한 박스..   -->
                    <div class="fixedDiv">
                    	<!-- 2.1  total amount-->
                        <div class="right_side p-3 shadow bg-white">
                    			<h2 class="product_name mb-4">The Total Amount Of</h2>
                    		
	                            <div class="card">
	                                <div class="card-body nopadding">
	                                    <a  data-toggle="collapse" href="#collapseEx1" aria-expanded="false" aria-controls="collapseEx1">
	                                        <div class="price_indiv d-flex justify-content-between">
	                                            <p class="font-weight-bold">상품 가격</p>
	                                            <p>
	                                            	<span><i class="fas fa-chevron-down pt-1"></i> </span > 
	                                            	<span class="font-weight-bold" id="product_total_amt"></span>원
	                                            </p>
	                                        </div>
	                                    </a>
	                                    <div class="collapse addItems" id="collapseEx1">
<!-- 이부분이 for문 및 제이쿼리로 추가되는 부분!!!!!!!!!!!!~~~~~~~~~~~~~~~~~~~~~~~~ !!!!!!!!!!!!!!!!!!!!!!!!!!!1-->
<% 
for(int i=0 ; i <list.size() ; i++){ 
	CartDTO dto = list.get(i);
%>			                                <div id="removeDiv2<%=dto.getCid() %>">    
		                                        <div class="price_indiv d-flex justify-content-between line">
		                                            <p class="text-uppercase" id="itemval2line<%=dto.getCid() %>"> -<%=dto.getGid() %> (<%=dto.getCsize().charAt(0) %>-<%=dto.getGcolor().charAt(0) %> <span id="textbox2<%=dto.getCid() %>"> <%=dto.getCqty() %></span>EA)</p>
		                                            <p><span id="itemval2<%=dto.getCid() %>"><%=dto.getGprice() * dto.getCqty() %></span> 원</p>
		                                        </div>
	                                        </div>                 
<%}; %>
										</div>
<!--end  이부분이 for문 및 제이쿼리로 추가되는 부분!!!!!!!!!!!!~~~~~~~~~~~~~~~~~~~~~~~~ !!!!!!!!!!!!!!!!!!!!!!!!!!!1 -->

                                    </div> 
                                </div>
                                <div class="price_indiv d-flex justify-content-between">
                                    <p class="font-weight-bold">배송비</p>
                                    <p><span class="font-weight-bold" id="shipping_charge">3000</span> 원</p>
                                </div>
                                <hr class="mt-1"/>
                                <div class="total-amt d-flex justify-content-between font-weight-bold">
                                    <p>총 가격 (VAT 포함)</p>
                                    <p><span id="total_cart_amt"></span>원</p>
                                </div>
                                <div id="couponDiv" data-code="x" data-type="x" data-discount="x" class="d-flex justify-content-between font-weight-bold">
                                    <p id="dccodeContent"></p>
                                    <p><span id="dccodeDiscount"></span></p>
                                </div>
                                <div class="d-flex justify-content-end">
                                    <!-- btn-primary: 파란색버튼, 대문자로-->
                                    <button class="btn btn-primary text-uppercase" id="order">구매하기</button>
                                </div>  
                    		
                    	</div>
                    	<!--2.2 discount code part -->
                        <div class="discount_code mt-3 shadow">
                        	<!-- class card는 카드형식을 쉽게 만들어주는 키워드 
                                .card-header에는 카드 제목을 입력합니다.
                                .card-body에는 카드 내용이 들어갑니다. 
                                .card-title로 제목을, 
                                .card-text로 내용을 구분합니다.-->
                            <div class="card">
                                <div class="card-body">
                                    <!-- data-toggle을 collapse로 해야 아래 class="collapse가 안보이고 추가로
                                    href에 collapse의 id(지금은collapseExample)를 적어줘야 동작한다.
                                    a 태그는 data-toggle 과 href 
                                    button은 data-toggle 과 data-target="#id값"
                                    aria-expanded: 열린부분은 "true" 닫힌부분은 "false" <-이부분은 시각장애인 전용 스크린리더에 필요한듯. 
                                    aria-controls: 속성값은 본문이 보여지게될 부분의 id와 일치해야 한다. 
				                                      자세한 내용:https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=ksh81850&logNo=220423080597
                                    -->
                                    <a class="d-flex justify-content-between" data-toggle="collapse"
                                        href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                        	할인쿠폰 등록하기
                                        <!-- 얘는 단순한 아래방향 화살표 -->
                                        <span><i class="fas fa-chevron-down pt-1"></i></span>
                                    </a>
                                    <!-- collapse 평소에 숨어있는부분..  -->
                                    <div class="collapse" id="collapseExample">
                                        <!-- 마진탑:3 -->
                                        <div class="mt-3">
                                            <!-- form-control: input,select,textarea에 주면 된다. /
					                                                여려개의 input등이 나오면 form-group으로 묶어준다 
					                                                자세한 설명:https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=rbdud96&logNo=221442215442
                                            -->
                                            <input type="text" value="" id="dcCode" class="form-control font-weight-bold" 
                                             placeholder="Enter the discount code" >
                                            <!-- 검은색 글자, 마진탑:3 -->
                                            <small id="error_trw" class="text-dark mt-3">dc코드를 입력해주세요</small>
                                        </div>
                                        <!-- btn-primary: 파란색버튼 , btn-sm:버튼크기조절 small사이즈 , 마진탑:3 -->
                                        <div class="d-flex justify-content-end">	
                                        	<button class="btn btn-primary btn-sm mt-3" id="coupon">Apply</button>
                                        	<button class="btn btn-danger btn-sm mt-3 ml-2" id="coupon_delete">delete</button>
                                    	</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--2.3 delivery 부분 -->
                        <!-- 마진탑:3 , 박스쉐도우, 패딩:3 , 배경: 화이트 -->
                        <div class="mt-3 shadow p-3 bg-white">
                        	<!-- 패딩탑:4 -->
                            <div class="pt-4">
                                <!-- 마진바텀:4 -->
                                <h5 class="mb-4">예상 배달일</h5>
                                <p><%=delevertDay %></p>
                            </div>
                        </div>
                        
     				</div><!-- end fiexdDiv  -->
     			</div><!-- end 2. right amount 박스 -->
<!--  여기까지가   container 역할은하는 div  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->   			
     		</div><!-- end 2nd row 여기까지가 container 역할은하는 div  -->
     	</div><!-- end first row detail -->
     </div><!-- end first row  --> 
</div><!--end container-fluid  -->   
    
<!-- Optional JavaScript -->
<!-- Popper.js first, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/" crossorigin="anonymous"></script>

<script src="resources/js/jquery-3.5.1.min.js"></script>
<script src="resources/js/memberPage/cart.js"></script>  



