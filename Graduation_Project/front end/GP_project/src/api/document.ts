import request from "@/utils/request";

//定义类型
export type Common<T> =  {
    count:string;
    code:string
    data:T
    mesg:string
}

export type documentItem = {
    id:number
    fileName:string
    filePath:string
    fileSize:number
    fileType:string
    originName:string
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
export const getFileList = async(page:number) =>{
    return request<{count:number;code:number;msg:string;data:documentItem[]}>({
        method: 'GET',
        url:`/file/list?page=${page}&size=10`,
        params:{
            page,
        }
    })
}
//根据id找文件类型
export const getFile = async (id:string)=>{
    return request<{code:number;msg:string;data:documentItem}>({
        method: 'GET',
        url:`/file/${id}`,
        params:{
            id,
        }
    })
}