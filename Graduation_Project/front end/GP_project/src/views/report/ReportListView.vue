<template>
   <div>
        <el-card  class="box-card" >
            <template #header>
            <div class="card-header">
                <!-- <span>列表视图</span> -->
                <el-button type="text" @click="router.push({path:'/newreportview'})">添加报告</el-button>
            </div>
            </template>
            
            <el-table :data="allMenus" border style="width: 100%">
            <el-table-column prop="reportCode" label="编号" align="center" width="180"/>
            <el-table-column prop="content" label="内容" align="center" width="260">
                <template v-slot="{ row }">
                 {{ row.type }} - {{ row.theme }} - {{ row.reporter }}  
                </template>
            </el-table-column>
            <el-table-column prop="flightNumber" label="航班号" align="center" width="160" />
            <el-table-column prop="reportdate" label="报告日期" align="center" width="160" />
            <el-table-column prop="eventRisk" label="风险" align="center"  width="120"/>
            <el-table-column  label="操作"align="center"  v-slot="scope" width="420">
                <el-button type="primary" @click="router.push({name:'checkreportview',params:{id:scope.row.id}})">编辑</el-button>
                <el-button type="danger" @click="handleDelete(scope.row.id)">删除</el-button>
            </el-table-column>
            </el-table> 
            <template #footer>
                <div class="example-pagination-block">
                <div class="example-demonstration">When you have few pages</div>
                <el-pagination layout="prev, pager, next" :total="total" :page-size="15" @current-change="handlePageChange"/>
            </div> 
            </template> 
            
        </el-card>
    </div>
</template>

<script setup lang="ts">

import { useRouter } from 'vue-router'
const router = useRouter()
//返回存储的数据
import { reportMenus } from '@/composables/reportmenus';
const {allMenus,getAll,handleDelete,total} = reportMenus()
getAll(1)
const handlePageChange = (page:number)=>{
  console.log("当前页码",page);
  getAll(page);
  }
  
</script>
