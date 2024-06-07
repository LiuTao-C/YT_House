import request from "@/utils/request"
import { c } from "vite/dist/node/types.d-FdqQ54oU";

//定义类型
export type Common<T> =  {
    count:string;
    code:string
    data:T
    mesg:string
}
export type reportItem = {
    id:number
    type:string
    theme:string
    reporter:string
    reportdate:string
    reportCode:string
    flightNumber:string
    reportIntroduction:string
    eventType:string
    eventRisk:string
    evaluationDate:string   //查看表有
    evaluator:string   //查看表有
    conclusion:string   //查看表有
    needReaserch:string
    needExpertResearch:string
    fileId:number
}

export type fileItem = {
    id:number
    fileName:string
    filePath:string
    fileSize:number
    fileType:string
    originName:string
}

export type CreateOrEditReportItem  = Omit<reportItem,'conclusion'| 'evaluationDate' | 'evaluator' > &{id?:number}
//请求列表数据
export const getReportList = (page:number) =>{
    return request<{code:number;count:number;msg:string;data:reportItem[]}>({
        method: 'GET',
        url:`/reportlist/list?page=${page}&size=15`,
    })
}

//上传
export const saveOrUpdate =(reportinfo :reportItem |CreateOrEditReportItem) =>{
    return request<{code:number;msg:string;data:reportItem[]}>({
        method: 'PUT',
        url:'/reportlist/',
        data:reportinfo
    })
}
//根据删除
export const deleteReport = (id:number) => {
    return request<{code:number;msg:string;data:reportItem[]}>({
        method: 'DELETE',
        url:`/reportlist/${id}`, //有参数，用``符，且不能有空格
    })
}
    //根据id查找
    export const getReportById = (id:string) =>{
        return request<{code:number;msg:string;data:reportItem}>({
            method: 'GET',
            url:`/reportlist/${id}`,
            params:{
                id,
            }
        })
    }

//根据id下载
export const download = async (id: number)=> {
    const response = await request({
      method: 'GET',
      url: `/file/download?id=${id}`,
      params: {
        id: id,
      },
      responseType: 'blob',
    });
    console.log("打印请求的东西",response.data)
    return response.data as Blob;
  };
//根据id找文件类型
export const getFile = async (id:string)=>{
    return request<{code:number;msg:string;data:fileItem}>({
        method: 'GET',
        url:`/file/${id}`,
        params:{
            id,
        }
    })
}