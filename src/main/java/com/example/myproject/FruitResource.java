package com.example.myproject;
import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.json.Json;
import javax.json.JsonObjectBuilder;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;
import org.jboss.resteasy.annotations.jaxrs.PathParam;
@Path("fruits")
@ApplicationScoped
@Produces("application/json")
@Consumes("application/json")

public class FruitResource {
    //注入服务类
    @Inject
    FruitService service;

    //获取Project列表
    @GET
    public List<Fruit> get() {
        return service.get();
    }


    //获取单个Project信息
    @GET
    @Path("{id}")
    public Fruit getById(@PathParam("id")  Integer id) {
        return service.getById(id);
    }

    //增加一个Project对象
    @POST
    public Response add( Fruit project) {
        service.add(project) ;
        return Response.ok(project).status(201).build();
    }

    //修改一个Project对象
    @PUT
    @Path("{id}")
    public Fruit update(Fruit project) {
        return service.update(project);
    }

    //删除一个Project对象
    @DELETE
    @Path("{id}")
    public Response delete(@PathParam("id") Integer id) {
        service.delete(id);
        return Response.status(204).build();
    }

    // 处理Response的错误情况
    @Provider
    public static class ErrorMapper implements ExceptionMapper<Exception> {

        @Override
        public Response toResponse(Exception exception) {
//            LOGGER.error("Failed to handle request", exception);

            int code = 500;
            if (exception instanceof WebApplicationException) {
                code = ((WebApplicationException) exception).getResponse().getStatus();
            }

            JsonObjectBuilder entityBuilder = Json.createObjectBuilder()
                    .add("exceptionType", exception.getClass().getName())
                    .add("code", code);

            if (exception.getMessage() != null) {
                entityBuilder.add("error", exception.getMessage());
            }

            return Response.status(code)
                    .entity(entityBuilder.build())
                    .build();
        }
    }
}
