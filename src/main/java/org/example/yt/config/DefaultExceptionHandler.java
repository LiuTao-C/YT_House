package org.example.yt.config;

import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.ExceptionMapper;
import jakarta.ws.rs.ext.Provider;
import lombok.extern.slf4j.Slf4j;
import org.example.yt.response.ResponseResult;
/**
 * @author Lanzhou
 * @date 2024/3/19-14:37
 * @since all right
 */
@Slf4j
@Provider
public class DefaultExceptionHandler implements ExceptionMapper<Exception> {
    
    /**
     * 全局异常处理, 可以自定义一些异常, 比如登入异常之类的
     *
     * @param exception 异常
     * @return 正常响应体, 可以设置异常时返回前端的值
     */
    @Override
    public Response toResponse(Exception exception) {
        ResponseResult<String> result = null;
        if (exception instanceof RuntimeException) {
            log.debug("Need To Handle RuntimeException: [{}]", exception.getMessage());
            result = ResponseResult.fail(exception.getMessage());
        } else {
            log.debug("Need To Handle Exception: [{}]", exception.getMessage());
            result = ResponseResult.fail(exception.getMessage());
        }
        return Response.status(Response.Status.OK).entity(result).build();
    }
    
}