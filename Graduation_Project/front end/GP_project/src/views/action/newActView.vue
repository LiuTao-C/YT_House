
<template>
  <h1>新的行动</h1>
  <div class="demo-collapse">
    <el-collapse v-model="activeNames" @change="handleChange">
      <el-collapse-item title="基础" name="1" >
        <template #title>
                <span class="custom-title">基础</span>
            </template>
          <el-form label-width="auto" :rules="rules"  :model="formCreat" ref="formRef" style="max-width:600px" size="large"> 
      <div style="display: grid; grid-template-columns: 1fr 1fr;gap:30px">
      <el-form-item label="序号"  prop="actCode">
          <el-input  placeholder = "ACT-XX-xxx" v-model="formCreat.actCode" />
       </el-form-item>   
      <el-form-item label="类型" prop="type">
          <el-select v-model="formCreat.type" >
              <el-option label="一级发现" :value="'一级发现'"/>
              <el-option label="二级发现" :value="'二级发现'"/>
              <el-option label="三级发现" :value="'三级发现'"/>
          </el-select>

      </el-form-item>
      <el-form-item label="投资方" prop="investors">
          <el-select v-model="formCreat.investors" >
              <el-option label="南方航空" :value="'南方航空'"/>
              <el-option label="厦门航空" :value="'厦门航空'"/>
              <el-option label="四川航空" :value = "'四川航空'"/>
              <el-option label="春秋航空" :value = "'春秋航空'"/>
              <el-option label="百度" :value = "'百度'"/>
              <el-option label="腾讯" :value = "'腾讯'"/>
              <el-option label="阿里" :value = "'阿里'"/>
          </el-select>
      </el-form-item>
      <el-form-item label="提出日期"  prop="createDate">
          <el-date-picker
              v-model="formCreat.createDate"
              type="date"
              placeholder="选择日期"
              value-format="YYYY-MM-DD">
          </el-date-picker>
      </el-form-item>
      <el-form-item label="项目范围" prop="projectScope">
          <el-select v-model="formCreat.projectScope" >
              <el-option label="航班运营" :value="'航班运营'"/>
              <el-option label="乘客运营" :value="'乘客运营'"/>
              <el-option label="货物运营" :value="'货物运营'"/>
              <el-option label="质量管理" :value="'质量管理'"/>
              <el-option label="飞行支持" :value="'飞行支持'"/>
              <el-option label="地面勤务" :value="'地面勤务'"/>
              <el-option label="机务维修" :value="'机务维修'"/>
          </el-select>

      </el-form-item>
      <el-form-item label="实施标准" prop="standards">
          <el-select v-model="formCreat.standards" >
              <el-option  label="ISO9001" :value="'ISO9001'"/>
              <el-option  label="ICAO" :value="'ICAO'"/>
              <el-option  label="ATA" :value="'ATA'"/>
              <el-option  label="EASA" :value="'EASA'"/>
          </el-select>    
      </el-form-item>
      <el-form-item label="目标实施日期" prop="scheduleStartDate">
          <el-date-picker 
              
              v-model="formCreat.scheduleStartDate"
              type="date"
              placeholder="选择日期"
              value-format="YYYY-MM-DD">
          </el-date-picker>
      </el-form-item>
      <el-form-item label="目标完成日期" prop="scheduleEndDate">
          <el-date-picker
              
              v-model="formCreat.scheduleEndDate"
              type="date"
            placeholder="选择日期"
            value-format="YYYY-MM-DD"
              >
          </el-date-picker>
      </el-form-item>
      <el-form-item label="位置" prop="position">
          <el-select  v-model="formCreat.position" >
            <el-option label="未开始" :value="'未开始'" />
            <el-option label="审计中" :value="'审计中'"/>
            <el-option label="取消" :value="'取消'"/>
            <el-option label="同意" :value="'同意'"/>
            <!-- <el-option v-for="menu in topMenus" :value="menu.id" :key="menu.id" :label="menu.id"  /> -->
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-select v-model="formCreat.status" >
            <el-option label="未审批" :value="'未审批'" />
            <el-option label="行动中" :value="'行动中'"/>
            <el-option label="中止" :value="'中止'"/>
            <el-option label="完成" :value="'完成'"/>
            <!-- <el-option v-for="menu in topMenus" :value="menu.id" :key="menu.id" :label="menu.id"  /> -->
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="detailInformation">
          <el-input  placeholder = "请输入内容" v-model="formCreat.detailInformation" required/>
        </el-form-item>
      </div>
      </el-form> 
      </el-collapse-item>

      <el-collapse-item title="风险预估以及原因分析" name="2">
        <template #title>
                <span class="custom-title">风险预估以及原因分析</span>
            </template>
    <el-form label-width="auto"  :model="formCreat" style="max-width:600px" size="large">
      <div class="form-row">
        <el-form-item label="行动周期" class="large-input" >
          <el-select id="op1" v-model="formCreat.actionCycle" required>
            <el-option label="长周期" :value="'2'"/>
            <el-option label="短周期" :value="'1'"/> 
            <el-option label="临时周期" :value="'0'"/>     
          </el-select>
        </el-form-item>
        <el-form-item label="协同部门" for="op2" class="large-input" >
          <el-select id="op2" v-model="formCreat.departmentCollaboration" >
            <el-option label="多部门协同" :value="'2'"/>
            <el-option label="单个部门协同" :value="'1'"/> 
            <el-option label="无"  :value="'0'"/>     
          </el-select>
        </el-form-item>
        <el-form-item  label="风险分析:" >{{ riskvalue }}</el-form-item>
        
      </div>
      <el-form-item  label="评估结论" >
          <el-input readonly placeholder="暂无结论"/>
        </el-form-item>
    </el-form>
  </el-collapse-item>
      <el-collapse-item title="纠正措施" name="3">
        <template #title>
                <span class="custom-title">纠正措施</span>
            </template>
          <el-form-item  label="措施">
          <el-input  readonly placeholder="暂无措施"/>
        </el-form-item>

      </el-collapse-item>
    </el-collapse>
    <el-form-item class="button-container">
            <el-button type="primary" style="font-size: 19px;" @click="submitForm" >新建</el-button>
            <!-- <el-button </el-button> -->
          </el-form-item>
  </div>
