package com.example.myproject.resource;

import com.example.myproject.entity.CheckList;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.response.ResponsePage;
import com.example.myproject.service.CheckListService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

/**
 * 专注数据交互，直接对Path负责，这里不需要很负责的业务逻辑
 * 可以做一些参数校验， 比如某个值是否格式正确，
 */
@Path("checklist")
@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CheckListResource {
    
    @Inject
    CheckListService checkListService;
    
    /**
     * 查询所有数据列表 - 分页
     * @return
     */
    @Path("list") // list?a=1&b=2
    @GET //RestFul风格： @GET 查询 @DELETE 删除 @UPDATE 更新 @POST 新增
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponsePage list(@QueryParam("page")Integer page, @QueryParam("size") Integer size) {
        List result = checkListService.selectList(page,size);
        ResponsePage responsePage = new ResponsePage();
        responsePage.setData(result);
        return responsePage;
    }
    
    
    // TODO 把service层做个业务封装到Controlller层， 参考上面的写法
    //查询单个
    @GET
    @Path("{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<CheckList> getById(@PathParam("id") Long id){
        CheckList result =  checkListService.getById(id);
        return  ResponseResult.success(result);
    }
    //删除
    @DELETE
    @Path("{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult delete(@PathParam("id") Long id){
        checkListService.deleteById(id);
        return ResponseResult.success(200);
    }
    
    //更新
    @PUT
    @Path("id")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<CheckListService> updateById(CheckList checkList){
         CheckList result = checkListService.updateById(checkList);
         return ResponseResult.success(result);
    }
    
    //新增
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult add(CheckList checkList){
        CheckList result = checkListService.updateById(checkList);
        return ResponseResult.success(result);
    }
    
}

