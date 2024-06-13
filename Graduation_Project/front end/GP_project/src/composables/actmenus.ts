import { actionItem,CreateOrEditActItem } from "@/api/actionlist";
import { getActionById,getActionList,saveOrUpdateAction,deleteAction } from "@/api/actionlist";
import {computed, ref} from "vue"
import {useRouter } from "vue-router"
import { ElMessage ,ElMessageBox} from "element-plus";
import { id } from "element-plus/es/locale";
import  router from '@/router/index';
export function actionMenus(){
    const allActionMenus = ref([] as actionItem[])
    const total = ref<number>()
    const actionGetAll = async (page:number) =>{
        const res = await getActionList(page)
        if(res.data.code ==200){
            allActionMenus.value = res.data.data
            total.value = res.data.count;
    
    }else{
        ElMessage.error("请求行动失败")
        throw new Error("请求行动失败")
        }
    }
    const formCreat = ref<CreateOrEditActItem>({
        actCode:"",
        investors:"",
        createDate:"",
        projectScope:"",
        standards:"",
        status:"",
        position:"",
        detailInformation:"",
        risk:"",
        actionCycle:"短周期",
        departmentCollaboration:"无",
        scheduleStartDate:"",
        scheduleEndDate:"",
        type:"",
        id:0
    })

    const formCheck = ref<actionItem>({
        type:"",
        actCode:"",
        investors:"",
        createDate:"",
        projectScope:"",
        standards:"",
        status:"",
        position:"",
        detailInformation:"",
        risk:"",
        actionCycle:"",
        departmentCollaboration:"",
        assessmentConclusion:"",
        correctiveMeasures:"",
        scheduleStartDate:"",
        scheduleEndDate:"",
        id:0
    })
    const res = ref()
    //提交表单
    const actionSubmit = async (id:number) =>{
        if(id === 1) {
            res.value = await saveOrUpdateAction(formCreat.value)}
        else{
            res.value = await saveOrUpdateAction(formCheck.value)}
            console.log('上传成功',res)
            if(res.value.data.code === 200){
                ElMessage.success(`${msgText.value}成功`)
                router.push({name: 'auditlistview',})
                console.log("哪个？值：",msgText.value)
                console.log("正确还是错误？",isCreat.value)
            }else{
                ElMessage.error(`${msgText.value}失败`)
                throw new Error(`${msgText.value}失败`)
            }
    }

    //删除表单
    const handleDeleteAction = async (id:number) => {
        await ElMessageBox.confirm('此操作将永久删除该菜单, 是否继续?', '提示',{
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
        }).catch(()=>{
            ElMessage.info("删除操作被取消")
            return new Promise(() => {})
        })
        const res = await deleteAction(id)
        if(res.data.code ==200){
            ElMessage.success("删除行动成功")
            //翻页，如果是当前页
            

            actionGetAll(1)// 重新获得新的列表数据(相当于删除一个列表然后刷新)
        }else{
            ElMessage.error("删除行动失败")
            throw new Error("删除行动失败")
        }

    }
    const getActionInfoById = async (id:String) => {
        //根据id判断状态
        if(!Number(id)){//新建状态
            isCreat.value = true;
            return 
        }else{//更新状态
            isCreat.value = false;
        }
        //通过接口获取信息
        const res = await getActionById(id);
        console.log("getActionById",res.data.data.id)
        console.log("isCreat的值是：",isCreat.value)
        if(res.data.code ===200){
            formCheck.value  = res.data.data
            console.log("transform data is",res.data.data)
        }else{
            ElMessage.error("获取编辑行动信息失败")
            throw new Error("获取编辑行动信息失败")
        }

    }
    const isCreat = ref(true)
    const msgText = computed(()=>(isCreat.value?"创建":"更新"))

    return { getActionInfoById,handleDeleteAction,actionSubmit,actionGetAll,allActionMenus,total,msgText,formCheck,formCreat}


}

