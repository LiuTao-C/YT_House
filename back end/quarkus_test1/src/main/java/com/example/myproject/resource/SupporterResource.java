package com.example.myproject.resource;

import com.example.myproject.entity.Supporter;
import com.example.myproject.response.ResponsePage;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.service.SupporterService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import org.springframework.data.domain.Page;

@ApplicationScoped
@Path("support")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class SupporterResource {

    @Inject
    SupporterService supporterService;

    @GET
    @Path("list")
    public ResponsePage<Supporter> findAll(@QueryParam("page")Integer page ,@QueryParam("size")Integer size){
        Page<Supporter> supporterlist = supporterService.findList(page,size);
        return  ResponsePage.success(supporterlist);
    }

    @GET
    @Path("{id}")
    public ResponseResult<Supporter>  findById(@PathParam("id")Long id){
        Supporter supporter = supporterService.findById(id);
        return  ResponseResult.success(supporter);
    }
    

    @DELETE
    @Path("{id}")
    public ResponseResult<Supporter> deleteById(@PathParam("id")Long id){
        supporterService.deleteById(id);
        return ResponseResult.success();
    }

    @POST
    public  ResponseResult<Supporter> updateOne(Supporter supporter){
        return ResponseResult.success(supporterService.updateById(supporter));
    }
    @PUT
    public  ResponseResult<Supporter> addOne(Supporter supporter){
        return ResponseResult.success(supporterService.updateById(supporter));
    }
}
