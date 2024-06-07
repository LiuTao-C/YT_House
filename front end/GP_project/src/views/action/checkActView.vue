
<template>
    <h1>新的行动</h1>
    <div class="demo-collapse">
      <el-collapse v-model="activeNames" @change="handleChange">
        <el-collapse-item title="基础" name="1" >
            <template #title>
                <span class="custom-title">基础</span>
            </template>
            <el-form label-width="auto"  :model="formCheck" style="max-width:600px" size="large"> 
        <div style="display: grid; grid-template-columns: 1fr 1fr;gap:30px">
        <el-form-item label="序号" >
            <el-input  placeholder = "ACT-XX-xxx" v-model="formCheck.actCode" />
         </el-form-item>   
        <el-form-item label="类型" v-model="formCheck.type" >
            <el-select >
                <el-option label="内部" :Value="'内部'"/>
                <el-option label="外部" :Value="'外部'"/>
                <el-option label="供应商" :Value="'供应商'"/>
            </el-select>

        </el-form-item>
        <el-form-item label="投资方" >
            <el-select v-model="formCheck.investors">
                <el-option label="南方航空" :value="'南方航空'"/>
                <el-option label="厦门航空" :value="'厦门航空'"/>
                <el-option label="四川航空" :value = "'四川航空'"/>
                <el-option label="春秋航空" :value = "'春秋航空'"/>
                <el-option label="百度" :value = "'百度'"/>
                <el-option label="腾讯" :value = "'腾讯'"/>
                <el-option label="阿里" :value = "'阿里'"/>
            </el-select>
        </el-form-item>
        <el-form-item label="提出日期">
            <el-date-picker
                v-model="formCheck.createDate"
                type="date"
                placeholder="选择日期"
                value-format="YYYY-MM-DD">
            </el-date-picker>
        </el-form-item>
        <el-form-item label="项目范围" >
            <el-select v-model="formCheck.projectScope">
                <el-option label="航班运营" :value="'航班运营'"/>
                <el-option label="乘客运营" :value="'乘客运营'"/>
                <el-option label="货物运营" :value="'货物运营'"/>
                <el-option label="质量管理" :value="'质量管理'"/>
                <el-option label="飞行支持" :value="'飞行支持'"/>
                <el-option label="地面勤务" :value="'地面勤务'"/>
                <el-option label="机务维修" :value="'机务维修'"/>
            </el-select>

        </el-form-item>
        <el-form-item label="实施标准" >
            <el-select v-model="formCheck.standards">
                <el-option  label="ISO9001" :value="'ISO9001'"/>
                <el-option  label="ICAO" :value="'ICAO'"/>
                <el-option  label="ATA" :value="'ATA'"/>
                <el-option  label="EASA" :value="'EASA'"/>
            </el-select>    
        </el-form-item>
        <el-form-item label="目标实施日期">
            <el-date-picker 
                v-model="formCheck.scheduleStartDate"
                type="date"
                placeholder="选择日期"
                value-format="YYYY-MM-DD">
            </el-date-picker>
        </el-form-item>
        <el-form-item label="目标完成日期">
            <el-date-picker
                v-model="formCheck.scheduleEndDate"
                type="date"
                placeholder="选择日期"
                value-format="YYYY-MM-DD">
            </el-date-picker>
        </el-form-item>
        <el-form-item label="位置">
            <el-select  v-model="formCheck.position">
              <el-option label="未开始" :value="'未开始'" />
              <el-option label="审计中" :value="'审计中'"/>
              <el-option label="取消" :value="'取消'"/>
              <el-option label="同意" :value="'同意'"/>
              <!-- <el-option v-for="menu in topMenus" :value="menu.id" :key="menu.id" :label="menu.id"  /> -->
            </el-select>
          </el-form-item>
          <el-form-item label="状态" >
            <el-select v-model="formCheck.status">
              <el-option label="未审批" :value="'未审批'" />
              <el-option label="行动中" :value="'行动中'"/>
              <el-option label="中止" :value="'中止'"/>
              <el-option label="完成" :value="'完成'"/>
              <!-- <el-option v-for="menu in topMenus" :value="menu.id" :key="menu.id" :label="menu.id"  /> -->
            </el-select>
          </el-form-item>
          <el-form-item label="备注">
            <el-input  placeholder = "请输入内容" v-model="formCheck.detailInformation"/>
          </el-form-item>
        </div>
        </el-form> 
        </el-collapse-item>

        <el-collapse-item   v-model="activeNames" title="风险预估以及原因分析" name="2">
            <template #title>
                <span class="custom-title">风险预估以及原因分析</span>
            </template>
      <el-form label-width="auto" :model="formCheck" style="max-width:600px" size="large">
        <div class="form-row">
          <el-form-item label="行动周期" class="large-input">
            <el-select id="op1" v-model="formCheck.actionCycle">
              <el-option label="长周期" :value="'2'"/>
              <el-option label="短周期" :value="'1'"/> 
              <el-option label="临时周期" :value="'0'"/>     
            </el-select>
          </el-form-item>
          <el-form-item label="协同部门" for="op2" class="large-input">
            <el-select id="op2" v-model="formCheck.departmentCollaboration">
              <el-option label="多部门协同" :value="'2'"/>
              <el-option label="单个部门协同" :value="'1'"/> 
              <el-option label="无"  :value="'0'"/>     
            </el-select>
          </el-form-item>
          <el-form-item  label="风险分析:" v-model="formCheck.risk">{{ riskvalue }}</el-form-item>
          
        </div>
        <el-form-item  label="评估结论" >
            <el-input v-model="formCheck.assessmentConclusion"/>
          </el-form-item>
      </el-form>
    </el-collapse-item >
        <el-collapse-item  v-model="activeNames"  name="3" >
            <template #title>
                <span class="custom-title">纠正措施</span>
            </template>
            <el-form-item  label="措施">
            <el-input v-model="formCheck.correctiveMeasures"/>
          </el-form-item>

        </el-collapse-item>
      </el-collapse>
      <el-form-item class="button-container">
            <el-button type="primary" style="font-size: 19px;" @click="actionSubmit" >提交</el-button>
            <!-- <el-button </el-button> -->
          </el-form-item>
    </div>
  </template>
  
