<template>
    <h1>检查表单</h1>
    <div>
      <el-collapse class="demo-collapse">
        <el-form
          label-width="auto"
          :model="formCheck"
          style="max-width: 600px"
          size="large"
        >
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px">
  
            <el-form-item label="风险等级">
              <el-select v-model="formCheck.hazardLevel">
                <el-option label="重大危险" :value="'重大危险'" />
                <el-option label="普通" :value="'普通'" />
                <el-option label="轻微" :value="'轻微'" />
              </el-select>
            </el-form-item>
  
            <el-form-item label="发现日期">
              <el-date-picker
                v-model="formCheck.findDate"
                type="date"
                placeholder="选择日期"
                value-format="YYYY-MM-DD"
              >
              </el-date-picker>
            </el-form-item>
            <el-form-item label="发生地点">
              <el-input placeholder="请输入内容" v-model="formCheck.location" />
            </el-form-item>
            <el-form-itme label="持续时间">
              <el-select v-model="formCheck.period">
                <el-option label="1天内" :value="'1天内'" />
                <el-option label="1周内" :value="'1周内'" />
                <el-option label="1个月内" :value="'1个月内'" />
                <el-option label="1年内" :value="'1年内'" />
                <el-option label="1年以上" :value="'1年以上'" />
              </el-select>
            </el-form-itme>
  
            <el-form-item label="详细信息">
              <el-input
                placeholder="请输入内容"
                v-model="formCheck.detailInfo"
              />
            </el-form-item>
          </div>
        </el-form>
      </el-collapse>
      <el-form-item class="button-container">
        <el-button type="primary" style="font-size: 19px" @click="hazardSubmit(0)"
          >新建</el-button
        >
        <!-- <el-button </el-button> -->
      </el-form-item>
    </div>
  </template>
  
  <script lang="ts" setup>
  import { ref } from "vue";
  import { hazardMenus } from "@/composables/hazardmenus";
import { useRoute } from "vue-router";
  
  const { hazardSubmit, formCheck ,getHazardInfoById} = hazardMenus();

  const route = useRoute()
  const hazardId = route.params.id
  getHazardInfoById(hazardId as string);
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
  