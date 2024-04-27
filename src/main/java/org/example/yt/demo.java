package org.example.yt;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import org.example.yt.response.ResponseResult;

@Path("demo")
public class demo {
    
    @Inject
    UserTable userTable;
    
    @GET
    @Path("{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<String> demo(@PathParam("id") Integer id){
        UserTable.IUser user = userTable.getById(id);
        String str = "123"+user.getUsername();
        return ResponseResult.success(str);
    }
    
}
