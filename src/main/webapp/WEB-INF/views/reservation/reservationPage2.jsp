<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
    <title>예약 하기</title>
    <link href="../css/reservation.css" rel="stylesheet"> -->
    <link href="../../css/style.css" rel="stylesheet">

</head>

<body>
<div id="container">
    <div class="header">
        <header class="header_tit">
            <h1 class="logo">
                <a href="/reservation/mainpage" class="lnk_logo" title="예약"> <span class="spr_bi ico_bk_logo">예약</span> </a>
            </h1>
                <span title="내예약" class="viewReservation" th:text="${session.reservationEmail}"></span>
            </a>
        </header>
    </div>
    <hr>
    <div class="ct">
        <div class="section_my">
            <!-- 예약 현황 -->
            <div class="my_summary">
                <ul class="summary_board">
                    <li class="item">
                        <!--[D] 선택 후 .on 추가 link_summary_board -->
                        <a href="#" class="link_summary_board on">
                            <i class="spr_book2 ico_book2"></i>
                            <em class="tit">전체</em>
                            <span class="figure" id="allReservation"></span>
                        </a>
                    </li>
                    <li class="item">
                        <a href="#" class="link_summary_board">
                            <i class="spr_book2 ico_book_ss"></i>
                            <em class="tit">이용예정</em>
                            <span class="figure" id="confirmedReservation"></span>
                        </a>
                    </li>
                    <li class="item">
                        <a href="#" class="link_summary_board">
                            <i class="spr_book2 ico_check"></i>
                            <em class="tit">이용완료</em>
                            <span class="figure" id="usedReservation"></span>
                        </a>
                    </li>
                    <li class="item">
                        <a href="#" class="link_summary_board">
                            <i class="spr_book2 ico_back"></i>
                            <em class="tit">취소·환불</em>
                            <span class="figure" id="cancelReservation"></span>
                        </a>
                    </li>
                </ul>
            </div>
            <!--// 예약 현황 -->

            <!-- 내 예약 리스트 -->
            <div class="wrap_mylist">
                <ul class="list_cards" ng-if="bookedLists.length > 0">
                    <!--[D] 예약확정: .confirmed, 취소된 예약&이용완료: .used 추가 card -->
                    <li class="card" style="display: none;">
                        <div class=link_booking_details>
                            <div class="card_header">
                                <div class="left"></div>
                                <div class="middle">
                                    <!--[D] 예약 신청중: .ico_clock, 예약확정&이용완료: .ico_check2, 취소된 예약: .ico_cancel 추가 spr_book2 -->
                                    <i class="spr_book2 ico_clock"></i>
                                    <span class="tit">예약 신청중</span>
                                </div>
                                <div class="right"></div>
                            </div>
                        </div>
                    </li>
                    <li class="card confirmed">
                        <div class="link_booking_details">
                            <div class="card_header">
                                <div class="left"></div>
                                <div class="middle">
                                    <!--[D] 예약 신청중: .ico_clock, 예약확정&이용완료: .ico_check2, 취소된 예약: .ico_cancel 추가 spr_book -->
                                    <i class="spr_book2 ico_check2"></i>
                                    <span class="tit">예약 확정</span>
                                </div>
                                <div class="right"></div>
                            </div>
                        </div>
                    </li>
                    <li class="card used">
                        <div class="link_booking_details">
                            <div class="card_header">
                                <div class="left"></div>
                                <div class="middle">
                                    <!--[D] 예약 신청중: .ico_clock, 예약확정&이용완료: .ico_check2, 취소된 예약: .ico_cancel 추가 spr_book -->
                                    <i class="spr_book2 ico_check2"></i>
                                    <span class="tit">이용 완료</span>
                                </div>
                                <div class="right"></div>
                            </div>
                        </div>
                    </li>
                    <li class="card used cancel">
                        <div class="link_booking_details">
                            <div class="card_header">
                                <div class="left"></div>
                                <div class="middle">
                                    <!--[D] 예약 신청중: .ico_clock, 예약확정&이용완료: .ico_check2, 취소된 예약: .ico_cancel 추가 spr_book -->
                                    <i class="spr_book2 ico_cancel"></i>
                                    <span class="tit">취소된 예약</span>
                                </div>
                                <div class="right"></div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <!--// 내 예약 리스트 -->

            <!-- 예약 리스트 없음 -->
            <div class="err"><i class="spr_book ico_info_nolist"></i>
                <h1 class="tit">예약 리스트가 없습니다</h1>
            </div>
            <!--// 예약 리스트 없음 -->
        </div>
    </div>
    <hr>
</div>


    </div>
</div>
<div class="reservationEmail" th:id="${session.reservationEmail}"></div>
<!--// 취소 팝업 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.1.2/handlebars.min.js"></script>
<script type="text/javascript" src="/js/global.js"></script>
<script type="text/javascript" src="/js/reserved/bookingEvent.js"></script>
<script type="text/javascript" src="/js/reserved/makeCardTemplate.js"></script>
<script type="text/javascript" src="/js/reserved/reserved.js"></script>

