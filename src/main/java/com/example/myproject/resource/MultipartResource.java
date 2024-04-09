package com.example.myproject.resource;

import com.example.myproject.entity.UploadFile;
import com.example.myproject.resource.util.FileHelper;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.service.UploadFileService;
import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.core.MediaType;

import lombok.extern.slf4j.Slf4j;
import org.jboss.resteasy.reactive.PartType;
import org.jboss.resteasy.reactive.RestForm;
import org.jboss.resteasy.reactive.multipart.FileUpload;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
@Slf4j
@Path("multipart")
public class MultipartResource {
    @Inject
    UploadFileService uploadFileService;
    @Inject
    UploadFile uploadFile;
    
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
        String fileName = fileUpload.fileName();
        java.nio.file.Path source = fileUpload.uploadedFile();
        byte[] bytes = Files.readAllBytes(source);
        // 创建输出文件路径信息
        String UPLOAD_DIR = "D:\\storefile";
        java.nio.file.Path outputDirectory = Paths.get(UPLOAD_DIR);
        //目录不存在的话创建目录
        if (!Files.exists(outputDirectory)) {
            Files.createDirectory(outputDirectory);
        }
        // 创建输出文件的虚拟文件信息
        java.nio.file.Path outPath = outputDirectory.resolve(fileName);
        // 将文件数据保存到对应的目录文件夹下 -> D:\output\{{fileName}}
        Files.write(outPath, bytes);
        
        // TODO: 写入文件后这个位置可以将文件信息保存数据库
        
        log.info("the file name is :{}", fileName);
        log.info("the file size is :{}", fileUpload.size());
        log.info("the file type is :{}", FileHelper.getFileExtension(fileName));
        log.info("the file path is :{}", outPath.toAbsolutePath());
        
        String Type =  FileHelper.getFileExtension(fileName);
        uploadFile.setFileName(fileName);
        uploadFile.setFileSize(fileUpload.size());
        uploadFile.setFileType(Type);
        uploadFileService.updateById(uploadFile);
        
        return ResponseResult.success();
    }
    
    
}

