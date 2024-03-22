package com.example.myproject.resource;

import com.example.myproject.entity.AuditList;
import com.example.myproject.response.ResponsePage;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.service.AuditListService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 专注数据交互，直接对Path负责，这里不需要很负责的业务逻辑
 * 可以做一些参数校验， 比如某个值是否格式正确，
 */
@Path("auditlist")
@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AuditListResource {
    
    @Inject
    AuditListService auditListService;
    
    /**
     * 查询所有数据列表 - 分页
     * @return
     */
    @Path("list")
    @GET //RestFul风格： @GET 查询 @DELETE 删除 @UPDATE 更新 @POST 新增
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponsePage<AuditList> page(@QueryParam("page")Integer page, @QueryParam("size") Integer size) {
        // 这里可以将参数传递到下一层做分页
//        System.out.println("page=============" + page);
//        System.out.println("limit=============" + limit);
        Page<AuditList> auditlists = auditListService.selectList(page,size);
        return ResponsePage.success(auditlists);
    }
    
    // TODO 把service层做个业务封装到Controlller层， 参考上面的写法
    //查询单个
    @GET
    @Path("{id}")
    public ResponseResult<AuditList> getById(@PathParam("id") Long id){
        AuditList result = auditListService.getById(id);
        return  ResponseResult.success(result);
    }
    //删除
    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<String> delete(@PathParam("id") Long id){
        auditListService.deleteById(id);
        return ResponseResult.success();
    }
    //更新
    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<AuditList> updateById(AuditList auditList){
        AuditList result =  auditListService.updateById(auditList);
        return ResponseResult.success(result);
    }
    
    //新增
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<AuditList> Add(AuditList auditList){
        AuditList result = auditListService.updateById(auditList);
        return ResponseResult.success(result);
    }
    
}
