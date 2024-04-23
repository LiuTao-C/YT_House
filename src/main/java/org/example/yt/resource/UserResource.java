package org.example.yt.resource;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.core.Response;
import org.example.yt.entity.UserList;
import org.example.yt.service.UserService;

import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;

@Path("user")
public class UserResource {
    //暂未aa
    @Inject
    UserService userService;
    
    @GET
    @Path("{id}")
    public Response login(@PathParam("id") Long id, @Context HttpHeaders httpHeaders){
        UserList user = userService.getById(id);
        String username = user.getUsername();
        String password = user.getPassword();
        
        //todo 添加token生成
        
        return Response.ok().build();
    }
}
