package com.example.myproject.resource;


import com.example.myproject.entity.ActionList;
import com.example.myproject.response.ResponsePage;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.service.ActionListService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import org.springframework.data.domain.Page;

@Path("actionlist")
@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class ActionListResource {
    
    @Inject
    ActionListService actionListService;
    
    @Path("list")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    //查询所有
    public ResponsePage<ActionList> page(@QueryParam("page") Integer page,@QueryParam("size") Integer size){
        Page<ActionList> actionListPage = actionListService.selectList(page,size);
        return ResponsePage.success(actionListPage);
    }
    
    //查询单个
    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<ActionList> getById(@PathParam("id")Long id){
        ActionList result = actionListService.getById(id);
        return ResponseResult.success(result);
    }
    
    //删除单个
    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<ActionList> deleteById(@PathParam("id") Long id){
        actionListService.deleteById(id);
        return ResponseResult.success();
    }
    
    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<ActionList> updateById(ActionList actionList){
        ActionList result = actionListService.updateById(actionList);
        return ResponseResult.success(result);
    }
    
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<ActionList> add(ActionList actionList){
        ActionList result = actionListService.updateById(actionList);
        return ResponseResult.success(result);
    }
}
