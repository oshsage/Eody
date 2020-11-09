<%@ page language="java" contentType="text/html; charset=utf-8"
        pageEncoding="utf-8"%>
<!-- modal -->
<div class="modal fade" id="reviewmodal_mod" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
                <div class="modal-content">

                        <div class="modal-header">

                                <h3 class="modal-title">Review</h3>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                </button>
                        </div>


                        <div class="modal-body">

                                <div class="explorer_info">

                                        <form enctype="multipart/form-data" action="modifyReviewImpl.mc" method="post">
                                        <input type="hidden" name="booking_no" value="${b.booking_no}">
                                        <input type="hidden" name="shop_name">
                                        <input type="hidden" name="review_name" value="${loginuser.searcher_nickname}">
                                        <input type="hidden" name="searcher_id" value="${loginuser.searcher_id}">
                                        <div>별점</div>
                                        <div class="starRev mb-20">
                                                <span class="starR" value="1">별1</span> 
                                                <span class="starR" value="2">별2</span> 
                                                <span class="starR" value="3">별3</span> 
                                                <span class="starR" value="4">별4</span> 
                                                <span class="starR" value="5">별5</span>
                                        </div>
                                        <input type="hidden" name="shop_score" id="shop_score">

                                        <div>사진</div>
                                        <div class="mb-20">
                                                <!-- <input multiple="multiple" type="file" name="file" multiple style="display:none">
                                                <div class="button" onclick="onclick=document.all.file.click()">사진추가</div> -->
                                                <input multiple="multiple" id="input_file" type="file" name="files">
                                                
                                                <div id="preview"></div>
                                        </div>
                                        <!-- <input type="hidden" name="review_img" id="review_img"> -->

                                        <div>내용</div>
                                        <div class="mb-20">
                                                <input type="text" id="review-contents" name="review_contents"> 
                                        </div>
                                        
                                        <div class="mb-20">
                                                <button class="boxed-btn2 mb-30" onclick="alert('리뷰가 수정되었습니다')" type="submit">리뷰 수정하기</button>
                                        </div>
                                        

                                        </form>
                                </div>

                        </div>

                </div>
        </div>
</div>