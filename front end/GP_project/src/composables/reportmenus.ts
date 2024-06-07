import {ref,computed} from 'vue';
import { ElMessage, ElMessageBox, ListItem } from 'element-plus';
import  router from '@/router/index';
import { CreateOrEditReportItem, getReportList, reportItem,saveOrUpdate,deleteReport,getReportById,download,getFile,fileItem} from '@/api/reportlist';


export function reportMenus(){
//报告的类型
const valueStrictly = ref()
const data = [
  {
    value: "'机场管理",
    label: '机场管理',
    children: [
      {
        value: "'机场消防'",
        label: '机场消防',
      },{
        value:"'拥塞管理'",
        label:'拥塞管理',
      },{
        value:"'跑道管理'",
        label:'跑道管理',
      },{
        value:"'鸟害防治'",
        label:'鸟害防治',
      },{
        value:"'照明系统管理'",
        label:'照明系统管理',
      }
    ],
  },
  {
    value: "'客舱管理'",
    label: "客舱管理",
    children: [
      {
        value: "'行李托运'",
        label: '行李托运',
      },{
        value:"'乘客管理'",
        label:'乘客管理',
      },{
        value:"'机务通信'",
        label:'机务通信',
      },{
        value:"'其他'",
        label:'其他',
      },
    ],
  },
  {
    value: "'通信系统'",
    label: '通信系统',
    children: [
      {
        value: "'通信集成系统'",
        label: '通信集成系统',
      
      },
      {
        value: "'驾驶舱通信设备'",
        label: '驾驶舱通信设备',
        children: [
          {
            value: "'耳机/麦克风'",
            label: '耳机/麦克风',
          },{
            value: "'无线电通信'",
            label: '无线电通信',
          }
        ],
      },
    ],
  },{
    value:"'航班管理'",
    label:'航班管理',
    children:[
    {
        value:"'飞行计划'",
        label:'飞行计划'    
    },{
        value:"'机场调度'",
        label:'机场调度'
    },{
        value:"'乘客管理'",
        label:'乘客管理'
    }
    ]
  },{
    value:"'设备管理'",
    label:'设备管理',
    children:[
    {
        value:"'驾驶室设备'",
        label:'驾驶室设备'
    },{
        value:"'起飞设备'",
        label:'起飞设备'
    },{
        value:"'着陆设备'",
        label:'着陆设备'
    },{
        value:"'发动机系统'",
        label:'发动机系统'
    },{
        value:"'燃油系统'",
        label:'燃油系统'
    },{
        value:"'雷达系统'",
        label:'雷达系统'
    }
    ]
  },{
    value:"'安全管理'",
    label:'安全管理',
    children:[
    {
        value:"'消防设备'",
        label:'消防设备'
    },{
        value:"'跑道管理'",
        label:'跑道管理'
    },{
        value:"'空中管理'",
        label:'空中管理'
    },{
        value:"'天气管理'",
        label:'天气管理'
    }
    ]
  }
]
//获得列表信息
const allMenus = ref([] as reportItem[])
const total  = ref<number>()
const getAll = async (page:number) =>{
  const res = await getReportList(page)
  if(res.data.code ===200){
    allMenus.value = res.data.data
    total.value = res.data.count
  }else{
    ElMessage.error("出错")
    throw new Error("请求报告列表出错")
  }
}
//提交表单的类型
const formCreate = ref<CreateOrEditReportItem>({
  id:0,
  type:"",
  theme:"",
  reporter:'',
  reportdate:'',
  reportCode:'',
  flightNumber:'0',
  reportIntroduction:'',
  eventType:'',
  eventRisk:'',
  needReaserch:"false",
  needExpertResearch:"false",
  fileId:0
  // evaluationDate:"0000-00-00",   //查看表有
  // evaluator:"无",  //查看表有
  // conclusion:"无",   //查看表有
})
//修改表单的类型
const formCheck = ref<reportItem>({
  id:0,
  type:"",
  theme:"",
  reporter:'',
  reportdate:'',
  flightNumber:'0',
  reportCode:'',
  reportIntroduction:'',
  eventType:'',
  eventRisk:'',
  needReaserch:"false",
  needExpertResearch:"false",
  evaluationDate:"无",   //查看表有
  evaluator:"无",  //查看表有
  conclusion:"无",   //查看表有
  fileId:0

})
const fileList = ref<fileItem>({
  id:0,
  fileName:"",
  filePath:"",
  fileSize:0,
  fileType:"",
  originName:""
})
const res = ref()
//表单提交
const reportSubmit = async(id:number) =>{
  if(id === 1){
    res.value = await saveOrUpdate(formCreate.value)
  }else{
    res.value = await saveOrUpdate(formCheck.value)

  }
  if(res.value.data.code ===200){
    ElMessage.success(`${msgText.value}成功`)
    router.push({name:'reportlistview'})
  }else{
    ElMessage.error(`${msgText.value}失败`)
    throw new Error(`${msgText.value}失败`)
  }
}
//删除菜单
  const handleDelete = async (id:number) =>{
    await ElMessageBox.confirm('此操作将永久删除菜单，是否继续？','提示',{
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    }).catch(() => {
      ElMessage.info("删除操作被取消")
      return new Promise(() => {})
    })
    const res = await deleteReport(id)
    if(res.data.code ===200){
      ElMessage.success('删除成功')
      
      getAll(1)
      router.push({name:'reportlistview'})
    }else{
      ElMessage.error('删除失败')
      throw new Error('删除失败')
    }
  }
  //根据id获得信息
  const getReportInfoById = async(id:string) =>{
    if(!Number(id)){//如果id不是数字类型，则为新建
      isCreate.value = true
    }else{
      isCreate.value = false
    }
    const res = await getReportById(id)
    
    if(res.data.code ===200){
      formCheck.value = res.data.data
      ElMessage.success(`获得了id为${id}的信息`,)
  }else{
    ElMessage.error(`获得id为${id}的信息失败`)
    throw new Error(`获得id为${id}的信息失败`)
  }
    
    
  }
const getFileById =  async (id: string) =>{
  const res = await getFile(id)
  if(res.data.code ===200){
    fileList.value = res.data.data
    ElMessage.success(`获得了id为${id}的文件信息`,)
}else{
  ElMessage.error(`获得id为${id}的文件信息失败`)
  throw new Error(`获得id为${id}的文件信息失败`)
}
}
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
  const downloadFile = async (id: number,fileType:string): Promise<boolean> => {
    try {
      const blobData = await download(id);
      console.log(blobData);
      const mimeType = getFileMimetype(fileType);
      // console.log("")
      // 创建一个 Blob 对象并使用它创建一个下载链接
      const blob = new Blob([blobData], { type: mimeType });
      const downloadLink = document.createElement('a');
      downloadLink.href = window.URL.createObjectURL(blob);
      
      // 获取文件名
      const contentDisposition = blobData.type;
      const fileNameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
      const matches = fileNameRegex.exec(contentDisposition);
      const fileName = matches != null && matches[1] ? matches[1].replace(/['"]/g, '') : '下载文件';
  {}
      // 设置下载链接属性
      downloadLink.download = fileName;
  
      // 将下载链接添加到文档中并点击触发下载
      document.body.appendChild(downloadLink);
      downloadLink.click();
  
      // 清理创建的下载链接
      document.body.removeChild(downloadLink);
  
      return true; // 下载成功
    } catch (error) {
      console.error('下载文件失败：', error);
      return false; // 下载失败
    }
  };
  
//分页
  const isCreate=ref(true)
  const msgText = computed(()=>(isCreate.value?"创建":"更新"))

    return {fileList,getFileById,data,getAll,valueStrictly,total,allMenus,formCheck,formCreate,handleDelete,getReportInfoById,downloadFile,reportSubmit}
}