<template>
    <div>
        <h1>查看审计</h1>
        <el-form :model="formCheck" label-width="auto" style="max-width: 600px" size="large">
          <div style="display: grid; grid-template-columns: 1fr 1fr;gap:30px">
            <el-form-item label="编号" :readonly="true" >
              <el-input v-model="formCheck.code" />
            </el-form-item>
            <el-form-item label="被审核方">
              <el-select v-model="formCheck.position" >
                <el-option label="南方航空" :value="'南方航空'"/>
                <el-option label="厦门航空" :value="'厦门航空'"/>
                <el-option label="四川航空" :value = "'四川航空'"/>
                <el-option label="春秋航空" :value = "'春秋航空'"/>
                 
                <!-- <el-option v-for="menu in topMenus" :value="menu.id" :key="menu.id" :label="menu.id"  /> -->
              </el-select>
              
            </el-form-item>
            <el-form-item label="范围">
              <el-select v-model="formCheck.scope" >
                <el-option label="质量与安全" :value="'内部'" />
                <el-option label="飞行支持" :value="'外部'"/>
                <el-option label="货物装卸" :value = "'货物装卸'"/>
                <el-option label="航班运营" :value = "'航班运营'"/>
                <el-option label="飞机操作" :value = "'飞机操作'"/>
              </el-select>
              
            </el-form-item>
            <el-form-item label="类型">
              <el-select v-model="formCheck.type" >
                <el-option label="内部" :value="'内部'" />
                <el-option label="外部" :value="'外部'" />
                <el-option label="供应商" :value="'供应商'" />
                <!-- <el-option v-for="menu in topMenus" :value="menu.id" :key="menu.id" :label="menu.id"  /> -->
              </el-select>
            </el-form-item>
            <el-form-item label="审计主管">
            <el-input v-model="formCheck.leadAuditor" />
            </el-form-item>
          <el-form-item label="审计人">
          <el-input v-model="formCheck.auditors" />
          </el-form-item>    
          <el-form-item label="预定开始日期">
            <el-date-picker
              v-model="formCheck.scheduleStartDate"
              type="date"
              placeholder="预定日期"
              format="YYYY-MM-DD "
              value-fromat="YYYY-MM-DD"
              />
          </el-form-item>
          <el-form-item label="预定结束日期">
            <el-date-picker
              v-model="formCheck.scheduleEndDate"
              type="date"
              placeholder="结束日期"
              format="YYYY-MM-DD "
              value-fromat="YYYY-MM-DD"
              />
            </el-form-item>
            <el-form-item label="开始日期">
            <el-date-picker
              v-model="formCheck.performStartDate"
              type="date"
              placeholder="预定日期"
              format="YYYY-MM-DD "
              value-fromat="YYYY-MM-DD"
              />
            </el-form-item>
          <el-form-item label="结束日期">
            <el-date-picker
              v-model="formCheck.performEndDate"
              type="date"
              placeholder="结束日期"
              format="YYYY-MM-DD "
              value-fromat="YYYY-MM-DD"
              />
          </el-form-item>     
          <el-form-item label="创建人">
            <el-input v-model="formCheck.createBy" :readonly="true" />
          </el-form-item>
          <el-form-item label="创建时间">
            <el-date-picker
              v-model="formCheck.createDate"
              type="date"
              placeholder="创建日期"
              format="YYYY-MM-DD "
              value-fromat="YYYY-MM-DD"
              :readonly="true" 
              />
            </el-form-item>
            
        </div>
   
        <el-form-item class="button-container" >
              <el-button type="primary" @click="onSubmit">确认</el-button>
              <el-button type="warning" @click="router.push({name:'auditlistview'})">返回</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script lang="ts" setup>
import {useRoute ,useRouter} from "vue-router"
import { auditMenus } from '@/composables/auditmenus';
const { formCheck ,onSubmit,getAuditInfoById} = auditMenus();

const route = useRoute()
const router = useRouter()
// console.log("ID is",route.params.id);
getAuditInfoById(route.params.id as string);

</script>



<style lang="scss" scoped>
.button-container {
  display: flex; 
  justify-content: space-between; 
  margin-left:400px;
  margin-top: 40px
}
</style>@/composables/auditmenus