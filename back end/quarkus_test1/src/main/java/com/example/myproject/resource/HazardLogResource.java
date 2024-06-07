package com.example.myproject.resource;


import com.example.myproject.entity.HazardLog;
import com.example.myproject.response.ResponsePage;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.service.HazardLogService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import org.springframework.data.domain.Page;

@Path("hazardlog")
@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class HazardLogResource {
    
    @Inject
    HazardLogService hazardLogService;

    @Path("list")
    @GET
    public ResponsePage<HazardLog> page(@QueryParam("page") Integer page,@QueryParam("size") Integer size){
        Page<HazardLog> hazardLogPage = hazardLogService.findlist(page,size);
        return  ResponsePage.success(hazardLogPage);
    }

    @GET
    @Path("{id}")
    public ResponseResult<HazardLog> getById(@PathParam("id") Long id){
        HazardLog hazardLog =  hazardLogService.findById(id);
        return  ResponseResult.success(hazardLog);
    }

    @DELETE
    @Path("{id}")
    public ResponseResult<HazardLog> deleteById(@PathParam("id") Long id){
        hazardLogService.deletById(id);
        return ResponseResult.success();
    }

    @PUT
    public ResponseResult<HazardLog> updateById(HazardLog hazardLog){
        HazardLog res = hazardLogService.updateById(hazardLog);
        return  ResponseResult.success(res);
    }

    @POST
    public  ResponseResult<HazardLog> add(HazardLog hazardLog){
        HazardLog res = hazardLogService.updateById(hazardLog);
        return ResponseResult.success(res);
    }

}
