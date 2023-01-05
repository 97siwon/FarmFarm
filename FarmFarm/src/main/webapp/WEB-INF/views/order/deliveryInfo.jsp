<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="/resources/css/order/deliveryInfo-style.css">
  <link rel="stylesheet" href="/resources/css/order/modal/addressModal-style.css" />



  <script src="https://kit.fontawesome.com/d449774bd8.js" crossorigin="anonymous"></script>
  <title>팜팜 | 배송지변경</title>
</head>
<body>
  <div>
    <div class="address-info">
      <div class="address-header">
        <h2 class="address-title">배송지</h2>
        <div class="column-name">
          <span>선택</span>
          <span>배송 정보</span>
          <span>삭제</span>
        </div>
      </div>

      <%-- 배송지 선택 --%>
      <div class="delivery-address-area">

        <c:forEach var="address" items="${addressList}">
          <div class="one-address">
            <div class="check-address">
              <label>
                <c:if test="${address.defaultFl == 'Y'}">
                  <i class="fa-solid fa-circle-check" name="checkIcon"></i>
                  <input type="checkbox"
                  value="${address.addressNo}" checked disabled>
                </c:if>
                <c:if test="${address.defaultFl == 'N'}">
                  <i class="fa-regular fa-circle-check" name="unCheckIcon"></i>
                  <input type="checkbox" class="select-address" value="${address.addressNo}">
                </c:if>
              </label>
            </div>
            <div class="address-area">
              <c:if test="${address.defaultFl == 'Y'}">
                <span class="selected-address">기본 배송지</span>
              </c:if>
              <p class="address-detail">${address.memberAddress2}</p>
              <div class="member-info">
                <span>${address.memberName}</span>
                <span class="bar"></span>
                <span class="phone-no">${address.to}</span>
              </div>
            </div>
            <c:if test="${address.defaultFl == 'N'}">
              <div class="delete-address">
                <button class="fa-regular fa-circle-xmark" name="deleteBtn"></button>
              </div>
            </c:if>
          </div>
        </c:forEach>

      </div>

      <%-- 배송지 추가 --%>
      <div class="add-address">
        <button class="add-btn" type="button" height="60"  onclick="sample6_execDaumPostcode()">
          <i class="fa-solid fa-plus"></i>
          <span>새 배송지 추가</span>
        </button>
      </div>
    
    </div>
  
  </div>

  <jsp:include page="/WEB-INF/views/common/modal/message.jsp"/>
  <jsp:include page="/WEB-INF/views/order/modal/cartConfirm.jsp"/>
  
  <%-- 다음주소 --%>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <script src="/resources/js/order/deliveryInfo.js"></script>
  <script src="/resources/js/common/common.js"></script>

  <!-- ajax -->
  <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>


</body>
</html>
