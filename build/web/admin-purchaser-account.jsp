<%@include file="template/headerAdmin.jsp" %>

<div id="content-right">
    <div class="path-admin">Purchaser Account</b></div>
    <div class="content-main">
        <div id="content-main-dashboard">
            <div id="product-title-header">
                <div id="product-title-2" style="width: 55%; padding: 16px">
                    <form action="manage-purchaser" method="post">
                        <input type="text" name="txtSearch" placeholder="Enter name to search" value="${txtSearch}"/>
                        <input type="submit" value="Search"/>
                    </form>
                </div>
                <div id="purchaser-table-admin">
                    <table id="purchaser" border="1">
                        <tr>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>   Dob   </th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Status</th>
                        </tr>
                        <c:forEach items="${purlist}" var="c">
                            <tr>
                                <td>${contactDAO.getAccContactById(c).getFullName()}</td>
                                <td>${accDAO.getAccountById(c).getEmail()}</td>
                                <td>${!contactDAO.getAccContactById(c).isGender()?"Male":"Female"}</td>
                                <td>${contactDAO.getAccContactById(c).getDob()}</td>
                                <td>${contactDAO.getAccContactById(c).getPhone()}</td>
                                <td>${contactDAO.getAccContactById(c).getAddress()}</td> 
                                <td>                                    
                                        <a href="lock_acc?accid=${c}">
                                            <c:if test="${accDAO.getAccountById(c).isStatus()}">
                                                <img src="img/lock_img.png" width="40" height="40" alt="lock_img"/>
                                            </c:if>
                                            <c:if test="${!accDAO.getAccountById(c).isStatus()}">
                                                <img src="img/unlock_img.png" width="40" height="40" alt="lock_img"/>
                                            </c:if>                                            
                                        </a>

                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                
            </div>
        </div>
    </div>
</div>
</div>
<%@include file="template/footerAdmin.jsp" %>