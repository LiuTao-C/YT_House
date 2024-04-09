//package com.example.myproject.resource;
//
//import jakarta.inject.Inject;
//import jakarta.ws.rs.*;
//import jakarta.ws.rs.core.MediaType;
//import jakarta.ws.rs.core.Response;
//import org.eclipse.microprofile.openapi.annotations.tags.Tag;
//import com.example.myproject.entity.UploadedFile;
//import com.example.myproject.service.FileUploadService;
//import org.jboss.resteasy.annotations.providers.multipart.MultipartForm;
//
//@Path("/files")
//@Tag(name = "File Upload")
//@Produces(MediaType.APPLICATION_JSON)
//@Consumes(MediaType.MULTIPART_FORM_DATA)
//public class FileUploadResource {
//
//    @Inject
//    FileUploadService fileUploadService;
//
//    @POST
//    @Path("/upload")
//    public Response uploadFile(@MultipartForm UploadedFile uploadedFile) {
//        fileUploadService.uploadFile(uploadedFile);
//        return Response.ok("File uploaded successfully").build();
////    }
//
