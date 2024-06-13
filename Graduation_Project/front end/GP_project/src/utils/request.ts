import { useTokenStore } from "@/stores/mytoken";
import axios, { AxiosRequestHeaders } from "axios";
import router from "@/router/index"
import { refreshToken } from "@/api/users";

const request = axios.create({ 
}) 


//拦截器
request.interceptors.request.use((config)=>{
    if(!config.headers) {
        config.headers = {} as AxiosRequestHeaders;
    }
    const store = useTokenStore()
    config.headers.Authorization = store.token as string

    return config
})
//响应拦截器
request.interceptors.response.use(
    (response)=>response,
    async (error)=>{
    if(error.response.status === 401){
       console.log("401")
        const {data} =await  refreshToken()//刷新token
        if(data.success){
            //保存新token
            useTokenStore().saveToken(data.content)
            //重新请求之前的接口，并且返回结果
            return request(error.config)
        }else{
            //跳转到login去
            ElMessage.error("刷新token失败,需要重新登录才可以!")
            
            router.push({name: 'login'})
            return
        }
    }
    return Promise.reject(error)
})

export default request;