</template>

<script lang="ts" setup>
import { ref,computed } from 'vue'
import {actionMenus} from "@/composables/actmenus";
import {useRoute ,useRouter} from "vue-router"
const {formCreat,getActionInfoById,actionSubmit} = actionMenus()

const route = useRoute()
const router = useRouter()
getActionInfoById(route.params.id as string)
const activeNames = ref(['1'])
const handleChange = (val: string[]) => {
  console.log(val)
}
// 定义表单验证规则
const rules = ref({
  actCode: [
    { required: true, message: "序号不能为空", trigger: "blur" }
  ],
  type: [
    { required: true, message: "类型不能为空", trigger: "blur" }
  ],
  investors: [
    { required: true, message: "投资方不能为空", trigger: "blur" }
  ],
  createDate: [
    { required: true, message: "提出日期不能为空", trigger: "blur" }
  ],
  projectScope: [
    { required: true, message: "项目范围不能为空", trigger: "blur" }
  ],
  standards: [
    { required: true, message: "实施标准不能为空", trigger: "blur" }
  ],
  scheduleStartDate: [
    { required: true, message: "目标实施日期不能为空", trigger: "blur" }
  ],
  scheduleEndDate: [
    { required: true, message: "目标完成日期不能为空", trigger: "blur" }
  ],
  position: [
    { required: true, message: "位置不能为空", trigger: "blur" }
  ],
  status: [
    { required: true, message: "状态不能为空", trigger: "blur" }
  ],
  detailInformation: [
    { required: true, message: "备注不能为空", trigger: "blur" }
  ]
});
const selectedOption1 = ref()
const selectedOption2 = ref()
let riskvalue = ref()
  riskvalue = computed(() => {
  if (formCreat.value.actionCycle === '2' && formCreat.value.departmentCollaboration==='2') {
  return '高风险';
} else if (formCreat.value.actionCycle === '2' && formCreat.value.departmentCollaboration==='1') {
  return '中高风险';
}  else if (formCreat.value.actionCycle === '2' &&formCreat.value.departmentCollaboration==='0') {
  return '中风险';
}  else if (formCreat.value.actionCycle === '1' && formCreat.value.departmentCollaboration==='2') {
  return '中风险';
}  else if (formCreat.value.actionCycle === '1'&& formCreat.value.departmentCollaboration==='1') {
  return '中低风险';
}  else if (formCreat.value.actionCycle === '1' &&formCreat.value.departmentCollaboration==='0') {
  return '低风险';
} else if (formCreat.value.actionCycle === '0' && formCreat.value.departmentCollaboration==='2') {
  return '中低风险';
} else {
  return '无风险';
}
});
console.log(typeof(riskvalue.value))
formCreat.value.risk = riskvalue.value;
// 提交表单函数
const formRef = ref(null);
const submitForm = () => {
  // 调用表单验证方法
  formRef.value.validate((valid: boolean) => {
    if (valid) {
      // 表单验证通过，执行提交操作
      actionSubmit(1);
    } else {
      // 表单验证失败，弹出提示
      ElMessage.warning('请填写完整的表单内容！');
    }
  });
};

</script>


<style lang="scss" scoped>
.large-input{
  flex:1;
}
.form-row{
  display:flex;
  gap:20px;
}
.custom-title{
  font-size: 18px;
  color:333;
}
.button-container{
margin-top: 30px;
display: flex;
justify-content: space-between;

margin-left: 80%;
}
</style>