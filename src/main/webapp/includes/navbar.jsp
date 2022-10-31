<%@ page import="com.example.epamproj.dao.entities.User" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">Cargo delivery</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <%if(request.getSession().getAttribute("user")!= null && "client".equals(((User)request.getSession().getAttribute("user")).getRole())){%>
        <li class="nav-item">
          <a class="nav-link" href="order.jsp">Order</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="controller?command=showOrders&status=new">Cabinet</a>
        </li>
        <%}%>
        <li class="nav-item">
          <a class="nav-link" href="calculate.jsp">Calculate</a>
        </li>
        <%if(request.getSession().getAttribute("user")!= null && "admin".equals(((User)request.getSession().getAttribute("user")).getRole())){%>
        <li class="nav-item">
          <a class="nav-link" href="controller?command=showOrders">Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="reports.jsp">Reports</a>
        </li>
        <%}%>

        <%if(request.getSession().getAttribute("user")!= null){%>
            <li class="nav-item">
          <form method="post" action="controller">
            <input name="command" value="logout" type="hidden">
            <button type="submit" class="btn btn-primary">Logout</button>
          </form>
        </li>
          <%}else{%>
            <li class="nav-item">
          <a class="nav-link" href="login.jsp">Log in</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="register.jsp">Register</a>
        </li>
          <%}%>


      </ul>
    </div>
  </div>
</nav>