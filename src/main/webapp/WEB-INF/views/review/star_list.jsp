<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- JavaScript 추가 -->
<script>
function convertToStars(score) {
    let fullStars = Math.floor(score); // Calculate the number of full stars
    let remainder = score - fullStars; // Calculate the decimal part

    let starString = '';

    // Full stars
    for (let i = 0; i < fullStars; i++) {
      starString += '&#9733; '; // Filled star character
    }

    // Half star (if the decimal part is greater than or equal to 0.5)
    if (remainder >= 0.5) {
      starString += ' &#9733; '; // Half-filled star character (★½)
    } else if (remainder > 0) {
      // Less than half star, fill with empty star
      starString += '&#189; '; // Empty star character (½)
    }

    // Empty stars
    for (let i = 0; i < 5 - Math.ceil(score); i++) {
      starString += '☆ '; // Empty star character (☆)
    }

    return starString;
  }
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review/rev_star.css?after">
<title>Insert title here</title>
</head>
<body>

<section>

  <h1>리뷰</h1>

  <table border=0>
    <c:forEach var="vo" items="${Rlist}">
      <tr>
        <td>
          ${vo.user_id}
          <script>
            // JavaScript 함수를 호출하여 별점 표시
            document.write(convertToStars(${vo.review_star}));
          </script>
          ${vo.review_date}
        </td>
      </tr>
      <tr>
        <td width="900"><textarea class="water_rev" type="text" id="reviewContents">${vo.review_star}</textarea></td>
      </tr> 
    </c:forEach>
  </table>
</section>

</body>
</html>