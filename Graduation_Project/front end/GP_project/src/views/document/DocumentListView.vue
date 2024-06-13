<template>
  <div>
    <el-card class="box-card">
      <el-table :data="allMenus" border style="width: 100%">
        <el-table-column prop="id" label="编号" align="center" width="180" />
        <el-table-column
          prop="originName"
          label="文件名"
          align="center"
          width="260"
        />

        <el-table-column
          prop="updateTime"
          label="上传时间"
          align="center"
          width="160"
        />
        <el-table-column
          prop="documentType"
          label="上传部门"
          align="center"
          width="160"
        />
        <el-table-column
          prop="fileSize"
          label="文件大小"
          align="center"
          width="160"
        >
          <template v-slot="{ row }">
            {{ row.filesize / 1024 + " KB" }}
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" v-slot="scope" width="420">
          <el-button
            type="primary"
            @click="
             downloadDocument(scope.row.id,scope.row.fileType,scope.row.originName)
            "
            >下载文档</el-button
          >
        </el-table-column>
      </el-table>
      <template #footer>
        <div class="example-pagination-block">
          <div class="example-demonstration">When you have few pages</div>
          <el-pagination
            layout="prev, pager, next"
            :total="total"
            :page-size="15"
            @current-change="handlePageChange"
          />
        </div>
      </template>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from "vue-router";
const router = useRouter();
//返回存储的数据
import { documentMenus} from '@/composables/documentmenus';
const { allMenus, total, getall,downloadDocument } = documentMenus();
getall(1);
const handlePageChange = (page: number) => {
  console.log("当前页码", page);
  getall(page);
};
</script>
