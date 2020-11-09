<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- explorer_europe start  -->

<div class="explorer_europe list_wrap">
	<div class="container">
		<div class="bradcam_text text-center">
			<h1>Choose the shop</h1>
			</br>
			</br>
		</div>
		<div class="row">
			<div class="col-xl-4 col-lg-4">
				<div class="filter_wrap">
					<div class="bradcam_text text-center">
						<h3>${hplace.h_name }</h3>
					</div>
					<div class="filter_main_wrap">
						<jsp:include page="map.jsp" />
					</div>

					<div class="filter_main_wrap">
						<div class="filter_inner">
							
								<div class="input_field">
									<input id="keyword" type="text" placeholder="상호 검색">
									<button class="submit_btn" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</div>
								<div class="input_field">
									<select class="wide" id="shopType">
										<option data-display="장소 유형" value="000">선택하세요</option>
										<option value="100">식당</option>
										<option value="101">까페</option>
										<option value="102">기타</option>
									</select>
								</div>								
								<div class="input_field ">
									<div class="inner">
										<div class="check_1">
											<input type="checkbox" id="carCheck" name="fruit-1"
												value="1"> <label for="carCheck">주차장</label>
										</div>
										<div class="check_1">
											<input type="checkbox" id="bookCheck" name="fruit-4"
												value="2"> <label for="bookCheck">예약가능</label>
										</div>
									</div>
								</div>				
							
						</div>
						<div class="last_range">
							<label for="amount">.</label>
						</div>
					</div> 
				</div>
			</div>

			<div class="col-xl-8 col-lg-8">
				<div class="row">
					<c:forEach var="shop" items="${shoplist}" varStatus="vs">
						<div class="col-xl-6 col-lg-6 col-md-6 shop_container">
							<div class="single_explorer ${shop.shop_name } shoptype000 shoptype${shop.shop_type} park${shop.shop_park} booking${shop.shop_booking}">
								<div class="thumb">
									<img src="img/shopImg/${shop.shop_img1 }" width="250px"
										height="200px">
								</div>
								<div class="explorer_bottom d-flex">

									<div class="explorer_info">
										<h3>
											<a data-toggle="modal" href="#shopmodal${vs.index }"
												onclick="fn_count('${shop.shop_name }')">
												${shop.shop_name }</a>
										</h3>
										<p>${shop.shop_address } </p>
										<ul>
											<li><i class="fa fa-phone"></i>${shop.shop_phone }</li>
											<li><i class="fa fa-star"></i>${shop.shop_score_avg }/5.0</li>
										</ul>
									</div>
								</div>
							</div>
						</div>


						<div class="modal fade" id="shopmodal${vs.index }" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLongTitle"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">

									<div class="modal-header">

										<h3 class="modal-title">Reserve</h3>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>

									</div>
									<div class="modal-body">
										<div class="col-lg-8 col-md-8"
											>
											<div class="explorer_info">
												<h3>
													<a href="#" id="shopinfo">${shop.shop_name }</a>
												</h3>
												<p id="shopinfo">${shop.shop_address }</p>
												<ul id="shopinfo">
													<li><i class="fa fa-phone"></i> ${shop.shop_phone }</li>
													<li><i class="fa fa-star"></i>${shop.shop_score_avg }/5.0</li>
													<li><i class="fa fa-info"></i>&emsp;${shop.shop_info }</li>
												</ul>
											</div>
										</div>
										<div class="section-top-border" id="shopimages">
											<!-- image -->
											<img src="/img/shopImg/${shop.shop_img1}" width="300px"
												height="250px">
											<img src="/img/shopImg/${shop.shop_img2}" width="300px"
												height="250px"> <img
												src="/img/shopImg/${shop.shop_img3}" width="300px"
												height="250px"> <img
												src="/img/shopImg/${shop.shop_img4}" width="300px"
												height="250px">
										</div>
										<div class="section-top-border">

											<form action="bookingimpl.mc" method="post">
												<table class="mb-20"
													style="margin-left: auto; margin-right: auto;">
													<tr>
														<td>예약자 성함</td>
														<td colspan="2"><div class="input_field mb-20">
																<input type="text" name="searcher_name"
																	placeholder="name"><br>
															</div></td>
													</tr>
													<tr>
														<td><input type="hidden" name="searcher_id"
															value="${loginuser.searcher_id }"></td>
														<td><input type="hidden" name="shop_name"
															value="${shop.shop_name }"></td>
														<td><input type="hidden" name="booking_stat"
															value="0"></td>
														<td><input type="hidden" name="review_stat" value="0"></td>
														<td><input type="hidden" name="shop_img"
															value="${shop.shop_img1 }"></td>
													</tr>
													<tr>
														<td>인원수</td>
														<td colspan="3"><div class="input_field mb-20">
																<input type="text" name="booking_pp" id="booking_pp"
																	placeholder="number">
															</div></td>
													</tr>
													<tr>
														<td>예약일</td>
														<td colspan="3"><div class="input_field mb-20">
																<input type="date" name="booking_date" id="booking_date">
															</div></td>
													</tr>
													<tr>
														<td>예약메시지</td>
														<td colspan="3"><div class="input_field mb-20">
																<textarea class="single-textarea" placeholder="Message"
																	name="booking_msg" onfocus="this.placeholder = ''"
																	onblur="this.placeholder = 'Message'" required></textarea>
															</div></td>
													</tr>
													<tr>
														<td>예약자 연락처</td>
														<td colspan="3"><div class="input_field mb-20">
																<input type="text" name="searcher_phone"
																	placeholder="ex) 010-000-0000">
															</div></td>
													</tr>
												</table>

												<div class="text-center">
													<button class="boxed-btn2 mb-30" type="submit">예약하기</button>
												</div>
											</form>

										</div>

									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>
		</div>
	</div>

	<script>
		var k1 = ''; 
		var k2 = '000';
		$(document).ready(function() {
			$("#keyword").keyup(function(){
				k1 = $(this).val();				
				word_find(k1,k2);
			})
			
			$("#carCheck").change(function(){
				if($("#carCheck").is(":checked")){	
					word_find(k1,k2);
					$(".shop_container>div:not('.park1')").hide();				
				}else{					
					$(".shop_container>div:not('.park1')").show();
					word_find(k1,k2);
				}
			});
			
			$("#bookCheck").change(function(){
				if($("#bookCheck").is(":checked")){
					word_find(k1,k2);
					$(".shop_container>div:not('.booking1')").hide();
				}else{					
					$(".shop_container>div:not('.booking1')").show();
					word_find(k1,k2);
				}
			});
			
			$("#shopType").change(function(){
				$(".shop_container").children().show();
				k2 = $(this).val();
				word_find(k1,k2);
			});	
		})
		function word_find(a,b){
			$(".shop_container").hide();
			$(".shop_container>div:contains('"+a+"')").parent().show();
			$(".shop_container>div:not('.shoptype"+b+"')").hide();
		}
		
		function fn_count(name) {
			$.ajax({
				url : 'shop_hitcnt.mc',
				data : {
					'shop_name' : name
				}
			});
		}
	</script>