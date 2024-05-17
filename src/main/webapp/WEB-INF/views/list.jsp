<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container-fluid mt-3">
    <h1>Java Spring Full Stack Developer</h1>
    <p>Resize the browser window to see the effect.</p>
    <p>The first, second and third row will automatically stack on top of each other when the screen is less than 576px wide.</p>

    <div class="container-fluid">

        <div class="card">
            <div class="card-header">Java Spring Framework</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-2 mb-2">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Left</h4>
                                <p class="card-text">Some example text. Some example text.</p>
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-7 mb-2">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Book List</h4>
                                <p class="card-text">책 리스트를 보여주는 부분</p>

                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>가격</th>
                                        <th>저자</th>
                                        <th>페이지수</th>
                                        <th>검색</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="book" items="${list}">
                                            <tr>
                                                <td>${book.num}</td>
                                                <td>${book.title}</td>
                                                <td>${book.price}</td>
                                                <td>${book.author}</td>
                                                <td>${book.page}</td>
                                                <td><button class="btn btn-sm btn-info" onclick="showTitle(this)">검색</button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">검색결과</h4>
                                <p class="card-text" id="searchTitle">Some example text. Some example text.</p>
                                <div id="bookList"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer text-center">Java Spring Full Stack Developer(김재원)</div>
        </div>



    </div>
</div>
<script>
    function showTitle(button) {
        let row = button.closest("tr");
        let title = row.querySelector("td:nth-child(2)").textContent;

        document.getElementById("searchTitle").textContent = "선택된 책 제목 : " + title;

        // $.ajax({});
        // tetch().then().then()
        let url = "${cpath}/search/books?title="+encodeURIComponent(title);

        fetch(url)
            .then(response => {
                if(response.ok) {
                    return response.json();
                }
                throw new Error("error")
            })
            .then(data => {
                console.log(data); // 책목록 (JSON)
                const resultContainer = document.querySelector('#bookList')
                resultContainer.innerHTML = '';
                data.documents.forEach(book => {
                    const {title, price, isbn, publisher, thumbnail, url, authors} = book;

                    // HTML 요소 생성 및 설정
                    const bookInfo = document.createElement('div');
                    bookInfo.classList.add("book-info");
                    bookInfo.style.border = "1px solid #ddd";
                    bookInfo.style.margin = '10px 0';
                    bookInfo.style.padding = '10px';

                    var html = "<table class='table'";
                    html += "<tr>";
                    html += "<td>저자<button type='button' class='btn btn-sm btn-success save-btn' onclick='goSave(\""+isbn + "\")'>저장</button></td>";
                    html += "<td id='a" +isbn + "'>" + authors + "</td>";
                    html += "</tr>";
                    html += "<tr>";
                    html += "<td>제목</td>";
                    html += "<td id='t"+isbn+"'><a href="+ url +">" + title + "</a></td>";
                    html += "</tr>";
                    html += "<tr>";
                    html += "<td>가격</td>";
                    html += "<td id='p"+isbn+"'>"+price+"</td>";
                    html += "</tr>";
                    html += "<tr>";
                    html += "<td>출판사</td>";
                    html += "<td>" + publisher + "</td>";
                    html += "</tr>"
                    html += "<tr>";
                    html += "<td colspan='2'><img src="+thumbnail+"/></td>";
                    html += "</tr>";
                    html += "</table>";
                    bookInfo.innerHTML=html;

                    // bookInfo.innerHTML = "<a href='"+url+"'>" + title +"</a>" + ":" + price + ":" + isbn + ":" + publisher + ":" +"<img src='"+thumbnail+"' />";

                    // 생성된 요소를 컨테이너에 추가
                    resultContainer.appendChild(bookInfo);
                });
            })
            .catch(error => {
                console.log(error);
            })
    }

    // 저장 버틍 클릭시 처리하는 부분
    function goSave(isbn) {
        let authorsElement = document.getElementById("a" + isbn);
        let author = authorsElement.textContent; // 또는 authorsElement.innerText; 사용가능

        let titleElement = document.getElementById("t" + isbn);
        let title = titleElement.textContent; // 또는 authorsElement.innerText; 사용가능

        let priceElement = document.getElementById("p" + isbn);
        let price = priceElement.textContent; // 또는 authorsElement.innerText; 사용가능

        console.log(author, title, price);

        // fetch()
        const url = "${cpath}/restSave";

        fetch(url, {
            method: "POST",
            headers: {
                "Content-Type" : "application/json"
            },
            body: JSON.stringify({title, price, author})
        })
            .then(response => response.text())
            .then(data => {
                console.log(data); // 성공 메시지
                location.href="${cpath}/list";
            })
            .catch(error => {
                console.log(error);
            })
        return;
    }
</script>
</body>
</html>
