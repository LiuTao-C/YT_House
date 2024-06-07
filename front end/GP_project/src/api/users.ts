import { useTokenStore } from "@/stores/mytoken";
import request from "@/utils/request";
import { promises } from "dns";
//用户登录参数类型
type LoginInfo = {
    username: string,
    password: string,
}
//用户登录-返回数据类型
//泛型
type LoginResult = CommonReturn<string>
// type LoginResult = {
//     success: boolean,
//     state:number,
//     message:string,
//     content:string
// }
//提取公共类型
type CommonReturn<T> = {
    code: number
    message:string,
    data:T
}

// 用户登录请求
export const login = (loginInfo : LoginInfo) => {
    return request<LoginResult>({
        method:"POST",
        url:"/login",
        data:{
            username:loginInfo.username,
            password:loginInfo.password
        }
    })
}
//请求类型为aaplication/x-www.form-urlencoded
//      把数据拼接为 属性1=值1&属性2=值2
// 请求类型为aaplication/json
//      只需要直接传对象 data:logininfo
type UserInfo = CommonReturn<{
    isUpdatedPassword: boolean
    portrait: string
    userName: string
}>
// type UserInfo = {
//     success: boolean
//     message: string
//     state:number 
//     content: {
//         isUpdatedPassword: boolean
//         portrait: string
//         userName: string
//     }
// }

//获取用户信息
export const getInfo = () =>{
    return request<UserInfo>({
        method:'GET',
        url:'/front/user/getInfo',
    })
}

//用户退出
export const logout = () =>{
    return request({
        method:'POST',
        url:'/front/user/logout',
    })
}
//刷新token
type RToken = CommonReturn<string>
//刷新token
let promiseRT:Promise<any>
let isRefreshing = false
export const refreshToken = () =>{
    if(isRefreshing){
        return promiseRT
    }
    isRefreshing = true;

    return request<RToken>({
        method:'POST',
        url:'/front/user/refresh_token',
        params: {
            refreshtoken:useTokenStore().token?.refresh_token,
        }
    }).finally(()=>{
        isRefreshing = false
    })

    return promiseRT
}