<script lang="ts" setup>
  import { ref,computed } from 'vue'
  import {actionMenus} from "@/composables/actmenus";
  import {useRoute ,useRouter} from "vue-router"
  const {formCheck,getActionInfoById,actionSubmit} = actionMenus()

const route = useRoute()
const router = useRouter()
console.log(route.params)
getActionInfoById(route.params.id as string)
  const activeNames = ref(['1','2','3'])
  const handleChange = (val: string[]) => {
    console.log(val)
  }
  const selectedOption1 = ref()
  const selectedOption2 = ref()
  const riskvalue = computed(() => {
  if (formCheck.value.actionCycle === '2' && formCheck.value.departmentCollaboration==='2') {
  return '高风险';
} else if (formCheck.value.actionCycle === '2' && formCheck.value.departmentCollaboration==='1') {
  return '中高风险';
}  else if (formCheck.value.actionCycle === '2' &&formCheck.value.departmentCollaboration==='0') {
  return '中风险';
}  else if (formCheck.value.actionCycle === '1' && formCheck.value.departmentCollaboration==='2') {
  return '中风险';
}  else if (formCheck.value.actionCycle === '1'&& formCheck.value.departmentCollaboration==='1') {
  return '中低风险';
}  else if (formCheck.value.actionCycle === '1' &&formCheck.value.departmentCollaboration==='0') {
  return '低风险';
} else if (formCheck.value.actionCycle === '0' && formCheck.value.departmentCollaboration==='2') {
  return '中低风险';
} else {
  return '无风险';
}
});
  formCheck.value.risk = riskvalue.value;
  

</script>
  

<style lang="scss" scoped>
.large-input{
    flex:1;
}
.form-row{
    display:flex;
    gap:20px;
}
.custom-title {
    font-size: 18px; /* 设置字体大小 */
    font-weight: normal; /* 设置字体粗细 */
    color: #333; /* 设置字体颜色 */
    
    /* 其他样式 */
  }

</style>