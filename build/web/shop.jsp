<%-- 
    Document   : shop
    Created on : Dec 4, 2023, 9:49:41 PM
    Author     : Thanh Hai
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>EShopper - Bootstrap Shop Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@include file="components/navBarComponent.jsp" %>

        <section class="py-5">

            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-5">
                        <h3>List Categories</h3>
                        <ul class="list-group category_block">
                            <c:forEach items="${listCategories}" var="C">
                                <li class="list-group-item text-white ${tag == C.cid? "active":""}"><a href="category?categoryId=${C.cid}">${C.cname}</a></li>
                                </c:forEach>
                        </ul>
                    </div>

                    <div class="col-md-9"> 
                        <form id="sortForm" action="sort">
                            <div class="dropdown ml-12">
                                <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Sort by
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                    <a class="dropdown-item" href="#" name="sortOption" value="Latest">Latest</a>
                                    <a class="dropdown-item" href="#" name="sortOption" value="Popularity">Popularity</a>
                                    <a class="dropdown-item" href="#" name="sortOption" value="Best Rating">Best Rating</a>
                                </div>
                            </div>
                        </form>
                        <h3>List Products</h3>


                        <div
                            class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center"
                            >
                            <c:forEach items="${listProducts}" var="P">
                                <!-- comment   -->




                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div
                                            class="badge bg-dark text-white position-absolute"
                                            style="top: 0.5rem; right: 0.5rem"
                                            >
                                            Sale
                                        </div>
                                        <!-- Product image-->
                                        <a href="detail?productId=${P.id}">
                                            <img
                                                class="card-img-top"
                                                src="${P.imageUrl}"
                                                alt="..."
                                                />
                                        </a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${P.name}</h5>
                                                <!-- Product reviews-->
                                                <div
                                                    class="d-flex justify-content-center small text-warning mb-2"
                                                    >
                                                    <div class="bi-star-fill">${P.tiltle}</div>

                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through text-muted ml-2"
                                                      >$${P.price+10}</span
                                                >

                                                $${P.price}
                                            </div>

                                        </div>
                                        <!-- Product actions --> 

                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${P.id}"
                                                   >Add to cart</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--      comment --> 

                            </c:forEach>

                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${listProducts == null}">
                            Not found
                        </c:when>
                        <c:when test="${page > totalPage || page < 1}">
                            <!-- Không thực hiện bất kỳ thay đổi nào với page ở đây -->
                        </c:when>
                        <c:otherwise>
                            <c:set var="prevPage" value="${page - 1}" />
                            <c:set var="nextPage" value="${page + 1}" />
                            <nav aria-label="Page navigation example" class="d-flex justify-content-end">
                                <ul class="pagination">
                                    <c:choose>
                                        <c:when test="${page > 1}">
                                            <li class="page-item"><a class="page-link" href="shop?page=${prevPage}">Previous</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li class="page-item disabled"><span class="page-link">Previous</span></li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach begin="1" end="${totalPage}" var="i">
                                        <li class="page-item ${i == page ? "active" : ""}">
                                            <a class="page-link" href="shop?page=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test="${page < totalPage}">
                                            <li class="page-item"><a class="page-link" href="shop?page=${nextPage}">Next</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li class="page-item disabled"><span class="page-link">Next</span></li>
                                            </c:otherwise>
                                        </c:choose>

                                </ul>
                            </nav>
                        </c:otherwise>
                    </c:choose>



                </div>
            </div>
        </section>
        <!-- Shop Start -->
        
        <%@include file="components/footerComponents.jsp" %>



        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>
