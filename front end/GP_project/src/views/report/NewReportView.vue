<template>
    <h1>新的报告</h1>
  <div class="demo-collapse">
    <el-collapse v-model="activeNames" @change="handleChange">
      <el-collapse-item title="基础" name="1" >
        <template #title>
                <span class="custom-title">基础</span>
            </template>
          <el-form label-width="auto"  :model="formCreate" style="max-width:600px" size="large"> 
      <div style="display: grid; grid-template-columns: 1fr 1fr;gap:30px">
      <el-form-item label="序号" >
          <el-input  placeholder = "REPORT-xxxx-xxx"  v-model="formCreate.reportCode" />
       </el-form-item>   
 <el-form-item label="类型" >
  <el-tree-select
    v-model="valueStrictly"
    :data="data"
    multiple
    :render-after-expand="false"
    show-checkbox
    check-strictly
    check-on-click-node
    style="width: 240px"
  />
  </el-form-item>
      <el-form-item label="主题" >
          <el-select v-model="formCreate.theme">
              <el-option label="运营维护" :value="'运营维护'"/>
              <el-option label="危险事件" :value="'危险事件'"/>
              <el-option label="普通日志" :value = "'普通日志'"/>
              <el-option label="其他" :value = "'其他'"/>
          </el-select>
      </el-form-item>
      <el-form-item label="航班号" >
        <el-input  placeholder = "航班号"  v-model="formCreate.flightNumber"/>
      </el-form-item>
      <el-form-item label="报告人">
          <el-input  placeholder = "姓名" v-model="formCreate.reporter"/>
        </el-form-item>
      <el-form-item label="报告日期">
          <el-date-picker
              v-model="formCreate.reportdate"
              type="date"
              placeholder="选择日期"
              value-format="YYYY-MM-DD">
          </el-date-picker>
      </el-form-item>
    

     
        <el-form-item label="报告简介">
          <el-input  placeholder = "请输入内容" v-model="formCreate.reportIntroduction"/>
        </el-form-item>
      </div>
      </el-form> 
      </el-collapse-item>

      <el-collapse-item title="风险预估以及原因分析" name="2">
        <template #title>
                <span class="custom-title">紧急程度以及原因分析</span>
            </template>
    <el-form label-width="auto"  style="max-width:600px " size="large">
      <div style="display: grid; grid-template-columns: 1fr 1fr;gap:30px">
        <el-form-item label="事件类型" >
          <el-input label="事件类型" v-model="formCreate.eventType"/>
        </el-form-item>
        <el-form-item label="紧急程度" for="op2" class="large-input">
          <el-select id="op2" v-model="formCreate.eventRisk">
            <el-option label="特急报告" :value="'2'"/>
            <el-option label="紧急报告" :value="'1'"/> 
            <el-option label="常规报告"  :value="'0'"/>     
          </el-select>
        </el-form-item>
      </div>
      <div class="switch-container">
      <el-form-item>
        <el-switch
        size="small"
      v-model="value1"
      class="mt-2"
      style="margin-right: 10px;margin-left: 40px;"
      inline-prompt
      :active-icon="Check"
      :inactive-icon="Close"
      
    />是否需要调查
      </el-form-item>
      <el-form-item>
        <el-switch
        size="small"
      v-model="value2"
      class="mt-2"
      style="margin-right: 10px;margin-left: 40px;"
      inline-prompt
      :active-icon="Check"
      :inactive-icon="Close"
    />是否需要专家协助
      </el-form-item>
    </div>  
      <el-form-item  label="评估结论">
          <el-input readonly placeholder="暂无结论"/>
        </el-form-item>
    </el-form>
  </el-collapse-item>
      <el-collapse-item title="纠正措施" name="3">
        <template #title>
                <span class="custom-title">上传附件</span>
            </template>
            <el-upload
    class="upload-demo"
    drag
    action="http://localhost:8080/file/upload"
    multiple
  >  
    <el-icon class="el-icon--upload"><upload-filled /></el-icon>
    <!-- 上传文件-->
    <div class="el-upload__text">
      拖拽文件到此 或<em>点击上传</em>
    </div>
    <template #tip>
      <div class="el-upload__tip">
        jpg/png 文件大小 小于 500kb
      </div>
    </template>
  </el-upload>  
      </el-collapse-item>
    </el-collapse>
    <el-form-item class="button-container">
            <el-button type="primary" style="font-size: 19px;" @click="reportSubmit(1)" >新建</el-button>
            <!-- <el-button </el-button> -->
          </el-form-item>
  </div>
</template>

<script lang="ts" setup>
import { ref, watchEffect } from 'vue'
import {reportMenus} from '@/composables/reportmenus'
import { Check, Close } from '@element-plus/icons-vue'
import { UploadFilled } from '@element-plus/icons-vue'
const {data,valueStrictly,reportSubmit,formCreate} = reportMenus()
const activeNames = ref(['1'])
const handleChange = (val: string[]) => {
  console.log(val)
}
const value1 = ref(false)
const value2 = ref(false)
// 监听 valueStrictly 的变化，更新 formCreate.type
watchEffect(() => {
  formCreate.value.type = JSON.stringify(valueStrictly.value);
  if(JSON.stringify(value1.value)=='true'){
    formCreate.value.needReaserch = '1'
  }else{formCreate.value.needReaserch = '0'}
  if(JSON.stringify(value2.value)=='true'){
    formCreate.value.needExpertResearch ='1'
  }else{formCreate.value.needExpertResearch = '0'}
});
formCreate.value.fileId = formCreate.value.id

</script>

<style lang="scss" scoped>
.switch-container{
  display: flex;
  flex-direction: row; /* 设置水平排列 */
}
</style>