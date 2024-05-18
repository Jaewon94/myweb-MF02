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
                                <h4 class="card-title">책 상세보기</h4>
                                <p class="card-text">
                                    선택한 <span class="badge badge-primary">${book.title}</span> 책의 정보를 보기
                                </p>
                                <div class="card" style="width:400px">
<%--                                    <img class="card-img-top" src="img_avatar1.png" alt="Card image">--%>
                                    <div class="card-body">
                                        <h4 class="card-title">${book.title}</h4>
                                        <p class="card-text">
                                            <span class="badge badge-dark">가격</span> ${book.price} /
                                            <span class="badge badge-dark">저자</span> ${book.author} /
                                            <span class="badge badge-dark">페이지</span> ${book.page}</p>
                                        <div id="atag">
                                            <a href="#" class="btn btn-secondary btn-sm">목록</a>
                                            <a href="${book.num}" class="btn btn-secondary btn-sm">수정</a>
                                            <a href="${book.num}" class="btn btn-secondary btn-sm">삭제</a>
                                        </div>

                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Right</h4>
                                <p class="card-text">Some example text. Some example text.</p>
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
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
    document.getElementById("atag").addEventListener("click", function (event) {
        event.preventDefault();
        let target = event.target;
        if(target.tagName === "A") {
            let href = target.getAttribute("href");
            if(href === "#") {
                location.href="${cpath}/list";
            } else {
                let num = href;
                if(target.textContent === "수정") {
                    location.href="${cpath}/update/" + num;

                } else if(target.textContent === "삭제"){
                    location.href="${cpath}/remove/" + num;
                }
            }
        }
    })
</script>

</body>
</html>
