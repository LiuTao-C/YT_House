<template>
    <div>
        <el-card class="box-card">
            <template #header>
                <div class="card-header">
    
                <el-button type="text" @click="router.push({name:'newact'})">添加行动</el-button>
                </div>
            </template>

            <el-table :data="allActionMenus" border style="width:100%">
                <el-table-column prop="actCode" label="序号" align="center"width="120"></el-table-column>
                <el-table-column prop="actContent" label="行动内容" align="center"width="300">
                    <template v-slot ="{row}">
                        {{row.standards}} - {{ row.position }} -{{ row.projectScope }}
                    </template>
                </el-table-column>
                <el-table-column prop="createDate" label="创建日期" align="center"width="220"></el-table-column>
                <el-table-column prop="investors" label="投资方" align="center"width="180"></el-table-column>
                <el-table-column prop="risk" label="风险" align="center"width="180"></el-table-column>
                <el-table-column prop="status" label="状态"align="center" width="180"></el-table-column>
                <el-table-column  label="操作"align="center"  v-slot="scope" width="220">
                    <el-button type="primary"  @click="router.push({name:'checkactview',params:{id:scope.row.id}})">查看</el-button>
                    <el-button type="danger"  @click="handleDeleteAction(scope.row.id)">删除</el-button>
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

<script lang="ts" setup>
import {ref} from "vue"
import { useRouter } from "vue-router";
import { actionMenus } from "@/composables/actmenus";
const { allActionMenus,handleDeleteAction,actionGetAll,total} = actionMenus()
actionGetAll(1)
const handlePageChange = (page:number)=>{
  console.log("当前页码",page);
  console.log("总的页",total.value)
  actionGetAll(page);
  }

const router = useRouter()


</script>

<style lang="scss" scoped>

</style>