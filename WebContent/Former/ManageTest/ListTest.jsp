<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../Common/header.jspf"%>
<title>Test view</title>
</head>
<body>

	<div class="container-fluid">
		<%@ include file="../../Common/navbar.jspf"%>
		<div class="row" style="margin-top: 20px;">
			<div class="col-lg-12">
				<div class="col-lg-8">
					<h2>Liste des tests</h2>

					<table class="table table-hover">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Label</th>
								<th scope="col">Statement</th>
								<th scope="col">Duration</th>
								<th scope="col">High level</th>
								<th scope="col">Low level</th>
								<th scope="col">Fonctionnalit�s</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${lstTest}" var="test">
								<tr>
									<td>${test.label}</td>
									<td>${test.statement}</td>
									<td>${test.duration}</td>
									<td>${test.high_level}</td>
									<td>${test.low_level}</td>
									<td>
										<div class="row">
											<div class="col-6">
												<a class="btn btn-primary btn-lg"
												href="<c:out value="${pageContext.servletContext.contextPath}" />/Formateur/updateTest?id=<c:out value="${test.id}" />"
												role="button">Modify</a>
											</div>
											<div class="col-6">
												<a class="btn btn-primary btn-lg"
												href="<c:out value="${pageContext.servletContext.contextPath}" />/Formateur/updateTest?id=<c:out value="${test.id}" />"
												role="button">Delete</a>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>