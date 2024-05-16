<%-- 
    Document   : home
    Created on : Apr 22, 2024, 9:12:31 AM
    Author     : Administrator
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Forum chat</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">

        <!-- Template Main CSS Files -->
        <link href="assets/css/variables.css" rel="stylesheet">
        <link href="assets/css/main.css" rel="stylesheet">

        <!-- <!        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        -->
        <!-- =======================================================
        * Template Name: ZenBlog
        * Template URL: https://bootstrapmade.com/zenblog-bootstrap-blog-template/
        * Updated: Mar 17 2024 with Bootstrap v5.3.3
        * Author: BootstrapMade.com
        * License: https:///bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header d-flex align-items-center fixed-top">
            <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

                <a href="home" class="logo d-flex align-items-center">
                    <!-- Uncomment the line below if you also wish to use an image logo -->
                    <!-- <img src="assets/img/logo.png" alt=""> -->
                    <h1>Dream forum</h1>
                </a>
                <nav id="navbar" class="navbar">
                    <ul>
                        <c:choose>
                            <c:when test="${empty sessionScope.username}">
                                <li><a href="login.jsp">New Post</a></li>
                                </c:when>
                                <c:otherwise>
                                <li><a href="AddPost.jsp?username=${sessionScope.username}">New Post</a></li>
                                </c:otherwise>
                            </c:choose>
                        <li><a href="single-post.jsp">Single Post</a></li>
                        <li class="dropdown"><a href="category.jsp"><span>Categories</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                            <ul>
                                <li><a href="search-result.jsp">Search Result</a></li>
                                <li><a href="#">Drop Down 1</a></li>
                                <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                                    <ul>
                                        <li><a href="#">Deep Drop Down 1</a></li>
                                        <li><a href="#">Deep Drop Down 2</a></li>
                                        <li><a href="#">Deep Drop Down 3</a></li>
                                        <li><a href="#">Deep Drop Down 4</a></li>
                                        <li><a href="#">Deep Drop Down 5</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Drop Down 2</a></li>
                                <li><a href="#">Drop Down 3</a></li>
                                <li><a href="#">Drop Down 4</a></li>
                            </ul>
                        </li>

                        <li><a href="about.jsp">About</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                        <form action="user" method="post">   <c:if test="${not empty sessionScope.username}">
                                <li><a href="user.jsp"><c:out value="${sessionScope.username}" /></a></li>
                                </c:if>
                        </form>


                    </ul>
                </nav><!-- .navbar -->

                <div class="position-relative">
                    <a href="#" class="mx-2"><span class="bi-facebook"></span></a>
                    <a href="#" class="mx-2"><span class="bi-twitter"></span></a>
                    <a href="#" class="mx-2"><span class="bi-instagram"></span></a>
                        <c:if test="${sessionScope.user==null}">
                        <a href="login.jsp" class="login-link">Login</a>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                        <a href="logout" class="login-link">Logout</a>
                    </c:if>
                    <a href="#" class="mx-2 js-search-open"><span class="bi-search"></span></a>
                    <i class="bi bi-list mobile-nav-toggle"></i>

                    <!-- ======= Search Form ======= -->
                    <div class="search-form-wrap js-search-form-wrap">
                        <form action="search-result.html" class="search-form">
                            <span class="icon bi-search"></span>
                            <input type="text" placeholder="Search" class="form-control">
                            <button class="btn js-search-close"><span class="bi-x"></span></button>
                        </form>
                    </div><!-- End Search Form -->

                </div>

            </div>

        </header><!-- End Header -->

        <main id="main">

            <!-- ======= Hero Slider Section ======= -->
            <section id="hero-slider" class="hero-slider">
                <div class="container-md" data-aos="fade-in">
                    <div class="row">
                        <div class="col-12">
                            <div class="swiper sliderFeaturedPosts">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <a href="single-post.jsp" class="img-bg d-flex align-items-end" style="background-image: url('https://i2.wp.com/techbeasts.com/wp-content/uploads/2016/01/green_mountain_nature_wallpaper_hd.jpg');">
                                            <div class="img-bg-inner">
                                                <h2>Political and Historical Significance</h2>
                                                <p>Forum tourism focuses on visiting places that have played a pivotal role in political history. These locations may include national capitals, parliamentary buildings, government institutions, historic sites of political rallies or protests, or venues where significant debates or forums have taken place.</p>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="swiper-slide">
                                        <a href="single-post.jsp" class="img-bg d-flex align-items-end" style="background-image: url('https://wallpaperaccess.com/full/2592195.jpg');">
                                            <div class="img-bg-inner">
                                                <h2>Cultural and Educational Experience</h2>
                                                <p>Forum tourism offers a unique cultural and educational experience. Visitors can immerse themselves in the political and social context of a particular destination, gaining insights into the country's history, governance systems, and ideologies.</p>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="swiper-slide">
                                        <a href="single-post.jsp" class="img-bg d-flex align-items-end" style="background-image: url('https://th.bing.com/th/id/R.ceac4529bea2bde814262f91c702d4aa?rik=tgGj4kj40eU1kg&pid=ImgRaw&r=0');">
                                            <div class="img-bg-inner">
                                                <h2>Visiting Parliamentary Buildings</h2>
                                                <p>Many forum tourists are interested in exploring parliamentary buildings and chambers. They may take guided tours, attend public sessions or debates, and witness the democratic processes in action.</p>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="swiper-slide">
                                        <a href="single-post.jsp" class="img-bg d-flex align-items-end" style="background-image: url('https://cdn.wallpapersafari.com/74/69/C9QEUs.jpg');">
                                            <div class="img-bg-inner">
                                                <h2>Participation in Political and Social Events</h2>
                                                <p>Some forum tourists actively engage in political or social events during their visits. This could include attending conferences, seminars, or public lectures related to current affairs, policy debates, or social issues.</p>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="custom-swiper-button-next">
                                    <span class="bi-chevron-right"></span>
                                </div>
                                <div class="custom-swiper-button-prev">
                                    <span class="bi-chevron-left"></span>
                                </div>

                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ======= Post Grid Section ======= -->

            <section id="posts" class="posts">
                <div class="container" data-aos="fade-up">
                    <div class="row g-5">
                        <div class="col-lg-4">
                            <div class="post-entry-1 lg">
                                <a href="single-post.jsp"><img src="https://th.bing.com/th/id/OIP.m5ki8IcNTEa5iBN4Oej9OgAAAA?w=202&h=202&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="" class="img-fluid"></a>
                                <div class="post-meta"><span class="date">Forum news!</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
                                <h2><a href="single-post.jsp">11 Work From Home Part-Time Jobs You Can Do Now</a></h2>
                                <p class="mb-4 d-block">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero temporibus repudiandae, inventore pariatur numquam cumque possimus exercitationem? Nihil tempore odit ab minus eveniet praesentium, similique blanditiis molestiae ut saepe perspiciatis officia nemo, eos quae cumque. Accusamus fugiat architecto rerum animi atque eveniet, quo, praesentium dignissimos</p>

                                <div class="d-flex align-items-center author">
                                    <div class="photo"><img src="assets/img/person-1.jpg" alt="" class="img-fluid"></div>
                                    <div class="name">
                                        <h3 class="m-0 p-0">Cameron Williamson</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <form action="home" method="post">
                                <div class="row g-5">
                                    <c:forEach items="${post}" var="p" varStatus="loop">
                                        <c:if test="${loop.index % 3 == 0}">
                                            <div class="row g-4">
                                            </c:if>
                                            <div class="col-lg-4 border-start custom-border">
                                                <div class="post-entry-1">
                                                    <div class="post-meta">
                                                        <span class="date">${p.createdAt}</span>
                                                    </div>
                                                    <h2><a href="postdetail?id=${p.getPostID()}">${p.getTitle()}</a></h2>
                                                    <h2><a>Posted by: </a><a style="color: #fd7e14">${p.getName()}</a></h2>
                                                </div>
                                            </div>

                                            <c:if test="${loop.index % 3 == 2 or loop.last}">
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </form>




                        </div>
                    </div>
                </div> <!-- End .row -->

            </section> <!-- End Post Grid Section -->


        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">

            <div class="footer-content">
                <div class="container">

                    <div class="row g-5">
                        <div class="col-lg-4">
                            <h3 class="footer-heading">About ZenBlog</h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam ab, perspiciatis beatae autem deleniti voluptate nulla a dolores, exercitationem eveniet libero laudantium recusandae officiis qui aliquid blanditiis omnis quae. Explicabo?</p>
                            <p><a href="about.html" class="footer-link-more">Learn More</a></p>
                            <p>Tag</p>
                            <c:forEach items="${topic}" var="t">
                                <a style="color: #dc3545">${t.getTag()}</a>
                            </c:forEach>
                        </div>
                        <div class="col-6 col-lg-2">
                            <h3 class="footer-heading">Navigation</h3>
                            <ul class="footer-links list-unstyled">
                                <li><a href="index.html"><i class="bi bi-chevron-right"></i> Home</a></li>
                                <li><a href="index.html"><i class="bi bi-chevron-right"></i> Blog</a></li>
                                <li><a href="category.html"><i class="bi bi-chevron-right"></i> Categories</a></li>
                                <li><a href="single-post.html"><i class="bi bi-chevron-right"></i> Single Post</a></li>
                                <li><a href="about.html"><i class="bi bi-chevron-right"></i> About us</a></li>
                                <li><a href="contact.html"><i class="bi bi-chevron-right"></i> Contact</a></li>
                            </ul>
                        </div>
                        <div class="col-6 col-lg-2">
                            <h3 class="footer-heading">Categories</h3>
                            <ul class="footer-links list-unstyled">
                                <li><a href="category.html"><i class="bi bi-chevron-right"></i> Business</a></li>
                                <li><a href="category.html"><i class="bi bi-chevron-right"></i> Culture</a></li>
                                <li><a href="category.html"><i class="bi bi-chevron-right"></i> Sport</a></li>
                                <li><a href="category.html"><i class="bi bi-chevron-right"></i> Food</a></li>
                                <li><a href="category.html"><i class="bi bi-chevron-right"></i> Politics</a></li>
                                <li><a href="category.html"><i class="bi bi-chevron-right"></i> Celebrity</a></li>
                                <li><a href="category.html"><i class="bi bi-chevron-right"></i> Startups</a></li>
                                <li><a href="category.html"><i class="bi bi-chevron-right"></i> Travel</a></li>

                            </ul>
                        </div>

                        <div class="col-lg-4">
                            <h3 class="footer-heading">Recent Posts</h3>

                            <ul class="footer-links footer-blog-entry list-unstyled">
                                <li>
                                    <a href="single-post.html" class="d-flex align-items-center">
                                        <img src="assets/img/post-sq-1.jpg" alt="" class="img-fluid me-3">
                                        <div>
                                            <div class="post-meta d-block"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
                                            <span>5 Great Startup Tips for Female Founders</span>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="single-post.html" class="d-flex align-items-center">
                                        <img src="assets/img/post-sq-2.jpg" alt="" class="img-fluid me-3">
                                        <div>
                                            <div class="post-meta d-block"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
                                            <span>What is the son of Football Coach John Gruden, Deuce Gruden doing Now?</span>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="single-post.html" class="d-flex align-items-center">
                                        <img src="assets/img/post-sq-3.jpg" alt="" class="img-fluid me-3">
                                        <div>
                                            <div class="post-meta d-block"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
                                            <span>Life Insurance And Pregnancy: A Working Mom’s Guide</span>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="single-post.html" class="d-flex align-items-center">
                                        <img src="assets/img/post-sq-4.jpg" alt="" class="img-fluid me-3">
                                        <div>
                                            <div class="post-meta d-block"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
                                            <span>How to Avoid Distraction and Stay Focused During Video Calls?</span>
                                        </div>
                                    </a>
                                </li>

                            </ul>

                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-legal">
                <div class="container">

                    <div class="row justify-content-between">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            <div class="copyright">
                                © Copyright <strong><span>ZenBlog</span></strong>. All Rights Reserved
                            </div>

                            <div class="credits">
                                <!-- All the links in the footer should remain intact. -->
                                <!-- You can delete the links only if you purchased the pro version. -->
                                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/herobiz-bootstrap-business-template/ -->
                                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                            </div>

                        </div>

                        <div class="col-md-6">
                            <div class="social-links mb-3 mb-lg-0 text-center text-md-end">
                                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                                <a href="#" class="google-plus"><i class="bi bi-skype"></i></a>
                                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                            </div>

                        </div>

                    </div>

                </div>
            </div>

        </footer>

        <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
