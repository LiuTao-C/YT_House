<template>
    <div>
        <el-card  class="box-card" >
            <template #header>
            <div class="card-header">
                <!-- <span>列表视图</span> -->
                <el-button type="text" @click="router.push({path:'/newaudit'})">添加审计</el-button>
            </div>
            </template>
            
            <el-table :data="allMenus" border style="width: 100%">
            <el-table-column prop="code" label="编号" align="center" width="180"/>
            <el-table-column prop="content" label="内容" align="center" width="260">
                <template v-slot="{ row }">
                 {{ row.type }} - {{ row.position }} - {{ row.scope }}  
                </template>
            </el-table-column>
            <el-table-column prop="createBy" label="创建人" align="center" width="160" />
            <el-table-column prop="leadAuditor" label="审核主管" align="center" width="160" />
            <el-table-column prop="createDate" label="创建日期" align="center" width="160" />
            <el-table-column prop="scheduleStartDate" label="计划开始日期" align="center"  width="160"/>
            <el-table-column prop="status" label="状态" align="center"  width="120"/>
            <el-table-column  label="操作"align="center"  v-slot="scope" width="420">
                <el-button type="primary" @click="router.push({name:'checklistview',params:{id:scope.row.id}})">编辑</el-button>
                <el-button type="danger" @click="handleDelete(scope.row.id)">删除</el-button>
            </el-table-column>
            </el-table> 
            <template #footer>
                <div class="example-pagination-block">
                <div class="example-demonstration">When you have few pages</div>
                <el-pagination layout="prev, pager, next" :total="total" :page-size="20" @current-change="handlePageChange"/>
            </div> 
            </template> 
            
        </el-card>
    </div>
 
    
</template>

<script lang="ts" setup>
import { useRouter } from 'vue-router'
const router = useRouter()
//返回存储的数据
import { auditMenus } from '@/composables/auditmenus';
const {allMenus,getAll,handleDelete,total} = auditMenus()
getAll(1)
const handlePageChange = (page:number)=>{
  console.log("当前页码",page);
  getAll(page);
  }
</script>

<style scoped>

.box-card{
    width:auto;   
    
}
.example-pagination-block .example-demonstration {
  margin-bottom: 20px;
  size:large;
}
.pagination{
    font-size: 30px;
}
</style>