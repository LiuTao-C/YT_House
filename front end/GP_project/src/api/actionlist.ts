import request from "@/utils/request";

export type Common<T> = {
    count:string
    code: string
    data:T
    mesg:string
}
//actionlist表单
export type actionItem = {
    type:string
    actCode:string
    investors:string
    createDate:string
    projectScope:string
    standards:string
    status:string
    position:string
    detailInformation:string
    risk:string
    actionCycle:string
    departmentCollaboration:string
    assessmentConclusion:string
    correctiveMeasures:string
    scheduleStartDate:string
    scheduleEndDate:string
    id:number
}
//新造的表单
export type CreateOrEditActItem = Omit<actionItem,
    'assessmentConclusion' | 'correctiveMeasures'> &{id:number}
    

export const getActionList = (page:number) =>{
    return request<{code:number;count:number;msg:string;data:actionItem[]}>({
        method:"GET",
        url:`/actionlist/list?page=${page}&size=15`
    })
}
//添加表单和更新表单
export const saveOrUpdateAction = (actinfo :actionItem | CreateOrEditActItem) =>{
    return request<{code:number;msg:string;data:actionItem[]}>({
        method:"PUT",
        url:"/actionlist/",
        data:actinfo
    })
}
//根据id删除
export const deleteAction = (id:number) =>{
    return request<{code:number;msg:string;data:actionItem[]}>({
        method:"DELETE",
        url:`/actionlist/${id}`
    })
}
//根据id查找
export const getActionById = (id:String) =>{
    return request<{code:number;msg:string;data:actionItem}>({
        method:"GET",
        url:`/actionlist/${id}`,
        params:{
            id,
        }
    })
}
