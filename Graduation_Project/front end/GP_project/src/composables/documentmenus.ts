import {ref,computed} from 'vue';
import { ElMessage, ElMessageBox, ListItem } from 'element-plus';
import  router from '@/router/index';
import { documentItem, getFileList,download} from '@/api/document';
import { get } from 'https';

//获得列表信息
export function documentMenus(){
const allMenus = ref([] as documentItem[])
const total  = ref<number>()
const getall = async(page:number)=>{
    const res = await getFileList(page)
    if(res.data.code ==200){
        allMenus.value = res.data.data
        total.value = res.data.count
    }else{
        ElMessage.error("请求文件列表失败")
        throw new Error("请求文件列表失败")
    }
}

const formCreate = ref<documentItem>({
    id:0,
    fileName:"",
    filePath:"",
    fileSize:0,
    fileType:"",
    originName:""
})
const getFileMimetype = (fileType: string): string =>{
    switch(fileType){
      case 'txt':
        return 'text/plain';
      case 'pdf':
        return 'application/pdf';
      case 'png':
        return 'image/png';
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      // 添加更多文件类型的处理逻辑...
      default:
        return 'application/octet-stream'; // 默认为二进制流类型
    }
  }
const downloadDocument = async (id:number, fileType:string,fileName:string): Promise<boolean> => {
    try{
        const blobData = await download(id);
        console.log(blobData);
        const mimeType = getFileMimetype(fileType);
        // console.log("")
        // 创建一个 Blob 对象并使用它创建一个下载链接
        const blob = new Blob([blobData], { type: mimeType });
        const downloadLink = document.createElement('a');
        downloadLink.href = window.URL.createObjectURL(blob);
         // 获取文件名
    //   const contentDisposition = blobData.type;
    //   const fileNameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
    //   const matches = fileNameRegex.exec(contentDisposition);
    //   const fileName = matches != null && matches[1] ? matches[1].replace(/['"]/g, '') : '下载文件';

        downloadLink.download = fileName;
        
        // 将下载链接添加到文档中并点击触发下载
        document.body.appendChild(downloadLink);
        downloadLink.click();
        //清除下载链接
        document.body.removeChild(downloadLink);
        return true;
    }catch(error){
        console.error('下载文件失败：', error);
        return false;
    }
    }
    return {downloadDocument,allMenus,getall,total,formCreate}
}