<script type="rv-template" id="cancel_card_item_template">
    <article class="card_item" id="{{reservationInfoId}}">
        <a class="link_booking_details">
            <div class="card_body">
                <div class="left"></div>
                <div class="middle">
                    <div class="card_detail">
                        <em class="booking_number">No.{{reservationInfoId}}</em>
                        <h4 class="tit">{{productDescription}}</h4>
                        <ul class="detail">
                            <li class="item">
                                <span class="item_tit">공연 일시</span>
                                <em class="item_dsc">
                                    {{openingHours}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">홈페이지</span>
                                <em class="item_dsc">
                                    {{homepage}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">장소</span>
                                <em class="item_dsc">
                                    {{placeLot}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">예약자명</span>
                                <em class="item_dsc">
                                    {{reservationName}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">예약일시</span>
                                <em class="item_dsc">
                                    {{reservationDate}}
                                </em>
                            </li>
                        </ul>
                        <div class="price_summary">
                            <span class="price_tit">취소된 금액</span>
                            <em class="price_amount">
                                <span>{{totalPrice}}</span>
                                <span class="unit">원</span>
                            </em>
                        </div>
                    </div>
                </div>
                <div class="right"></div>
            </div>
            <div class="card_footer">
                <div class="left"></div>
                <div class="middle"></div>
                <div class="right"></div>
            </div>
        </a>
    </article>
</script>

<script type="rv-template" id="confirmed_card_item_template">
    <article class="card_item" id="{{reservationInfoId}}">
        <a class="link_booking_details">
            <div class="card_body">
                <div class="left"></div>
                <div class="middle">
                    <div class="card_detail">
                        <em class="booking_number">No.{{reservationInfoId}}</em>
                        <h4 class="tit">{{productDescription}}</h4>
                        <ul class="detail">
                            <li class="item">
                                <span class="item_tit">공연 일시</span>
                                <em class="item_dsc">
                                    {{openingHours}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">홈페이지</span>
                                <em class="item_dsc">
                                    {{homepage}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">장소</span>
                                <em class="item_dsc">
                                    {{placeLot}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">에약자명</span>
                                <em class="item_dsc">
                                    {{reservationName}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">예약일시</span>
                                <em class="item_dsc">
                                    {{reservationDate}}
                                </em>
                            </li>
                        </ul>
                        <div class="price_summary">
                            <span class="price_tit">결제 예정금액</span>
                            <em class="price_amount">
                                <span>{{totalPrice}}</span>
                                <span class="unit">원</span>
                            </em>
                        </div>
                        <!-- [D] 예약 신청중, 예약 확정 만 취소가능, 취소 버튼 클릭 시 취소 팝업 활성화 -->
                        <div class="booking_cancel" id="{{reservationInfoId}}">
                            <button class="btn"><span>취소</span></button>
                        </div>

                    </div>
                </div>
                <div class="right"></div>
            </div>
            <div class="card_footer">
                <div class="left"></div>
                <div class="middle"></div>
                <div class="right"></div>
            </div>
        </a>
        <a href="#" class="fn fn-share1 naver-splugin btn_goto_share" title="공유하기"></a>
    </article>
</script>

<script type="rv-template" id="used_card_item_template">
    <article class="card_item" id="{{reservationInfoId}}">
        <a class="link_booking_details">
            <div class="card_body">
                <div class="left"></div>
                <div class="middle">
                    <div class="card_detail">
                        <em class="booking_number">No.{{reservationInfoId}}</em>
                        <h4 class="tit">{{productDescription}}</h4>
                        <ul class="detail">
                            <li class="item">
                                <span class="item_tit">공연 일시</span>
                                <em class="item_dsc">
                                    {{openingHours}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">홈페이지</span>
                                <em class="item_dsc">
                                    {{homepage}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">장소</span>
                                <em class="item_dsc">
                                    {{placeLot}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">예약자명</span>
                                <em class="item_dsc">
                                    {{reservationName}}
                                </em>
                            </li>
                            <li class="item">
                                <span class="item_tit">예약일시</span>
                                <em class="item_dsc">
                                    {{reservationDate}}
                                </em>
                            </li>
                        </ul>
                        <div class="price_summary">
                            <span class="price_tit">결제 금액</span>
                            <em class="price_amount">
                                <span>{{totalPrice}}</span>
                                <span class="unit">원</span>
                            </em>
                        </div>
                        <div class="booking_cancel" id="{{reservationInfoId}}">
                            <a href="/reservation/reviewWriteForm?reservationInfoId={{reservationInfoId}}">
                                <button class="btn"><span>예매자 리뷰 남기기</span></button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="right"></div>
            </div>
            <div class="card_footer">
                <div class="left"></div>
                <div class="middle"></div>
                <div class="right"></div>
            </div>
        </a>
    </article>
</script>
</body>

</html>