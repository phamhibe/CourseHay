<%@include file="template/header.jsp" %>

<!-- About Start -->
<div style="height: 100%">
    <div id="content">
        <div id="content-left" style="width: 20%; margin-right: 5px;">
            <h1 style="text-align: center; border-bottom: 1px solid #2878EB; padding: 10px 15px; ">Author Detail</h1>
            <ul>
                <a href="#" style=" "><li style="padding: 30px 0px ">Courses</li></a>
                <a href="<%=path%>/manageblog?view=true&role=user"><li style="padding: 30px 0px ">Blog</li></a>
            </ul>
        </div>
        <div id="content-right">
            <div class="path" style=";
                 background-color: #f5f5f5;
                 color: black;
                 font-size: 30px;
                 margin: 35px 60px;
                 text-align: left;
                 ">Courses
            </div>
            <div>
                <a href="<%=path%>/create-course" style="background-color: #2878EB;
                   color: white;text-align: center; padding: 14px 26px;margin-left: 10px;
                   font-family: 'Jost';">Create your Courses</a> 
            </div>
            <br>
            <c:if test="${msgDelete != null}">
                ${msgDelete}
            </c:if>
            <div style="width: 100%" class="content-author">

                <c:forEach items="${coursesofAuthor}" var="c">
                    <div class="product" style="border: 1px solid saddlebrown; margin: 0px 10px; background-color: #fff; display: flex">
                        <c:if test="${c.getImg()==null}">
                            <c:set var="srcImg" value="${path}/img/error.jpg"/>
                        </c:if>
                        <c:if test="${c.getImg()!=null}">
                            <c:set var="srcImg" value="data:image/jpg;base64,${CoursesDAO.createImgurl(c.getImg())}"/>
                        </c:if>
                        <form class="img_form" action="${path}/account/editimg" method="post" enctype="multipart/form-data">
                            <img src="${srcImg}" width="20%" style="width: 100%;"/>
                            <div class="img_form_hover">
                                <label for="class_picture" class="form-label">Edit image</label>
                                <input type="file" class="form-control" name="pic" id="class_picture"
                                       accept="image/png, image/jpeg, image/jpg">
                                <label id="class_picture-error" class="error mt-1" for="class_picture">${requestScope["class_picture-error"]}</label>
                                <input type="submit" value="Submit">
                                <input type="hidden" name="id" value="${c.getCourseId()}">
                            </div>
                        </form>
                        <div style="margin: 5% 10px"><a href="">${c.getCourseName()}</a></div>
                        <div style="margin: 5% auto">Status: 
                            <c:if test="${c.getPublicStatus() == 2}">
                                Public
                            </c:if>
                            <c:if test="${c.getPublicStatus() == 0}">
                                Not Public
                            </c:if>
                            <c:if test="${c.getPublicStatus() == 1}">
                                Waiting for admin to approve
                            </c:if>
                            <c:if test="${c.getPublicStatus() == 2 || c.getPublicStatus() == 0}">

                            </c:if>
                        </div>
                        <c:choose>
                            <c:when test="${c.getPublicStatus() == 2}">
                            </c:when>
                            <c:otherwise>
                                <div style="margin: 5% 10px">
                                    <a href="<%=path%>/content?courseid=${c.getCourseId()}">Contents of course</a>
                                </div>

                                <div style="margin: 5% auto">
                                    <a href="<%=path%>/account/author-edit?coursesid=${c.getCourseId()}">Edit/Manage</a>
                                    <c:if test="${coursesid==c.getCourseId()}">
                                        ${msgErr}
                                    </c:if>
                                </div>
                                <div style="margin: 5% 10px"><a  onclick="return confirm('Do u want to delete')" eq true ? href="<%=path%>/account/detecourse?id=${c.getCourseId()}" :href="" ; style="cursor: pointer">Delete</a></div> 
                            </c:otherwise>
                        </c:choose>


                    </div>
                    <br>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- Contact End -->
<%@include file="template/footer.jsp" %>