<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<%@ include file="inc/header.jsp" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="@{/css/css/all.css}" rel="stylesheet">
<link href="@{/css/stars.css}" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>review</title>
    <link rel="stylesheet" href="resources/css/ind.css">
</head>

리뷰OK!
<block replace="~{inc/layout :: body(~{this :: main})}">
	<main class="main" fragment="main">
		<div class="container">
			<form role="review--form" action="" method="post" >
				<input type="hidden" name="movie--id" id="movie--id" value="">			
				<div class="form-group">
					<label for="mid">이름</label> 
					<input type="text" name="username" class="form-control" id="username" value="${memberId}" readonly>
				</div>
				<div class="form-group">
					<label for="movie">전시회</label> 
					<input type="text" name="movie" class="form-control" id="movie" value="" readonly>
				</div>
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" name="title" class="form-control" id="title" value=""> 
					<span id="title--ok" text=""></span>
				</div>
				<div class="form-group">
					<label for="rating">평점</label>
					<input type="number" name="rating" class="form-control" id="rating" step="1" max="5" value="" placeholder="평점(0점 ~ 5점)">
					<div class="stars-outer">
						<div class="stars-inner"></div>
					</div>
					<span class="number-rating"></span> <br> 
					<span id="rating--ok" text=""></span>
				</div>
				<div name="myform" id="myform" method="post" action="./save">
			    <fieldset>
			        <legend>별점</legend>
			        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
			        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
			        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
			        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
			        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
			    </div>
				
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control summernote" name="content" id="content" value=""></textarea>
					<span id="content--ok" text=""></span>
					<h5 id="limite_vermelho" style="text-align: right; color: red"></h5>
					<h5 id="limite_normal" style="text-align: right"></h5>
					<button type="button" id="btn--review--create" class="btn btn-primary">리뷰작성</button> 		
				<input class="btn btn-primary" type="button" value="처음으로" onclick="script:window.location='index'">	
				</div>		
			</form>
							
		</div>
		<script>
			    $('.summernote').on('summernote.keyup', function(e) {
			        debugger;
			        var text = $(this).next('.note-editor').find('.note-editable').text();
			        var length = text.length;
			        var num = 5000 - length;
		
			        if (length > 5000) {
			            $('#limite_normal').hide();
			            $('#limite_vermelho').text(5000 - length).show();
			            $('.summernote').summernote('code', text.substring(0,5000));
			        }
			        else{
			            $('#limite_vermelho').hide();
			            $('#limite_normal').text(5000 - length).show();
			        }
			    });
	    
				$('.summernote').summernote({
					tabsize: 2,
					height: 300,
					minHeight: null,
					maxHeight: null,
					focus: true,
					placeholder: '최대 5000자까지 쓸 수 있습니다. 업로드 하실 수 있는 파일의 크기는 최대 10MB 입니다.',
					maximumImageFileSize: 1024 * 1024 * 10, // 10MB
					toolbar: [
			            [ 'style', [ 'style' ] ],
			            [ 'font', [ 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear'] ],
			            [ 'fontname', [ 'fontname' ] ],
			            [ 'fontsize', [ 'fontsize' ] ],
			            [ 'color', [ 'color' ] ],
			            [ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
			            [ 'table', [ 'table' ] ],
			            [ 'insert', [ 'link', 'picture'] ],
			            [ 'view', [ 'undo', 'redo', 'fullscreen', 'codeview', 'help' ] ]						
					],
				});			
	
			
				document.addEventListener('DOMContentLoaded', getRating);		
			  
			  	const maxRating = 5;
			  	const rating = document.getElementById('rating');
			  
			  	rating.addEventListener('blur', (e) => {
					const ratingVal = e.target.value;
				  
				  	if(ratingVal > 5 || ratingVal < 0) {
					  	alert('평점은 0점 이상 5점 이하입니다.');
					  	return;
				  	}
				  
				  	getRating();
			  	});
			  
			  	function getRating() {
			  		const rating = document.getElementById('rating').value;
				  	const starPercentage = (rating / maxRating) * 100;
			  	  	const starPercentageRounded = `${Math.round(starPercentage / 10) * 10}%`;
			  	  
			  	  	document.querySelector('.stars-inner').style.width = starPercentageRounded;
			  	}
			</script>
	</main>
	<%@ include file="inc/footer.jsp" %>
</body>
</html>
