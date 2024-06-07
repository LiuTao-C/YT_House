import { CheckItem, ListItem } from '@/api/auditlist'
import { getAuditList,CreateOrEditListItem ,saveOrUpdate,deleteAudit,getEditAuditInfo} from '@/api/auditlist';
import { ElMessage, ElMessageBox } from 'element-plus';
import { ref,computed} from 'vue';
import  router from '@/router/index';
export function auditMenus(){

const allMenus = ref([] as ListItem[])
const total = ref<number>() 
const getAll = async (page:number) => {
    const res= await getAuditList(page) 
    // const {data} = res
    if(res.data.code ==200){
        allMenus.value = res.data.data
        const first = allMenus.value[0];
        // console.log("hhhh",first.id)
        total.value = res.data.count
    }else{
        ElMessage.error("出错")
        throw new Error("newaudit出错")
    } 
}


/**
*/
// 2.再从所有菜单中过滤出一级菜单
// const topMenus = computed(()=>{return allMenus.value.filter((menu)=>menu.level ===0)})

//表单的响应式数据
    const formCreat = ref<CreateOrEditListItem>({
       code:'',
       type:'',
       position:'',
       scope:'',
       leadAuditor:'',
       auditors:'',
       scheduleStartDate:'',
       scheduleEndDate:'',
       createBy:'',
       status:'',
       createDate:'',
       id:0,
    })
    const formCheck = ref<ListItem>({
        code:'',
        type:'',
        position:'',
        scope:'',
        leadAuditor:'',
        auditors:'',
        scheduleStartDate:'',
        scheduleEndDate:'',
        performStartDate:'',
        performEndDate:'',
        createBy:'',
        status:'',
        createDate:'',
        id:0,
    })
  
//  const form = ref<CheckItem>({ 
//      type:"",
//      content:'',
//      createBy:'',
//      createDate:'',
//      checkListId:0,
//      id:0  })
//表单提交
const res = ref()
   const onSubmit = async (id:number) => {
 
    if(id === 1) {
         res.value = await saveOrUpdate(formCreat.value)}
         

    else{
         res.value = await saveOrUpdate(formCheck.value)}
        
        console.log('上传成功',res)
        if(res.value.data.code ==200){
            ElMessage.success(`${msgText.value}菜单成功`)
            
            // if(`${msgText.value}`==="创建"){router.push({path:'/auditlistview'})}
            // else{router.push({path:'/checklistview'})}
            router.push({name:'auditlistview',})
        }else{ 
            ElMessage.error(`${msgText.value}菜单失败`)
            throw new Error(`${msgText.value}菜单失败`) 
        }
    }
//删除菜单
    const handleDelete = async (id:number) =>{
        await ElMessageBox.confirm('此操作将永久删除该菜单, 是否继续?', '提示',{
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
        }).catch(()=>{
            ElMessage.info("删除操作被取消")
            return new Promise(() => {})
        })
//调用接口函数
        const res = await deleteAudit(id)
        // console.log("AA",res)
        if(res.data.code ==200){
            ElMessage.success("删除菜单成功")
            console.log("删除了ID",id)
            // 重新获取当前页数据
            // const page = id%20;
            // console.log(page,"page")
           getAll(1)
        }else{
            ElMessage.error("删除菜单失败") 
            throw new Error("删除菜单失败")
        }
    }
 
    //根据id获取菜单信息
    const getAuditInfoById = async (id:string) =>{
        //根据id判断状态
        if(!Number(id)){//新建状态
            isCreat.value = true;
            return 
        }else{//更新状态
            isCreat.value = false;
        }
        //通过接口获取信息
        const res = await getEditAuditInfo(id);
        console.log("调用getEditAuditInfo，id是",res.data.data.id)
        console.log("isCreat的值是：",isCreat.value)
        if(res.data.code ===200){
            formCheck.value  = res.data.data
            console.log("transform data is",res.data.data)
        }else{
            ElMessage.error("获取编辑菜单信息失败")
            throw new Error("获取编辑菜单信息失败")
        }
    }

    //分页 
    //状态与提示文本
    const isCreat = ref(true)
    const msgText = computed(()=>(isCreat.value?"创建":"更新"))
    return {allMenus,getAll,formCreat,formCheck,onSubmit,handleDelete,getAuditInfoById,msgText,total}

}
