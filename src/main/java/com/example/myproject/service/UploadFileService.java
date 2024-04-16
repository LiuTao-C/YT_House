package com.example.myproject.service;

import com.example.myproject.entity.UploadFile;
import com.example.myproject.mapper.UploadFileMapper;
import com.example.myproject.resource.util.FileHelper;
import com.example.myproject.response.ResponseResult;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.core.Response;
import org.jboss.resteasy.reactive.multipart.FileUpload;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

@ApplicationScoped
public class UploadFileService {
    @Inject
    UploadFileMapper uploadFileMapper;
    
    
    //初始化数据
    public UploadFile InitFileData(FileUpload fileUpload) throws IOException {
        String UPLOAD_DIR = "D:\\storefile";
        String fileName = fileUpload.fileName();
        java.nio.file.Path source = fileUpload.uploadedFile();
        byte[] bytes = Files.readAllBytes(source);
        // 创建输出文件路径信息
        
        java.nio.file.Path outputDirectory = Paths.get(UPLOAD_DIR);
        //目录不存在的话创建目录
        if (!Files.exists(outputDirectory)) {
            Files.createDirectory(outputDirectory);
        }
        // 创建输出文件的虚拟文件信息
        java.nio.file.Path outPath = outputDirectory.resolve(fileName);
        // 将文件数据保存到对应的目录文件夹下 -> D:\output\{{fileName}}
        Files.write(outPath, bytes);
        
        UploadFile uploadFile = new UploadFile();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String Type =  FileHelper.getFileExtension(fileUpload.fileName());
        uploadFile.setFileName(uuid+"."+Type);
        uploadFile.setOriginName(fileUpload.fileName());
        uploadFile.setFileSize(fileUpload.size());
        uploadFile.setFileType(Type);
        uploadFile.setFilePath(UPLOAD_DIR);
        System.out.println("the dabasetA is"+uploadFile.getId());
        System.out.println("the file name is :"+fileName);
        System.out.println("the file size is :"+ fileUpload.size());
        System.out.println("the file type is :"+ FileHelper.getFileExtension(fileName));
        System.out.println("the file path is :"+ outPath.toAbsolutePath());
        return uploadFile;
    }
    //更新数据
    public UploadFile updateById(FileUpload fileUpload) throws IOException {
        UploadFile uploadFile = new UploadFile();
        uploadFile = InitFileData(fileUpload);
        System.out.println("the dabasetB is"+uploadFile.getId());
        return uploadFileMapper.saveAndFlush(uploadFile);
    }
    
    
    //下载文件根据文件名下载
    public File downloadByName(String fileName){
        File file = new File("D:\\storefile\\"+fileName);
        return file;
    }
    
    public UploadFile getById(Long id) { return uploadFileMapper.getOne(id);}
    
    
    
    
    //查找
    /**
    public File downloadById(Long id){
     
     File file = new File()
     }
     */
    
}
