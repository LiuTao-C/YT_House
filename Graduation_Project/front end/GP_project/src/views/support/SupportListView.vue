<template>
    <div>
         <el-card  class="box-card" >
             <template #header>
             <div class="card-header">
                 <!-- <span>列表视图</span> -->
                 <el-button type="text" @click="router.push({path:'/newsupport'})">添加报告</el-button>
             </div>
             </template>
             
             <el-table :data="allMenus" border style="width: 85%">
             <el-table-column prop="id" label="编号" align="center" width="160"/>
             <el-table-column prop="name" label="赞助商" align="center" width="240"/>
            <el-table-column prop="department" label="赞助部门" align="center" width="240"/>
            <el-table-column prop="projectName" label="赞助项目" align="center" width="240"/>
            <el-table-column prop="projectStatus" label="项目状态" align="center" width="160"/>
            <el-table-column prop="Money" label="赞助金额" align="center" width="160"/>
             <el-table-column prop="status" label="状态" align="center" width="200"/>
        
            
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
 import { supportMenus } from '@/composables/supportmenus';
 const {allMenus,getall,handleDelete,total} = supportMenus()
 getall(1)
 const handlePageChange = (page:number)=>{
   console.log("当前页码",page);
   getall(page);
   }
   
 </script>
 