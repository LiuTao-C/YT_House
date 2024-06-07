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

          <el-form-item label="风险等级">
            <el-select v-model="formCreate.hazardLevel">
              <el-option label="重大危险" :value="'重大危险'" />
              <el-option label="普通" :value="'普通'" />
              <el-option label="轻微" :value="'轻微'" />
            </el-select>
          </el-form-item>

          <el-form-item label="发现日期">
            <el-date-picker
              v-model="formCreate.findDate"
              type="date"
              placeholder="选择日期"
              value-format="YYYY-MM-DD"
            >
            </el-date-picker>
          </el-form-item>
          <el-form-item label="发生地点">
            <el-input placeholder="请输入内容" v-model="formCreate.location" />
          </el-form-item>
          <el-form-itme label="持续时间">
            <el-select v-model="formCreate.period">
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
              v-model="formCreate.detailInfo"
            />
          </el-form-item>
        </div>
      </el-form>
    </el-collapse>
    <el-form-item class="button-container">
      <el-button type="primary" style="font-size: 19px" @click="hazardSubmit(1)"
        >新建</el-button
      >
      <!-- <el-button </el-button> -->
    </el-form-item>
  </div>
</template>

<script lang="ts" setup>
import { ref, watchEffect } from "vue";
import { hazardMenus } from "@/composables/hazardmenus";

const { hazardSubmit, formCreate } = hazardMenus();
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
