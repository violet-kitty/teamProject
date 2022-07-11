<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
.bd-navbar {
  position: sticky;
  top: 0;
  z-index: 1071;
  min-height: 4rem;
  box-shadow: 0 0.5rem 1rem rgba(0,0,0,.05), inset 0 -1px 0 rgba(0,0,0,.1);
}
.bd-sidebar {
  position: sticky;
  top: 4rem;
  z-index: 1000;
  height: calc(100vh - 4rem);
  background: #eee;
  border-right: 1px solid rgba(0,0,0,.1);
  overflow-y: auto;
  min-width: 160px;
  max-width: 220px;
}
.bd-sidebar .nav {
  display: block;
}
.bd-sidebar .nav>li>a {
  display: block;
  padding: .25rem 1.5rem;
  font-size: 90%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-3 bd-sidebar">
		      <ul class="nav">
		        <li><a>Side 1</a></li>
		        <li><a>Side 2</a></li>
		        <li><a>Side 3</a></li>
		        <li><a>Side 4</a></li>
		        <li><a>Side 5</a></li>
		        <li><a>Side 6</a></li>
		        <li><a>Side 7</a></li>
		        <li><a>Side 8</a></li>
		      </ul>
		      <br>
		    </div>
		</div>
	</div>




<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>