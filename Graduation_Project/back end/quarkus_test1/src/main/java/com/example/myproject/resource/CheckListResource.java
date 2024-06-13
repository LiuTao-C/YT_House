package com.example.myproject.resource;

import com.example.myproject.entity.CheckList;
import com.example.myproject.entity.User;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.response.ResponsePage;
import com.example.myproject.service.CheckListService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import org.springframework.data.domain.Page;
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
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponsePage<CheckList> page(@QueryParam("page")Integer page, @QueryParam("size") Integer size) {
        Page<CheckList> checkLists= checkListService.selectList(page,size);
       return ResponsePage.success(checkLists);
    }
    
    
    // TODO 把service层做个业务封装到Controlller层， 参考上面的写法
    //查询单个
    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<CheckList> getById(@PathParam("id") Long id){
        CheckList result =  checkListService.getById(id);
        return  ResponseResult.success(result);
    }
    //删除
    @DELETE
    @Path("{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<String> delete(@PathParam("id") Long id){
        checkListService.deleteById(id);
        return ResponseResult.success();
    }
    
    //更新
    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<CheckList> updateById(CheckList checkList){
         CheckList result = checkListService.updateById(checkList);
         return ResponseResult.success(result);
    }
    
    //新增
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<CheckList> add(CheckList checkList){
        CheckList result = checkListService.add(checkList);
        return ResponseResult.success(result);
    }
    
}

