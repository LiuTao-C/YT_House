// uploadApi.ts
import request from "@/utils/request";
export type Common<T> = {
    code: string
    mesg:string
}
export function uploadFiles(formData: FormData) {
    return request<{code:string;msg:string;}>({
        url: '/upload/',
        method: 'post',
        data: formData,
        headers: {
            'Content-Type':'multipart/form-data'
        }
    })
}
