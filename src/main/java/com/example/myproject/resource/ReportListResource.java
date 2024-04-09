package com.example.myproject.resource;


import com.example.myproject.entity.ReportList;
import com.example.myproject.response.ResponsePage;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.service.ReportListService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import org.springframework.data.domain.Page;
@Path("reportlist")
@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class ReportListResource {
    
    @Inject
    ReportListService reportListService;
    //删除单个
    @Path("list")
    @GET
  
    public ResponsePage<ReportList>pageAll(@QueryParam("page") Integer page ,@QueryParam("size") Integer size){
        Page<ReportList>  reportListPage = reportListService.selectList(page,size);
        return ResponsePage.success(reportListPage);
    }
    //查询单个
    @Path("{id}")
    @GET
    public ResponseResult<ReportList>getById(@PathParam("id")Long id){
        ReportList result = reportListService.getById(id);
        return ResponseResult.success(result);
    }
    //删除单个
    @Path("{id}")
    @DELETE
    public ResponseResult<ReportList>deleteById(@PathParam("id")Long id){
         reportListService.deleteById(id);
        ResponseResult responseResult;
        return ResponseResult.success();
    }
    @POST
    public ResponseResult<ReportList>updateById(ReportList reportList){
        ReportList result =  reportListService.updateAndSave(reportList);
        return ResponseResult.success(result);
    }
    @PUT
    public  ResponseResult<ReportList>addOneList(ReportList reportList){
        ReportList result = reportListService.updateAndSave(reportList);
        return ResponseResult.success(result);
    }
    
}
