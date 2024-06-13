import request from "@/utils/request"
import { reportItem } from "./reportlist";

//定义类型

export type Common<T> =  {
    count:string;
    code:string
    data:T
    mesg:string
}

export type supportItem = {
    id:number
    name:string
    department:string
    phone:string
    email:string
    address:string
    status:string
    dateTime:string
    projectName:string
    projectStatus:string
    Money:string
}
export type CreateOrEditsupportItem = Omit<supportItem,"dateTime"| "projectName" | "projectStatus"|"Money">
//请求数据
export const getSupportList = (page:number) =>{
    return request<{code:number;count:number;msg:string;data:supportItem[]}>({
        method:"GET",
        url:`/support/list?page=${page}&size=10`
    })
}
//修改
export const saveOrUpdate = (supportInfo:CreateOrEditsupportItem | supportItem)=>{
    return request<{code:number;msg:string;data:supportItem[]}>({
        method:"PUT",
        url:"/support/",
        data:supportInfo
    })
}

//根据id删除
export const deleteSupport = (id:number) => {
    return request<{code:number;msg:string;data:supportItem[]}>({
        method:"DELETE",
        url:`/support/${id}`
    })
}
//根据id查找
export const getSupportById = (id:String) =>{
    return request<{code:number;msg:string;data:supportItem}>({
        method:"GET",
        url:`/support/${id}`,
        params:{
            id,
        }
    })
}