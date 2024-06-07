import request from "@/utils/request";

//定义类型
export type Common<T> = {
    count:string
    code: string
    data:T
    mesg:string
}
export type ListItem = {
    code: string
    type: string
    position:string
    scope:string
    leadAuditor:string
    auditors:string
    scheduleStartDate :string
    scheduleEndDate :string
    performEndDate :string
    performStartDate :string
    createBy:  string
    createDate:string
    id:number
    status:string
}
export type CheckItem ={
    code: string
    type: string
    position:string
    scope:string
    leadAuditor:string
    auditors:string
    scheduleStartDate :string
    scheduleEndDate :string
    performEndDate :string
    performStartDate :string
    createBy:  string
    createDate:string
    id:number
    status:string
}

// type CreateOrEditListItem Partial<ListItem>      //整体每一项属性都有可选
// export type CreateOrEditListItem = Pick<ListItem,       //选择哪部分属性
//          "id" | "type" | "scope" | "code" | "create_by"|"schedule_start_date"> //&{id?:number}//id为可选，编辑的时候有id，新建无id
export type CreateOrEditListItem = Omit<ListItem,            //忽略哪部分属性
'performEndDate' | 'performStartDate'> &
    {id?:number}//id为可选，编辑的时候有id，新建无id

// Common<ListItem[]>
//获取审计栏
export const getAuditList = (page:number) => {
    return request<{code:number;count:number;msg:string;data:ListItem[] }>({
        method: 'GET',
        url:`/auditlist/list?page=${page}&size=20`,
    })
}


        // 保存或新增菜单
export const saveOrUpdate =(auditinfo :ListItem | CreateOrEditListItem) => {
    return request<{code:number;msg:string;data:ListItem[]}>({
        method: 'PUT',
        url:'/auditlist/',
        data:auditinfo
    })
}
// export const save =(auditinfo :CreateOrEditListItem) => {
//     return request<{code:number;msg:string;data:ListItem[]}>({
//         method: 'POST',
//         url:'/auditlist/',
//         data:auditinfo
//     })
// }


//删除菜单
export const deleteAudit = (id :number) =>{
    return request<{code:number;msg:string;data:ListItem[]}>({
        method:'delete',
        url:`/auditlist/${id}`, //有参数，用``符，且不能有空格

    })
}
type EditAuditInfo = ListItem | null


//获取指定ID菜单的信息
export const getEditAuditInfo =(id:String)=>{
    return request<{code:number;msg:string;data:ListItem}>({
        method: 'GET',
        url:`/auditlist/${id}`,
        params:{
            id,
        }
    })
}   