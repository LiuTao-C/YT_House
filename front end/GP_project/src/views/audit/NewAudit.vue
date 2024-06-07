<template>
  <div>
      <h1>新的审计</h1>
      <el-form :model="formCreat" label-width="auto" style="max-width: 500px" size="large">
        <div style="display: grid; grid-template-columns: 1fr 1fr;gap:30px">
          <el-form-item label="编号">
            <el-input v-model="formCreat.code"placeholder="AUDIT-xx-xxx"  />
          </el-form-item>
          <el-form-item label="被审核方">
            <el-select v-model="formCreat.position" >
              <el-option label="南方航空" :value="'南方航空'"/>
              <el-option label="厦门航空" :value="'厦门航空'"/>
              <el-option label="四川航空" :value = "'四川航空'"/>
              <el-option label="春秋航空" :value = "'春秋航空'"/>
               
              <!-- <el-option v-for="menu in topMenus" :value="menu.id" :key="menu.id" :label="menu.id"  /> -->
            </el-select>
            
          </el-form-item>
          <el-form-item label="范围">
            <el-select v-model="formCreat.scope" >
              <el-option label="质量与安全" :value="'内部'" />
              <el-option label="飞行支持" :value="'外部'"/>
              <el-option label="货物装卸" :value = "'货物装卸'"/>
              <el-option label="航班运营" :value = "'航班运营'"/>
              <el-option label="飞机操作" :value = "'飞机操作'"/>
            </el-select>
            
          </el-form-item>
          <el-form-item label="类型">
            <el-select v-model="formCreat.type" >
              <el-option label="内部" :value="'内部'" />
              <el-option label="外部" :value="'外部'" />
              <el-option label="供应商" :value="'供应商'" />
              <!-- <el-option v-for="menu in topMenus" :value="menu.id" :key="menu.id" :label="menu.id"  /> -->
            </el-select>
          </el-form-item>
          <el-form-item label="审计主管">
          <el-input v-model="formCreat.leadAuditor" />
          </el-form-item>
        <el-form-item label="审计人">
        <el-input v-model="formCreat.auditors" />
        </el-form-item>    
        <el-form-item label="预定开始日期">
          <el-date-picker
            v-model="formCreat.scheduleStartDate"
            type="date"
            placeholder="预定日期"
            value-format="YYYY-MM-DD"
            />
        </el-form-item>
        <el-form-item label="预定结束日期">
          <el-date-picker
            v-model="formCreat.scheduleEndDate"
            type="date"
            placeholder="结束日期"
            value-format="YYYY-MM-DD"
            />
        </el-form-item>     
        <el-form-item label="创建人">
          <el-input v-model="formCreat.createBy" />
        </el-form-item>
        <el-form-item label="创建时间">
          <el-date-picker
            v-model="formCreat.createDate"
            type="date"
            placeholder="创建日期"
            value-format="YYYY-MM-DD"
            />
          </el-form-item>
          <el-form-item label="状态">
            <el-select v-model="formCreat.status" >
              <el-option label="未开始" :value="'未开始'" />
              <el-option label="审计中" :value="'审计中'"/>
              <el-option label="取消" :value="'取消'"/>
              <el-option label="同意" :value="'同意'"/>
              <!-- <el-option v-for="menu in topMenus" :value="menu.id" :key="menu.id" :label="menu.id"  /> -->
            </el-select>
          </el-form-item>
          <el-form-item label="">
            </el-form-item>
          
      </div>
 
      <el-form-item class="button-container">
            <el-button type="primary" @click="onSubmit(1)">新建</el-button>
            <!-- <el-button </el-button> -->
          </el-form-item>
      </el-form>
  </div>
</template>

<script lang="ts" setup>
import { ListItem } from '@/api/auditlist'
import { getAuditList } from '@/api/auditlist';
import { ElMessage } from 'element-plus';
//获取一级菜单
// 1.先获取所有菜单
import { computed, ref } from 'vue';
import { auditMenus } from '@/composables/auditmenus';
const {allMenus,getAll,formCreat,onSubmit} = auditMenus()


</script>

<style lang="scss" scoped>
.el-form{
  padding: 70px;
  background-color: #fff;
}
.button-container{
display: flex;
justify-content: space-between;
margin-left: 400px;
}
</style>