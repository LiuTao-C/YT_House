package com.example.myproject.resource;

import com.example.myproject.entity.FileList;
import com.example.myproject.entity.ReportList;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.service.UploadFileService;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import jakarta.ws.rs.core.Response;
import lombok.extern.slf4j.Slf4j;
import org.jboss.resteasy.reactive.PartType;
import org.jboss.resteasy.reactive.RestForm;
import org.jboss.resteasy.reactive.multipart.FileUpload;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Slf4j
@Path("file")
public class FileResource {
    @Inject
    UploadFileService uploadFileService;
    
    
    public static class Person {
        public String firstName;
        public String lastName;
    }
    
    @POST
    public void multipart(@RestForm String description,
                          @RestForm("image") FileUpload file,
                          @RestForm @PartType(MediaType.APPLICATION_JSON) Person person) {
        // do something
    }
    
    @POST
    @Path("/upload")
    @Consumes({MediaType.MULTIPART_FORM_DATA, MediaType.APPLICATION_FORM_URLENCODED})
    public ResponseResult<String> upload(@RestForm("file") FileUpload fileUpload) throws IOException {
        
        uploadFileService.updateById(fileUpload);
        return ResponseResult.success();
    }
    
    /**
     *
     * @param id
     * @return
     */
 
    @GET
    @Path("/download")
    @Produces(MediaType.APPLICATION_OCTET_STREAM)
    public Response download(@QueryParam("id") Long id){
        
        FileList fileList = uploadFileService.getById(id);
        String fileName = fileList.getOriginName();
        String filePath = fileList.getFilePath();
        String path = filePath+"\\"+fileName;
        path = path.replace("\\", File.separator);
        System.out.println("path:"+path);
        File file = new File(path);
        String encodFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8);
        return Response.ok(file)
        .header("content-disposition", "attachment; filename=\"" + encodFileName + "\"")
        .header("Content-Length", file.length())
        .build();

    }
    
    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    
    public ResponseResult<FileList> getById(@PathParam("id") Long id){
        FileList result =  uploadFileService.getById(id);
        return  ResponseResult.success(result);
    }
    
    
}
    
    


