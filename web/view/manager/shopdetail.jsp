<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>Eody</title>
<meta charset="UTF-8">
<meta name="description" content="Sona Template">
<meta name="keywords" content="Sona, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

  <!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap">

<!-- Css Styles -->
<link rel="stylesheet" type="text/css" href="view/manager/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="view/manager/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="view/manager/css/elegant-icons.css">
<link rel="stylesheet" type="text/css" href="view/manager/css/flaticon.css">
<link rel="stylesheet" type="text/css" href="view/manager/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="view/manager/css/nice-select.css">
<link rel="stylesheet" type="text/css" href="view/manager/css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="view/manager/css/magnific-popup.css">
<link rel="stylesheet" type="text/css" href="view/manager/css/slicknav.min.css">
<link rel="stylesheet" type="text/css" href="view/manager/css/style.css">
</head>
<script>

	// Origin Function //
	$(document).ready(function(){
		MakeCode1();				// 주차장 여부
		MakeCode2();				// 예약 여부
		getBookings();				// 예약 리스트 출력
		StarRate();					// 별점 표시(상세)
	});
	
	// Check Box //
	var checkpark = ${singleshop.shop_park};
	var checkbooking = ${singleshop.shop_booking};
	// 주차장 여부 표시 //
	function MakeCode1(){
		if(checkpark==1){
			var code = "<span>주차장: </span>";
				code +="<input type='checkbox' name='shop_park' id='checkpark_1' value='1' checked='checked' onclick='return false;'><span>예</span>";
				code += "<input type='checkbox' name='shop_park' id='checkpark_0' value='0' onclick='return false;'><span>아니오</span>";
			$(".checkbox1").append(code);
		}else {
			var code = "<span>주차장: </span>";
				code += "<input type='checkbox' name='shop_park' id='checkpark_1' value='1'  onclick='return false;'><span>예</span>";
				code += "<input type='checkbox' name='shop_park' id='checkpark_0' value='0'  checked='checked' onclick='return false;'><span>아니오</span>";
			$(".checkbox1").append(code);
		}
	};
	
	// 예약 여부 표시 //
	function MakeCode2(){
		if(checkbooking==1){
			var code = "<span>예약여부</span>";
				code +="<input type='checkbox' name='shop_booking' id='checkbooking_1' value='1'  checked='checked' onclick='return false;'><span>가능</span>";
				code += "<input type='checkbox' name='shop_booking' id='checkbooking_0' value='0' onclick='return false;'><span>불가능</span>";
			$(".checkbox2").append(code);
		}else {
			var code = "<span>예약여부</span>";
				code += "<input type='checkbox' name='shop_booking' id='checkbooking_1' value='1'  onclick='return false;'><span>가능</span>";
				code += "<input type='checkbox' name='shop_booking' id='checkbooking_0' value='0'  checked='checked' onclick='return false;'><span>불가능</span>";
			$(".checkbox2").append(code);
		}
	};
	
	// 별점 표시(가게 상세) //
	function StarRate() {
		// 별점
		var star_strings = '';
        if(Number('${singleshop.shop_score_avg}')== 1){
        	star_strings +='<span class="starR on"></span>';
        	star_strings +='<span class="starR"></span>';
        	star_strings +='<span class="starR"></span>';
        	star_strings +='<span class="starR"></span>';
        	star_strings +='<span class="starR"></span>';
        }else if(Number('${singleshop.shop_score_avg}')  == 2){
        	star_strings +='<span class="starR on"></span>';
        	star_strings +='<span class="starR on"></span>';
        	star_strings +='<span class="starR"></span>';
        	star_strings +='<span class="starR"></span>';
        	star_strings +='<span class="starR"></span>';
        }else if(Number('${singleshop.shop_score_avg}') == 3){
        	star_strings +='<span class="starR on"></span>';
        	star_strings +='<span class="starR on"></span>';
        	star_strings +='<span class="starR on"></span>';
        	star_strings +='<span class="starR"></span>';
        	star_strings +='<span class="starR"></span>';
        }else if(Number('${singleshop.shop_score_avg}') == 4){
        	star_strings +='<span class="starR on"></span>';
        	star_strings +='<span class="starR on"></span>';
            star_strings +='<span class="starR on"></span>';
            star_strings +='<span class="starR on"></span>';
            star_strings +='<span class="starR"></span>';
        }else if(Number('${singleshop.shop_score_avg}') == 5){
        	star_strings +='<span class="starR on"></span>';
        	star_strings +='<span class="starR on"></span>'; 
        	star_strings +='<span class="starR on"></span>';
        	star_strings +='<span class="starR on"></span>';
        	star_strings +='<span class="starR on"></span>';
        }else if(Number('${singleshop.shop_score_avg}') == 0){
        	star_strings +='<span class="starR"></span>';
        	star_strings +='<span class="starR"></span>';
        	star_strings +='<span class="starR"></span>';
        	star_strings +='<span class="starR"></span>';
        	star_strings +='<span class="starR"></span>';
        }
        $(".starRate").append(star_strings);
	}
	
	// Star Rating //
	$('.starRev span').click(function() {
	    $(this).parent().children('span').removeClass('on');
	    $(this).addClass('on').prevAll('span').addClass('on');
	    var rate = $(this).attr("value");
	    $('#review_score').val(rate);
	    return false;
	});

