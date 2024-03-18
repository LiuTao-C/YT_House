package com.example.myproject.Response;

import com.example.myproject.entity.AuditList;
import com.example.myproject.service.AuditListService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

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
    public List<AuditList> list(@QueryParam("page")Integer page, @QueryParam("limit") Integer limit) {
        // 这里可以将参数传递到下一层做分页
        System.out.println("page=============" + page);
        System.out.println("limit=============" + limit);
        return auditListService.selectList();
    }
    
    // TODO 把service层做个业务封装到Controlller层， 参考上面的写法
    //查询单个
    @GET
    @Path("{id}")
    public AuditList getById(@PathParam("id") Long id){
        return  auditListService.getById(id);
    }
    //删除
    @DELETE
    @Path("{id}")
    public void delete(@PathParam("id") Long id){
        auditListService.deleteById(id);
        System.out.println("删除 "+id);
    }
    //更新
    @PUT
    @Path("id")
    public AuditList updateById(AuditList auditList){
        return auditListService.updateById(auditList);
    }
    
    //新增
    @POST
    public void Add(AuditList auditList){
        auditListService.updateById(auditList);
        System.out.println("增加"+auditList);
    }
    
}
