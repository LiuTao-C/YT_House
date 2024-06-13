import { ref,computed }  from 'vue'
import { ElMessage, ElMessageBox, ListItem } from 'element-plus';
import  router from '@/router/index';
import { CreateOrEditsupportItem,getSupportById,supportItem,saveOrUpdate,deleteSupport,getSupportList, } from '@/api/supportlist';

export function supportMenus(){
    
    const valueStrictly = ref()
    const data = [
      {
        value:"安全部门",
        label:"安全部门"
      },{
        value:"'技术操作部'",
        label:"技术操作部"
      },{
        value:"'航班运营部'",
        label:"航班运营部"
      },{
        value:"'行政部'",
        label:"行政部"
      },{
        value:"'管理员'",
        label:"管理员"
      }
    ]
    
const allMenus = ref([] as supportItem[])
const total = ref<number>()
const getall = async (page:number) => {
    const res = await getSupportList(page)
    if(res.data.code ==200){
        allMenus.value = res.data.data
        total.value = res.data.count
    }else{
        ElMessage.error("请求赞助商失败")
        throw new Error("请求赞助商失败")
    }
}
const formCreate = ref<CreateOrEditsupportItem>({
    id: 0,
    name:"",
    department:"",
    phone:"",
    email:"",
    address:"",
    status:""
})
const formCheck = ref<supportItem>({
    id:0,
    name:"",
    department:"",
    phone:"",
    email:"",
    address:"",
    status:"",
    dateTime:"",
    projectName:"",
    projectStatus:"",
    Money:""
})
const res = ref()
//表单提交
    const supportSubmit = async (id:number) => {
    if(id === 1) {
         res.value = await saveOrUpdate(formCreate.value)}
         
    else{
         res.value = await saveOrUpdate(formCheck.value)}
         console.log('上传成功',res)
         if(res.value.data.code === 200){
             ElMessage.success(`${msgText.value}成功`)
         }else{
             ElMessage.error(`${msgText.value}失败`)
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
          const res = await deleteSupport(id)
          if(res.data.code ===200){
            ElMessage.success('删除成功')
            getall(1)
            router.push({name:'supportlist'})
          }else{
            ElMessage.error('删除失败')
            throw new Error('删除失败')
          }
    }
//根据id获得信息
    const getSupportInfoById = async(id:string) =>{
        if(!Number(id)){//如果id不是数字类型，则为新建
            isCreate.value = true
          }else{
            isCreate.value = false
          }
          const res = await getSupportById(id)
          
          if(res.data.code ===200){
            formCheck.value = res.data.data
            ElMessage.success(`获得了id为${id}的信息`,)
        }else{
          ElMessage.error(`获得id为${id}的信息失败`)
          throw new Error(`获得id为${id}的信息失败`)
        }
    }
//分页
const isCreate=ref(true)
const msgText = computed(()=>(isCreate.value?"创建":"更新"))
return {getSupportInfoById,handleDelete,supportSubmit,formCheck,formCreate,getall,data,valueStrictly,total,allMenus}

}