<<<<<<< HEAD
	// Review //
    function getReviews(){
	    var ashop ='';
	    ashop='${singleshop.shop_name}';
	
	    //server로 해당 가게의 booking 목록을 요청하는 ajax입니다.
	    $.ajax({
	        url : 'getReview.mc',
	        data : {'ashop':ashop},
	        error : function(error) {
	            console.log("error");
	        },
	        success : function(data) {
	        console.log("success");
	        console.log(data);
	        displayReviewData(data);
	        },
	        error:function(request, error) {
	        	alert("fail");
	            // error 발생 이유를 알려준다.
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	    });
	}
=======
    //server로 해당 가게의 review 목록을 요청하는 ajax입니다.
    $.ajax({
        url : 'getReview.mc',
        data : {'ashop':ashop},
        error : function(error) {
            console.log("error");
        },
        success : function(data) {
        console.log("success");
        console.log(data);
        displayReviewData(data);
        },
        error:function(request, error) {
        	alert("fail");
            // error 발생 이유를 알려준다.
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
    });
}
>>>>>>> f3c5db7cb7486c4709cb78a77fd11fb96fb5fd3b
    
    function displayReviewData(reviewlist){
    //생성할 html 태그를 담을 변수(review_strings)입니다.
	    var review_strings = '';
	    review_strings += '<div class="box" style="overflow-y: scroll;">';
        for(var i in reviewlist){
             review_strings += '<div class="review-item">';
             // 사진
             review_strings += '<div class="img-container">';
             if(reviewlist[i].review_image1 != 'default.jpg'){
            	 review_strings += '<img src="./img/'+reviewlist[i].review_image1+'" style="width:120px; height:120px; border-radius:10px;">';
             }
             if(reviewlist[i].review_image2 != 'default.jpg'){
            	 review_strings += '<img src="./img/'+reviewlist[i].review_image2 +'" style="width:120px; height:120px; border-radius:10px;">';
             }
             if(reviewlist[i].review_image3 != 'default.jpg'){
             	review_strings += '<img src="./img/'+reviewlist[i].review_image3 +'" style="width:120px; height:120px; border-radius:10px;">';
             }
             review_strings += '</div>';
             // 별점
             if(Number(reviewlist[i].review_score)  == 1){
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR"></span>';
                 review_strings +='<span class="starR"></span>';
                 review_strings +='<span class="starR"></span>';
                 review_strings +='<span class="starR"></span>';
             } else if(Number(reviewlist[i].shop_score)  == 2){
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR"></span>';
                 review_strings +='<span class="starR"></span>';
                 review_strings +='<span class="starR"></span>';
             } else if(Number(reviewlist[i].shop_score) == 3){
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR"></span>';
                 review_strings +='<span class="starR"></span>';
             } else if(Number(reviewlist[i].shop_score) == 4){
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR"></span>';
             } else if(Number(reviewlist[i].shop_score) == 5){
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR on"></span>';
                 review_strings +='<span class="starR on"></span>';
             }
             // 날짜
             review_strings += '<div class="ri-text"><span>'+reviewlist[i].review_date+'</span>';
             // 내용
             review_strings += '<h5>'+reviewlist[i].review_name+'</h5><p>'+reviewlist[i].review_contents+'</p></div></div>';
             review_strings += '<hr style="border: solid 1px #dfa974;">';
   		}
	    review_strings += '</div>';
	            $(".con-container").empty();
	    $(".con-container").append(review_strings);
	}
        
<<<<<<< HEAD
     //Booking //
     //예약목록 Ajax
    function getBookings(){
	    var ashop ='';
	    ashop='${singleshop.shop_name}';
	    alert(typeof(ashop));
	               
	    //server로 해당 가게의 booking 목록을 요청하는 ajax입니다.
	    $.ajax({
	    	url : 'getbooking.mc',
	       data : {'ashop':ashop},
	       error : function(error) {
	       	console.log("error");
	       },
	       success : function(data) {
	       	console.log("success");
	       	displayBookingData(data);
	       }
	    });
	}
    function displayBookingData(bookinglist){
	    $(".con-container").empty();
	    //생성할 html 태그를 담을 변수(booking_strings)입니다.
		var booking_strings='';
		booking_strings= '<div class="row"><div class="col-lg-8"><div class="room-details-item"><div class="rd-text"><div class="rd-title">' +'${singleshop.shop_name}'+'의 예약 목록 </div><table><tbody><tr><td class="r-o">예약번호</td><td class="r-o">고객ID</td><td class="r-o">인원수</td><td class="r-o">예약 날짜</td><td class="r-o">연락처</td><td class="r-o">상태</td><td class="r-o">관리</td></tr>';
		for(var i in bookinglist){
	        booking_strings+='<tr><td>'+bookinglist[i].booking_no+'</td><td>'+bookinglist[i].searcher_id+'</td><td>'+bookinglist[i].booking_pp+'</td><td>'+bookinglist[i].booking_date+'</td><td>'+bookinglist[i].booking_searcher_phone+'</td><td>'+bookinglist[i].booking_stat+'</td><td><button id = "okbtn" value = "'+bookinglist[i].booking_stat+'" onclick="OK();">승인</button></td></tr>';
	        booking_strings+='<tr><td colspan="7">'+bookinglist[i].booking_msg+'<td></tr><hr class="my-4">';
=======
       //Booking //
       //예약목록 Ajax
       function getBookings(){
             var ashop ='';
             ashop='${singleshop.shop_name}';
             
                        
             //server로 해당 가게의 booking 목록을 요청하는 ajax입니다.
             $.ajax({
             	url : 'getbooking.mc',
                data : {'ashop':ashop},
                error : function(error) {
                	console.log("error");
                },
                success : function(data) {
                	console.log("success");
                	console.log(typeof(data));
                	displayBookingData(data);
                }
             });
        }
        function displayBookingData(bookinglist){
                $(".con-container").empty();
                //생성할 html 태그를 담을 변수(booking_strings)입니다.
                        var booking_strings='';
                        booking_strings= '<div class="row"><div class="col-lg-8"><div class="room-details-item"><div class="rd-text"><div class="rd-title">' +'${singleshop.shop_name}'+'의 예약 목록 </div><table><tbody><tr><td class="r-o">예약번호</td><td class="r-o">고객ID</td><td class="r-o">인원수</td><td class="r-o">예약 날짜</td><td class="r-o">연락처</td><td class="r-o">상태</td><td class="r-o">관리</td></tr>';
                        for(var i in bookinglist){
                                booking_strings+='<tr><td>'+bookinglist[i].booking_no+'</td><td>'+bookinglist[i].searcher_id+'</td><td>'+bookinglist[i].booking_pp+'</td><td>'+bookinglist[i].booking_date+'</td><td>'+bookinglist[i].booking_searcher_phone+'</td><td>'+bookinglist[i].booking_stat+'</td><td><button id = "okbtn" value = "'+bookinglist[i].booking_stat+'" onclick="OK();"><a href="/checkBookingImpl.mc?booking_no='+bookinglist[i].booking_no+'">승인</a></button></td></tr>';
                                booking_strings+='<tr><td colspan="7">'+bookinglist[i].booking_msg+'<td></tr><hr class="my-4">';
                        }
                        booking_strings+='</tbody></table></div></div></div></div>';
                        
                        $(".con-container").append(booking_strings);
        }
        function getChart(){
            $(".con-container").empty();
                    var chart_strings='';
                    chart_strings= '<div class="counter"><div class="container"><div class="row"><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><div class="employees"><p class="counter-count">';
                   	chart_strings+= ${singleshop.shop_hits};
                   	chart_strings+='</p><p class="employee-p">View</p></div></div>';
                   	chart_strings+='<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><div class="customer"><p class="counter-count">';
                   	chart_strings+=${singleshop.shop_score_avg};
                   	chart_strings+='</p><p class="customer-p">Star Rating</p></div></div><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><div class="design"><p class="counter-count">';
                   	chart_strings+=${singleshop.shop_booking};
                   	chart_strings+='</p><p class="design-p">Reservation</p></div></div></div></div></div>';
                    $(".con-container").append(chart_strings);
>>>>>>> f3c5db7cb7486c4709cb78a77fd11fb96fb5fd3b
		}
		booking_strings+='</tbody></table></div></div></div></div>';
		$(".con-container").append(booking_strings);
      }
    function getChart(){
	    $(".con-container").empty();
        var chart_strings='';
        chart_strings= '<div class="counter"><div class="container"><div class="row"><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><div class="employees"><p class="counter-count">';
		chart_strings+= ${singleshop.shop_hits};
		chart_strings+='</p><p class="employee-p">View</p></div></div>';
		chart_strings+='<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><div class="customer"><p class="counter-count">';
		chart_strings+=${singleshop.shop_score_avg};
		chart_strings+='</p><p class="customer-p">Star Rating</p></div></div><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><div class="design"><p class="counter-count">';
		chart_strings+=${singleshop.shop_booking};
		chart_strings+='</p><p class="design-p">Reservation</p></div></div></div></div></div>';
        $(".con-container").append(chart_strings);
	}
    function OK(){
	 	alert('승인되었습니다.');
		var stat = $('#okbtn').attr('value');
		if(stat == '0'){
			stat.replace('1');
		}else if(stat == '1'){
			stat.replace('0');
		}
	}
</script>
<style>
/* Chart CSS */
.counter
{
	padding-left: 120px !important;
    background-color: #eaecf0;
    text-align: center;
}
.counter>.container{
	width:650px;
}
.employees,.customer,.design,.order
{
    margin-top: 70px;
    margin-bottom: 70px;
}
.counter-count
{
    font-size: 18px;
    background-color: #00b3e7;
    border-radius: 50%;
    position: relative;
    color: #ffffff;
    text-align: center;
    line-height: 150px;
    width: 150px;
    height: 150px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -ms-border-radius: 50%;
    -o-border-radius: 50%;
    display: inline-block;
}

.employee-p,.customer-p,.order-p,.design-p
{
    font-size: 24px;
    color: #000000;
    line-height: 34px;
}
/* End Chart CSS */
.container{
	margin: 0 auto;
	text-align: center;
}
.rd-title{
	text-weight: bold;
	text-align: center;
	margin: 0 auto;
}
.con-container>.row>.col-lg-8{
	margin: 0 auto;
	width: 800 px !important;
}


.container{
	height: auto;
}
.container>.image{
	width: 450px;
	height: 600px;
	float: left;
}
.container>.image> img{
	width: 450px;
	height: 500px;
}
.container>.contact-form{
	margin: 0 auto;
	text-align: center;
	float: right;
	width: 450px;
	height: 600px;
}
.checkbox1 input{
	width: 15px;
	height: 15px;
	margin: 10px;
}
.checkbox2 input{
	width: 15px;
	height: 15px;
	margin: 10px;
}
.starR {
    background:
        url('http://miuu227.godohosting.com/images/icon/ico_review.png')
        no-repeat right 0;
    background-size: auto 100%;
    width: 30px;
    height: 30px;
    display: inline-block;
    text-indent: -9999px;
    cursor: pointer;
}

.starR.on {
    background-position: 0 0;
}

body {
        margin: 0;
        padding: 0;
}

#nav-con {
        text-align: center;
}

.nav-container {
        display: flex;
        flex-direction: row;
        width: 100%;
        margin: 0;
        padding: 0;
        background-color: #dfa974;
        list-style-type: none;
        text-align: center;
}

.nav-container li {
        width: 100%;
        border: 1px grey inset;
}

.nav-item {
        padding: 15px;
        cursor: pointer;
}

.nav-container a {
		height: 50px;
		line-height: 50px;
        display: block;
        margin: 0;
        padding: 0;
        text-align: center;
        text-decoration: none;
        color: white;
}

.nav-item-chidld(1) {
        background-color: lightseagreen;
}

.nav-item:hover {
        backgroud-color: grey;
}

.con-container {
        width: 100%;
        height: auto;
        padding: 20px;
        border: 0px black solid;
}

.shopdetail-container {
        height: 700px;
        margin-bottom: 120px;
}

::-webkit-scrollbar {
        display: none;
} /*특정 부분 스크롤바 없애기*/
.box {
        -ms-overflow-style: none;
}

.box::-webkit-scrollbar {
        display: none;
}
.img-container img{
        margin-top:10px;
        margin-bottom: 10px;
        margin-right:10px;
}

.table1{
	font-size:12px;
	width: 450px;
	height: 300px;
}
.shopdetail-container>.jumbotron{
	height: 700px;
}
.con-container>.counter>.container{
	margin: 0 auto;
}
.shopdetail-container p{

    margin-bottom: 15px !important;
    font-size: 15px !important;
    font-weight: bold !important;
}
#shopname{
	font-size: 21px;
}
.footer-section{
	margin-top: 20px;
}
.contact-form> button{
	margin-top: 40px;
}

