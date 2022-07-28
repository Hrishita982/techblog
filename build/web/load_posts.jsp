
<%@page import="java.util.List"%>
<%@page import="blog.entities.Post"%>
<%@page import="blog.dao.PostDao"%>
<%@page import="blog.helper.ConnectionProvider"%>


<div class="row" >
    
<%
    
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        
        int cid=Integer.parseInt(request.getParameter("cid"));
        List<Post> posts =null;
        if(cid == 0)
        {
             posts = d.getAllPosts();
        }
        else
        {
            posts=d.getPostByCatId(cid);
        }
        
        if(posts.size() == 0)
        {
            out.println("<h3 class='diaplay-3 text-center' >No posts available  in this category</h3>");
            return;
        }
       
        for(Post p: posts)
        {
%>

<div class="col-md-6 mt-2">
    <div class="card">
        <div class="card-body">
            <img class="card-img-top " src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
            <br><br>
            <h5><%= p.getpTitle() %></h5>
            <p><%= p.getpContent() %></p>
            
        </div>
            
            <div class="card-footer primary-background text-white text-left mt-3">
                  <a href="show_blog_page.jsp?post_id=<%= p.getPid()   %>" class="btn btn-outline-light btn ">Read more</a>
                            

                              <a href="# !" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-up"></i> <span>10</span></a>

                              <a href="# !" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting"></i> <span>10</span></a>

                          
                
            </div>


    </div>
</div>

<%

        }

%>

</div>