package org.example.yt;



import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.core.Response;

@Path("/example")
public class CaffeineExample {
    @Inject
    CaffeineCache caffeineCache;
    
    
    //查询方法
    @GET
    @Path("/data/{key}")
    public Response getData(@PathParam("key") String key){
        String data = caffeineCache.getCacheData(key);
        if (data != null){
            return Response.ok().entity(data).build();
        }else{
            return Response.status(Response.Status.NOT_FOUND).entity("Data not found").build();
        }
        
    }
}

