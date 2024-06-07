import { ref, computed } from "vue";
import { ElMessage, ElMessageBox, ListItem } from "element-plus";
import router from "@/router/index";
import {
  hazardItem,
  getHazardlist,
  getHazardById,
  deleteHazard,
  saveOrUpdateHazard,
} from "@/api/hazardlist";

export function hazardMenus() {
  //获得列表信息
  const allMenus = ref([] as hazardItem[]);
  const total = ref<number>();
  const getAll = async (page: number) => {
    const res = await getHazardlist(page);
    if (res.data.code === 200) {
      allMenus.value = res.data.data;
      total.value = res.data.count;
    } else {
      ElMessage.error("出错1");
      throw new Error("请求危险源列表出错");
    }
  };
  //提交列表
  const formCreate = ref<hazardItem>({
    id: 0,
    hazardLevel: "",
    location: "",
    period: "",
    findDate: "",
    detailInfo: "",
    registor: "",
  });
  //修改表单类型
  const formCheck = ref<hazardItem>({
    id: 0,
    hazardLevel: "",
    location: "",
    period: "",
    findDate: "",
    detailInfo: "",
    registor: "",
  });
  const onSubmit = async () => {
    const res = await saveOrUpdateHazard(formCreate.value);
    if (res.data.code === 200) {
      ElMessage.success("创建成功");
      router.push({ name: "hazardlistview" });
    } else {
      ElMessage.error("创建失败");
      throw new Error("创建失败");
    }
  };

  const res = ref();
  //提交表单
  const hazardSubmit = async (id: number) => {
    if (id === 1) {
      res.value = await saveOrUpdateHazard(formCreate.value);
    } else {
      res.value = await saveOrUpdateHazard(formCheck.value);
    }
    if (res.value.data.code === 200) {
      ElMessage.success(`${msgText.value}成功`);
      router.push({ name: "hazardlistview" });
    } else {
      ElMessage.error(`${msgText.value}失败`);
      throw new Error(`${msgText.value}失败`);
    }
  };
  //根据id获得信息
  const getHazardInfoById = async (id: string) => {
      if (!Number(id)) {
        //如果id不是数字类型，则为新建
        isCreate.value = true;
      } else {
        isCreate.value = false;
      }
      const res = await getHazardById(id);
      if (res.data.code === 200) {
        formCheck.value = res.data.data;
        ElMessage.success(`获得了id为${id}的信息`);
      } else {
        ElMessage.error(`获得id为${id}的信息失败`);
        throw new Error(`获得id为${id}的信息失败`);
      }
  };
  //删除菜单
  const handleDelete = async (id: number) => {
    await ElMessageBox.confirm("此操作将永久删除该菜单, 是否继续?", "提示", {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "warning",
    }).catch(() => {
      ElMessage.info("删除操作被取消");
      return new Promise(() => {});
    });
    const res = await deleteHazard(id);
    if (res.data.code === 200) {
      ElMessage.success("删除成功");
      getAll(1);
      router.push({ name: "hazardlistview" });
    } else {
      ElMessage.error("删除失败");
      throw new Error("删除失败");
    }
  };
  //分页
  const isCreate = ref(true);
  const msgText = computed(() => (isCreate.value ? "创建" : "更新"));

  return {
    getAll,
    formCheck,
    formCreate,
    onSubmit,
    handleDelete,
    getHazardInfoById,
    hazardSubmit,
    allMenus,
    total,
  };
}
