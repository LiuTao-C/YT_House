package com.example.myproject.resource;

import com.example.myproject.entity.User;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.service.UserService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

/**
 * 专注数据交互，直接对Path负责，这里不需要很负责的业务逻辑
 * 可以做一些参数校验， 比如某个值是否格式正确，
 */
@Path("userlist")
@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class UserResource {
    
    @Inject
    UserService userService;
    
    /**
     * 查询所有数据列表 - 分页
     * @return
     */
    @Path("list")
    @GET //RestFul风格： @GET 查询 @DELETE 删除 @UPDATE 更新 @POST 新增
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public List<User> list(@QueryParam("page")Integer page, @QueryParam("limit") Integer limit) {
        // 这里可以将参数传递到下一层做分页
        System.out.println("page=============" + page);
        System.out.println("limit=============" + limit);
        return userService.selectList();
    }
    
    // TODO 把service层做个业务封装到Controlller层， 参考上面的写法
    //查询单个
    
    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult getById(@PathParam("id") Long id){
         User result =  userService.getById(id);
         return ResponseResult.success(result);
    }
    
    //删除
    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult delete(@PathParam("id") Long id){
        userService.deleteById(id);
        return  ResponseResult.success(200);
    }
    //更新
    @PUT
    @Path("id")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult updateById(User user){
        User result = userService.updateById(user);
        return ResponseResult.success(result);
    }
    
    //新增
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult editByNameAndId(User user){
        User result = userService.Add(user);
        return  ResponseResult.success(result);
    }
    
}

