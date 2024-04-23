package org.example.yt;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import org.example.yt.service.JwtService;

@Path("/hello")
public class ExampleResource {
    @Inject
    JwtService jwtService;
    
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        jwtService.generateToken("3");
        
        return "Hello from Quarkus REST";
    }
    
}
