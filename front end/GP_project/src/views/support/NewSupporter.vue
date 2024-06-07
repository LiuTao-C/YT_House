<template>
    <h1>新的报告</h1>
    <div>
      <el-collapse class="demo-collapse">
        <el-form
          label-width="auto"
          :model="formCreate"
          style="max-width: 600px"
          size="large"
        >
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px">
            <el-form-item label="赞助商">
              <el-input
                placeholder="请输入名称"
                v-model="formCreate.name"
              />
            </el-form-item>
              <el-form-item label="赞助部门" >
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
           
            <el-form-item label="电话号码">
              <el-input placeholder="请输入内容" v-model="formCreate.phone" />
            </el-form-item>
            <el-form-item label="邮件">
              <el-input placeholder="请输入内容" v-model="formCreate.email" />
            </el-form-item>
            <el-form-item label="地址">
              <el-input placeholder="请输入内容" v-model="formCreate.address" />
            </el-form-item>
            <el-form-item label="状态">
              <el-input placeholder="请输入内容" v-model="formCreate.status" />
            </el-form-item>
          </div>
        </el-form>
      </el-collapse>
      <el-form-item class="button-container">
        <el-button type="primary" style="font-size: 19px" @click="supportSubmit(1)"
          >新建</el-button
        >
        <!-- <el-button </el-button> -->
      </el-form-item>
    </div>
  </template>
  
  <script lang="ts" setup>
  import { ref, watchEffect } from "vue";
  import { supportMenus } from "@/composables/supportmenus";
  
  const { supportSubmit, formCreate,valueStrictly,data} = supportMenus();
  watchEffect(() => {
    formCreate.value.department = JSON.stringify(valueStrictly.value)
  });
  </script>
  
  <style lang="scss" scoped>
  .switch-container {
    display: flex;
    flex-direction: row; /* 设置水平排列 */
  }
  .demo-collapse {
    margin-top: 40px;
    margin-bottom: 40px;
  }
  </style>
  