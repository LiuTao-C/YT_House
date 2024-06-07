package com.example.myproject.resource;

import com.example.myproject.entity.User;
import com.example.myproject.response.ResponsePage;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.service.UserService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import org.springframework.data.domain.Page;

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
     * @return s
     */
    @Path("page")
    @GET //RestFul风格： @GET 查询 @DELETE 删除 @UPDATE 更新 @POST 新增
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponsePage<User> page(@QueryParam("page")Integer page, @QueryParam("size") Integer size) {
        // 这里可以将参数传递到下一层做分页
        Page<User> users = userService.selectList(page, size);
        return ResponsePage.success(users);
    }
    
    //查询单个
    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<User> getById(@PathParam("id") Long id){
        User result =  userService.getById(id);
        return ResponseResult.success(result);
    }
    
    //删除
    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<String> deleteById(@PathParam("id") Long id){
        userService.deleteById(id);
        return ResponseResult.success();
    }
    //更新
    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<User> updateById(User user){
        User result = userService.updateById(user);
        return ResponseResult.success(result);
    }
    
    //新增
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<User> add(User user){
        User result = userService.add(user);
        return  ResponseResult.success(result);
    }
    
}