</style>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	<!-- Offcanvas Menu Section Begin -->
	 <div class="offcanvas-menu-wrapper">
	     <div class="header-configure-area">
	         <a href="alogin.mc" class="bk-btn">Login</a>
	         <a href="aregister.mc" class="bk-btn">Register Now</a>
	     </div>
	     <div id="mobile-menu-wrap"></div>
	     <div class="top-social">
	         <a href="#"><i class="fa fa-facebook"></i></a>
	         <a href="#"><i class="fa fa-twitter"></i></a>
	         <a href="#"><i class="fa fa-tripadvisor"></i></a>
	         <a href="#"><i class="fa fa-instagram"></i></a>
	     </div>
	     <ul class="top-widget">
	         <li><i class="fa fa-phone"></i> (12) 345 67890</li>
	         <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
	     </ul>
	 </div>
    <!-- Header Section Begin -->
    <header class="header-section header-normal">
        <div class="top-nav">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="logo">
                            <a href="admin.html"><img src="img/logo/m_blacklogo.png" alt="">
                            </a>
                    	</div>
           			</div>
            		<div class="col-lg-6">
                   		<div class="tn-right">
                        	<div class="top-social"></div>
                           	<a href="alogin.mc" class="bk-btn">login</a>
						 	<a href="manageradd.mc" class="bk-btn">Register Now</a>
						 	<div class="language-option">
   								<img src="view/manager/img/pointer.png" alt="">
    						</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header End -->
    
    <h2> ${aloginuser.manager_id}님의 SHOP</h2>
	<div class="shopdetail-container mb-20">
        <!-- SHOP DETAIL START  -->
	    <div class="jumbotron jumbotron-fluid">
			<div class="container">
				<div class="image">
					<img src="img/shopImg/${singleshop.shop_img1}">
				</div>
				<div class="contact-form">
					<span id="shopname"> 가게명: ${singleshop.shop_name}</span>
					<div class="starRate mb-20">
	                </div>
	                <input type="hidden" name="review_score" id="review_score">
	                <p></p>
	                <table class="table1">
	                	<tr>
	                		<td><p>사업자 번호: </p></td>
	                		<td><p>${singleshop.shop_number}</p></td>
	                	</tr>
	                	<tr>
	                		<td><p> 주소: </p></td>
	                		<td><p>${singleshop.shop_address}</p></td>
	                	</tr>
	                	<tr>
	                		<td><p>운영시간: </p></td>
	                		<td><p>${singleshop.shop_time}</p></td>
	                	</tr>
	                	<tr>
	                		<td><p>전화번호: </p></td>
	                		<td><p>${singleshop.shop_phone}</p></td>
	                	</tr>
	                	<tr>
	                		<td><p>해당지역: </p></td>
	                		<td><p>${singleshop.h_name}</p></td>
	                	</tr>
	                	<tr>
	                		<td><p>장소유형: </p></td>
	                		<td><p>${singleshop.shop_type}</p></td>
	                	</tr>
	                	<tr>
	                		<td><p>주차장: </p></td>
	                		<td><p class="checkbox1"></p></td>
	                	</tr>
	                	<tr>
	                		<td><p>예약여부: </p></td>
	                		<td><p class="checkbox2"></p></td>
	                	</tr>
	                	<tr>
	                		<td><p> 장소 소개 </p></td>
	                		<td><p>${singleshop.shop_info}</p></td>
	                	</tr>
	                </table>
					<a href="shopupdate.mc"><button type="button" class="btn btn-link">가게 정보 수정</button></a>
				</div>
			</div>
		</div>
  	  <!-- SHOP DETAIL END  -->         
	</div>
    <!-- BOOKING & REVIEW & CHART START -->
    
    <div class="container">
	     <!-- <div class="offcanvas-menu-wrapper">
		    <nav class="mainmenu mobile-menu">
		        <ul>
		            <li class="active"><a href="./index.html">예약신청현황</a></li>
		            <li><a href="./rooms.html">리뷰확인</a></li>
		            <li><a href="./about-us.html">Shop현황</a></li>                
		        </ul>
		    </nav>
	       	<div id="mobile-menu-wrap"></div> 
	   	</div>-->
		<nav id="nav-con">
	        <ul class="nav-container">
	            <li><a class="nav-item" onclick="getBookings();">예약신청현황</a></li>
	            <li><a class="nav-item" onclick="getReviews();">리뷰확인</a></li>
	            <li><a class="nav-item" onclick="getChart();">Shop현황</a></li>
	        </ul>
        </nav>
        <div class="con-container">
	        <c:choose>
				<c:when test="${centerpage == null}">
					<jsp:include page="booklist.jsp"></jsp:include>
				</c:when>
				<c:otherwise>
					<jsp:include page="${centerpage}.jsp"></jsp:include>
				</c:otherwise>
	        </c:choose>
		</div>
    </div>
    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="footer-text">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="ft-about">
                            <div class="logo">
                                <a href="#">
                                    <img src="view/manager/img/m_blacklogo.png">
                                </a>
                            </div>
                            <p>We inspire and reach millions of travelers<br> across 90 local websites</p>
                            <div class="fa-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="ft-contact">
                            <h6>Contact Us</h6>
                            <ul>
                                <li>https://github.com/socialDe</li>
                                <li>https://github.com/hunman89</li>
                                <li>https://github.com/cijbest</li>
                                <li>https://github.com/oshsage</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                  		<!-- Footer 오른쪽 파트 채우는 곳  -->
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                    </div>
                    <div class="col-lg-5">
                        <div class="co-text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Search model Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch"><i class="icon_close"></i></div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

    
     <!-- Js Plugins -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="view/manager/js/jquery-3.3.1.min.js"></script>
    <script src="view/manager/js/bootstrap.min.js"></script>
    <script src="view/manager/js/jquery.magnific-popup.min.js"></script>
    <script src="view/manager/js/jquery.nice-select.min.js"></script>
    <script src="view/manager/js/jquery-ui.min.js"></script>
    <script src="view/manager/js/jquery.slicknav.js"></script>
    <script src="view/manager/js/owl.carousel.min.js"></script>
    <script src="view/manager/js/main.js"></script>
    
</body>
</html>
