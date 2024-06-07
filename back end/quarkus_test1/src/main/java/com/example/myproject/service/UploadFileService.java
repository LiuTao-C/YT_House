package com.example.myproject.service;

import com.example.myproject.entity.FileList;
import com.example.myproject.mapper.DocumentMapper;
import com.example.myproject.mapper.UploadFileMapper;
import com.example.myproject.resource.util.FileHelper;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import org.jboss.resteasy.reactive.multipart.FileUpload;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@ApplicationScoped
public class UploadFileService {
    
    @Inject
    UploadFileMapper uploadFileMapper;
    
    @Inject
    DocumentMapper documentMapper;
    
    //初始化数据
    public  FileList InitFileData(FileUpload fileUpload) throws IOException {
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
        
        FileList fileList = new FileList();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String Type = FileHelper.getFileExtension(fileUpload.fileName());
        
        
        fileList.setFileName(uuid + "." + Type);
        fileList.setOriginName(fileUpload.fileName());
        fileList.setFileSize(fileUpload.size());
        fileList.setFileType(Type);
        fileList.setFilePath(UPLOAD_DIR);
        //保存时间
        // 获取当前当地日期
        LocalDate localDate = LocalDate.now();
        
        // 定义日期格式化器
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        // 格式化日期
        String formattedDate = localDate.format(formatter);
        fileList.setUpdateTime(formattedDate);
        //文档类型 随机
        List<String> list = Arrays.asList("安全部", "行政", "航班运营部", "技术操作部", "管理员");
        int index = new Random().nextInt(list.size());
        fileList.setDocumentType(list.get(index));
//        fileList.setDocumentType(modelist.documentType);
        System.out.println("the dabasetA is" + fileList.getId());
        System.out.println("the file name is :" + fileName);
        System.out.println("the file size is :" + fileUpload.size());
        System.out.println("the file type is :" + FileHelper.getFileExtension(fileName));
        System.out.println("the file path is :" + outPath.toAbsolutePath());
        return fileList;
    }
    
    //更新数据
    public <T> FileList updateById(FileUpload fileUpload) throws IOException {
        FileList fileList = InitFileData(fileUpload);
        System.out.println("the dabasetB i  s" + fileList.getId());
        return uploadFileMapper.saveAndFlush(fileList);
    }
    
    
    //下载文件根据文件名下载
    public File downloadByName(String fileName) {
        File file = new File("D:\\storefile\\" + fileName);
        return file;
    }
    
    public FileList getById(Long id) {
        return uploadFileMapper.getOne(id);
    }
    
    
    public Page<FileList> findAll(Integer page, Integer size) {
        Pageable pageable = PageRequest.of(page - 1, size);
        return documentMapper.findAll(pageable);
    }
    
    
    //查找
    /**
     public File downloadById(Long id){
     
     File file = new File()
     }
     */
    
}
